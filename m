Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3967D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6h2kAInXQw5GSZ9/yGrDMGC9W3e57sw1Gq+9X5Cbobg=; b=iVuxeajIBs7FEwgktrefnixX03
	MjYKDMxMqfP14zeMkgDEvN92yIQq6DfUokkD2zbjiS67D8OA6D/QEmSohatbYeqR0BwukbusLI5rp
	gBRdHXHDu08sJJIhCff2OqoCaoCvoq0KaIiHZeLPHukALyj/IJddCRBF37zyoOBgkdIsgNgPub1oZ
	Eb9n399+Sw16QNU93Mso8Qq4q/e3pz2PoCLcWfKMqeu1UXujcKXve9QNoOSq7wV7XuO0YKCwU34eW
	VGDpvFTz5pT5FSqBHfP+957xIcYHDe7sOVSJ2muGMBp6VVYN+ckDJqkz0tQIAgUGkfMHlsfk1aKNZ
	8hFXXtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2AW-00000003t8q-3Sxv;
	Fri, 15 Nov 2024 19:39:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC29a-00000003ss5-2kwS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 19:38:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0C065C6512;
	Fri, 15 Nov 2024 19:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97599C4CECF;
	Fri, 15 Nov 2024 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731699529;
	bh=Ta89hoZlKOxfpyHkQBO+QgPfHl3czdx7coDCK9JfVdg=;
	h=From:To:Cc:Subject:Date:From;
	b=jvWXf89iDBZYVTcgpi+pQFVPTvIpHvirLtmIYLVWZlgbmXfrQQL6qCw4qt1BPniWd
	 mEaamc16R/c6CXqA83+XEoBlEQ6kLUb2Ca32qel26gBp09bx+VbsSLgP3JzhsGM7xJ
	 1ia7enQ+S+YHGpHcS/sUKyOoAZmCbxFZVWJOUgkpk0vqgn/FJ708frTIyBne9SLDXd
	 MYQpXwiygwPHuFhRi08geoipFfFn2D50gI7W0qsSr6vOqUdkRa5P9D+NoHL9zRL4vP
	 r40rQOyDo4FdVCdG0M4lkJGZ5ixfnFWHZGEzukVFbA4uvdxbuPkFBnwwe0EJgVGivY
	 kyyI3jqBsC9yg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: spear13xx: Remove unused and undocumented "pl022,slave-tx-disable" property
Date: Fri, 15 Nov 2024 13:38:34 -0600
Message-ID: <20241115193835.3623725-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_113850_734733_32E32515 
X-CRM114-Status: UNSURE (   8.11  )
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

Remove "pl022,slave-tx-disable" property which is both unused in the kernel
and undocumented. Most likely they are leftovers from downstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/st/spear1310-evb.dts | 2 --
 arch/arm/boot/dts/st/spear1340-evb.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1310-evb.dts b/arch/arm/boot/dts/st/spear1310-evb.dts
index 18191a87f07c..ad216571ba57 100644
--- a/arch/arm/boot/dts/st/spear1310-evb.dts
+++ b/arch/arm/boot/dts/st/spear1310-evb.dts
@@ -353,7 +353,6 @@ stmpe610@0 {
 					spi-max-frequency = <1000000>;
 					spi-cpha;
 					pl022,interface = <0>;
-					pl022,slave-tx-disable;
 					pl022,com-mode = <0>;
 					pl022,rx-level-trig = <0>;
 					pl022,tx-level-trig = <0>;
@@ -385,7 +384,6 @@ flash@1 {
 					spi-cpol;
 					spi-cpha;
 					pl022,interface = <0>;
-					pl022,slave-tx-disable;
 					pl022,com-mode = <0x2>;
 					pl022,rx-level-trig = <0>;
 					pl022,tx-level-trig = <0>;
diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index cea624fc745c..9b515b21a633 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -446,7 +446,6 @@ flash@0 {
 					spi-cpol;
 					spi-cpha;
 					pl022,interface = <0>;
-					pl022,slave-tx-disable;
 					pl022,com-mode = <0x2>;
 					pl022,rx-level-trig = <0>;
 					pl022,tx-level-trig = <0>;
@@ -461,7 +460,6 @@ stmpe610@1 {
 					spi-cpha;
 					reg = <1>;
 					pl022,interface = <0>;
-					pl022,slave-tx-disable;
 					pl022,com-mode = <0>;
 					pl022,rx-level-trig = <0>;
 					pl022,tx-level-trig = <0>;
-- 
2.45.2


