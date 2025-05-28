class Task:
    def __init__(self, title, status="ToDo"):
        self.title = title
        self.completed = False
        self.status = status

    def mark_completed(self):
        self.completed = True
        self.status = "Done"

    def __repr__(self):
        return f"{self.title} - {self.status}"

    def __str__(self):
        return f"Task: {self.title}, Status: {self.status}"


class TaskPool:
    def __init__(self):
        self.tasks = []

    def populate(self):
        self.tasks = [
            Task("Setup GitHub Repo", "Done"),
            Task("Create Task Class", "Done"),
            Task("Write Unit Tests", "Done"),
            Task("Write HTML Updater"),
            Task("Build Dockerfile"),
            Task("CI/CD Workflow"),
        ]

        for task in self.tasks[:3]:
            task.mark_completed()

    def add_task(self, task):
        self.tasks.append(task)

    def get_open_tasks(self):
        return [task for task in self.tasks if task.status == "ToDo"]

    def get_done_tasks(self):
        return [task for task in self.tasks if task.status == "Done"]


def main():
    pool = TaskPool()
    pool.populate()

    open_titles = [task.title for task in pool.get_open_tasks()]
    done_titles = [task.title for task in pool.get_done_tasks()]

    print("ToDo Tasks:")
    for title in open_titles:
        print(title)

    print("\nDone Tasks:")
    for title in done_titles:
        print(title)


if __name__ == "__main__":
    main()
