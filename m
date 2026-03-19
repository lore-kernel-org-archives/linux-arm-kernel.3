Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162BD1090222
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NF6w8t5jTyzsEb0m2tYRzroS6jTcRuQ0VrGUp+agBgo=; b=QI01sPNVtJlg8oFIUYscZareUN
	iMv8AkHgSABDBuSAe+xTCXOUI04cuqd+pPRKH/oHp2iOkclqAIzWPqzVHnStoQYCDpHvcHLL115KN
	EBvVw+RA6furyX5nf8NQsrncSRCKHnTOYYU7Ug310RQx2yDfS8XEjg9knbApLeEdjTfkuCncRRYTB
	icxIqJ7gzePdICPlSQL/B4xQq6pfEX0xADX6WZdjS6v0gkkliJZrvmeXya+fdtzqlgEF+jyiDItol
	slS8XFyoiBIVqWXwuqR6wMRVqWd7COrB+C5fS68uoQVnkV2HvdAIjbj1NlpqhrJ+kx2htP1+WMbjS
	ZRFHp1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CpW-0000000AcyR-2NC4;
	Thu, 19 Mar 2026 12:50:26 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CpT-0000000Acwa-08CF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=NF6w8t5jTyzsEb0m2tYRzroS6jTcRuQ0VrGUp+agBgo=; b=fDIadPVkdIF4vsB63JSmgVDn52
	Yykz0b/gU2GEmYUS1TRRLGsBlf7B/+jkX14oHsBj0O7FYSX7h90KdIr2vi85xPND/zu6pH0IjbIVc
	NBDMl1HMemTk4ha+XJPWdkn6nBuRPDnDWVXDiS/sMYU7RvKnRzOlAEjKzgpMV1WNRB56gN3WtGAVv
	IPeI6gSw85VHKtuXgGHXPHelHVRjS5JA60LO/aa8+XPnA510SB26c5j698JXDXUwBB6KvMeivWgaE
	JtoxPusg0D75ROfjdnDUMuv58RlZEjuBiI/qMAyV+yowQrOK2VsvOgTk1BRSK7pcx5PsrSoc1SsJ9
	+CRSJUag==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w3CpP-0009x4-2H;
	Thu, 19 Mar 2026 13:50:19 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w3CpO-000MiA-2x;
	Thu, 19 Mar 2026 13:50:19 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 0/3] TQMa93xx on MBa93xxLA-Mini support
Date: Thu, 19 Mar 2026 13:50:07 +0100
Message-ID: <20260319125013.2421621-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27945/Thu Mar 19 07:24:38 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_055023_213647_8650B89B 
X-CRM114-Status: GOOD (  10.68  )
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

Hi all,

this series adds support for TQMa93xxLA on MBa93xxLA-Mini [1],
a single board computer board in small form factor.
It has a reduced feature set compared to MBa93xxLA, with WiFi/Bluetooth and
WWAN applicaitons in mind.
An overlay for Ezurio WiFi module is added as well.

Changes in v2:
* Collected tags
* Fixes commit message style
* Remove unused display related DT nodes
* Fix Ethernet PHY IRQ types

Best regards,
Alexander

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/mba93xxla-mini/

Martin Schmiedel (3):
  dt-bindings: arm: fsl: add MBa93xxLA-MINI
  arm64: dts: freescale: add initial device tree for
    TQMa93xx/MBa93xxLA-MINI
  arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add WLAN/BT
    overlay

 .../devicetree/bindings/arm/fsl.yaml          |   3 +
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 ...3-tqma9352-mba93xxla-mini-ezurio-wlan.dtso |  35 +
 .../imx93-tqma9352-mba93xxla-mini.dts         | 597 ++++++++++++++++++
 4 files changed, 640 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts

-- 
2.43.0


