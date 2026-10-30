Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53429606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4EadySPC;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=HFRWZjlH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=; b=4EadySPCqP+E3/
	nneIDj/uaYamkJVywaDHI/EwQFROT0Z2SoP1Lj0WkYVrtY980WhYV7zMXiSXowWBKR5nUBmkqiFxP
	m1Uur1zCe0F81SZRPuH8W2E2I91WNS0Ro0Ts669szdMSw0/aSc3RuwNQpNWXnDkgNJOBVSwG590l4
	i6Aa4QtvVgbk52iZPx/D/vAztNlznx3hmf/3ZEJCRn3EPXjLSC1OIh3120iBVrnSOEQ+3JWn/mIo0
	yaeALGW2hBOheakWr04eaO8f4D1XRwY5FJVBAilzgCZZoVj0dDEs0OZMAeNv694f2erDBldWtPCov
	PFcbqo9jm+0BGy3D53pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpaB-0000000C8iQ-49GL;
	Fri, 30 Oct 2026 16:35:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpa8-0000000C8hR-1tKo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:35:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso4722245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378154; x=1793982954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
        b=HFRWZjlH771kJgLvvxOtbVgluMe+OaU7XJjvusSQp9MkEOAFFQPFIpOsHq0b1mxVXq
         It9sYUSHQw71Iq9ZO4OqCecA6Ds9VOL5ewfFVhs+bZlKpMnQgY2GMpKZDXcONzmVbbU4
         1BjyCdZsjvhDIHaIOLVpqgMuUJA5qmWyy0ZbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378154; x=1793982954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
        b=UzCecN9IFQa8bk/XG0MNVu4gJbKZH1IA/MGzfTwI4Ogmq9wxCm2ABz8pfqpJ58K9jN
         xlLP+tiThB1lQjR92Alp7yAOvhV1HZCO+Lu0ZaRuHYMWvyKgXRCrLq9UUhoHrpR7h/Hr
         6MDUf50O+mkEBSJF1sZxPA3PrRf+ImrWyDxcsTA44rCgqoa40d/g2yxYNEEmiP6dnYVu
         bTQwxWRXIQS2Agw6WC3iEMcjAEms0c8kJVjVsHV1RwUjWT8m/OpleOWpzjjnKAMBsChU
         8s7VmuTxWdSXkamsf0fqVqZS7XUiwqnN7BUhIY9w7EJBZe4D7tiRv1iaxQgcYV0tbMbM
         7ACA==
X-Forwarded-Encrypted: i=1; AKwUvBzrMmc5+iUziEbfs5rMYAUfxaIFAY2n5WnE6rkLVHY3Rj7mHH+AEY3XqW4vYzpEZl291vr2tqpVRY3Ey8scUCrz@lists.infradead.org
X-Gm-Message-State: AFq9FYIfuk9ZNOIVp+xkeo1WyL0PIer1k+eHOCYF1PQBZKUjZh5WcLUK
	s6MdglnIxvMnWwCQxK6LqsIvEp6HnXKwEmFVm+ODjsIvrFNP3IsyGnGcUaH7CqbBwKE=
X-Gm-Gg: AYBFou0Y+kpAvZozunQaM7jZ/KLY0BYLwSDjUA+/aNkGeRSY10AvLB9UlhtqS3QhrLs
	pCuWQCOU75XJvGabFi672KHZPBWSLWNp4gWAju2UMx/aL1NJytnzF05J8vDiWGcbv3dsBpAjD3r
	wFXGSGDaZU3hh5xQvnQYF7s9pzE76UiXk/xnApCFViMSbQF7kc5XWKqCIg2do8leKqumsz4YIGq
	dTariGJR+cJCjXR6NNnj+cqolANJNKOhvG7lab0ipjk3Ss8Lg331G7YpB5JLTDaVGIvx3CMG/Fn
	fsv6idb/yUTUG/MAQTzL2W+4s0aC55OXKeaVc7keybFX13OsbQ5uS05Ykc4+NS9H5fzfTII1HMZ
	fpUm+KOLPzhAK7vSIjYCDNH3p3WMq+c/ZELZvCkUoW08DyxDo9HOP9Kh0mstBTtCciqVEKCJhm5
	WGOV68cwtqGBdVnBQv4tptDmPQFrK0rxpnoataU6ugzSt4Sdi5ezm4GTCDYvSFtBIP/e0uqN/du
	k0nx9kI8ehzLppJwZSyx7bL8T6N5tR5MekQZde1VI62/aS0WQHnwrBtMD05n5LKJu45Yb0JOpwJ
	VJQSATIpVmvOL7rOGOpMIlqr4HQ9N8UboOChHleU15CSQG/I0QLdrLFmosvgizRRhpOkCmuU0Px
	4GkHAM5cCzHHnF74o4LddAY5uR/uxWjZvzQFOBxdwVvGeuM2CYpYKyzlK+Y2qISiAo7l5tsWPXw
	FQUIEEKrhXgAdAYSdjXNeRxBHnaw==
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr61029555e9.18.1793378154030;
        Fri, 30 Oct 2026 09:35:54 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
Date: Fri, 30 Oct 2026 17:35:40 +0100
Message-ID: <20261030163547.2682583-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093556_502700_D666DBF4 
X-CRM114-Status: GOOD (  11.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable the watchdog, asserting WDOG_B on timeout. On the SoM the signal
is connected to the PMIC, which resets the whole board.

Tested on the i.Core MX8M Plus Fast Ethernet variant.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../boot/dts/freescale/imx8mp-icore-mx8mp.dtsi      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
index affcc20b20c7..33066247cd2c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
@@ -122,6 +122,13 @@ &usdhc3 {
 	status = "okay";
 };
 
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
@@ -183,4 +190,10 @@ MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
 			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
+		>;
+	};
 };
-- 
2.43.0


