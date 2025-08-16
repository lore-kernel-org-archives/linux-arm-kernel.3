Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B49FCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZaUVKgFL1lunF4nMqIkLNfN3yrPrabF4vqHbgSjhvc=; b=aNhHnQxi7qv0M8bOM1qCzP4lp1
	UYxKYrReSkNA4408JjNzvJbF0cq+RJHbLlRiAXcZDvylAALNqXRLTWTR0b+TR+9BgBYZzsaTvt8jV
	lk4fgMdHJE52ouvzDWsU+0OrA/5MyEQPU6VIXJGnvwGR6rbBeLcFkezuQgkHg67WqcLnvl9Lxpjnd
	nR6g98bDKu7AGFcjj7iYv/51UZS1ixHfpSYScfxYurxRenZfB5zNURWohpzCKgmhXhIZLR6UnWIvo
	UYkwOBV1Y9DjDL+ffE1LjI5SAyKhr+B5ilKnIOLDiB7gP5bZdpl8cuLh9ATNtZUZyb9RMWUFu6cTP
	K2AjAPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCoe-00000004MIp-09nu;
	Sat, 16 Aug 2025 09:03:08 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCaD-00000004KDV-2YA0;
	Sat, 16 Aug 2025 08:48:14 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-24456f3f669so27106295ad.1;
        Sat, 16 Aug 2025 01:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334093; x=1755938893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZaUVKgFL1lunF4nMqIkLNfN3yrPrabF4vqHbgSjhvc=;
        b=XT7R2Iof6KPf2P0Hm5jV0tkuGKiDyGEZItLLYoRQfEboAd5HmnWgspKSFmGZ0ADm9k
         K5dGD74ev7XhHVjwdbzaD+LQPaWGC4yzgW/zjgDebrXSyeQ6/BUhRmySgTQ7GWaQXvpC
         pNvlvC31jD0DIwrFJa2+xlwpUG74MBxyZgvVXozXgoIxLUOwfijFU5kUP+B/rK42cDbu
         C+qmJcu83uIHuXC63Nh+4WE05o+f/6HKZxmGUCvTP8AlhhiM9yymwtvvUqdhoTaNCgAW
         x2w0hIXMt5uY9CCoild8ArGkpIjlgGe50cVn8qIzF7PqrRs70Dg4RM9v46phw2ci6eu+
         37GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334093; x=1755938893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZaUVKgFL1lunF4nMqIkLNfN3yrPrabF4vqHbgSjhvc=;
        b=V4aOJcm4YuBNvOpyyGJxEPtgcA/7lDHEaPLHle6Az7KVOIHDtnz5/y9tS87/x7BV4E
         NV7wAExLHDosbVUX+uire4WHvsrBAPHI1wersooItqRar9NF056aSDScSxXf2MqpPpXw
         GQXONZ+EtUAh4ubMp/cSivDrR/M50KCisXDypp8L7f/ulII42Dk8e2A+baGr4XGKfc0W
         X7LHNI6emRNeZZorgRKvH1shD8QFopEalldPzb38FPaBnTSAnqs4l07a6lkZU1LtsuKy
         6tl42840TrhWZ5USRX/K3kLZhjG7DOW2R9FrBJjejmu1n0j94Kn9UtQHD3IA6E2EfjTc
         uVvg==
X-Forwarded-Encrypted: i=1; AJvYcCUK3Qzpn3ulkjhN7iCCiLvFJvA7K4nwByJCFKcaN+XvLDO0UMTOBiPgiLZ/kxwCBqb/D0UVH8XGL1QLbsqtbsAb@lists.infradead.org, AJvYcCV3X09aPleKAtOr9wNmzqKxd+wMuGm/6zO/TZv8Jtv1L4QXk9p40WP6tujetnQcQxuFs8n/hOdI8FK0@lists.infradead.org
X-Gm-Message-State: AOJu0YwOHCDO1RARj68DV5UuRZPmTMe+hafUghPkJNa+qKHQRKSIeUhv
	e6D3BNZyqFgwCVJH3w79DXZHwyDCKksA/b/etfFWO9Iuae0tLSkCGtJw
X-Gm-Gg: ASbGncvlOYOnTzIsp8GMH3iu4otysfXgJfRHSofwGKVuB50Fso7dvmvBj+88kJctui/
	awQDCTOifSXrq0WRAC2Q7vx1j7OzyWjW5gYgWNpkkX5FEcQXZNDJgb12eSRYIIgepfnirTXjG2t
	cxC4rUHShmHEGDBESUCKXSrDp20KZMm8mIp+ci53VzZI5b3DGOMitWiVeM+UaMV9a/0n96RyNMk
	phvH/e+LHsMP72/S4QwhMGfb/p1K3v82Bafkrbb4BHnmjUDztMXe1pIbqO+kYBBRWoaCm6kObuS
	gPfetCw6SZfEM/UqpjbOosL+aJbK2r/J9Xrm7Hf952THhdoqRR3tG9/Pm5EteAMceVQwwWAk2mJ
	XRwGZdc1d5jM=
X-Google-Smtp-Source: AGHT+IEeC7TzpwrnZ29EptzNFEC8zZV507GN6tiYHpU7eLNsZcGs71sZYOzt9Mx6896AVTDC5n+jJg==
X-Received: by 2002:a17:903:2d2:b0:23f:75d1:3691 with SMTP id d9443c01a7336-2446bdafa24mr79167475ad.15.1755334092874;
        Sat, 16 Aug 2025 01:48:12 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:48:12 -0700 (PDT)
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
Subject: [PATCH 5/7] arm64: dts: allwinner: a523: add USB3.0 phy node
Date: Sat, 16 Aug 2025 16:46:58 +0800
Message-ID: <20250816084700.569524-6-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_014813_644571_242AFFA7 
X-CRM114-Status: GOOD (  11.28  )
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

After adding the phy driver, we can also add phy node. In addition to the
clk and reset lines, the power domain PD_PCIE is declared in this node
according to the bsp dtb. So let's mention it. 
Currently, phy driver does not support role selection and only works in
USB3.0 mode.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index e4ed4fa82..233365496 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -606,6 +606,16 @@ mdio0: mdio {
 			};
 		};
 
+		combophy: phy@4f00000 {
+			compatible = "allwinner,sun55i-a523-usb3-pcie-phy";
+			reg = <0x04f00000 0x100000>;
+			clocks = <&ccu CLK_USB3>;
+			resets = <&ccu RST_BUS_PCIE_USB3>;
+			#phy-cells = <0>;
+			power-domains = <&pck600 PD_PCIE>;
+			status = "disabled";
+		};
+
 		ppu: power-controller@7001400 {
 			compatible = "allwinner,sun55i-a523-ppu";
 			reg = <0x07001400 0x400>;
-- 
2.50.1


