Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FC5D10C11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=idA2hEcUdIZdPkR2DtLiEItPPio04naz2YdamBrPyD0=; b=y0TVJdi4Dn81fmHyo97IkkHcMq
	SDEUynrgLWacNzC3Cnqn30jiqvgnS1DOuPQdnOrRfywxAineNNUwVOEXfjyAtdMcWCALlgSNzgTry
	906sauhgECRp5N0oo5xesQnqOh1uK+NHNIluHKoo/ehDCpgAc5q3++m80iYKo4K8kJy4U/Xxj3ufM
	az5FM2sYv2Z7NXPDeane7+KMWXyHJhI3v53CfrcEIXmq8h63kVHyB17LQ87vti6sv/tC04Qq+5o64
	LJ0y/0tyQDAAw2y2yAbcYep2GhplFPjIjRMD/v++NXmJrA6rX7AmGGKp84L6q31WA0YpxsaysPduT
	LpNVppzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PFk-0000000AqOn-4BRF;
	Mon, 28 Oct 2024 12:53:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P8P-0000000Aojq-16E3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:46:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20b5affde14so29411845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 05:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119572; x=1730724372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idA2hEcUdIZdPkR2DtLiEItPPio04naz2YdamBrPyD0=;
        b=lZBBDNROHViABAtPup/yHPT0Fgl3INn3GfSReL53cLXw15sN3EAgR2Nk7c0gbl8ige
         gXDcfZYe8SqCUo5O13yfohEWA3875lmT1wDYSOteOl+vPCjRJToALH0Q6WBGjUlryJ4g
         4WG/YlzCGkECclOGFXa/zOPbd4uEVE6RzjxGNAZmhy1X/u+xl8EtFu96OCqLqO+N2cyb
         QIoo6qglNoJc8cp3CAK0gSMW8LjyrG3e8YX8tFLhWGdHWMdzV8tSi0gljEe3fvi3+vq5
         50/nu8gH65paRPuF+RLq+E4ZS6rqmEULNWs2oVxiHOl0dL14MQhiNZOAJyyZvbmuoGtg
         KzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119572; x=1730724372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idA2hEcUdIZdPkR2DtLiEItPPio04naz2YdamBrPyD0=;
        b=bV6ss8jf44a/4QFrJPNyVTWuDh8tFgNAvMJBEv5D7SleLxfgjacBTR1idVl9IZn4zi
         lq/8wlzur53iAskXYUj6DBRUVd6NTsUXCaByCoSmGbDXIgh2+lTmRRl8KKAw+K593X5i
         BlUL2Wd6CtYm0f0Ev7dWLFZorN3Z2X/ExSCYqX4mwViIEHrN1477O39dagjSg9EGGSMO
         QLMa79MdMAWuMpxtnVRVKqu9SA6FtlrBtsLs2KslfOuLNS56AgFl6AmpVbf4ZiUvnhGE
         cheyTklYHSybApYt4neEMG4V/mnJIwZvSsy8C6FKtewdMz2JkxpZ/fMOrfDvFygW7yww
         kiPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7ffDnDrfLPDp+NWGxvLxTZEVTcMgdLM6gTo6U3KiCP1F/eg99BvZ1Y234mzYqIyOVCuN8FndEJGrGJBjBibhO@lists.infradead.org
X-Gm-Message-State: AOJu0YxAvdB8NZyHlkYGlEF7UhpEim1TwL34/sYKMrp1/NHG4qqwkaL3
	XO7Pb/y+J3nPhR2umVw02EeYdVa2YZDX3ImawbQSB6/+cKGYwj6y
X-Google-Smtp-Source: AGHT+IEhWhO8jWtASWcjVnLJnH+2CiugnkO8wyv3J5+FMlEyhT7K9Ky7XdsE9koqPkJFrgnGLvmvEw==
X-Received: by 2002:a17:902:db0f:b0:20c:cf39:fe3c with SMTP id d9443c01a7336-210c6c34824mr111646485ad.41.1730119572121;
        Mon, 28 Oct 2024 05:46:12 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:325c:8d87:ee5c:f04e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc017858sm49969895ad.134.2024.10.28.05.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:46:11 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx6sll: Improve gpc description
Date: Mon, 28 Oct 2024 09:45:45 -0300
Message-Id: <20241028124545.72652-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_054613_340818_C8F40BF3 
X-CRM114-Status: UNSURE (   9.33  )
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

From: Fabio Estevam <festevam@denx.de>

According to fsl,imx-gpc.yaml, 'clocks', 'clock-names', and 'pgc'
are required properties.

Describe them to fix the following dt-schema warnings:

interrupt-controller@20dc000: 'clocks' is a required property
interrupt-controller@20dc000: 'clock-names' is a required property
interrupt-controller@20dc000: 'pgc' is a required property

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..d219c2b67294 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -602,6 +602,18 @@ gpc: interrupt-controller@20dc000 {
 				#interrupt-cells = <3>;
 				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&intc>;
+				clocks = <&clks IMX6SLL_CLK_IPG>;
+				clock-names = "ipg";
+
+				pgc {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					power-domain@0 {
+						reg = <0>;
+						#power-domain-cells = <0>;
+					};
+				};
 			};
 
 			iomuxc: pinctrl@20e0000 {
-- 
2.34.1


