Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09A6106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YD+WAIAvu9uMcvTn8pDJU/qLVCdMBY10QasA8QIpb+s=; b=0grgU29pCRM7MhCIi14xnM5dEo
	2uWj2Tn18lGp2p0CAw3bLbmLkg557XGWcU8r3aPAB+qdop5w1t2AHS7HDbirr9VP7Ogt1BmTURegc
	NvA9rmfYs1YaJrqd8Er+1p/JT9SURKbQ/ywYA+/FPsqiB5TJmQYdUZNJlbr+1t3u/E+Z7W6lI8A8W
	rUbgkHN9TY+N8cQKk298R2SPRXicA8LQ8amB2SYUb6HoCAoeTZ7Bi9Sv1Rsbxm5Lh1L4DAu/KP4d8
	tgmJHqycFCzIoX0mlclHfXIGFluCaH2aPayN8HRl7mpP3uZQlFnKgd4VBp9/l9q9xRL/jgV4T6SPX
	zlsdCBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXn-0000000Gwzw-00fy;
	Fri, 13 Mar 2026 07:02:47 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXg-0000000Gwv7-3YeR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YD+WAIAvu9uMcvTn8pDJU/qLVCdMBY10QasA8QIpb+s=; b=P+g2OChhnTQBSYTtqi/S22t9dW
	NGBhfixzLFXLwzzlfGuZjSFu51ZFyUnavF2Lk0R/QJl3DoxGlpVWukFVcJzPCh3sgfw7qQ0cT4qbu
	l1CZpNv7GE6FRpYsvtV1FfGvUS83BzFrEh4ymBzD7EE9wwA5ia2P3KsUvJmjkIT1RppI9vAcfNstM
	E/Qy3YdfvCJE0aLo+rmcXlA2MRhRU7LMmYpF1feQcZSZdes5GR+7Dyr8Ig0KkhzvRoinAVHh9p3gQ
	fInGEGu2MeuXgxhVhVrOaZSIRNdyEVFgIIs9kt1WLnBAiCZvXIilHz4GuiZt6IuzhHCbgxqVo2cqR
	np5rj8SQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXZ-000BWO-1V;
	Fri, 13 Mar 2026 08:02:33 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXY-0005Xv-3A;
	Fri, 13 Mar 2026 08:02:33 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: dts: imx8mp-tqma8mpql-mba8mpxl-tm070jvhg33: Remove compatible from overlay
Date: Fri, 13 Mar 2026 08:02:21 +0100
Message-ID: <20260313070226.579939-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
References: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_000240_883847_850B4D38 
X-CRM114-Status: UNSURE (   9.96  )
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

Override of board compatible is unexpected, especially when the same dtso
override difference mainboard. So remove it and update the copyright year.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improved commit message

 .../imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
index ea44d605342ba..f6aaad91d7f8e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Alexander Stein
  */
@@ -8,10 +8,6 @@
 /dts-v1/;
 /plugin/;
 
-&{/} {
-	compatible = "tq,imx8mp-tqma8mpql-mba8mpxl", "tq,imx8mp-tqma8mpql", "fsl,imx8mp";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0


