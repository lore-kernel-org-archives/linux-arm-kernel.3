Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADCBC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esmmfpi3kvEuTnF8NNPy+ASdlcPdHl8nczq2Wpky2kI=; b=xhtOqKPQZKG1COG0m0viNQf2gu
	pwsIwvpVRp4yirmrJDReF67FRA8FCZIwgOdrDvn5F9KhIY6UXGCSf7wbs5/Fev65pJMwNEdNzxHhl
	47/4MuZlIaN2AHQVm6av3WKK3Zu+RjI4qt3sp0Vapw3K1T2sYEQ5PGVTUWibUs3FPcUHKVRN4Og1M
	SUhDR4El+1FpD01SzmW0CX186v0xtfhvCNb0ynWKC4rDAnMA05kKVa0boRWZuEP+SbWvsBragvaqL
	T6gohLndDifwDV2HTYsBiT960bSI7hlNY+4wr5Fk4rmDSCojUKU3ytXsYu1yxZweirOTtp08SxVRS
	/B8Ab7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfJ9-00000008aAQ-0QG1;
	Tue, 17 Jun 2025 23:01:35 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReqe-00000008WSp-1Dz5;
	Tue, 17 Jun 2025 22:32:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A21D64316C;
	Tue, 17 Jun 2025 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750199525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esmmfpi3kvEuTnF8NNPy+ASdlcPdHl8nczq2Wpky2kI=;
	b=f7YEoRxabbDiuDE81Y4N7liiuep0PepQZBg4OcbRpIFGIKa4Bn/euoAyzd5uw/Dqwk32+3
	3ZfiIWRiAz+G/U/aPg4jtSknpoUL3rw0jZIl42c21UD0ai3BnXJnWL8dO8ziKmBz53G5LP
	ua9CNK/CX6XDyNfKjkN5B/Sfl8It4K5mbJzTAs34AikOaMRL7SldUojIGlSAG9DsCrjBly
	B8l1OmSOyUrd/gfBQuCx8RzgXbxKj7mr2FPpzKU5PVqUsCo1GmxTS1+7fyq+Fpsf6f3qhp
	bFxZfOaciK6wQ+0N6uXDXw4hLHh9bpeJuihmnY5qOwZH324wEJ32gLSYAWDHMw==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Wed, 18 Jun 2025 00:32:02 +0200
Subject: [PATCH 3/3] arm64: dts: rockchip: Remove unused property in
 PinePhone Pro MIPI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-dtb_fixes-v1-3-e54797ad2eba@bootlin.com>
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
X-CRM114-CacheID: sfid-20250617_153208_488496_ADA783F4 
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

The MIPI panel definition in the PinePhone Pro DTS includes a
"pinctrl-names" property, which is unused in the absence of pinctrl-0.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 5a7341fb6bcb0613af6f3ac31d99355a0f890e89..405140700208365c8631de86a2d7b6e577b7aa7f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -485,7 +485,6 @@ panel@0 {
 		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&vcc2v8_lcd>;
 		iovcc-supply = <&vcc1v8_lcd>;
-		pinctrl-names = "default";
 
 		port {
 			mipi_in_panel: endpoint {

-- 
2.49.0


