Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117B9C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAH9S+wzjFpRJSZc87Qu7ARvwl7o1j4kN4JhTt+7yzg=; b=FarrUWrRCeMGZQnVTBZH6vE93k
	U1ncc9Bu7D7VSEMhQUAvG54CcJx2uH3o3JLwVEMK6lAVTiAwpkVHb62ZJD057UhV8NViG6sNWspn8
	ArexgEhPuivzxsfynZnQJPGa7K6lmxNfSbDYAWalYlZJY4/jm2lIJ4diCEajXhausVlFGHlnsyKwa
	GkrNFlV+iaTzhBJfm+I8WbykWqDFEVwYjqdao3Z1PuTYsAOdloUTTrw8ca/nlCHUeri9Dt3gYv4o8
	9DCRPkibmWf7g6g9gn6uJEvzXPFFHmIqaEKh/GyxmA+GJunzlKmVOcKvCdfQmQA4Gupk4WDGnik0v
	EjScJESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfEm-00000008ZdN-36Z2;
	Tue, 17 Jun 2025 22:57:04 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReqd-00000008WSk-37oi;
	Tue, 17 Jun 2025 22:32:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4E2A4315F;
	Tue, 17 Jun 2025 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750199524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uAH9S+wzjFpRJSZc87Qu7ARvwl7o1j4kN4JhTt+7yzg=;
	b=l/5sDpKIrEuGoYbJ8d+teG+Z4XdYFqqoZ2u2QKLK2lSDzAwO9U6kS/1nbGfzJjzQF7GXR0
	rVxn5cJyVyG+TfpMeDOdQKkbslYM9qbNLWTwbMO1JEUHW3wNgGsnKPl2Fc8N7SqD4UHx3u
	+LCeglplZyA8jCFCfLIk7Eao8eRfKrk9rN2bRqmuY3vSiM+rP7Txqtf1OlwAQvzNG3O70Z
	dFrRu3vBZM60N7HiHMLtyBSPaXBo2wjiI3QWAKPGbn+PT1HX6b15P7aG6jnKmJ9EbS9m7m
	n8NM08Z1nK7fUw6EFpsOxV5qbJW3KaVC2qsXk0XGrSHIVlCaMiaPbvWFq73KuQ==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Wed, 18 Jun 2025 00:32:00 +0200
Subject: [PATCH 1/3] arm64: dts: rockchip: Fix the panel compatible for the
 PinePhone Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-dtb_fixes-v1-1-e54797ad2eba@bootlin.com>
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
X-CRM114-CacheID: sfid-20250617_153208_418462_2DCE8324 
X-CRM114-Status: GOOD (  11.21  )
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

As documented in its bindings, the compatible for the Himax HX8394
MIPI-DSI LCD panel controller is in 2 parts.
The PinePhone Pro DTS currently only specifies the first part of the
compatible, generating a warning.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 04ba4c4565d0a205e2e46d7535c6a3190993621d..5ebc380a24df86ba7172b0950b89cac56b61c507 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -479,7 +479,7 @@ mipi_out_panel: endpoint {
 	};
 
 	panel@0 {
-		compatible = "hannstar,hsd060bhw4";
+		compatible = "hannstar,hsd060bhw4", "himax,hx8394";
 		reg = <0>;
 		backlight = <&backlight>;
 		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;

-- 
2.49.0


