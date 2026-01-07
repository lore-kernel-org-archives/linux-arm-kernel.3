Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4450CF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKSV5V3WfxTtG9gGQf44uHIC5XvJW1yCv88bgwyEcC8=; b=I2d3DHCVVmJ+OAbZ1VjOKXqJig
	aVK2LKIVdOd8YA/7pySFxca3y9QkTCDBMA0Iv75IRL/kJ3xQa4zFGmXFiKXw5iV1aDFpfU/PAKtlH
	vqt2mJeJpB/R0ismbQ0ixLbiIbBZIXC7th2f2VpClNHD5fIv1b+0J4uwsvaeup3sMEQnmkFjLGPBd
	E/NIQx1elW0EqLWCtfZyomZ5BX+mMw5Blj5KsPThx93hltKc5X19aCqMwhCGiJgwV/oS1GcxCyDRM
	XZwFcDu0E8Tj+I7M61HJuw6hCzdLSjylRmSSlUF7jC5mYMywbeuvr16vXfaHJ00TK+NLOgUadjV8s
	QJzI3HaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ0K-0000000E2W3-0i1O;
	Wed, 07 Jan 2026 02:10:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ04-0000000E2GU-1Z5b;
	Wed, 07 Jan 2026 02:10:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10245443F1;
	Wed,  7 Jan 2026 02:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF032C2BCB1;
	Wed,  7 Jan 2026 02:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751815;
	bh=O25Fa+LOHrlGWf89leLFa5oUdMzI0/mS2zkHLLNiy8I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TS0BE4nbfGyfx/9gmij+OPkQf/MnV8X2MKy025UtpMxcY9+o4fjTnqyQnODO6qVBg
	 0kcWwYMvBYomyz+d8G27voGLUWnxvSxDm/KF/L0IoXdI4kmYaxumBw/yQ0zEQWhOOW
	 8RQQDxaR/XlXg3I+u4uE90RfFKvsKWVsMLFswu2bU2E9fACkvCLXrNNicC2MFQbu1V
	 bEQ15ZqS29QaQX9If0t2xVZfHtshi2cw/Ehxk+g/Boo687qaVBiJOZGuvcq4L6Ce6w
	 /cA7lulIhqo+tn/WXFy/MManmg+9nxOUtmHdZwLj2DMqLQLYQGD8oWyVjqI5pYBkS+
	 VAOyzm42wiYcg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:48 -0600
Subject: [PATCH 09/13] arm64: dts: broadcom: ns2-svk: Use non-deprecated
 at25 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-9-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_181016_445460_C4B42C48 
X-CRM114-Status: GOOD (  10.32  )
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

The at25,* properties have been deprecated since 2012. This board wasn't
upstream until 2014, so it should be safe to switch over to the "new"
properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
index 290759ee0078..de238a9b1845 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
@@ -115,9 +115,9 @@ eeprom@0 {
 		compatible = "atmel,at25";
 		reg = <0>;
 		spi-max-frequency = <5000000>;
-		at25,byte-len = <0x8000>;
-		at25,addr-mode = <2>;
-		at25,page-size = <64>;
+		size = <0x8000>;
+		address-width = <16>;
+		pagesize = <64>;
 		spi-cpha;
 		spi-cpol;
 		pl022,interface = <0>;

-- 
2.51.0


