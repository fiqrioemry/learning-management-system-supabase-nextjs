-- =====================================
-- LMS COMPLETE DUMMY DATA
-- =====================================

-- Insert profile data for existing auth users
INSERT INTO profile (id, full_name, avatar_url, role, total_points, current_streak, longest_streak, created_at) VALUES
('e0a58879-3fcb-42a6-be7f-d68126f16abb', 'Admin User', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', 'admin', 0, 0, 0, NOW()),
('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 'John Student', 'https://api.dicebear.com/7.x/avataaars/svg?seed=john', 'student', 150, 5, 12, NOW());

-- Insert categories
INSERT INTO categories (id, name) VALUES
(gen_random_uuid(), 'Programming'),
(gen_random_uuid(), 'Web Development'),
(gen_random_uuid(), 'Data Science'),
(gen_random_uuid(), 'Design');

-- Get category IDs for reference
DO $block$
DECLARE
    programming_cat_id UUID;
    webdev_cat_id UUID;
    course1_id UUID;
    course2_id UUID;
    
    -- Course 1 sections
    course1_section1_id UUID;
    course1_section2_id UUID;
    
    -- Course 2 sections
    course2_section1_id UUID;
    course2_section2_id UUID;
    
    -- Course 1 chapters
    c1s1_ch1_id UUID;
    c1s1_ch2_id UUID;
    c1s1_ch3_id UUID;
    c1s1_ch4_id UUID;
    c1s2_ch1_id UUID;
    c1s2_ch2_id UUID;
    c1s2_ch3_id UUID;
    c1s2_ch4_id UUID;
    
    -- Course 2 chapters
    c2s1_ch1_id UUID;
    c2s1_ch2_id UUID;
    c2s1_ch3_id UUID;
    c2s1_ch4_id UUID;
    c2s2_ch1_id UUID;
    c2s2_ch2_id UUID;
    c2s2_ch3_id UUID;
    c2s2_ch4_id UUID;
    
    -- Quiz IDs
    quiz1_id UUID;
    quiz2_id UUID;
    quiz3_id UUID;
    quiz4_id UUID;
    
BEGIN
    -- Get category IDs
    SELECT id INTO programming_cat_id FROM categories WHERE name = 'Programming';
    SELECT id INTO webdev_cat_id FROM categories WHERE name = 'Web Development';
    
    -- Generate UUIDs for courses
    course1_id := gen_random_uuid();
    course2_id := gen_random_uuid();
    
    -- Insert courses
    INSERT INTO courses (id, title, description, price, thumbnail, level, published, estimated_duration, total_chapters) VALUES
    (course1_id, 'Complete JavaScript Mastery', 'Master JavaScript from basics to advanced concepts including ES6+, async programming, and modern frameworks. This comprehensive course will take you from zero to hero in JavaScript development.', 99.00, 'https://placehold.co/800x600/4F46E5/FFFFFF?text=JavaScript+Course', 'beginner', true, 1200, 8),
    (course2_id, 'React.js Professional Development', 'Build modern web applications with React.js. Learn hooks, context, state management, and best practices for professional React development. Perfect for developers who want to master React.', 149.00, 'https://placehold.co/800x600/06B6D4/FFFFFF?text=React.js+Course', 'intermediate', true, 1800, 8);
    
    -- Link courses to categories
    INSERT INTO course_categories (course_id, category_id) VALUES
    (course1_id, programming_cat_id),
    (course1_id, webdev_cat_id),
    (course2_id, programming_cat_id),
    (course2_id, webdev_cat_id);
    
    -- Generate section IDs
    course1_section1_id := gen_random_uuid();
    course1_section2_id := gen_random_uuid();
    course2_section1_id := gen_random_uuid();
    course2_section2_id := gen_random_uuid();
    
    -- Insert sections for Course 1
    INSERT INTO sections (id, course_id, order_no, title, description) VALUES
    (course1_section1_id, course1_id, 1, 'JavaScript Fundamentals', 'Learn the core concepts of JavaScript including variables, functions, objects, and control flow.'),
    (course1_section2_id, course1_id, 2, 'Advanced JavaScript', 'Dive deep into advanced topics like closures, prototypes, async programming, and ES6+ features.');
    
    -- Insert sections for Course 2
    INSERT INTO sections (id, course_id, order_no, title, description) VALUES
    (course2_section1_id, course2_id, 1, 'React Basics', 'Get started with React components, JSX, props, and state management fundamentals.'),
    (course2_section2_id, course2_id, 2, 'Advanced React Patterns', 'Learn advanced React concepts including hooks, context, performance optimization, and testing.');
    
    -- Generate chapter IDs
    c1s1_ch1_id := gen_random_uuid();
    c1s1_ch2_id := gen_random_uuid();
    c1s1_ch3_id := gen_random_uuid();
    c1s1_ch4_id := gen_random_uuid();
    c1s2_ch1_id := gen_random_uuid();
    c1s2_ch2_id := gen_random_uuid();
    c1s2_ch3_id := gen_random_uuid();
    c1s2_ch4_id := gen_random_uuid();
    
    c2s1_ch1_id := gen_random_uuid();
    c2s1_ch2_id := gen_random_uuid();
    c2s1_ch3_id := gen_random_uuid();
    c2s1_ch4_id := gen_random_uuid();
    c2s2_ch1_id := gen_random_uuid();
    c2s2_ch2_id := gen_random_uuid();
    c2s2_ch3_id := gen_random_uuid();
    c2s2_ch4_id := gen_random_uuid();
    
    -- Insert chapters for Course 1, Section 1
    INSERT INTO chapters (id, section_id, title, description, order_no, visible, video_url, video_duration, content, materials) VALUES
    (c1s1_ch1_id, course1_section1_id, 'Introduction to JavaScript', 'Welcome to JavaScript! Learn what JavaScript is and why it''s essential for web development.', 1, true, 'https://www.youtube.com/watch?v=W6NZfCO5SIk', 900, 'JavaScript is a versatile programming language that powers the modern web. In this chapter, we''ll explore its history, capabilities, and why it''s become one of the most popular programming languages in the world.', '[{"id": 1, "name": "JavaScript Cheatsheet", "url": "https://example.com/js-cheatsheet.pdf", "type": "pdf"}]'),
    (c1s1_ch2_id, course1_section1_id, 'Variables and Data Types', 'Master JavaScript variables, data types, and how to work with different kinds of data.', 2, true, 'https://www.youtube.com/watch?v=9emXNzqCKyg', 1200, 'Understanding variables and data types is fundamental to JavaScript programming. We''ll cover let, const, var, and explore strings, numbers, booleans, objects, and arrays.', '[{"id": 2, "name": "Data Types Reference", "url": "https://example.com/data-types.pdf", "type": "pdf"}]'),
    (c1s1_ch3_id, course1_section1_id, 'Functions and Scope', 'Learn how to create and use functions, understand scope, and master function expressions.', 3, true, 'https://www.youtube.com/watch?v=xUI5Tsl2JpY', 1500, 'Functions are the building blocks of JavaScript applications. We''ll learn function declarations, expressions, arrow functions, and understand how scope works in JavaScript.', '[{"id": 3, "name": "Function Examples", "url": "https://example.com/functions.js", "type": "js"}]'),
    (c1s1_ch4_id, course1_section1_id, 'Objects and Arrays', 'Deep dive into JavaScript objects and arrays - the most important data structures.', 4, true, 'https://www.youtube.com/watch?v=r7v6EIiHfVg', 1800, 'Objects and arrays are essential for organizing data in JavaScript. We''ll learn how to create, manipulate, and iterate through these data structures effectively.', '[{"id": 4, "name": "Object Methods Reference", "url": "https://example.com/objects.pdf", "type": "pdf"}]');
    
    -- Insert chapters for Course 1, Section 2
    INSERT INTO chapters (id, section_id, title, description, order_no, visible, video_url, video_duration, content, materials) VALUES
    (c1s2_ch1_id, course1_section2_id, 'Promises and Async/Await', 'Master asynchronous JavaScript with Promises and async/await syntax.', 1, false, 'https://www.youtube.com/watch?v=DHvZLI7Db8E', 2100, 'Asynchronous programming is crucial for modern web development. Learn how to handle async operations with Promises and the more modern async/await syntax.', '[{"id": 5, "name": "Async Programming Guide", "url": "https://example.com/async.pdf", "type": "pdf"}]'),
    (c1s2_ch2_id, course1_section2_id, 'ES6+ Features', 'Explore modern JavaScript features including destructuring, spread operator, and modules.', 2, false, 'https://www.youtube.com/watch?v=NCwa_xi0Uuc', 1800, 'Modern JavaScript (ES6+) introduces powerful features that make code more readable and efficient. We''ll cover the most important updates to the language.', '[{"id": 6, "name": "ES6 Feature List", "url": "https://example.com/es6.pdf", "type": "pdf"}]'),
    (c1s2_ch3_id, course1_section2_id, 'DOM Manipulation', 'Learn how to interact with web pages using the Document Object Model (DOM).', 3, false, 'https://www.youtube.com/watch?v=y17RuWkWdn8', 1600, 'The DOM is how JavaScript interacts with web pages. Learn to select elements, modify content, handle events, and create dynamic web experiences.', '[{"id": 7, "name": "DOM Methods Reference", "url": "https://example.com/dom.pdf", "type": "pdf"}]'),
    (c1s2_ch4_id, course1_section2_id, 'Error Handling and Debugging', 'Master error handling techniques and debugging strategies in JavaScript.', 4, false, 'https://www.youtube.com/watch?v=cFTFtuEQ-10', 1400, 'Learn how to handle errors gracefully and debug JavaScript applications effectively. We''ll cover try/catch, error types, and debugging tools.', '[{"id": 8, "name": "Debugging Checklist", "url": "https://example.com/debugging.pdf", "type": "pdf"}]');
    
    -- Insert chapters for Course 2, Section 1
    INSERT INTO chapters (id, section_id, title, description, order_no, visible, video_url, video_duration, content, materials) VALUES
    (c2s1_ch1_id, course2_section1_id, 'React Introduction and Setup', 'Get started with React and set up your development environment.', 1, true, 'https://www.youtube.com/watch?v=Tn6-PIqc4UM', 1100, 'Welcome to React! Learn what React is, why it''s popular, and how to set up your development environment for React development.', '[{"id": 9, "name": "React Setup Guide", "url": "https://example.com/react-setup.pdf", "type": "pdf"}]'),
    (c2s1_ch2_id, course2_section1_id, 'Components and JSX', 'Learn the fundamentals of React components and JSX syntax.', 2, true, 'https://www.youtube.com/watch?v=DLX62G4lc44', 1600, 'Components are the heart of React applications. Learn how to create functional and class components, and master JSX syntax for writing component templates.', '[{"id": 10, "name": "Component Patterns", "url": "https://example.com/components.pdf", "type": "pdf"}]'),
    (c2s1_ch3_id, course2_section1_id, 'Props and State Management', 'Master data flow in React with props and state management.', 3, true, 'https://www.youtube.com/watch?v=IYvD9oBCuJI', 1800, 'Learn how to pass data between components using props and manage component state effectively. Understanding data flow is crucial for React development.', '[{"id": 11, "name": "State Management Examples", "url": "https://example.com/state.js", "type": "js"}]'),
    (c2s1_ch4_id, course2_section1_id, 'Event Handling in React', 'Learn how to handle user interactions and events in React applications.', 4, true, 'https://www.youtube.com/watch?v=Znqv84xi8Vs', 1300, 'User interaction is essential for dynamic applications. Learn how to handle clicks, form submissions, and other events in React components.', '[{"id": 12, "name": "Event Handling Reference", "url": "https://example.com/events.pdf", "type": "pdf"}]');
    
    -- Insert chapters for Course 2, Section 2
    INSERT INTO chapters (id, section_id, title, description, order_no, visible, video_url, video_duration, content, materials) VALUES
    (c2s2_ch1_id, course2_section2_id, 'React Hooks Deep Dive', 'Master React Hooks including useState, useEffect, and custom hooks.', 1, false, 'https://www.youtube.com/watch?v=TNhaISOUy6Q', 2400, 'React Hooks revolutionized React development. Learn useState, useEffect, useContext, and how to create custom hooks for reusable logic.', '[{"id": 13, "name": "Hooks Cheatsheet", "url": "https://example.com/hooks.pdf", "type": "pdf"}]'),
    (c2s2_ch2_id, course2_section2_id, 'Context API and Global State', 'Learn advanced state management with React Context API.', 2, false, 'https://www.youtube.com/watch?v=35lXWvCuM8o', 2000, 'For complex applications, you need global state management. Learn how to use React Context API to share state across your entire application.', '[{"id": 14, "name": "Context API Examples", "url": "https://example.com/context.js", "type": "js"}]'),
    (c2s2_ch3_id, course2_section2_id, 'Performance Optimization', 'Optimize your React applications for better performance and user experience.', 3, false, 'https://www.youtube.com/watch?v=uojLJFt9SzY', 1900, 'Learn React performance optimization techniques including React.memo, useMemo, useCallback, and code splitting for faster applications.', '[{"id": 15, "name": "Performance Tips", "url": "https://example.com/performance.pdf", "type": "pdf"}]'),
    (c2s2_ch4_id, course2_section2_id, 'Testing React Applications', 'Learn how to test React components and applications effectively.', 4, false, 'https://www.youtube.com/watch?v=8Xwq35cPwYg', 2200, 'Testing ensures your React applications work correctly. Learn unit testing, integration testing, and testing best practices for React applications.', '[{"id": 16, "name": "Testing Guide", "url": "https://example.com/testing.pdf", "type": "pdf"}]');
    
    -- Insert sample quizzes for some chapters
    quiz1_id := gen_random_uuid();
    quiz2_id := gen_random_uuid();
    quiz3_id := gen_random_uuid();
    quiz4_id := gen_random_uuid();
    
    INSERT INTO quizzes (id, chapter_id, title, description, passing_score, max_attempts, time_limit) VALUES
    (quiz1_id, c1s1_ch1_id, 'JavaScript Introduction Quiz', 'Test your understanding of JavaScript basics', 70, 3, 10),
    (quiz2_id, c1s1_ch2_id, 'Variables and Data Types Quiz', 'Quiz on JavaScript variables and data types', 70, 3, 15),
    (quiz3_id, c2s1_ch1_id, 'React Introduction Quiz', 'Test your knowledge of React fundamentals', 70, 3, 10),
    (quiz4_id, c2s1_ch2_id, 'Components and JSX Quiz', 'Quiz on React components and JSX syntax', 70, 3, 15);
    
    -- Insert quiz questions
    INSERT INTO quiz_questions (quiz_id, question, question_type, options, correct_answer, points, explanation, order_no) VALUES
    -- Quiz 1 questions
    (quiz1_id, 'What does JavaScript primarily run on?', 'multiple_choice', '[{"a": "Server only"}, {"b": "Browser only"}, {"c": "Both browser and server"}, {"d": "Desktop applications only"}]', 'c', 1, 'JavaScript can run in browsers (client-side) and on servers (Node.js).', 1),
    (quiz1_id, 'JavaScript is a compiled language.', 'true_false', '[{"true": "True"}, {"false": "False"}]', 'false', 1, 'JavaScript is an interpreted language, not compiled.', 2),
    
    -- Quiz 2 questions  
    (quiz2_id, 'Which keyword is used to declare a block-scoped variable?', 'multiple_choice', '[{"a": "var"}, {"b": "let"}, {"c": "const"}, {"d": "define"}]', 'b', 1, 'The let keyword declares block-scoped variables that can be reassigned.', 1),
    (quiz2_id, 'What data type is returned by typeof null?', 'multiple_choice', '[{"a": "null"}, {"b": "undefined"}, {"c": "object"}, {"d": "boolean"}]', 'c', 1, 'This is a famous JavaScript quirk - typeof null returns "object".', 2),
    
    -- Quiz 3 questions
    (quiz3_id, 'What does JSX stand for?', 'multiple_choice', '[{"a": "JavaScript XML"}, {"b": "Java Syntax Extension"}, {"c": "JSON XML"}, {"d": "JavaScript Extension"}]', 'a', 1, 'JSX stands for JavaScript XML, allowing you to write HTML-like syntax in JavaScript.', 1),
    (quiz3_id, 'React is a library for building user interfaces.', 'true_false', '[{"true": "True"}, {"false": "False"}]', 'true', 1, 'React is indeed a JavaScript library focused on building user interfaces.', 2),
    
    -- Quiz 4 questions
    (quiz4_id, 'How do you pass data from parent to child component?', 'multiple_choice', '[{"a": "Using state"}, {"b": "Using props"}, {"c": "Using refs"}, {"d": "Using context"}]', 'b', 1, 'Props are used to pass data from parent components to child components.', 1),
    (quiz4_id, 'JSX elements must have a closing tag.', 'true_false', '[{"true": "True"}, {"false": "False"}]', 'true', 1, 'JSX elements must be properly closed, either with closing tags or self-closing syntax.', 2);
    
    -- Insert transactions (student bought both courses)
    INSERT INTO transactions (user_id, course_id, status, payment_type, amount, tax, reference_id, paid_at) VALUES
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', course1_id, 'paid', 'CREDIT_CARD', 99.00, 9.90, 'TXN-' || substr(gen_random_uuid()::text, 1, 8), NOW() - INTERVAL '5 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', course2_id, 'paid', 'QRIS', 149.00, 14.90, 'TXN-' || substr(gen_random_uuid()::text, 1, 8), NOW() - INTERVAL '3 days');
    
    -- Insert user course enrollments
    INSERT INTO user_courses (user_id, course_id, enrolled_at, last_accessed, total_time_spent) VALUES
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', course1_id, NOW() - INTERVAL '5 days', NOW() - INTERVAL '1 day', 7200),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', course2_id, NOW() - INTERVAL '3 days', NOW() - INTERVAL '2 hours', 3600);
    
    -- Insert course progress
    INSERT INTO user_course_progress (user_id, course_id, total_chapters, completed_chapters, started_at, last_updated) VALUES
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', course1_id, 8, 4, NOW() - INTERVAL '5 days', NOW() - INTERVAL '1 day'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', course2_id, 8, 2, NOW() - INTERVAL '3 days', NOW() - INTERVAL '2 hours');
    
    -- Insert section progress
    INSERT INTO user_section_progress (user_id, section_id, total_chapters, completed_chapters, started_at, completed_at) VALUES
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', course1_section1_id, 4, 4, NOW() - INTERVAL '5 days', NOW() - INTERVAL '3 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', course1_section2_id, 4, 0, NOW() - INTERVAL '2 days', NULL),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', course2_section1_id, 4, 2, NOW() - INTERVAL '3 days', NULL),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', course2_section2_id, 4, 0, NULL, NULL);
    
    -- Insert chapter progress (student completed first 4 chapters of course 1 and 2 chapters of course 2)
    INSERT INTO user_chapter_progress (user_id, chapter_id, is_completed, time_spent, completion_percentage, started_at, completed_at, last_position) VALUES
    -- Course 1, Section 1 - All completed
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c1s1_ch1_id, true, 900, 100, NOW() - INTERVAL '5 days', NOW() - INTERVAL '5 days', 900),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c1s1_ch2_id, true, 1200, 100, NOW() - INTERVAL '4 days', NOW() - INTERVAL '4 days', 1200),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c1s1_ch3_id, true, 1500, 100, NOW() - INTERVAL '4 days', NOW() - INTERVAL '3 days', 1500),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c1s1_ch4_id, true, 1800, 100, NOW() - INTERVAL '3 days', NOW() - INTERVAL '3 days', 1800),
    
    -- Course 1, Section 2 - In progress
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c1s2_ch1_id, false, 1200, 60, NOW() - INTERVAL '2 days', NULL, 1260),
    
    -- Course 2, Section 1 - 2 completed
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c2s1_ch1_id, true, 1100, 100, NOW() - INTERVAL '3 days', NOW() - INTERVAL '2 days', 1100),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c2s1_ch2_id, true, 1600, 100, NOW() - INTERVAL '2 days', NOW() - INTERVAL '1 day', 1600),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c2s1_ch3_id, false, 800, 45, NOW() - INTERVAL '1 day', NULL, 810);
    
    -- Insert quiz attempts
    INSERT INTO quiz_attempts (user_id, quiz_id, score, max_score, passed, attempt_number, started_at, completed_at, answers) VALUES
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', quiz1_id, 85, 100, true, 1, NOW() - INTERVAL '4 days', NOW() - INTERVAL '4 days', '{"q1": "c", "q2": "false"}'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', quiz2_id, 75, 100, true, 1, NOW() - INTERVAL '3 days', NOW() - INTERVAL '3 days', '{"q1": "b", "q2": "c"}'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', quiz3_id, 90, 100, true, 1, NOW() - INTERVAL '2 days', NOW() - INTERVAL '2 days', '{"q1": "a", "q2": "true"}');
    
    -- Insert comments for each chapter
    INSERT INTO comments (user_id, chapter_id, content, created_at) VALUES
    -- Course 1 comments
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c1s1_ch1_id, 'Great introduction! Really helped me understand what JavaScript is all about. Looking forward to the next chapters.', NOW() - INTERVAL '5 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c1s1_ch2_id, 'The explanation of let vs const vs var was very clear. The examples really helped solidify the concepts.', NOW() - INTERVAL '4 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c1s1_ch3_id, 'Functions are starting to make more sense now. The arrow function syntax is really elegant once you get used to it.', NOW() - INTERVAL '3 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c1s1_ch4_id, 'Objects and arrays are so powerful! The methods for manipulating arrays blew my mind. Great practical examples.', NOW() - INTERVAL '3 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c1s2_ch1_id, 'Async programming is challenging but this explanation made it much clearer. Still working through the exercises.', NOW() - INTERVAL '2 days'),
    ('e0a58879-3fcb-42a6-be7f-d68126f16abb', c1s2_ch2_id, 'ES6+ features are essential for modern JavaScript development. Make sure to practice these thoroughly!', NOW() - INTERVAL '2 days'),
    ('e0a58879-3fcb-42a6-be7f-d68126f16abb', c1s2_ch3_id, 'DOM manipulation is where JavaScript really shines in web development. Great practical examples here.', NOW() - INTERVAL '1 day'),
    ('e0a58879-3fcb-42a6-be7f-d68126f16abb', c1s2_ch4_id, 'Debugging skills are crucial for any developer. These techniques will save you hours of frustration!', NOW() - INTERVAL '1 day'),
    
    -- Course 2 comments
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c2s1_ch1_id, 'React setup was easier than I expected! The development environment is really nice to work with.', NOW() - INTERVAL '3 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c2s1_ch2_id, 'JSX felt weird at first but now I love how it combines HTML and JavaScript. Components are so reusable!', NOW() - INTERVAL '2 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', c2s1_ch3_id, 'Props vs state concept is becoming clearer. Still practicing with the data flow patterns.', NOW() - INTERVAL '1 day'),
    ('e0a58879-3fcb-42a6-be7f-d68126f16abb', c2s1_ch4_id, 'Event handling in React has some gotchas compared to vanilla JS. Pay attention to the binding examples!', NOW() - INTERVAL '12 hours'),
    ('e0a58879-3fcb-42a6-be7f-d68126f16abb', c2s2_ch1_id, 'Hooks completely changed how we write React. This is essential knowledge for modern React development.', NOW() - INTERVAL '6 hours'),
    ('e0a58879-3fcb-42a6-be7f-d68126f16abb', c2s2_ch2_id, 'Context API is perfect for avoiding prop drilling. Great examples of when and when not to use it.', NOW() - INTERVAL '4 hours'),
    ('e0a58879-3fcb-42a6-be7f-d68126f16abb', c2s2_ch3_id, 'Performance optimization is crucial for production apps. These techniques will make your React apps blazingly fast!', NOW() - INTERVAL '2 hours'),
    ('e0a58879-3fcb-42a6-be7f-d68126f16abb', c2s2_ch4_id, 'Testing is often overlooked but so important. These patterns will help you write maintainable, bug-free code.', NOW() - INTERVAL '1 hour');
    
    -- Insert achievements data
    INSERT INTO achievements (name, description, type, icon, points_reward, requirements) VALUES
    ('First Steps', 'Complete your first chapter', 'course_completion', '🎯', 10, '{"chapters_completed": 1}'),
    ('Getting Started', 'Complete your first course', 'course_completion', '🏆', 100, '{"courses_completed": 1}'),
    ('Quiz Master', 'Pass 5 quizzes with 90+ score', 'quiz_master', '🧠', 50, '{"high_score_quizzes": 5}'),
    ('Streak Starter', 'Maintain a 7-day learning streak', 'streak', '🔥', 30, '{"streak_days": 7}'),
    ('Dedication', 'Maintain a 30-day learning streak', 'streak', '⭐', 100, '{"streak_days": 30}'),
    ('Fast Learner', 'Complete 3 chapters in one day', 'fast_learner', '⚡', 25, '{"chapters_per_day": 3}'),
    ('Dedicated Learner', 'Spend 10 hours learning', 'dedicated_learner', '📚', 75, '{"total_hours": 10}');
    
    -- Award some achievements to the student
    INSERT INTO user_achievements (user_id, achievement_id, earned_at, points_earned) VALUES
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 
     (SELECT id FROM achievements WHERE name = 'First Steps'), 
     NOW() - INTERVAL '5 days', 10),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 
     (SELECT id FROM achievements WHERE name = 'Quiz Master'), 
     NOW() - INTERVAL '2 days', 50),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 
     (SELECT id FROM achievements WHERE name = 'Streak Starter'), 
     NOW() - INTERVAL '1 day', 30);
    
    -- Insert user points history
    INSERT INTO user_points (user_id, points, reason, reference_type, reference_id, created_at) VALUES
    -- Chapter completion points
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 10, 'Chapter completion', 'chapter', c1s1_ch1_id, NOW() - INTERVAL '5 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 10, 'Chapter completion', 'chapter', c1s1_ch2_id, NOW() - INTERVAL '4 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 10, 'Chapter completion', 'chapter', c1s1_ch3_id, NOW() - INTERVAL '3 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 10, 'Chapter completion', 'chapter', c1s1_ch4_id, NOW() - INTERVAL '3 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 10, 'Chapter completion', 'chapter', c2s1_ch1_id, NOW() - INTERVAL '2 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 10, 'Chapter completion', 'chapter', c2s1_ch2_id, NOW() - INTERVAL '1 day'),
    
    -- Quiz completion points
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 15, 'Quiz passed with high score', 'quiz', quiz1_id, NOW() - INTERVAL '4 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 12, 'Quiz completion', 'quiz', quiz2_id, NOW() - INTERVAL '3 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 18, 'Quiz passed with high score', 'quiz', quiz3_id, NOW() - INTERVAL '2 days'),
    
    -- Achievement points
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 10, 'Achievement unlocked: First Steps', 'achievement', (SELECT id FROM achievements WHERE name = 'First Steps'), NOW() - INTERVAL '5 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 50, 'Achievement unlocked: Quiz Master', 'achievement', (SELECT id FROM achievements WHERE name = 'Quiz Master'), NOW() - INTERVAL '2 days'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 30, 'Achievement unlocked: Streak Starter', 'achievement', (SELECT id FROM achievements WHERE name = 'Streak Starter'), NOW() - INTERVAL '1 day'),
    
    -- Bonus points
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 5, 'Daily login bonus', 'bonus', NULL, NOW() - INTERVAL '1 day'),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', 5, 'Daily login bonus', 'bonus', NULL, NOW());
    
    -- Insert learning streaks
    INSERT INTO user_streaks (user_id, date, activities_count, points_earned) VALUES
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', CURRENT_DATE - INTERVAL '7 days', 2, 25),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', CURRENT_DATE - INTERVAL '6 days', 1, 15),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', CURRENT_DATE - INTERVAL '5 days', 3, 35),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', CURRENT_DATE - INTERVAL '4 days', 2, 22),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', CURRENT_DATE - INTERVAL '3 days', 2, 28),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', CURRENT_DATE - INTERVAL '2 days', 1, 18),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', CURRENT_DATE - INTERVAL '1 day', 2, 23),
    ('22bbc716-bcdd-4e8c-91a1-1b0a80316053', CURRENT_DATE, 1, 10);
    
    -- Update profile total points to match the points history
    UPDATE profile 
    SET total_points = (
        SELECT SUM(points) 
        FROM user_points 
        WHERE user_id = '22bbc716-bcdd-4e8c-91a1-1b0a80316053'
    ),
    current_streak = 8,
    longest_streak = 12,
    last_activity = NOW()
    WHERE id = '22bbc716-bcdd-4e8c-91a1-1b0a80316053';

