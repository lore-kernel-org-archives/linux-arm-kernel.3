Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33635CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 06:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqLPM+kXoeHgjPG3WNK50K5OpNlzyApuQ3Iy6PDhjwg=; b=PnG/YXlW200zZPRMC9l0Kl8my7
	0XMPQcf+RKms5PiiFm/g3wYgg+BPtC6XfagtJ7GOXcS+asA3dETD2jceWQSYpeMIc39Hl3t+nWrJ7
	kvsfsTh3aX58I6rWUxhXfryJsAPnlUnaA8l9DN0D+fc4kd1eIf1IvMAT52mzspSI1E2rwI7oJWZHI
	Qh4PRn7l4+7ZrDGdARZ9exozzHwA45IEwwR/K6O3yl6cHdoQx1TRUgt0gHWXl3UdZPZpyQH2iu7Qa
	IAztk8UfzI+j47R3NGN3h180p6R1utIlZuOU/NmEdEXw+HjMPiIWXtZOX61K8T3jkewW4c90IFy1i
	7/gE6yZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEp-0000000CWm7-1P1P;
	Tue, 23 Sep 2025 06:10:55 +0000
Received: from mail-m49242.qiye.163.com ([45.254.49.242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEY-0000000CWeI-2ShI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 06:10:42 +0000
Received: from [127.0.1.1] (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23bdebfdc;
	Tue, 23 Sep 2025 14:10:32 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
Date: Tue, 23 Sep 2025 14:10:09 +0800
Subject: [PATCH 3/9] arm64: Kconfig: add ARCH_BST for Black Sesame
 Technologies SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-v4-patch-final-v1-3-2283ad7cbf88@thundersoft.com>
References: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
In-Reply-To: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
 soc@lists.linux.dev, Albert Yang <yangzh0906@thundersoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758607828; l=1640;
 i=yangzh0906@thundersoft.com; s=20250814; h=from:subject:message-id;
 bh=cHT9OdZmOkIsxZYmVp8kL8+kNdAyxnac4z7DgCBE+1k=;
 b=OME+FkLaqTP1p6JDWalZczqQZG/luaqEYd25xIJ3VIjzrcNGla4mWvW6JCbOoj2G1Qj83dWlJ
 ySZJfmZ4MzTB7cpa6dk1Of1li1dzTh1wdpESALut0Q0Jxe0sGa1t4Oz
X-Developer-Key: i=yangzh0906@thundersoft.com; a=ed25519;
 pk=bEcgALL9KpUg/m7zH44r50xa/re91dI9SA0vGV1/bu4=
X-HM-Tid: 0a997531f48c09cckunmfc27e25b4e0271
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGE1JVh0YTENMGksZGUlPSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jtjwu41VZUI2FsHS4LND00ky5OEvWLJEiWKpD4y0Z59bYpQT+VrlGfSzcx1WNYySyRP4nNNB4mW14yvZr8WQ9tsmb0z1aFzssbdsd5qbESsJyi2T+fS2Ay9NEimMAMSLOIwuUmrIPlA3v+fs93tnAptcQNBogeUKnQlmsYb4wjE=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=NqLPM+kXoeHgjPG3WNK50K5OpNlzyApuQ3Iy6PDhjwg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_231038_860463_045F4E02 
X-CRM114-Status: GOOD (  10.29  )
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

Add ARCH_BST configuration option to enable support for Black Sesame
Technologies SoC family. BST produces automotive-grade system-on-chips
for intelligent driving, focusing on computer vision and AI capabilities.

The BST C1200 family includes SoCs for ADAS and autonomous driving
applications.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>

---
Changes for v4:
- remove Signed-off-by: Ge Gordon

Changes for v3:
- Reword subject from "for bst silicons" to "for Black Sesame Technologies
SoCs"
- drop unrelated whitespace hunk

Changes for v2:
- Placed the configuration entry in correct alphabetical order
- Used generic family name (ARCH_BST) instead of SoC-specific naming
- Followed upstream kernel naming and description conventions
---
 arch/arm64/Kconfig.platforms | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a88f5ad9328c2ee13a0822782af6c83899273f14..8a870b213dee930861bab39dce2df295c387cf89 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -112,6 +112,14 @@ config ARCH_BLAIZE
 	help
 	  This enables support for the Blaize SoC family
 
+config ARCH_BST
+	bool "Black Sesame Technologies SoC Family"
+	help
+	  This enables support for Black Sesame Technologies (BST) SoC family.
+	  BST produces automotive-grade system-on-chips for intelligent driving,
+	  focusing on computer vision and AI capabilities. The BST C1200 family
+	  includes SoCs for ADAS and autonomous driving applications.
+
 config ARCH_CIX
 	bool "Cixtech SoC family"
 	help

-- 
2.43.0


