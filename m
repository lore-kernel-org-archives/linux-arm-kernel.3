Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1355ECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 16:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L96VtSiC03dq1BdD8urFU7CrXJuq+FaNhs8xSL+/hU=; b=sxOLF+YRKNOpYg/0eQxvaCt0wx
	4CteOMH8OcjlfsT8JdgEBWlQmDLxJN+jegJfQohA4wZ1pPK8uNLLwDqahUAp26QlymRZNn7h3NWcC
	9MV48giOy9m1kmeDNf/Rew0EMqUhx27Fe5XA1T/LubdkcCfyEdLQMMSwrpOmLWxqmwkrunJL2gSbM
	dNwb8HXccHmSo5FL7NrtwOVLVU4bCxe52uJvBj5K/QvL23phJMkeaDP/7SI52mSpKY5yWrabVy/NQ
	hBydjI/uQZ7ncvlbNofMv74uoS9rezFSL2n3YhXFaQdrOf3nTWgg1Hv43fYeJaSrHgY4CC4T094Xn
	86IexxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMeC-00000008wE3-46bQ;
	Sat, 30 May 2026 16:34:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMeA-00000008wDi-0q7M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 16:34:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E70444372;
	Sat, 30 May 2026 16:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B412D1F00893;
	Sat, 30 May 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780158889;
	bh=5L96VtSiC03dq1BdD8urFU7CrXJuq+FaNhs8xSL+/hU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AabGH03Ii1Tnyilz+KBLrISe+TT+FT2ZOIcPdlrAaK2mI8YuyNhyRUPo/rXwutOOP
	 zI94tvdDUSrPgRIYSlJ82xrswt6s7vNqKiF6h4wCtdPpdK6/J0F5ct1gQ21bI4/tvz
	 Y5UbSAoe9sO1flU+uyUMgUvO2+UZoXagk3eN1sb40qqc3PYfzQjYY93aBo/En8YVBI
	 BAngxXbGv9t805xtZ+BU7pMwGHPO+x0oIIOb5rG6u8JEAJ2PvkQiZ1mbCC1FmhNvTT
	 lLSl9/1aZi8SYKg5QeDVSHqVEWQZkPdh9J3KTuTdyk+oHHo/Gx/mp8EI6NVT1cPRcc
	 Y7pfQm8fcQ5nw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add myself as a co-maintainer for Samsung SoC clock drivers
Date: Sat, 30 May 2026 18:34:39 +0200
Message-ID: <178015858045.36212.17396395017417877709.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527-samsung-clk-maintainer-v1-1-97b179224ca5@linaro.org>
References: <20260527-samsung-clk-maintainer-v1-1-97b179224ca5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=505; i=krzk@kernel.org; h=from:subject:message-id; bh=yrpEQcYWGN8YA/WJWhQDt4erz2YnL0GxkJ/6OVEoh5k=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqGxGfdiGuWFX4jnt5lscUQeZustM3U9n3qHhQF 4O+78xuyx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahsRnwAKCRDBN2bmhouD 15wrEACXpjts0e6PvbbLkQm5J6Q+NPuBb4qEIXMNX0mDwUfu4b1VEfECOeyzzi2EUSANSoYNcxq B3laKWbRjqsSrWokFeSSugjc487oTo0DviZWkrPG9dsRjD9c7OsvPDr5oJhO/QBlCB6CwHPnjdo 5j4/6Y5A6HY7HTImQZrEUta7IBUmlh+8uSAeDq165WUBOyHJ0/UtFZ9b/W6QRTs1qhkmgk77VwT MU8q9Y8zup6uBJUiFNNsDEnZ/g9Rl4IA9Q2F9LEM7e9onnkJY5pYSCrm2GW03eReGLmQfz1k3aj h0tPANaXb4dTVW4sm7KIwVHzRxM90D8mQxnCQV0ZArGvQj0enW+zXOESMF2iNMEabcXtOkr3PuX Zuwp/xkiyrEyY7M3VnxPfvaNOxcJxNRZJIT2NJqJ46qmxbF5TiZKNSxgm8fvlN92/Fjf2WIZsOj V+/CZjspAK5+Qt+IuYwT4dWhC+atXKuVSJdSEpOZUVRyPe0rAFZhx40IlBcZHA6c6rImkgcx4Z6 tAy3pmBEm4b/sIfjsZilvBzeagNgnVklU29pB9v3Ig6TvN6DdNDDmhvWYxcJLPv3qRzWSfXPP3n QfJENpNNJaY2Pk+BH36LJICNyBxEZ0K8prEn7/aixInFHPhCfQlPYhs3asblA8cOQFAaqzRxpk8 49lsVClAOnwUBy
 w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_093450_257409_E1DBE5DF 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Wed, 27 May 2026 21:53:52 +0100, Peter Griffin wrote:
> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung SoC clock drivers and have an interest in helping
> maintain this code in the kernel.

Squashed

Applied, thanks!


[1/1] MAINTAINERS: add myself as a co-maintainer for Samsung SoC clock drivers
      https://git.kernel.org/krzk/linux/c/20550601bf4c23effa013a5f37e5250618869e87

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

