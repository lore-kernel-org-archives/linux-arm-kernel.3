Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0BFC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 21:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ewaN9QdWY1htk3+cEq5mwLDLsxgmkGUUi0mCDecEpA=; b=dAc1lo4wHqvaOKpLV5WbzO5p2h
	HtjYhds9NcJbTTzQXAWYxO6TBITZ5y03Ialz69FKVnC2fQLDYj4ZNjTb2yimqU8eqRFSTIWT5f/U4
	peMul3EZgQJabca+csbCQ3VIPZXje9Xcz8/76U1IJiWOdxFWD4jM5P/XRlCI99i4fTfhnuQYqqdz4
	TFMGwm9JWiWvvZRqnmi9YjeSqSXmk57HBW3nBykAqsRE9j2fs3XH9geBZhhrefneo4l1LTiIApXQh
	l6F9DZ8hYrChslouDpKO7QlAZIZ8Rg6NN3ZCx9yeNPwlcIeeYbOLjUJorZxYRcgRa4IsbL3kYQEVt
	WalbFlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uehIR-00000005ztq-0ukA;
	Wed, 23 Jul 2025 21:46:43 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uehG0-00000005zlK-15TT;
	Wed, 23 Jul 2025 21:44:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB80343174;
	Wed, 23 Jul 2025 21:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753307049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ewaN9QdWY1htk3+cEq5mwLDLsxgmkGUUi0mCDecEpA=;
	b=XnUPtqyx1VWKbhqMY3+QdxkkrEDT4NlVqYgZzaqqSEWZXWhdkLbjtDVRuy9GcLuAUpbdGJ
	u7eO1Jq8e9wx6zZufltfACwFYotrkGeZID/dBTP8tTfyAcqKcZbpfemL3BZqdxbI4Ahy+A
	C4g41SPxqyDuW8CMzKYXp4IYjR1ETiyCLPuzJmhoEi9qRx/X0qaJRAFPAreFg7moO4OQR4
	6rk1XSctuj/Rw4/IPLvRTK48b2MdIPk8ssvyFAuL1b4XowuUxzK+cYopTbapsz3XYnAbrd
	6cHsUkw4ZSayZ94qG/MoPLKe5DDH6ONl+RMQADFlDZvodlRgTJUP9/qKOqEQQA==
Date: Wed, 23 Jul 2025 23:44:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 1/2] dt-bindings: rtc: amlogic,a4-rtc: Add
 compatible string for C3
Message-ID: <175330704073.843948.17656447589473217659.b4-ty@bootlin.com>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
 <20250717-rtc-c3-node-v1-1-4f9ae059b8e6@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-rtc-c3-node-v1-1-4f9ae059b8e6@amlogic.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohephihithhinhhgrdguvghnghesrghmlhhoghhitgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepmhgrrhhtihhnrdgslhhumhgvnhhsthhinhhglhesghhoohhglhgvmhgrihhlrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_144412_426704_7A26BAAE 
X-CRM114-Status: UNSURE (   7.50  )
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

On Thu, 17 Jul 2025 17:38:37 +0800, Xianwei Zhao wrote:
> Amlogic C3 SoCs uses the same rtc controller as A5 SoCs. There is
> no need for an extra compatible line in the driver, but add C3
> compatible line for documentation.
> 
> 

Applied, thanks!

[1/2] dt-bindings: rtc: amlogic,a4-rtc: Add compatible string for C3
      https://git.kernel.org/abelloni/c/db22fd8880a2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

