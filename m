Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016C3C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ym4l12Cz7d5dEHhUQ7keYGDpgB7Syz1ET9NOekLK1U=; b=V3B0SPH2YGf+3XC5VzoH5qIy3z
	tPb4JRlfdhdjWIGPGXnIxd3ztcMztNg/jdqGjySovAprvuMVQmEh0PJ7gNwjTlKB9l0gKAjK+g4gL
	k8tKL3sL0Qba4SzzR5tBLFqYXa9+9wAMkL5oaencJaw4B8F+nNPl0WIF4bROAghnlAdJySdSGTIqd
	sQQ4XI93q8pYKdRaT/7xsYYr8wZZ0+4rR0RZodCEmISrDTyoaWZ8DRHU0Oiy8Fzrom9uvuZHwYpxx
	NgjxtJ4hyWjleCOiTI8JaB9maHipXAPejpaekGoJ9YtbrJXPBtJIwTj46gQp8E9XPvVHjzcsB83lB
	+VQbWaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUzn-00000000ip5-3zDG;
	Sun, 06 Jul 2025 19:25:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUON-00000000fFo-1Dzi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B0625C3E40;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD966C4CEF2;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827629;
	bh=5Q2Q0HYjd/a051Qeq/6+x7Kt/vVCeBodlYiFHOoyYjs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vHz63QPHJKbu1WaR6X38LhiUnOZTnYwkq/s7Cl0VPwu/RdX4/DtIFZHrSvfCbTzkC
	 cl5fMm4COfeBj/uRRRIPOB2atHNKMedVjX4+slhfPjTUqjppuAUeKwF+ovpema12ge
	 sh8KyEWaTo40/r/knxBjAD+BQFrCsQAdwZjd/+lSJ/+grIwAskqo6uZP7kLuIDQG86
	 sAtJpMzKx6ukrX3+uaay3yvI0GnuDCBUY4INxzm5iJAWMsIKqm8UIjFNhYGnh+g5Vi
	 qYnTQUzx0/oZEwPjcARak35CCGTSYO9ONbvxf4J+Xp1Xrm7R5Th2cWxGQOVMiNvxZ5
	 ZMVls9++8WtVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BA8C83F0A;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:46:58 -0400
Subject: [PATCH 02/11] ARM: dts: lpc18xx: rename node name mmcsd to mmc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-2-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=864;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=F9o9Zz1l+QBlQQDM8Dn10ujNdmNzCrECB6a3juGDdlQ=;
 b=i5bDnkjDaXg3R+eMt4iPutUeGhKw+htNfKMzD/bm9mmqJ4e3wV/3xTWR2FlH8nL/edtRFfYXq
 j1J7oytr13sBtnFs95y15K4NQ/a+zK5LF5W8wNnfAEjga6b+Wx81fqe
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_114711_378712_81661370 
X-CRM114-Status: GOOD (  10.79  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Change node name mmcsd to mmc to fix CHECK_DTB warnings:
  arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: mmcsd@40004000 (snps,dw-mshc): $nodename:0: 'mmcsd@40004000' does not match '^mmc(@.*)?$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
index e17298e89eebf4fc7e3f135dd4a20e563db48ed3..80da477bae3d9dc45f0dcdedc275ac2ff09032bf 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
@@ -111,7 +111,7 @@ spifi: spi@40003000 {
 			status = "disabled";
 		};
 
-		mmcsd: mmcsd@40004000 {
+		mmcsd: mmc@40004000 {
 			compatible = "snps,dw-mshc";
 			reg = <0x40004000 0x1000>;
 			interrupts = <6>;

-- 
2.34.1



