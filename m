Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB11C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXFMyaJzObxWXMHjdTdAF/kliHOATYUJJo1yxPuPZVk=; b=N0bn26R7MZo8Z4oip0A5mQp3VM
	Wfb3LYRYJOVzW7BoEi4C21FcIhxiGGi+dhp6Cj8eQ1IuBuEUGeCwCZDdhFZ4zcj+2YHYPFNMi/fJh
	hIGpcZXnWL337esQKSotNqmFBXSJUXomDLPNf+k9r6qs4GTx0MWxPpLJWkUH6TrwlQ1IzU+3iQv8n
	YBySRujIVdplh2lXvvEs0dxJM3l/q+7ods61oCu85VXrkI7GPwyIU18On5vyeY/CS63T+I+ueC5c8
	vf9eVHJfsEA5sn0OpFkdW2lTBwBa0J3UcXEMJJ90TDbJhpeJRqekVeopbkmte4bseh4L1MGT9ihVh
	lDdGrfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SO-0000000EfRT-2wL2;
	Tue, 07 Jul 2026 09:51:12 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SH-0000000EfKw-0f30
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NXFMyaJzObxWXMHjdTdAF/kliHOATYUJJo1yxPuPZVk=; b=WpyE2PyXZbFsv1NpbZYi8dyITq
	ea+JCHanD8KWCQ18jG4Hlz1Zl3aRLosakVxidN3Iyych/ShVCuGJH5vMLVAZ4XWE13v22Jb2jSICe
	GspaeEI6bqhGeVRfo4qvjPB2ryNLmiCIIywbpLB/5hlvuzsgbqjAxraJTPMJgnW6rJrYUUeUZj1ML
	Sz9kZ2xR+A38spEN9pvtkhhM1E6fCblZmxwIdCM5R/5PnIiJxIsQ5pmboG+EVYZIPUeReAjLu9TMe
	ALcHDNtxpXlRouCi2Y+cufdcmLN2Q3i7dRHfyBH2DR0X8lulpKnZ4CqMGHxpOEFtG+T83JVxk230e
	lTAjHjkw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SF-000PWt-15;
	Tue, 07 Jul 2026 11:51:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SE-000Ck1-2I;
	Tue, 07 Jul 2026 11:51:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 7/8] arm64: dts: fsl-lx2160a-tqmlx2160a: Remove deprecated properties
Date: Tue,  7 Jul 2026 11:50:54 +0200
Message-ID: <20260707095057.1745867-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
References: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_025105_202400_BC1A70C3 
X-CRM114-Status: UNSURE (   8.82  )
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

Setting #size-cells in MTD nodes itself is deprecated by mtd.yaml.
Remove the deprecated properties. Fixes the warning:
fsl-lx2160a-tqmlx2160a.dtsi:62.18-76.4: Warning
 (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 or "ranges" property

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index 5ca950ff908e7..d64879ee5e54a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -62,8 +62,6 @@ &fspi {
 	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
-- 
2.54.0


