Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FE9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqD3JFg+NSuqkMavjFnAVMGsxZrDKdqG5Hr37LsOgLs=; b=hLk5l4l77pZHNIoH7kIFXFVVps
	dpkRorYyU1bPL0Qyyw1Ukv2uiStqcpW0+1HlruzpuFjIW3T2F2KtYLiNA4BiVcZ/zDPcMhDNc6cnq
	eAQ1GKDK4rbDAxiQrSSk5lpA+hfLsUbxoS9RIw1DBOIcSJSzdsP2y2UnNZTGa5GprPrZqA9EKQzdt
	w8rhdAwlnFqc2pk/Ml0dY5n5gNYfgac/lGKocE99td3DajzPLUDTukd0i5q4sntdgJ4E5rctcIYjF
	XMuYNg/3hL7jsVfMJQPiiWCvpKfuJimMX0ZE0aqAbIdI7Ev4ppXlpNY+yY9TqtY79DSvVoHs3eWiG
	DrvTzyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7soX-0000000DUWO-3oOH;
	Thu, 24 Apr 2025 09:24:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sCA-0000000DOFc-2mC5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mqD3JFg+NSuqkMavjFnAVMGsxZrDKdqG5Hr37LsOgLs=; b=gNX7ryWp56kL06yDdcEoS0woN2
	TLZFapzahPZDMk3A7H7oCQO7XXAEs0iZ2DMVNSiBzL5l89B/xJSzDaoNVLwRtzSZW4N6erIT2demL
	C10kLQLZPYe5WvSksrwuiW93Jmo/mTdBAHek7HNJd4eUDpfMBOClg35k8gNPKbQoZkO22J1XngSgj
	4aozhKQGDX34C+3b6pVCDVWfCiQDfHsB7FE2fhW3ovMrHPKLhD8VQMDDRerkrDKgiX/Usf3vK/3Sn
	vkoaY7TK8F4sTPrI9LyWbHk+m72A39ZIDl538yDTUc8cBf5KLBjesqq6TjMDqYSWR0SGo4IvRgMHp
	zZ53QiJw==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sC7-0000000BdTv-2foZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:44:33 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iO3D1804379
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 03:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745484264;
	bh=mqD3JFg+NSuqkMavjFnAVMGsxZrDKdqG5Hr37LsOgLs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LNYKVPM+PydDwbUQ5bSZL9cyNBWjcoDH9DZ2Wx10q+pCKU3onN4pljOmTaduxhazY
	 q38wqJ+vEbvEGLUpqlLXHhhcI254npUugRi4T3IvAHZNLKg56FHb6/zPFOvzYDYbkP
	 Q7hMqoqWQesCiZ8Vm5vaxjvA0rtR1A9X+8AV+g70=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iOY1059199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 03:44:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 03:44:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 03:44:24 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O8iMjK067284;
	Thu, 24 Apr 2025 03:44:23 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH 4/4] arm64: dts: ti: k3-am69-sk: Reserve 1904MiB of global CMA
Date: Thu, 24 Apr 2025 14:14:15 +0530
Message-ID: <20250424084415.66457-5-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424084415.66457-1-j-choudhary@ti.com>
References: <20250424084415.66457-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094432_023783_200C8281 
X-CRM114-Status: GOOD (  10.69  )
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

Reserve 1904MiB of global CMA pool which is also marked as re-usable
so that OS can also use this region if peripheral drivers are not
using it.

AM69-SK has different multimedia components such as Camera, Dual-
Display and H264 Video Codec which uses CMA for buffer allocations.
Assuming the worst case scenario where all three run in parallel,
below is the calculation:

1) IMX390 camera sensor 1920x1080
-> 1920 width x 1080 height x 2 bytesperpixel x 4 buffers :
   15.820 MiB which is ~16MiB
   AM69-SK can support 12 cameras so ~192MiB

2) 3840x2160@60fps MHDP via DisplayPort0
-> 3840 width x 2160 height x 4 bytesperpixel x 2 buffers :
   63.281 MiB which is ~64 MiB

3) 1920x1080@60fps HDMI
-> 1920 width x 1080 height x 4 bytesperpixel x 2 buffers :
   15.820 MiB which is ~16MiB

4) H264 Video Codec 1920x1080 resolution:
-> For 1080p resolution codec application, we require ~98-100 MiB
   per channel. We require ~1600MiB for 16 channel codec application.

Total comes about 1872MiB. Adding 32MiB for other peripherals to
get 1904MiB.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index b85227052f97..37228ec64852 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -44,6 +44,14 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x77000000>;
+			linux,cma-default;
+		};
+
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>;
 			no-map;
-- 
2.34.1


