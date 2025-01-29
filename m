Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28FAC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drEhK3cDQdkh38kldJ0Y/4vDN7xVhcKxyh6okSkh4XI=; b=tFLNAqGkgUSr2h7Y1WDI7f3SbM
	tiYe8i7HnHtS87J+yqjjiGC0nKH7eaDXSbnRMs5SpJ2FcHmyJ/Jdpw/t4Cq7TI4hee+BvfFhMyPPT
	uJKRBkuSIAlb13gHRH6WIijIPkhhcJadOySfB/ZStxOhIaME2bqWi/U3vS5XILPjW4AFiguwwNSm1
	FBE/6NMClvek4bcIoA82YNcrM1Fj9jSMuO8UQaUR5uqeq6zdeEW6mlpVn0NdklWsW/DooqSOiF9+/
	pvKXwjehKGuP3zSHpY+JO8ozx2o1ayScsnSA5f19x8WbX9CxH5PvmE3vCEFajoT5V6Atrg2wQ+h5H
	zyjt4vmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBKi-00000007Qxl-1jXF;
	Wed, 29 Jan 2025 16:54:32 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBJD-00000007Qcf-09Ml
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 16:53:00 +0000
X-CSE-ConnectionGUID: zNic6jNLRIqqDACrvVeOgQ==
X-CSE-MsgGUID: dv9+jOqTSZG87UVHC9gn3Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jan 2025 01:52:53 +0900
Received: from wvbox.administration.lan (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5E9E8402D14A;
	Thu, 30 Jan 2025 01:52:51 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] defconfig: Enable RZ/T2H Soc and RZ_SCI
Date: Wed, 29 Jan 2025 16:37:50 +0000
Message-ID: <20250129165122.2980-15-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_085259_177215_34689B4D 
X-CRM114-Status: UNSURE (   6.50  )
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

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..a1cc7a37386d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -486,6 +486,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RZ_SCI=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
@@ -1457,6 +1458,7 @@ CONFIG_ARCH_R9A07G054=y
 CONFIG_ARCH_R9A08G045=y
 CONFIG_ARCH_R9A09G011=y
 CONFIG_ARCH_R9A09G057=y
+CONFIG_ARCH_R9A09G077=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
-- 
2.43.0


