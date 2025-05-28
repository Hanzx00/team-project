import unittest
from todo import Task, TaskPool

class TestTaskPool(unittest.TestCase):

    def setUp(self):
        self.pool = TaskPool()
        self.pool.populate()

    def test_add_task(self):
        new_task = Task("Write Documentation")
        self.pool.add_task(new_task)
        self.assertIn(new_task, self.pool.tasks)

    def test_get_open_tasks(self):
        open_tasks = self.pool.get_open_tasks()
        for task in open_tasks:
            self.assertEqual(task.status, "ToDo")

    def test_get_done_tasks(self):
        done_tasks = self.pool.get_done_tasks()
        for task in done_tasks:
            self.assertEqual(task.status, "Done")


if __name__ == "__main__":
    suite = unittest.TestLoader().loadTestsFromTestCase(TestTaskPool)
    result = unittest.TextTestRunner(verbosity=2).run(suite)

    # Optional: Clean output formatting
    for line in str(result).split('\n'):
        print(line.strip())
