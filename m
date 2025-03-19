Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE2DC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 03:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZJBK+GxYsr4WqPoDOxGQQ9TJsnGeN82PCQ8kkn/0UVw=; b=rs1XhA9PpdpW/LNdX3Y3QznVll
	+WOoMDifNha2WQP/Yt6abEBq8P/WOGmno6iAJj2g1gxeFV9I8Ia0EzoilR08tg2rJBH7mfZQoTcPj
	ULFJS6yatKGjND5zZsTQqdyyATX/9L7xtgPADOyCqjVRYxunkHZIHBLajYPKf8up5eulE9j08vhez
	IlJbNMjEEvOtDaaZO95DdlNvC+6vg4uM7B7gX5CqfzrB+UvRPRRSNJPDiw+GtBZmIDQ62/xALKpdX
	8XzmR/TlkVLPV8dPwpoTFAPJgRz8v+VN3s7I/Ez6egcnP1Bn+7YQcnk06vMBgDlfebQg0gzAg1wTL
	DM++Faqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tujrv-00000007r9h-1nNd;
	Wed, 19 Mar 2025 03:13:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tujqH-00000007r4E-1ice
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 03:11:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C68C6615EF;
	Wed, 19 Mar 2025 03:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D3AEC4CEDD;
	Wed, 19 Mar 2025 03:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742353900;
	bh=ypMMkKsvJ/Uf1JkZqtuKEEF9Wh2K7iXsnqGck2sa5Tc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QW+/Sk6TG/tyl45glLfkBo0I9mHv8we/xZ/4e7Nuza4pXnAvE1LLVgR65DO8ccfA/
	 Q9ePt3tQaM7GITBXloHMavASTgxbpiuZ6wNOquijCmWbKZ/5tAvcLSOEWBBFignAFE
	 YU9wz+/6K7R0yRujRXPbJTq55kIoKfo045+CDftZCBk2hSI/xghXfQAuvQ2L1YQgKV
	 GThcAmjPIKcVLC9oPWh/rkDH2XKa+pogs3A9/p5sGG7eF1ic6+x2mshIesYz7ne4fE
	 Mu6KB0hut4iiR27oGtpesckY9yHhQJJsEe7h804s7N2ZwET47ZWPud1BS7l8L+YOHb
	 NObrOeeePxyew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F86BC28B2F;
	Wed, 19 Mar 2025 03:11:40 +0000 (UTC)
From: Bjorn Andersson via B4 Relay <devnull+bjorn.andersson.oss.qualcomm.com@kernel.org>
Date: Tue, 18 Mar 2025 22:11:37 -0500
Subject: [PATCH] arm64: defconfig: Enable USB retimer and redriver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-xelite-retimer-redriver-v1-1-b3e85a37d294@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOg12mcC/x2MSQqAQBADvyJ9dkDH3a+IB3WiNrjRIyKIf7fxl
 BRU8pCHMDzVwUOCiz3vm0IcBjTM3TbBsFMmG9ksSuLS3Fj4hBGcvEI0nfClpbB9mqvgqtySrg/
 ByPf/3LTv+wG9RjTJaQAAAA==
X-Change-ID: 20250318-xelite-retimer-redriver-72b46318d962
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, andersson@kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742353900; l=1300;
 i=bjorn.andersson@oss.qualcomm.com; s=20250318; h=from:subject:message-id;
 bh=xRKqtaffSGX6Pjvc76vk0LWObAmQZMRTKBjP4UwTEzw=;
 b=Ilmlg9Ibvz3XH1u7sHItyqo0EvVlOztOyFwXe0QY5EL4PoQ3fG04ma3H4a+kPHGcJiDdNdsXI
 mtCbAkXJSrHDMh8WKqLwGa1D7rgtQzEq8O5nIjRiu3pOy0p6HnKDzu2
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=rD3O9C9Erg+mUPBRBNw91AGaIaDVqquHZbnn6N6xh6s=
X-Endpoint-Received: by B4 Relay for
 bjorn.andersson@oss.qualcomm.com/20250318 with auth_id=362
X-Original-From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
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
Reply-To: bjorn.andersson@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Several boards based on the Qualcomm X Elite platform uses the NXP
PTN3222 USB redriver and the Parade PS883x USB Type-C retimer. Without
these USB, and in some cases display, doesn't probe successfully, so
enable them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e8dfbe22db68d9aa24df5af0786a2eeb8f33bf3c..5bb8f09422a22116781169611482179b10798c14 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1153,6 +1153,7 @@ CONFIG_TYPEC_HD3SS3220=m
 CONFIG_TYPEC_MUX_FSA4480=m
 CONFIG_TYPEC_MUX_GPIO_SBU=m
 CONFIG_TYPEC_MUX_NB7VPQ904M=m
+CONFIG_TYPEC_MUX_PS883X=m
 CONFIG_TYPEC_MUX_WCD939X_USBSS=m
 CONFIG_TYPEC_DP_ALTMODE=m
 CONFIG_MMC=y
@@ -1573,6 +1574,7 @@ CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
+CONFIG_PHY_NXP_PTN3222=m
 CONFIG_PHY_SUN4I_USB=y
 CONFIG_PHY_CADENCE_TORRENT=m
 CONFIG_PHY_CADENCE_DPHY_RX=m

---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250318-xelite-retimer-redriver-72b46318d962

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>



