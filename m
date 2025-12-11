Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C327D41C32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZrkcUveyvPZFWYdc6fR2Z64ePNQfEWC03ElPftQEvus=; b=b/72RjmXYr/Y1KQg8l2L5TJaPC
	T44FACulP/NE2BSSePN0h5jUP3ObVXOFhq0tdww2b/y8HWmhPK8fmHADCKE9wnOAafCX+R3AHB1Ej
	kThyMOq5qVacoFpgm8HiOuxmC16jazL7D0yhdLpdKIHEuW+7RrMGc4LQiqRlqcVQHhm5Pa/886A+S
	abMyOz3l5g70PWou1wEvW9vg1gpK519TDnxgWWw9qylRJRosA7nJmIZuAiERqT+TQ6DrHj4fmj/R3
	W5Bdo7cH+Trqju1WGlrOUOsyegpekIzB9YBZLgg+hulelt0Y96X3TrLXbJFyAY/mGMph4nX4OcJe1
	GmX5vMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgLz-0000000GcIC-41RM;
	Thu, 11 Dec 2025 13:05:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgLy-0000000GcHl-0Qne
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2699243A5C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 13:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D325C4CEF7;
	Thu, 11 Dec 2025 13:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765458304;
	bh=TM4pB4B99UeY51FOmKqHe9qaAswn9fi2oFJ4ttsgNko=;
	h=From:Date:Subject:To:Cc:From;
	b=esPDVsMyszqmorGhvl0xDE3fZGdI2t1u3n41KhR+1sh6UO53kygqKyPY/sEd/7szU
	 dja9fSKZXVxU/PtU5yMRel4WN2bnWjHHC3uaEMqYacppbUNtY9keb9uqR1RtiNCpIA
	 zaorg6abqsIfztldpWpyaodqiXxsiFBmqwgVh/k94nOeb0BDGrnUqOrM3gU0PeI1sI
	 ojp10zb+ocJOfSQ0NSOfJWWTDZlMB5UAXes+iPWsMAoYHeVlSAjzzMi6ckO6JkZ2i1
	 TWSM4pMVkPWJhA2og9y1qD9r4WlxPFptr0nDxxOc/lLT/6rpKw8wvnHHQQPHwtyHA+
	 iFZDoXaMXaTuA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Dec 2025 14:05:01 +0100
Subject: [PATCH] ARM: dts: ixp4xx: Fix up Actiontec MI424WR DTS files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-ixp4xx-actiontec-dts-fix-v1-1-97af8e79d474@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBBFryKzbiDNiLpKtBCdajYlKiGEd29o+
 T7vvxcyJaYMi3oh0cOZ70tAdwr86a6DkIMwmN6M2miNXKOtFZ0vYhbyGErGnSuSt24ydt7tMIL
 cYyKZ//S6tfYB8jrkRmoAAAA=
X-Change-ID: 20251211-ixp4xx-actiontec-dts-fix-ec4a7249f435
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_050506_192252_4F57167C 
X-CRM114-Status: GOOD (  11.91  )
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

The KS8995 switch was unconditionally wired to EthC (eth1)
on both MI424WR variants, this is wrong: the D revision has
the switch connected to EthB (eth0) so pull this assingment
out of the generic MI424WR DTSI file and make it a property
of the respective variants instead.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
SoC maintainers: please apply this patch directly for fixes.
---
 .../boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts  | 11 +++++++++++
 .../boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts   | 11 +++++++++++
 .../boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi    |  1 -
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts
index 413b9255f9e3..19a8d7b07758 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts
@@ -12,6 +12,17 @@ / {
 	model = "Actiontec MI424WR rev A/C";
 	compatible = "actiontec,mi424wr-ac", "intel,ixp42x";
 
+	/* Connect the switch to EthC */
+	spi {
+		ethernet-switch@0 {
+			ethernet-ports {
+				ethernet-port@4 {
+					ethernet = <&ethc>;
+				};
+			};
+		};
+	};
+
 	soc {
 		/* EthB used for WAN */
 		ethernet@c8009000 {
diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts
index 3619c6411a5c..244c6ea0973f 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts
@@ -12,6 +12,17 @@ / {
 	model = "Actiontec MI424WR rev D";
 	compatible = "actiontec,mi424wr-d", "intel,ixp42x";
 
+	/* Connect the switch to EthB */
+	spi {
+		ethernet-switch@0 {
+			ethernet-ports {
+				ethernet-port@4 {
+					ethernet = <&ethb>;
+				};
+			};
+		};
+	};
+
 	soc {
 		/* EthB used for LAN */
 		ethernet@c8009000 {
diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
index 76fd97c5beb6..9b54e3c01a34 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
@@ -152,7 +152,6 @@ ethernet-port@3 {
 				};
 				ethernet-port@4 {
 					reg = <4>;
-					ethernet = <&ethc>;
 					phy-mode = "mii";
 					fixed-link {
 						speed = <100>;

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251211-ixp4xx-actiontec-dts-fix-ec4a7249f435

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


