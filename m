Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2ABC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9xgh8B/zm8/WChqwo53t1sfyOGDRUQkCddaF7RwrIM=; b=UO1rZ5WFbsRx8TQ32Fnt9lcXen
	ayV67NZVgazrgH3QRYKUx54M1hCa3+ZoYlKy29IqYv05ye7RLVRgjFBmz7CfeyJf+P2ufMezO+hNv
	XWjrx7mEFaRe9WiZTuNtZogFY0gu1nQ9DaI6XCsOP4hIXQzN4y5q793+/UchcNEA64gftIZO3E17Q
	HmIkhvy3zJ/Dh310lf/4Hl8A1ovcfJbKTtPB6NWW4UyfEYa/JQdgLwI36q4d6k76XTgvRxnuRztfl
	7SqvfgXeS7OMUV1YKwDCjXKT+N2D2Hs4kpPYlZvRiimiyQSU4QGVN6pp3dkJZDh/7PImmZhStrYXF
	CtcflrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPJF-00000005WgJ-0U7e;
	Wed, 26 Feb 2025 21:51:17 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPGE-00000005WBA-3NgC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:48:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 314B26122D;
	Wed, 26 Feb 2025 21:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97680C4CED6;
	Wed, 26 Feb 2025 21:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740606489;
	bh=82kYuqeQF4R2/TZndohz5T6rtlxiysXvknNQ+xYTXkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z3SWNmOjgQVTaZPw6vTmYYxHVNe7pMDk/O97umAWUKJAPVFc1+PqXsd8Viy7ALmUw
	 PU+9RkHbwcIk5zp5qed9myqLGNLU2XQMFLqbx3UMYEfKdi34Gnb8SsmcnMCWu2pETb
	 D0D9e5At8Vak/FQLgYWBEV27rKBQmzUJUnLrKrHK+JNvEmhd8I7xrDRpqdMLwSStAM
	 YKhLrnOTPRYyTBqPyXY5KEnaQRjYBQJgREepppBtVpYpQhMpsPXX3D3s9P+HmQPLL0
	 /GO7TWp9bXenhz+uv/vaZXfOh4WIRIrJRzH3GnecnE2pOote5wFoPR+XRw9/ogx4am
	 R5+L87bnGIoJA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: marvell: Drop unused CP11X_TYPE define
Date: Wed, 26 Feb 2025 15:47:48 -0600
Message-ID: <20250226214751.3751865-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226214751.3751865-1-robh@kernel.org>
References: <20250226214751.3751865-1-robh@kernel.org>
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

The CP11X_TYPE define is not used anywhere, remove it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-cp110.dtsi | 4 ----
 arch/arm64/boot/dts/marvell/armada-cp115.dtsi | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
index 4fd33b0fa56e..e3cfd168becc 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
@@ -5,8 +5,4 @@
  * Device Tree file for Marvell Armada CP110.
  */
 
-#define CP11X_TYPE cp110
-
 #include "armada-cp11x.dtsi"
-
-#undef CP11X_TYPE
diff --git a/arch/arm64/boot/dts/marvell/armada-cp115.dtsi b/arch/arm64/boot/dts/marvell/armada-cp115.dtsi
index 1d0a9653e681..ec6432c8db7c 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp115.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp115.dtsi
@@ -5,8 +5,4 @@
  * Device Tree file for Marvell Armada CP115.
  */
 
-#define CP11X_TYPE cp115
-
 #include "armada-cp11x.dtsi"
-
-#undef CP11X_TYPE
-- 
2.47.2


