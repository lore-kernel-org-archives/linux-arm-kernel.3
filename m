Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC29C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olCRpjYr4qsqRXFdIM/b3JCKLN2vd78BQaVxj7nrTLE=; b=PL0i8vBY2rnr/Z1x8O4gXdp7YT
	0slhBN6kaWRKYOBJN9EHEme3R1UuMQLX5SUZVINrmMqG1Zd+YG8thmHGlwAkHCRQHBbERXLos/Bzf
	1e1k8r3J2W3h1IHxMIbCrBZ8rSN79uwRGMgj17Skm8T2jrRHPb2C2rRF5Ws6BY+T0kEOmPNiUtPAv
	49g0kIRi1Sz0mQL0scH7/Su9+CmH5IF5sNMxhhjgUvscnraIsp7XLkuN76Sj+oxHv71bZozLbkCi6
	mpca2NdmMaVQrEdC9VQ+RBD3Vh658R4K9xmQ0qO0ZHoMVS/Wk6V+d33WdRKLUCL2OQmZksLnDsGBX
	vJZwTAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0Jd-0000000B408-3gYz;
	Fri, 28 Feb 2025 13:22:09 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0DP-0000000B2qF-07lB;
	Fri, 28 Feb 2025 13:15:45 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1740748540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olCRpjYr4qsqRXFdIM/b3JCKLN2vd78BQaVxj7nrTLE=;
	b=kCaYDqlg6pG/DvdWMsiG0vQHMiW09HzgzCV6Qz5Z4bMbRSx/crMZzxA1K+YvfdN+aXZcE0
	babArb1z2kp1on3hQ2n5AZyQKSybp4UPmzrT6U/8w54oL+mA0wW9RFF0cvfEehePrRaauz
	B+M+C6IFFZmG3cD9kedNv3lW+kmAVvYm06MSyIow3SZ6WR680DTcAPSQLhYe+ZQBv7Lnph
	ma9UcCyjt1VhWNRwNSGqdpW4e5ta3pKofGpvaQ7d02IyufA5B9mlXzfw8CT7jY/G5mHcB7
	6BvUtrCSWcEOZt6h1hmtV9nNR8p2aD1TTZkl9zzyOPL0ZNK/Q/tCwPmPBWHFeg==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add missing PCIe supplies to RockPro64 board dtsi
Date: Fri, 28 Feb 2025 14:15:29 +0100
Message-Id: <83f2938bdd4ba49c1e840537d6ede0f8219b7b90.1740748439.git.dsimic@manjaro.org>
In-Reply-To: <cover.1740748439.git.dsimic@manjaro.org>
References: <cover.1740748439.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_051543_350055_1BE3F41E 
X-CRM114-Status: GOOD (  17.53  )
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

Add missing "vpcie0v9-supply" and "vpcie1v8-supply" properties to the "pcie0"
node in the Pine64 RockPro64 board dtsi file.  This eliminates the following
warnings from the kernel log:

  rockchip-pcie f8000000.pcie: supply vpcie1v8 not found, using dummy regulator
  rockchip-pcie f8000000.pcie: supply vpcie0v9 not found, using dummy regulator

There are no functional changes to the way board works after these changes,
because the "vcca_0v9" and "vcca_1v8" regulators are always enabled, [1][2]
but these additions improve the accuracy of hardware description.

Shuffle and reorder the "vpcie*-supply" properties a bit, so they're sorted
alphanumerically, which is a bit more logical and more useful than having
these properties listed in their strict alphabetical order.

These changes apply to the both supported hardware revisions of the Pine64
RockPro64, i.e. to the production-run revisions 2.0 and 2.1. [1][2]

[1] https://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
[2] https://files.pine64.org/doc/rockpro64/rockpro64_v20-SCH.pdf

Reported-by: Diederik de Haas <didi.debian@cknow.org>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---

Notes:
    Actually, these additions to the DT _might_ improve the way RockPro64
    works a bit, by _possibly_ resolving the longstanding issues with PCI
    Express enumeration, which have been observed with certain PCI Express
    cards only.  This was mentioned in the commit 43853e843aa6 (arm64: dts:
    rockchip: Remove unsupported node from the Pinebook Pro dts, 2024-04-01),
    together with a brief description of the out-of-tree enumeration delay
    that reportedly resolves those issues.
    
    Symptomatically enough, AFAIK only the RockPro64 has been reported to
    suffer from the PCI Express issues, and it's only the RockPro64 that has
    the missing supplies in its DT, so maybe there's something that causes
    issues when the PCI Express is probed before the RK808 PMIC, which the
    "vcca_1v8" regulator comes from.  The above-mentioned enumeration delay
    might actually be just a workaround for those underlying issues.
    
    Admittedly, the RockPro64 is a bit specific board by having a standard
    PCI Express slot, allowing use of various standard cards, but pretty much
    standard PCI Express cards have been attached to other RK3399 boards as
    well, and I can't recall similar issues being reported for them.
    
    The required reliability testing will be performed as the time permits,
    so we'll hopefully see are these assumptions valid.  In the meantime,
    this patch remains perfectly safe, from the standpoint of being unable
    to do any harm or cause some unforeseen regressions.

 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
index 47dc198706c8..41ee381ff81f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
@@ -673,8 +673,10 @@ &pcie0 {
 	num-lanes = <4>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_perst>;
-	vpcie12v-supply = <&vcc12v_dcin>;
+	vpcie0v9-supply = <&vcca_0v9>;
+	vpcie1v8-supply = <&vcca_1v8>;
 	vpcie3v3-supply = <&vcc3v3_pcie>;
+	vpcie12v-supply = <&vcc12v_dcin>;
 	status = "okay";
 };
 

