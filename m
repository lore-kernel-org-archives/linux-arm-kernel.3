Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AA1CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCmauNf7s5FntNtudgCLlOZcs3Emgfa8V1BlciZ5v+A=; b=t5c6LgDFLXO2VazwB+ibvqzkcc
	/+ko8ElJOF/ucU169ZyAQp3Csyn19EgBaPRMzO4gGDIH0FBf42+6ct1JihYZMN0KMDBJDqChzy6pP
	hskRy92BZ2VY7u124X3pUf22J0fw5O+l6cJo4SoDxqzCsJgpoGXSbodxqC3o8CQHc0laib3kfRAh4
	d68gLYGfmOU9QCAsyKq8BB79tNlZanG+USJkkR8t8arEJllFMaCqG8Qtnu3aNahIYdWtgqHcOIsxZ
	xZTr38SoAd5ziMzFFyl1+oz5JO/C1ajriQBnWbiFZZWNsaFyDeZeyfvoWYeR+FC65xEfKUCz1jQ08
	+TiHMDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCr9-00000004MSk-0acK;
	Sat, 16 Aug 2025 09:05:43 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCaL-00000004KFk-31OB;
	Sat, 16 Aug 2025 08:48:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-244581d9866so22312685ad.2;
        Sat, 16 Aug 2025 01:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334101; x=1755938901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCmauNf7s5FntNtudgCLlOZcs3Emgfa8V1BlciZ5v+A=;
        b=kVAjQMCCx0MYuBa3Qh4LSrgc+CBo5Fk4xV7Ggm/P4RhVAhTVUz2ubNnWuoy9vkBpX3
         FFVkMwXjvEAnSwCi/aGDB14l1xl7wCe+N1zsOHJfvSCMxr14OhXNmxAYaQ1FvE24/uPZ
         benDGbP/BGzgWVZ2DohM2+m4wgG89Z9SkYsOo8Ok+v6n1Q0LMcmlWB2uZ90vE5IisFnH
         vCD/vQsxl51v8Nfremm2ZVc2oamejYo+isdwLKk/AlEGaZiiz0xl83Jh6a0HT9VCpWmV
         sq/AzpGhmjJCvIz87DOy6Myhgncq3qPLDLSZEtx4DWmoYosg+9jiiO1oC02Lc70IfQ20
         /baQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334101; x=1755938901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCmauNf7s5FntNtudgCLlOZcs3Emgfa8V1BlciZ5v+A=;
        b=RkHlSVpX/02ee1/b0NDDsVbpk1caygqRM732Vhej0N+VfOBxdAHOWvjcDneXifxfni
         3A31T9ktf1cTtv7ZLWVI/OpCrapHnJgv031RWJFQZEry/bdwqsCKZveCaOjsXPbm6WvW
         8gsFvPzd2jT1GFKF/dzUxwV/GmnN+NsEBc9UZbxo1aMFmwTVbUrkLnAyAv5THHo+D6yL
         ym9BqMT5f7cbeICdMChBCx5w82qK7dLwQeBrpXsBcfTuI4Kc9Zgoy9wqUoc7MxAmnJmy
         1n6vBZ3+PgMKGMQip+GTPy28WqlurJiLTHoEtwYiMQtr0sQa0Sfol0eEYb6rFr0NSjJh
         sm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUejqNcggmVWhR7NryJ4kGrVxaq42oAJ/b0ku2+GwIneuLn93vT2UeXBKGTzkaYvYV7Fss+L9ato+LGtxIFIpg@lists.infradead.org, AJvYcCXInXVMxOAPrYg1TxI3zhGPr4j3/1ipILEKXI9kFuyla2wRsQXk14HaGMVCuGTmn0/dhjnA6Hb5kqXN@lists.infradead.org
X-Gm-Message-State: AOJu0YwSucgBXYA/PQtA+Qz1OOANvhgC1U0bLKCHDHE7LDXttsQKyKVt
	TWZ5GqQslC0wf+AxYLCqzfV1hKgtvnWn9iy7+VcvhU+xYyk74nV06D1D
X-Gm-Gg: ASbGncsQjqP3e4oYlHW0Zmo2fD4tyauVtC3COS0rluUMKhmQPQkfzL2P8q5TSAEdx3d
	n8wRqy6uSTfRoZG/ZL+bvUNzos4zXUTvIOaAp8VY0hAej4LVVDq7rt9+Nu7rIH+waZig5Sw6s5U
	lkJuhEroO+kW8KqElrgoI0hMwQ5M3d8n5+mo7a7PX7ND76rsMcyZ+FraPhXchbM86/TsLD3bvsE
	udmcVVprlOuQfJosgOWFIiwa5JavAbuKxEmcK0/LU7WpxZJuXVIb7csml4NN+bRB+r+wvTusVlR
	GtpZq4ZhvZkDwimefxNrUGGQlCgI2R859rqEDwikoUZFqNO64m5URayulQ0g0cbKC13+DeLdlCo
	z4nbnkmZOZyM=
X-Google-Smtp-Source: AGHT+IGpbFzYzzfHGbiZJhEqwpiiL3XiXv/bsEZ7XwHQ7nIZIbLySNrguZk+IP+kgbrq8QPu+xMORg==
X-Received: by 2002:a17:902:dac1:b0:234:d778:13fa with SMTP id d9443c01a7336-2446d866269mr71913515ad.26.1755334100952;
        Sat, 16 Aug 2025 01:48:20 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:48:20 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 6/7] arm64: dts: allwinner: a523: add DWC3 USB3.0 node
Date: Sat, 16 Aug 2025 16:46:59 +0800
Message-ID: <20250816084700.569524-7-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_014821_758151_2871134F 
X-CRM114-Status: GOOD (  10.25  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

After adding the phy bindings, we can also add dwc3 node, which uses the
previously added usbphy2 and part of usb3 from combophy.
All settings declared in dwc3 node are obtained from the x96qproplus' dtb.
BSP contains an additional glue driver for dwc3, but it seems that it is
not needed.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 233365496..ec170888a 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -606,6 +606,27 @@ mdio0: mdio {
 			};
 		};
 
+		dwc3: usb@4d00000 {
+			compatible = "snps,dwc3";
+			reg = <0x04d00000 0x100000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "host";
+			clocks = <&ccu CLK_MBUS_USB3>, <&ccu CLK_USB3>,
+				 <&ccu CLK_USB2>, <&ccu CLK_USB3_SUSPEND>;
+			clock-names = "bus_clk", "ref_clk3", "ref_clk2", "suspend";
+			maximum-speed = "super-speed";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_rxdet_inp3_quirk;
+			phys = <&usbphy 2>, <&combophy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			status = "disabled";
+		};
+
 		combophy: phy@4f00000 {
 			compatible = "allwinner,sun55i-a523-usb3-pcie-phy";
 			reg = <0x04f00000 0x100000>;
-- 
2.50.1


