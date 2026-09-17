Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98339C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Tvl9RGSjd3N9HgM2+Is42KPtj6OKWFn7K89chpkvCU=; b=4eqnfSVtxmRFeO0M5ZWaBU3CEV
	8aeCbyKGOJqysip3oxxvuXIJlsuV+TKuCUy2SKtiSQlmyTsKm/s+Uebre+u1Z6W4I5eBE1W3k4r8X
	2YNL85Fdi6PwDaBZACNLAEnz7e0MEY0iJcUHFm4ZA/EdC2gEIUOkB7ATQY9wb+SG7+7fXenzlqDZN
	k91/agaYuxbWbk6v9PtPHbzz9GUe6lVmdvgIHqX69dtUSDQENAZTfHV1nwikUgRx+rpkGJ8jrPZEP
	C46Frw4Xh1XcDHMXdJim1wazkvLLk5NyXT6EHmvJdj9/0nq/REjT66B9IN8iKaMIz3eImrucLuGeh
	6CirJiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kyy-0000000CiDk-0ida;
	Thu, 17 Sep 2026 22:53:32 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kyu-0000000CiCc-3Z2c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:53:30 +0000
Received: (wp-smtpd smtp.wp.pl 32800 invoked from network); 18 Sep 2026 00:53:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1789685601; bh=+Tvl9RGSjd3N9HgM2+Is42KPtj6OKWFn7K89chpkvCU=;
          h=From:To:Subject;
          b=lkQUuZD7GDSlzqvQPn/74qM7mrduxHzTPGM6PY5not2MNAgk0fxDlq4HADLz6XBOW
           HwEP4l1RRU9iR2LJHrZlsIgwziXDwsz5tZXKV3NzJeb5Cm2bfBZ7wyubcdE8LnY7fp
           K/kLRlBRhUzvBZgGi2byqD9XstdpP0qi5RRwS1j2H7/ID77IC1m08gZvMFYbwX+z4a
           3O0xib7rFw5wx1R8wOm+/RgxR00VLgUq4efczCPcS3jA7SqlTsSRGxpLsE5PAtITor
           eYaRGEQU+mhkTKdNDi+GlQelQFgJKeirTnNSFDc17dFSyXlI1NWX3u8fth0QTwoHp0
           tKCc9QQd9XDNQ==
Received: from abajkowski.lan (83.5.247.11.ipv4.supernova.orange.pl [83.5.247.11])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <robh@kernel.org>; 18 Sep 2026 00:53:21 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michal.simek@amd.com,
	olek2@wp.pl,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: xilinx: parallella: Enable QSPI and NOR flash
Date: Fri, 18 Sep 2026 00:53:08 +0200
Message-ID: <20260917225317.319745-1-olek2@wp.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: cc02f3c7c051f7c6be1c70d3a8911eea
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000003 [8eC9]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_155329_346726_BF54CBB1 
X-CRM114-Status: UNSURE (   9.15  )
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

The Parallella board has a SPI-NOR flash connected to the QSPI controller.
Enable the QSPI controller and add the corresponding SPI-NOR flash node
to allow the system to access it.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/arm/boot/dts/xilinx/zynq-parallella.dts | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/xilinx/zynq-parallella.dts b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
index 366af4fcf8d9..1903aa1cd83b 100644
--- a/arch/arm/boot/dts/xilinx/zynq-parallella.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
@@ -78,6 +78,39 @@ ldo2 {
 	};
 };
 
+&qspi {
+	bootph-all;
+	status = "okay";
+	num-cs = <1>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "uboot";
+				reg = <0x0 0x4e0000>;
+				read-only;
+			};
+
+			partition@4e0000 {
+				label = "uboot-env";
+				reg = <0x4e0000 0x10000>;
+				read-only;
+			};
+		};
+	};
+};
+
 &sdhci1 {
 	status = "okay";
 };
-- 
2.53.0


