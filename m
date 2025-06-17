Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B0EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY8lr3cwBhpY747VHtfxpWMlqtvjqMvD4rBIcdrKAxU=; b=0JW/vE6unOhyoIOd9s8l1KHAoF
	lQW1JftLktKCZSyblIHnOvmsyy5UcMWhhG8wpo3R8xN2mOGAPHWEs7UgPbAFHTatbvkFfD2ttcGPA
	BjFXtG5FdqouPZTAeN7aOJ3xmfJJbD0S/TW14sGzQfH7jdypAQHqnXzeF8g9naEj3vRmCPD/wz6Dv
	koRsp7mHnp12pOjYkAhNZX6ab2766EKMtAibtzBwe7IHC3z5BQ7iQPG3dYcexU1peZF6UTrQZ+6oz
	HYR5YmJennJAngO7FCoh47gXe2ByuowixqU1ZNKvON5Xt9xhSFdh5ByO3pSqCA7RSvYchsWtqwJBs
	LG1niiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfGx-00000008Zr8-2rZu;
	Tue, 17 Jun 2025 22:59:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReqd-00000008WSl-3IMB;
	Tue, 17 Jun 2025 22:32:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38C2143165;
	Tue, 17 Jun 2025 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750199524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BY8lr3cwBhpY747VHtfxpWMlqtvjqMvD4rBIcdrKAxU=;
	b=C5tZyF3M+bt1MHFLo9nXnW9oA87sYfPMoAAzCDOJgOaUYBToftzB8ensVCrrjf5ioRM/Wa
	g5wOkC2qxmQxVXjUBxW8Uy6uAA3Nb4EE0xhKct/vS8kecXMneLuKjj3PHxitwbY4ZJ0fOc
	rijcA1Nml/R8umSpXkJ0E4sDhyPNZI26PUPADFlJ+VyVq2XGHtqjDQ5keBKRCtfnxY38+4
	03hw85ZtaInPvfAKpVWVzt/CGRreSijRiVZwL+VNLm8pA6XK0J4TUgLZNN+ZMDpD3Lv0K/
	6Rer6iJk4asT3b2KmrbZgxnOToRmPQdtETEClsoONKa2diUG02jwkaBOIcb3aQ==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Wed, 18 Jun 2025 00:32:01 +0200
Subject: [PATCH 2/3] arm64: dts: rockchip: Fix the mipi port definition for
 RK3399
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-dtb_fixes-v1-2-e54797ad2eba@bootlin.com>
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
In-Reply-To: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddufeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueegiedvvdevveevvddufeejvefftdeugfffkeeileehheefieehgfelfeeileenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhrt
 ghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_153208_410515_13D944B3 
X-CRM114-Status: GOOD (  11.01  )
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

The RK3399's MIPI DSI has 2 ports: in an out. The definition of
the port property necessitates the value of #address-cells to be 1.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 5ebc380a24df86ba7172b0950b89cac56b61c507..5a7341fb6bcb0613af6f3ac31d99355a0f890e89 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -468,7 +468,7 @@ &mipi_dsi {
 
 	ports {
 		mipi_out: port@1 {
-			#address-cells = <0>;
+			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
 

-- 
2.49.0


