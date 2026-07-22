Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95F8C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zeqQNC9dxpeHtC4McTJMo5VPAei5GmbsiOwZwfryttQ=; b=Eivwr+1EyJ1tHG
	KYsFcLGrpNVN4uzBKSZxQMc0YscwT/uM5mge9MgIlyWFHWgEF46ReS+1rxriz7YBzd4rHm36WpffT
	UNjtZyjLDfvlWJ9cxlDM7ARCPgJIE0ZblTiEcsP6R8QTq6St+yk65frdOBACBTRKqvpcHGtXtXOgI
	E22qs6gfGzoOAetiNftKNBjaPNbbZ8xQDQpiDaDSGdzLmEkXQVIKfQdYwKSIUnxKpjRVg4ahht94I
	2eVW0yGlpDyIZRNq9QcYCa27LYSLJFpl+5YPCqI1Wo0Cgh51M1GOYwEHMWTOfXz1/Rp77gnsk9oZA
	kgD3h7/RKZmDoqoP6Fpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZZR-0000000CIVX-0DW7;
	Wed, 22 Jul 2026 16:13:21 +0000
Received: from mail-m103131191138.xmail.ntesmail.com ([103.131.191.138])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZZK-0000000CIQF-1sTd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:13:16 +0000
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 472ee9f29;
	Thu, 23 Jul 2026 00:13:01 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
Date: Thu, 23 Jul 2026 00:12:38 +0800
Message-Id: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbrYGoC/6WOQQqDMBREryJZN8VEjdpV71FcRP1pPkUjP1Es4
 t0bpQcodPkG5s1szAMheHZLNkawoEc3RpCXhHVWj0/g2EdmMpUqVUJxmlt8TchHWAP/pgXPlcx
 FqXWlCs1idyIwuJ7eRxPZkBt4sAT6F9siuOBZX6u2qrO6NOYe7Dz2QN6ZcO3ccExY9MHR+3y+i
 GPof22z7/sHk3DASRMBAAA=
X-Change-ID: 20260616-rubikpi-next-20260615-462417aa865a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784736781; l=2096;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=XKSyz3rotSlKX1BqouvmaSVj7RopHzI3qas4x53oa+M=;
 b=XADByVQZ4Absf2IRhJZ3nthW8M2bYqMEyC3OBhnlHKRuiJGMNYUFIo8mWIM9/agUNow1JBAlF
 y8xdrSsHcJpC1xSKOFSuQZDgxjM9ztTRr4rHRVQYqIgiyp443uUtRRE
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f8a9a13b409d5kunm8c572dff4a6e5a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0lKVk5NQ01CSEJJQk1KGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Xq8Lvvevs8CxyKd34U94tBj/KJmRvaQ0t51HccmhqPNgZ6Oo+TNpCC3ApEgH8ULD/6cayo+EUe53VBwjj2vZPTrBEkpgq5vZF62taNtYSQAVHYC2A9IXNn/jlkwyKaONcw8L1Ca69o77dIxGP5G4lyovCyksgw5WYKVpCILrkpM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=zeqQNC9dxpeHtC4McTJMo5VPAei5GmbsiOwZwfryttQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_091314_757971_9CCA4A10 
X-CRM114-Status: UNSURE (   8.29  )
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

RUBIK Pi 3 provides two camera connectors but ships without camera
modules, and each connector can be used with different sensors. Describe
only the board-level 3.3 V output rail in the base DTS and add optional,
per-connector overlays for Raspberry Pi Camera Module V2 IMX219 sensors.

CAM1 is connected to CCI1 and CSIPHY1, while CAM2 is connected to CCI0
and CSIPHY4. The overlays can be used independently or combined, and the
Makefile provides composed DTBs for both single-camera configurations and
the dual-IMX219 configuration.

Both dual-camera and single-camera configurations have been validated on
the RUBIK Pi 3.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Changes in v2:
- Keep the optional IMX219 sensors out of the base board DTS and add one
  overlay per camera connector.
- Add composed DTBs for CAM1, CAM2, and dual-IMX219 configurations.
- Correct the power model: VCC3V3_OUTPUT is board-level, while each
  PWR_EN controls the module-local sensor rails.
- Model the 24 MHz sensor input clock separately for each camera module.
- Describe CAMERA1_GPIO and CAMERA2_GPIO as privacy indicator LEDs and
  associate each one with the corresponding sensor.
- Drop output-high and output-low from the GPIO pinctrl states.
- Rebase onto next-20260721.
- Link to v1: https://lore.kernel.org/r/20260616-rubikpi-next-20260615-v1-1-3d96b89397ff@thundersoft.com

---
Hongyang Zhao (2):
      arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V output supply
      arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays

 arch/arm64/boot/dts/qcom/Makefile                  |  15 +++
 .../qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso  | 117 +++++++++++++++++++++
 .../qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso  | 117 +++++++++++++++++++++
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  24 +++++
 4 files changed, 273 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260616-rubikpi-next-20260615-462417aa865a

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>


