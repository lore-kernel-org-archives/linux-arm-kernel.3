Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AFDCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBEw7W5Dwm7kgdG+aJEzz+SBc07Pz8jbT/7Xk/2YAXc=; b=HYd/QF99fPkEQhQhacNa/cLLFV
	GL5IShqNzbWSa0k9xVpdOM5DYn107e7CGh7oGFOgyYe8R0WVq0CfO1R3x044tsVzO4gg3i7bR5PCa
	9GRmHceXMNKZ3pEfa2GHUEzdHw3W7GcHq8s3F5ke4WMJGSJfEh0EvOrxnWb3aH1jqyBZ7oTu9+lGO
	t+QW3vgzbELErxdRBE12l57Bd5fOJqeV7+trL1Wur1WsUDSijoUlMRl4uV2d21bhpkCAC7/ykOOmZ
	4U7xdsbBzvZcXPn6LHVhsxBVdYb3z7s0xJny2bkHkj5UbDv3JtD30dPXqkHCFyf7dN7LOdVe4Q5IN
	YEnfbQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9uC-00000006Jn8-2oBj;
	Fri, 09 Oct 2026 12:40:56 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9u7-00000006Jln-3Jw2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:40:53 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 49B9B1A02F5;
	Fri,  9 Oct 2026 14:40:42 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C4411A0002;
	Fri,  9 Oct 2026 14:40:42 +0200 (CEST)
Received: from lsv15141.swis.ro-buh01.nxp.com (lsv15141.swis.ro-buh01.nxp.com [10.162.246.138])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8F8002037D;
	Fri,  9 Oct 2026 14:40:40 +0200 (CEST)
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: netdev@vger.kernel.org
Cc: s32@nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v1 4/5] arm64: dts: s32n79-rdb: enable NETC IEP18
Date: Fri,  9 Oct 2026 15:40:33 +0300
Message-Id: <23e77c8e48f84c67af8ec24bfde712baf64eec54.1791548316.git.claudiu.manoil@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791548316.git.claudiu.manoil@nxp.com>
References: <cover.1791548316.git.claudiu.manoil@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_054051_965210_1B985336 
X-CRM114-Status: UNSURE (   7.97  )
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

Enable the NETC v4 ECAM bus #18 on the S32N79-RDB board so that the
ENETC v4 Pseudo-MAC port (PPM) PF and VF instances are probed.

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 1feccd61258e..897ba24ac03a 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -68,3 +68,7 @@ &usdhc0 {
 	no-sdio;
 	status = "okay";
 };
+
+&netc_iep18 {
+	status = "okay";
+};
-- 
2.34.1


