Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F353CCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPCrPM7joQMUH1pWXZjT66gyl3muFxaL8zTs3UpJDxQ=; b=R9bcCVbXUh16j02e7ZrkoOW0Nu
	zE34uaEctnq6dG2iXRkxus6KkaS1QPpGcaZT7uMUc5LPg5N+Sgs9F6wATFeFcPqFKpGh6FDlkLvDo
	VVUlTC3QP7khOKazJppvAq/CeP1zsqb1BitIXAZULFag6uNq0qahatfdLaeLjDghgHaMV30Q/Pn9I
	s1WSyC7EQP4pGBTXE8RVqQKIZD3hStn1WmLQu7W6mte97l8CJMb2ytx9Qy8bfVzWCDNyO/UNEhzjA
	uG27rNJCza9zsxPTrgHm+QBfzH4mhirFJSiMCqBbvpxorEUpzGa8Z/+nCcGzRbI1NYJ0OUqnFKo7j
	VhF6TZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP7-0000000F8jN-3Efx;
	Wed, 03 Jun 2026 13:13:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP3-0000000F8c4-3Fp0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490b3637b90so16542145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492380; x=1781097180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPCrPM7joQMUH1pWXZjT66gyl3muFxaL8zTs3UpJDxQ=;
        b=aMC0YVszMTMfyFy6pfCJwT3Y67NYzWgwDnueseMBIuxf46b0ICP6zH6pwHikydREuF
         zqwZ1B3w31PvuhZ2LQQXI7zwz/7vz2/goKTU9tSB6Q4VVTdAGReFQ1Qbefaet483wyDF
         TTB2IIw6rUQ+SZZmdNRSaDHwss+fAgDdsXJkRHmJKqMpAYiLO2Ww8pNXtZtIUj1xoIGZ
         FoeqK5WDd0ueOqP7OGi0yqVHCV4LvWj9yRwg7cYR7/kw7ndHCRe1lIc0/j9mRColcWnP
         YidgVGUdYsUaPjJHlEQrIbKX54XPH4Y4RRlU+AckxAzPBqwOGRt3k7w5BSe9G2wOI3q8
         0Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492380; x=1781097180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPCrPM7joQMUH1pWXZjT66gyl3muFxaL8zTs3UpJDxQ=;
        b=MGXJiHlzG8iNJWPL5KZDzb0gQJlx68zfuxSd1EsCjutnBjEE4Sv0pdqug09ElEYa+f
         Zq+9Xn+N0QKNZwyceFAnbZjfeJQIXyGYNTkPLPBtr6g7/C+h1J+LxsUwKn5p9nljETX5
         KFz7lR5dVj/1HBZ31k+h/jlxK5CR1l74/hJcXIXhXQ6LwiCqvupBHo2eI0yz3Ba+kAZa
         JhlfqFIiqniWv5qoG7r6o0sRPaUtVQuAbudx6d4VxWGbJzUXOj2LlJ4N2NtA2xmRPq+m
         swCOh+gsZXU/6tUH4SIN+lNpmIFzwUDnQiOk+zbB6zvgdEwwyEKCwaPEnO+Qxm6BG/y2
         M/pQ==
X-Forwarded-Encrypted: i=1; AFNElJ+P7IMsAG1ePhm7KIU8h5hcp6bUGf6WNVkH2DeTXGBDM41dj1o0Ra/eUizGrgNH+BDUWKDVsSFoU0o5quMMHA5c@lists.infradead.org
X-Gm-Message-State: AOJu0YyV9hSCCOcjd4aXGDpD/w/00fmtm8U0CLsA0oMtEZfmLq6lmFCU
	Q6RE1rWc68smAg4c8kccudONCydWXPH6eqrFxY64BZXhwalWKpNeTuWa
X-Gm-Gg: Acq92OGcXJD2C/VC3pX2o1/rfuTioWNZUHpFw+ZjM2XAH9K34icuLsU7/3OTsCL+f/W
	AbJ5wmvBvezB1qhOy+L75wgJD7QV1G7mUhbVVfhknp55cH0ePmogtcBHeGMTBIEAELAKaZL8cNl
	gnS3EcSOx3yfBQUrPvOpiBcBMeC8mdBZp25ScOCXvlm0v6AVZ8A0mWDmTwAEShlJHENavpUkOiG
	CdM721+OQe96zOLxoWtgK0DscVu4r9mrIwprcJEb/bAVhZMp1Beim3V/ZuhvnsI7iK2IxgqZ8u0
	J8XJJW2BFBzmprrB3EKisJ9iUVvq3cxGkKI9Iunfsvpk3hztsvXu/23Ak9c2M685eLfASejTniQ
	yj6DI7Su+9f7/nMdUTTDsPvbyDx3WRCBrZz+baGkZevL2W9hkGoVwmcQxTaktH9O1BfJTJh/5l+
	YTFiu4COmocHoesDNK6Gm3fW1+qXZhAT8pWt1oa7yu0fczmJIjq6sQDqFonzrwqW7gn5o61Pt98
	O9h9SO/g4sf8B2Fczs8xGN6TvB6Hmocfk1SA7snF5NS80b31etPKkzahMA=
X-Received: by 2002:a05:600c:4fcc:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-490b5eaab2dmr58645675e9.11.1780492379682;
        Wed, 03 Jun 2026 06:12:59 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 06/12] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Wed,  3 Jun 2026 15:12:44 +0200
Message-ID: <9a937fa5f65dd23515d4e32f8a9cdbe5a674c9a7.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061301_875878_7B082DC9 
X-CRM114-Status: GOOD (  10.80  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Configure the PHY to use an external reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9500c9bf0f42..a928dc2d9adc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,17 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3


