Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE2AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 22:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9XdcBVBnhp8c8ZBsriCHLzr8nNacrDzZNd3KKWw4W8=; b=NGaSsz0oVIAgGIabbOPjSGZj8b
	+owMrgoX5d2AwcOBqmX8RB6FUZd9YASU1GaOwhoZ2W4hGnqbGWEREwhKvB6ansRduhX8pXdznQdFe
	mnuZNjQIsP8N67YZZCShRTobX48wiJZrkQsIf0KqBJSVYe9oXjdGzVgCn/9RpJfAH7mC8LkfIE7ec
	rm5rxg95In+ybpOU/LkpyTxQ3qGj+i87XJVJjY4wa/IffjjkvtzThnJ2x9SqzrmEREG/CMbuj1riO
	GKq698manAnbcg/kd2NfmLGvU86sQ6vfvuRFZ2TUjAhojEAS6hbbGKSCsr4MHdMwC1PjgzpNLZA9C
	ZorBVZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrDt-000000060SK-1HjR;
	Sun, 01 Jun 2025 22:32:09 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLr7w-000000060EB-01nZ;
	Sun, 01 Jun 2025 22:26:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3764432FA;
	Sun,  1 Jun 2025 22:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748816756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g9XdcBVBnhp8c8ZBsriCHLzr8nNacrDzZNd3KKWw4W8=;
	b=egUJasPsaefuid6MU0YZfsaXVy9wCo6z0IX5RgBCW7xW5LFbOYx/w/uXQ98qKu62jowkRc
	Sq6dxkuNutMbtl2vWqt2OucUB22bvNkvB9NQiPJTbT8x3r353bAKKL4K9X7cg2JggADzL/
	jqUTrs9z+W1C9Zmhr10DUVmcw6JYWj1SCmOl9v6DktnVsCtbbSUd5jkDGRd+oU+cHdp8Ga
	ByIoEyA2gOOfv6uoBCRxK0a6G8KQlCCVC9uSf+HrTCyPTVV1pxeHee6kiI7xdApUd0FVa/
	GD+YsF652mX0khfIY9rLEFrcIgRJChf4SppnNcwCJMJLU7aGPijpvl0aahpaEQ==
Date: Mon, 2 Jun 2025 00:25:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
Message-ID: <174881674471.460857.8494829036544139744.b4-ty@bootlin.com>
References: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepvgguughivgdrhhhurghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepshgvrghnrdifrghnghesm
 hgvughirghtvghkrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegrmhgvrhhgnhgrthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_152600_347378_65CF0137 
X-CRM114-Status: UNSURE (   8.22  )
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

On Mon, 28 Apr 2025 16:29:55 +0200, Alexandre Mergnat wrote:
> The MT6357 PMIC contains the same RTC as MT6358 which allows to add
> support for it trivially by just complementing the list of compatibles.
> 
> 

Applied, thanks!

[1/1] rtc: mt6359: Add mt6357 support
      https://git.kernel.org/abelloni/c/3d8b44b104fb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

