Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6189C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mZ281H0S02t7176D+bqxjl4chkVEj1RFfKyhGtpJ7c=; b=xs44SWyXNpbY3BYf426u+ZfAE8
	xDn/Q4PKxKsdXesEVAqA28qPYGy2eFbh92zyaixumR1MgXvnT7fblhdc2dFJgOy915jbpY/ZGm5Ww
	2+ImaDfZumLDzYuHecENHC7+szqhnvZQHhLYzySlLazyVD8x53Ue3CoLfXbf6V/HDyCHBvQUupFz/
	HvVcOKzgaDWCFBHL4+SwF8uZ70ZO8oMgVLxksLOWACbwR+WXLZNQbIeVkcX1kz7wYEf5WGXEiIN3g
	R5f11nquMAKQBnky6XaauQFITZOxOuf+aijVofY8gjZd+rEGuw7zRxa8elo17jO45ouM6D6xe4oj2
	85/Nensw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuhs-00000007xKD-2DtE;
	Wed, 02 Jul 2025 10:28:48 +0000
Received: from mail-m49226.qiye.163.com ([45.254.49.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWu33-00000007pdE-05jm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:46:38 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1aaa9ed42;
	Wed, 2 Jul 2025 17:46:33 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	catalin.marinas@arm.com,
	geert.uytterhoeven@gmail.com,
	will@kernel.org,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	soc@lists.linux.dev,
	bst-upstream@bstai.top,
	neil.armstrong@linaro.org,
	jonathan.cameron@huawei.com,
	bigfoot@classfun.cn,
	kever.yang@rock-chips.com,
	mani@kernel.org,
	geert+renesas@glider.be,
	andersson@kernel.org,
	nm@ti.com,
	nfraprado@collabora.com,
	quic_tdas@quicinc.com,
	ebiggers@google.com,
	victor.shih@genesyslogic.com.tw,
	shanchun1218@gmail.com,
	ben.chuang@genesyslogic.com.tw,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v2 3/8] arm64: Kconfig: add ARCH_BST for bst silicons
Date: Wed,  2 Jul 2025 17:44:39 +0800
Message-Id: <20250702094444.3523973-4-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250702094444.3523973-1-yangzh0906@thundersoft.com>
References: <20250528085403.481055-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkNOVk9LQktMGRpOSBgYH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0NVSk
	tLVUpCWQY+
X-HM-Tid: 0a97ca87e53409cckunmee1cabff3ebb07
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nxg6DAw5HjE5LE9RQiIzHUkP
	TC8aCi5VSlVKTE5KT09CTkJPQkxPVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUlMSU43Bg++
DKIM-Signature: a=rsa-sha256;
	b=CCVhNbF0z/nZNzKXzKPmTCziV/mfP8r7/JXYSuX3+o352hI3g6Kd+ZBKmVA2IicGO6JRd2Fv501c/80xty3Xoc6C9D1Fk8SXqWl+jay/xIqLslItLvj1HV/8BynCZlGPmq7wpK9nT9EFSJP0rrE9PrdQfzgP4wfgYZcHo+W1q0c=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=+mZ281H0S02t7176D+bqxjl4chkVEj1RFfKyhGtpJ7c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_024637_238137_2005FE3D 
X-CRM114-Status: UNSURE (   9.03  )
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

Add ARCH_BST for bst SoC series support.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Changes for v2:
- Placed the configuration entry in correct alphabetical order
- Used generic family name (ARCH_BST) instead of SoC-specific naming
- Followed upstream kernel naming and description conventions
---
 arch/arm64/Kconfig.platforms | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..4412d54b224d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -106,6 +106,14 @@ config ARCH_BLAIZE
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
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
@@ -402,4 +410,6 @@ config ARCH_ZYNQMP
 	help
 	  This enables support for Xilinx ZynqMP Family
 
+
+
 endmenu # "Platform selection"
-- 
2.25.1


