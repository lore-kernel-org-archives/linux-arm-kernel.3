Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486D0C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 21:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26gO5Z7viuRFbGZwX46BM+M9jsLRziHINHWmMxh9kUw=; b=iZ+Y9n4/TEImT3enaKSBB5cuWe
	QZ4zu4XJ2EdCFzj5tr07SunEPo9oaVSJgidZi8C514EuwlXzd3PVsnlXHFVWlXX9so7c08DjLFfvO
	DhKmOPixfY9j7lCeYpyvU4hCKCsOwCrVvqtXhUSSfjYfKE/jfCFHXrtXGgXgVy5q/qIBoi1PmMPrA
	jNiFz0LmSwJKglL5AyHTt17qdozdod9bEQUR2trbKoz7/BnqErT3RTihG/n/KEt6BoCte01t6ecJh
	zbEVyq5QdbhY1BcmdlubVg7EBvhhR7tZkPW/wUhjFZKBm0R3Dho1veR1bNwbrxiw8DBoyehZvGzup
	sU+8ms7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0SBT-0000000ABlf-3UwG;
	Thu, 03 Apr 2025 21:33:11 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0S9d-0000000ABJx-3wVr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 21:31:20 +0000
X-CSE-ConnectionGUID: 6BgU7RT8Qs6mvMmb/aNMhQ==
X-CSE-MsgGUID: WEPXP2IWRuizs4QHM0kemg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Apr 2025 06:31:12 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.33])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6199840B55D9;
	Fri,  4 Apr 2025 06:31:09 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 13/13] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
Date: Thu,  3 Apr 2025 23:29:15 +0200
Message-ID: <20250403212919.1137670-14-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_143118_090438_CBE46518 
X-CRM114-Status: UNSURE (   6.55  )
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

Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v6->v7: none
Changes v5->v6:
   - Renamed CONFIG_SERIAL_RZ_SCI_T2 to CONFIG_SERIAL_RSCI
Changes v4->v5:
   - Renamed CONFIG_SERIAL_RZ_SCI to CONFIG_SERIAL_RZ_SCI_T2
Changes v3->v4:
   - Remove CONFIG_ARCH_R9A09G077=y
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..fcfc7b2e5819 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -494,6 +494,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RSCI=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
-- 
2.43.0