END $block$;

-- =====================================
-- VERIFICATION QUERIES
-- =====================================

-- Check data summary
SELECT 'Profiles' as table_name, COUNT(*) as count FROM profile
UNION ALL
SELECT 'Categories', COUNT(*) FROM categories
UNION ALL
SELECT 'Courses', COUNT(*) FROM courses
UNION ALL
SELECT 'Sections', COUNT(*) FROM sections  
UNION ALL
SELECT 'Chapters', COUNT(*) FROM chapters
UNION ALL
SELECT 'Quizzes', COUNT(*) FROM quizzes
UNION ALL
SELECT 'Quiz Questions', COUNT(*) FROM quiz_questions
UNION ALL
SELECT 'Quiz Attempts', COUNT(*) FROM quiz_attempts
UNION ALL
SELECT 'Comments', COUNT(*) FROM comments
UNION ALL
SELECT 'Transactions', COUNT(*) FROM transactions
UNION ALL
SELECT 'User Courses', COUNT(*) FROM user_courses
UNION ALL
SELECT 'Course Progress', COUNT(*) FROM user_course_progress
UNION ALL
SELECT 'Chapter Progress', COUNT(*) FROM user_chapter_progress
UNION ALL
SELECT 'Achievements', COUNT(*) FROM achievements
UNION ALL
SELECT 'User Achievements', COUNT(*) FROM user_achievements
UNION ALL
SELECT 'User Points', COUNT(*) FROM user_points
UNION ALL
SELECT 'User Streaks', COUNT(*) FROM user_streaks
ORDER BY table_name;

-- =====================================
-- SAMPLE QUERIES TO TEST THE DATA
-- =====================================

-- Get course with details
-- SELECT get_course_details((SELECT id FROM courses LIMIT 1));

-- Get user dashboard
-- SELECT get_user_dashboard();

-- Get leaderboard
-- SELECT get_leaderboard(5);

-- Check user progress on specific course
-- SELECT 
--     c.title as course_title,
--     ucp.progress_percentage,
--     ucp.completed_chapters,
--     ucp.total_chapters
-- FROM user_course_progress ucp
-- JOIN courses c ON ucp.course_id = c.id
-- WHERE ucp.user_id = '22bbc716-bcdd-4e8c-91a1-1b0a80316053';

-- View user's quiz performance
-- SELECT 
--     q.title as quiz_title,
--     qa.score,
--     qa.passed,
--     qa.attempt_number,
--     qa.completed_at
-- FROM quiz_attempts qa
-- JOIN quizzes q ON qa.quiz_id = q.id
-- WHERE qa.user_id = '22bbc716-bcdd-4e8c-91a1-1b0a80316053'
-- ORDER BY qa.completed_at DESC;