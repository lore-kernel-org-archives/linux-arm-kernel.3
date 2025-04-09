Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA24DC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C4yXU2JFUiQhbuEEZJAK+mXC6XbGhAGkeN8e6pXXGkY=; b=2nYZ5VoEEiYFW+TP7d4bneqXxy
	MnukR/RKuxUO2NEH8Iu0BtbWJ8nJOgzzYNXzfbhM+oqt2nhP5wi+h+MX+bYSPW56T8qH9BV0u+5QY
	/Ogvmtl/7i7RSRMV/m2vVOyGh01m1GPRQQboZBV6B+S2LQeSZcdD/fHqoKQnv5MfocUxvSgW35Dug
	pU+jVtSccSQ6LiKG6YO+Wjhx0N05jEbfnp60nrmLN8zX6zf8gLTK5vFrXRmHBKGNaIdSCFqz+qlM9
	6IOkIsvTWVgGumR7rnd5bF8GacJpJi7WFdL2tSeyg0RQna8bfbHjVpuam/bza+DF8vtiCfEsy9auO
	VaA2fblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dIE-00000008d2v-2fLO;
	Wed, 09 Apr 2025 21:49:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cZd-00000008WSZ-3fwF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 21:03:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EE4A61127;
	Wed,  9 Apr 2025 21:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F92C4CEE8;
	Wed,  9 Apr 2025 21:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744232584;
	bh=GNu9pN8MhnbhJEhK3+EqUFdenT1ITVQAVXD2zBG/u2M=;
	h=From:To:Cc:Subject:Date:From;
	b=eAIJgM3llVkrBg2XJetnIXjBEJ5PHPjd9/hRTZCUjALRAmeHqssEJ0l9GOGzLbzZF
	 7izQXKEH9nOlBN9eAkaVRat8fYDFJO3pxymnku1NOVsbnaVNoIiHPT5sCy0gO5wfU8
	 q2ofvlxiTgfnogcRPFy5YZo60W886Nh6kGT5JGiBL0TYd0BadPwwlzZgmspF13/upj
	 Ihi/GLl74UBsGqJEN3fqC6g/xcDosymFkd0axdXRyusvH727mWnYW+Vz5TBDulbwrO
	 FYmPXLC8x07vn9aHhTc8jPted9k2KI/b9NADC11qBi+KSUw/0pFb8w9Eboaq467sMT
	 UHGmmqi7rD9sw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Antoine Tenart <atenart@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: amazon: Fix simple-bus node name schema warnings
Date: Wed,  9 Apr 2025 16:02:54 -0500
Message-ID: <20250409210255.1541298-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Fix a couple of node name warnings from the schema checks:

arch/arm64/boot/dts/amazon/alpine-v2-evp.dt.yaml: io-fabric: $nodename:0: 'io-fabric' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
arch/arm64/boot/dts/amazon/alpine-v3-evp.dt.yaml: io-fabric: $nodename:0: 'io-fabric' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, please apply directly unless you expect the Amazon maintainers
will pick this up.
---
 arch/arm64/boot/dts/amazon/alpine-v2.dtsi | 2 +-
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amazon/alpine-v2.dtsi b/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
index da9de4986660..5a72f0b64247 100644
--- a/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
+++ b/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
@@ -151,7 +151,7 @@ msix: msix@fbe00000 {
 			al,msi-num-spis = <160>;
 		};
 
-		io-fabric@fc000000 {
+		io-bus@fc000000 {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/amazon/alpine-v3.dtsi b/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
index 8b6156b5af65..dea60d136c2e 100644
--- a/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
+++ b/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
@@ -361,7 +361,7 @@ msix: msix@fbe00000 {
 			interrupt-parent = <&gic>;
 		};
 
-		io-fabric@fc000000 {
+		io-bus@fc000000 {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.47.2


