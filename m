Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B175CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 16:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWBgeJTJVYfnA1+McSRviEaV+4Sti7bEO6JCyn1934I=; b=FwkW4gfWgLK4l30EXrF8j8S/9p
	2eLeq8uGZWWZc0k5tpbpoLG4R6UsUdyTYr39Xl//EpGHUIoGW10+JulrVAvgJT6ffUHPlIZ4AqLIQ
	L2Lk8OKPdrVInlwNPV7TqON9zRdMd/d4MX4z4w/dCgpLcfodhRUm1RTCst/ULg506eJ4HpFDDJYBA
	Z9Wc3/cjUy/eNns9x0lY7J0JkIALpN4kfG3iQH1L5cD4nIIIsRrSpXs+RXoYW3Y67pmF1cC7uogrd
	5HSvAm0+y+543I4oD9ZzwKT1++8w/RzUQcqT+GB+TBCJTeMP0je4BEwCKKaprldJcisMbaYmaKADd
	SSCXlW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uW9-0000000GfCd-2PRc;
	Sun, 28 Sep 2025 16:44:57 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uW1-0000000Gf2R-0tgh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 16:44:51 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BD41925E97;
	Sun, 28 Sep 2025 18:44:47 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFitsIsOZg1D; Sun, 28 Sep 2025 18:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077887; bh=10YDFCmqhSIaFGh36KjtmIevVf+bR4XnXIxhpQUM1O0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fnSQTksZen4L2feUOOQehH6Vr/eKqGVTLv3GSh8M8kk9jkiYIUFtx9t2i6+6VCBOJ
	 mPF1KKGBhvykd5XagwcxKnlJtR6PTkR6hHnZgo5wcSe5/4TzhuEJa0Usu5YpgrMNc3
	 UAmHbxyK4MnK72TefzOpOqZgNIL3ag8a9C2lrb6jHF+1UVwDIOAWdkSkYSOph2kkso
	 Fd5h75+joCz2GCK+jhDtw93LcIrWvcjOf36can2f45iI8u3JujHnUU5N1Bw0dyjrWO
	 EPL8cIayJJjaIGWQiZ2UosDHZqCRh8YaBCYxX0Yuu0ucfuP8daUIKHPTSHgXN93CQ3
	 Cu4qvONpxKE+Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:58 +0530
Subject: [PATCH 7/7] arm64: dts: exynos7870-on7xelte: add bus-width to mmc0
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-7-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=1070;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=10YDFCmqhSIaFGh36KjtmIevVf+bR4XnXIxhpQUM1O0=;
 b=dYfyEMZutPlSnaBwITCzjzkqCBfcxWuIh8aG6HaCf3O6etZGvhshaT11+qmo01N2DbO9/yV8J
 aVpO5QJ4hYvCFTbLuwVPQKYjAfVQRtEtxOGAYDRZvYzp30kyRTKsqCh
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_094449_956552_7541CE76 
X-CRM114-Status: UNSURE (   9.75  )
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

Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
assumes bus width to be 8 if not present in devicetree, so at least with
respect to the Linux kernel, this doesn't introduce any functional
changes. But other drivers referring to it may not. Either way, without
the bus-width property the hardware description remains incomplete.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index 66413a9506276cca8925e644c0e857fb5c48112d..87549e9560643cd0692ce4a9b2c5cdff80b21173 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
@@ -463,6 +463,7 @@ &mmc0 {
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
+	bus-width = <8>;
 	fifo-depth = <64>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;

-- 
2.51.0


