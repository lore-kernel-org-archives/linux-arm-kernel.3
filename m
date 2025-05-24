Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF03C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 22:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctA+pw0iwq71a2CU5/HfDOmg6L4QLY/4rAetftgLJfE=; b=Yq7iv7oKQJSNXiEGJNTY72jsXJ
	Y2nLPowt8oiuPdMGXBK3pKZOua6bAVpcZ6Vpwd9p9qeE8BbiF4plB3ofDL55GS9PPb9yZyTR7X3kx
	1A+8vit/WpsJtRUZFmlSCY8n1nneUE59QLajf0FG6T9RxaEeId4JByTUgs/zR8awIawuRb/ZR98HQ
	BcGLFMrqFiUp4+t6h7yn5jlXS49kFui1YpQbI6IOJZw7ROZZhLpUxz3pCuIIUqD928AoPt5NGcORG
	ZW9PZKoRJDIPwEXPXBs1Z/PfWCyXLpgn0xK6NM36xkxScaB20x0Se8qse/whAy4rvBoAD21+vMcAV
	rjPAlSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIxRS-00000006LL8-18Nb;
	Sat, 24 May 2025 22:34:10 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIxPM-00000006LDx-3nPW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 22:32:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DABF443308;
	Sat, 24 May 2025 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748125918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ctA+pw0iwq71a2CU5/HfDOmg6L4QLY/4rAetftgLJfE=;
	b=Fwtb9Q68LXYuMwGTgH6ki4eecalXw93ok0fpht6jqEJQqsUwkNw6d9gLJheTHHSLrlshv1
	6osgGSYStO3i+7WLQZOM5iLG0nYzU1EFmbOfoiX735m7189RufFLKZOIyRYG3hGz1m2Crb
	CmqJsDd5uYtC904ZtaQQZCSE0doyPP4zBVV+uh3uEpQDle6QAuLXwCncqTWZhSgnRbfVwO
	f29VJhVdgyTiuhUMoEKT7xPTK0tT+3Ir9Eo1ngvRB9wOlO9WNj3Tap5BYQLWhFBtIsCZ+c
	iMfT/VMaDkjjhDYEM+Ztnd/jpcnrU4m20/ZL6q4sju40JLwOh9/bjPbgyYNc3A==
Date: Sun, 25 May 2025 00:31:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	lee@kernel.org, sre@kernel.org, p.zabel@pengutronix.de,
	Ryan.Wanner@microchip.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH v5 00/11] Enable Power Modes Support for
 SAMA7D65 SoC
Message-ID: <174812590116.1278122.18254321478152467419.b4-ty@bootlin.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdeludculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhrvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_153201_091910_45EE8DBB 
X-CRM114-Status: GOOD (  10.68  )
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

On Mon, 14 Apr 2025 14:41:17 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This patch set adds support for low power modes for the SAMA7D65 SoC and
> the required components and changes for low power modes.
> 
> The series includes changes in the asm code to account for the addtional
> clocks that are in this SoC.
> 
> [...]

Applied, thanks!

[04/11] dt-bindings: rtc: at91rm9200: add microchip,sama7d65-rtc
        https://git.kernel.org/abelloni/c/0a68f5be7883
[05/11] dt-bindings: at91rm9260-rtt: add microchip,sama7d65-rtt
        https://git.kernel.org/abelloni/c/bf1c27c6d540

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

