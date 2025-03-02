Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37691C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 18:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3wYKQ9B1StVQbxu+s2BMJr618h1KoB+cCRUMH1wITk=; b=rA+an6Ge2Aavgc3A/Gc4BVocXr
	C7HfgBuagGeJmEERXZ3vKMcpI9fqHqpCxvA9rpjIy6IiX8c3tLlnhpuZr/aMx7gp43zOJCOg3bsh6
	BbFClm3BSeRlBxNMN9vxsua9elgFzCYvv2wuS5vW2bsJMZny9FTBXdnBQ+SrGqg++lUsPBC5pdG98
	6xmx+6HU1T+wgltKLRo3Gp5HoYgnvx5yrfDbpNEIQP+Q1N+6pEfCZp+8td/OjmFJnHPuhH1GxbboW
	3vjDQsfyBKDj6kBd8O2FUuBl5/SYlnl+tkkELzl8KJ06gTP61as5VV7tvADwKoGDeeS3iBRIzLErJ
	cM5Kvu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tooQz-0000000GXQN-44He;
	Sun, 02 Mar 2025 18:53:05 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tooMM-0000000GWuJ-419x;
	Sun, 02 Mar 2025 18:48:21 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1740941294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3wYKQ9B1StVQbxu+s2BMJr618h1KoB+cCRUMH1wITk=;
	b=TAV7YFMCSlqOGO9FnrQugJPHf9F5Ltie6z22xZZbPnZfr/1PPud07X1M1BVMiLb3iuBxv3
	pTraaR4biBaK7AL9kRh6HZDUlFipSAziMM/9zJh1kX3/J4M2Q0sa65FbGZzOTUswh9OMFC
	6rD+0PcykRn6UgyVylMtFHTvHwiVrIyxM7V9LvbTx+rqYJnl4G3VL/inJMAcv4t1M71Xx3
	UCjvhkV9aVpUs20sdR5SAU9U7lu5SBTEKdAHjN1OwJ/l0wfmRrokE9VyQzjZjqHlt2ZK7e
	g+uJ1k3Dgr0YObo1xgu/oHVijjyzl+0Mf2CSQ9L99Wxi16zQsJn2vkSzbiN9Yg==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	didi.debian@cknow.org,
	chris@z9.de,
	stable@vger.kernel.org,
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add missing PCIe supplies to RockPro64 board dtsi
Date: Sun,  2 Mar 2025 19:48:04 +0100
Message-Id: <b39cfd7490d8194f053bf3971f13a43472d1769e.1740941097.git.dsimic@manjaro.org>
In-Reply-To: <cover.1740941097.git.dsimic@manjaro.org>
References: <cover.1740941097.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_104819_283009_FA394339 
X-CRM114-Status: GOOD (  17.18  )
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

These additions improve the accuracy of hardware description of the RockPro64
and, in theory, they should result in no functional changes to the way board
works after the changes, because the "vcca_0v9" and "vcca_1v8" regulators are
always enabled. [1][2]  However, extended reliability testing, performed by
Chris, [3] has proven that the age-old issues with some PCI Express cards,
when used with a Pine64 RockPro64, are also resolved.

Those issues were already mentioned in the commit 43853e843aa6 (arm64: dts:
rockchip: Remove unsupported node from the Pinebook Pro dts, 2024-04-01),
together with a brief description of the out-of-tree enumeration delay patch
that reportedly resolves those issues.  In a nutshell, booting a RockPro64
with some PCI Express cards attached to it caused a kernel oops. [4]

Symptomatically enough, to the commit author's best knowledge, only the Pine64
RockPro64, out of all RK3399-based boards and devices supported upstream, has
been reported to suffer from those PCI Express issues, and only the RockPro64
had some of the PCI Express supplies missing in its DT.  Thus, perhaps some
weird timing issues exist that caused the "vcca_1v8" always-on regulator,
which is part of the RK808 PMIC, to actually not be enabled before the PCI
Express is initialized and enumerated on the RockPro64, causing oopses with
some PCIe cards, and the aforementioned enumeration delay patch [4] probably
acted as just a workaround for the underlying timing issue.

Admittedly, the Pine64 RockPro64 is a bit specific board by having a standard
PCI Express slot, allowing use of various standard cards, but pretty much
standard PCI Express cards have been attached to other RK3399 boards as well,
and the commit author is unaware ot such issues reported for them.

It's quite hard to be sure that the PCI Express issues are fully resolved by
these additions to the DT, without some really extensive and time-consuming
testing.  However, these additions to the DT can result in good things and
improvements anyway, making them perfectly safe from the standpoint of being
unable to do any harm or cause some unforeseen regressions.

Shuffle and reorder the "vpcie*-supply" properties a bit, so they're sorted
alphanumerically, which is a bit more logical and more useful than having
these properties listed in their strict alphabetical order.

These changes apply to the both supported hardware revisions of the Pine64
RockPro64, i.e. to the production-run revisions 2.0 and 2.1. [1][2]

[1] https://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
[2] https://files.pine64.org/doc/rockpro64/rockpro64_v20-SCH.pdf
[3] https://z9.de/hedgedoc/s/nF4d5G7rg#reboot-tests-for-PCIe-improvements
[4] https://lore.kernel.org/lkml/20230509153912.515218-1-vincenzopalazzodev@gmail.com/T/#u

Fixes: bba821f5479e ("arm64: dts: rockchip: add PCIe nodes on rk3399-rockpro64")
Cc: stable@vger.kernel.org
Cc: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc: Peter Geis <pgwipeout@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>
Reported-by: Diederik de Haas <didi.debian@cknow.org>
Tested-by: Chris Vogel <chris@z9.de>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
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
 

