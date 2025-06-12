import React from 'react';

const Trending = () => {
  const articles = [
    { id: 1, title: "React 18 Released", summary: "Learn what's new in React 18." },
    { id: 2, title: "AI Revolution", summary: "How AI is transforming industries." },
  ];

  return (
// haz un componente Trending que muestre una lista de artículos populares disenalo con tailwind

    <section className="p-4 bg-gray-100">
      <h2 className="text-xl font-bold mb-2">Trending News</h2>
      <ul className="list-disc pl-5">
        {articles.map((article) => (
          <li key={article.id} className="mb-2">
            <h3 className="font-semibold">{article.title}</h3>
            <p className="text-gray-600">{article.summary}</p>
          </li>
        ))}
      </ul>
    </section>  
  );
};

export default Trending;