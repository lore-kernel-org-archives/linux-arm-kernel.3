Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B36CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXVzhTQxvQ//vXX7ZKs0tP9x9fSyHMV2TynUdpntVgQ=; b=vB6JBAbCnWfyZaVeSJiTOW7GI0
	fCNWu2CyBur1EIaycxcGbJmTioZzGf5SlUBaLdsPdKrF3LjnWpFh5pyUcnZABwKdLhZ/v/t4rNxnc
	Bw7maL9oc6Voh+3KVGfU0bUUhMTJDMtDXskzO/HJRYkMCfvsz98j3PqZCRlZuVo2nmLS282P3jCu+
	ivFRYmqzVgm8hotdp+o3mr50rgq3+REZetK9FIfMB5Wp3jMrYkbXYKjnMPeoPN4zUYET0aK2zOCV2
	4DWPh34xAbFBU1B/xnpi8Jf8U3hV6uTHQRXubeJk9PBZFdsnuamd2FttQx7M0W7TJjCqCOxfL8JMD
	neKzMamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKpZ-00000001dmk-0CJe;
	Fri, 22 Aug 2025 06:00:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFdj-000000012Zx-3OMo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:20 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1133EE45;
	Fri, 22 Aug 2025 02:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822439;
	bh=YuNXzrNIPIFJModivjHon25HApCbkHH/knuo3W43MdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KsZ4uM0EesReoByhqcbUykBKxA6sLmkqVVULhPU0im5W5pDITA/K301sI/CRIuX2a
	 XVw8TezN+zz1cNQEC+ufaVnpjnWadoZYU5O9RpQ0PGhJhj7ouu3B7nTLQAu+DQR35B
	 4oRLYdXsGN5MGLV5HiYkKnr1SVw+ET+YbVbMuynM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 13/13] arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers
Date: Fri, 22 Aug 2025 03:27:33 +0300
Message-ID: <20250822002734.23516-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172819_995757_64E33771 
X-CRM114-Status: UNSURE (   7.96  )
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

The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
in the device tree, to enable support for more than one channel.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index bb24dba7338e..1e52840078df 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1764,6 +1764,7 @@ mipi_csi_0: csi@32e40000 {
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
+				fsl,num-channels = <3>;
 				status = "disabled";
 
 				ports {
@@ -1799,6 +1800,7 @@ mipi_csi_1: csi@32e50000 {
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
+				fsl,num-channels = <3>;
 				status = "disabled";
 
 				ports {
-- 
Regards,

Laurent Pinchart


