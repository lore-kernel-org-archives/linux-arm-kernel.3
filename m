Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50597C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xuu3dqKbvT5TN0h8C9rxO9z7z8ny6MRLQZ+3c5zyScM=; b=gzCXbPo+b97IAMIKzyPSOf3Lrr
	AwUHZeyVqhX+yI9LQ5ZHkXtfIWNNYRcahbmluo8pjHFaWRPXSlSvelEuYKPaaudE+e0VLbdvhESgZ
	iIOvFbSkJssq+jZ2LWpDm8hVPA6Tbqu/dDjAr7Q5ZkTUE0OKMaxkcHtueF6rhNpWgBjfIZLLbiuPN
	5r/6Pv730HccVcTju85Y38XXWYKErhfIs786SNs9QV2oMsn2Fmp2w6bAuct0LYlZAVWvUGxnSvXcL
	dEc2yjHdT8g8ryWAiRjl2HVF84o63FrFXe501n7atijxTpybPlllaT3otQjWLP3k+hJoMxkVoUB8O
	1j1Y4H7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITxk-00000004Boi-1Ygs;
	Fri, 23 May 2025 15:05:32 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITKf-0000000446u-0vDi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 14:25:10 +0000
X-CSE-ConnectionGUID: 4EnbSzcFS9aXmf58ADsxAw==
X-CSE-MsgGUID: lgNzlK4EQBSsyae3MVbW8w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 May 2025 23:25:03 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.97])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 53C644017D95;
	Fri, 23 May 2025 23:25:00 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 10/10] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
Date: Fri, 23 May 2025 16:24:14 +0200
Message-ID: <20250523142417.2840797-11-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
References: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_072509_366253_5061366E 
X-CRM114-Status: UNSURE (   6.78  )
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v9->v10: none
Changes v8->v9: none
Changes v7->v8: none
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
index 04619fe7e22a..bd2aeb7c13a7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -495,6 +495,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RSCI=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
-- 
2.43.0


