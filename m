Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53000C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=50/m+/yb0jxBjg1zUH7OGJM94gBchdEwxDdiaXdUt8c=; b=sl6JWE9xW5qLo1
	VXiTQqOaV8CpsnH53UGuAnodQEgw/CU9Sxd780LxSP/z8kWpsTKW7Y6zU4rYnPoblmkhkHuXu/9cK
	IX/HJrs4GnKW2rqrhpuKx3fITdi7+pOHGUGkSJSngWw8WF8jy2Hpnjw6xryzGxkTzP4yX1L8VmJVy
	ozQ/+YICSKNK9nNt7LkK2bKQzYswBjKwtQ51A9ANyLo2ssMvFxcMCZoJcYKjIPym6tqevFE+tnQLX
	FZgafl6M/jIbl0efBYna5kft4t30OwqNJe+62bEKXf4lXibAY3MtYYqaWQVBvGvjMG9mXMNhuQNzl
	jjRNBQurMFRwXfpFpoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfLK-00000008aUL-0UvC;
	Tue, 17 Jun 2025 23:03:50 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReqd-00000008WSj-3GPj;
	Tue, 17 Jun 2025 22:32:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4762441B5F;
	Tue, 17 Jun 2025 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750199523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=50/m+/yb0jxBjg1zUH7OGJM94gBchdEwxDdiaXdUt8c=;
	b=kibDh6LgFbbHogi/cLqDkDUuFnWUKPi51fZeyLRVk1ZUZVbfEKsPeFmlykH7krrqSY9qEj
	EwyJsh8npSM38ionZkwt5Cjnb9U3MOGI69yHD5GU8W3fZJm+OQ+MBbKTlTlUiSirCFVuac
	Nr++Cx+bhdAx+d37y8BInbkXlOs0Ky4K4zruOv7z7m6gEgXZ/kEIvSe+NQKyMQlGox4EYF
	7o98CNi45zM+JxdX275n+vTA9UVZz7QuNQ2XprM0UV32GErgrRwtPFLYB/eXec+XIB8Kvx
	qGB9dIuCIlprDp1ZZ8byTixDpwg2CtKZmcTM0asLpZhKuI0QDFRmISeBu4KErA==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Subject: [PATCH 0/3] Fix the Rockchip PinePhone Pro DTS warnings.
Date: Wed, 18 Jun 2025 00:31:59 +0200
Message-Id: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/sUWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ML3ZSSpPi0zIrUYl1LczMTUxOguKFRqhJQfUFRKlgCqDw6trYWAL5
 +fvdbAAAA
X-Change-ID: 20250618-dtb_fixes-97645402512e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddufeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtledttdduvdfhjeeiffevieegleevieelfeelfffhueelveevjeelhedvheekieenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_153208_425419_2184F400 
X-CRM114-Status: UNSURE (   7.37  )
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

Small fixes to the PinePhone Pro DTS to fit bindings and
suppress warnings at build.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
Olivier Benjamin (3):
      arm64: dts: rockchip: Fix the panel compatible for the PinePhone Pro
      arm64: dts: rockchip: Fix the mipi port definition for RK3399
      arm64: dts: rockchip: Remove unused property in PinePhone Pro MIPI panel

 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
---
-- 
Olivier Benjamin <olivier.benjamin@bootlin.com>


