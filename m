Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BA5C4451E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeojZqsmoY6fEyvTiYHW1t3elGuAHbs5C9sKBBcrsx0=; b=Tcwn3x1y/TGDuP+5XFORZEll2X
	SLX3twJDDaTixXZWtJK31316CyPiCna/4p6pzqtbeCoaCOmTQUGqGrg7RuCckbrRlis5HCwNltw30
	eUHcUA4LJCRUKInwjYqFfgt5zlgDe/7WOnXIQAnHJg8SVs5YdU0oWjfWvQdHSDThHf7UEBeIkHOwm
	Bv+FsLTxEuv8tzk9aLBRM1S+rGw6SgxFZWuM+Hd0XBXD1u3HhLmmYHGeyxvUGWsNOmoO3qPCrCQd9
	C/KAv5Ym3fuj8TJVpRI9N8oaOICGFDocvDEdOXwCXmDzGzw4aBbcmr2C/9uL5vIO0m7mBSdD+VyLK
	wNDG7yNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcul-00000001OjQ-2xRo;
	Fri, 17 Jul 2026 07:23:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcui-00000001OgT-32vT;
	Fri, 17 Jul 2026 07:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4476543D15;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21C78C2BCFC;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784272996;
	bh=Qt+euM/zsTwnrwWBdeY4FC/bLGntnRxL7BQX8au6CKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jH64hN5DYQkmaBRqxJu14Ncc14PNNL57PEN2J5rxwd0IlZPvD/BCGhEps4OedLWEu
	 EAQWVcjPaN6UsiB9u7KtzAgDTeqvG0mPrkK/H5RKI5wQLCVcYV/fzfE3AfVJoqLf4y
	 IMhi1ldMo3ByVOpVD2nneU2OLefKsHdH1IB1xrDsJIozORgs8cls8dA1xwLkJiCFmb
	 1AQroJY1Ol1wKzwRLdgV+5k1XIok7Y7rmIS/Tj+rOnRBQt08Y94NNwhGnJeSxyvfIf
	 Edonm2KzpzFYmrDMQLTkkK7mw5dyU/awVDI+M0PFt75hsIofj7sA7RcFH9yPOHJijX
	 32DV0vhVJA9Tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BCDC4451C;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 09:23:03 +0200
Subject: [PATCH v4 05/12] arm64: dts: rockchip: rk3588s-nanopi-r6:
 pcie2x1l2: add clkreq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-nanopi-m6-v4-5-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
In-Reply-To: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784272993; l=850;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=nF39hGlVSZHnYtpnr/CKnQCddKMnmwHJRd/YxWqnHvs=;
 b=hPlkGdUmpom30Nh5CWQSLEMKoJ0lIlRnDVSU/17ctCLjZrTLchi7rADG+z12fYodZ/UkSAtZ2
 /quy3N7M6QEC1kKU0oIjdUOTZM7nSequV+MKXi1i8KTsQxZvxOGRyKl
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The clkreq is present on the board, so hook it up in DT.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 2d3ebcb9cb22..b115852ca13b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -369,7 +369,8 @@ &pcie2x1l1 {
 
 &pcie2x1l2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie20x1_2_perstn_m0>;
+	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";

-- 
2.55.0



