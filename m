Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B47C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MVvMs78zkzkeqmzW6J2z1KTg9lkgT1zXvYuPWJfo120=; b=VB5ViRo0FkyNH4lbZiZxr5Yowg
	lTDuYmER41C2MlF50Fhn30SDggO/nLUeccaegYYqVj2BXM3wttxwi0mo8R2r6C0laCOWGSdspKUaI
	2lpMBWdKX5AFeK1orJ0RAwYUGF+3Tz1sehmMaWo9J64D4VFLQxipVS6jA+T4JcEPjJvodouqFVEBP
	LsDJ/urlvEUAkrCDfRGp5k1NRWVZGyQnta1kEX6f+7xaK0Xx94FJ8t18nmWMsn0y48sxrKYkuaD1Q
	20orGepO9heC/ACg17dbKheI8uQdsr4bke42YpjfQmoFj9XVo27mbBoAHPvyLDhJOlQ1IY0pit4eG
	ASxCzblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkq8-00000007Tn9-0zzp;
	Wed, 05 Mar 2025 09:14:56 +0000
Received: from mail-m3271.qiye.163.com ([220.197.32.71])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjaH-00000007IT6-1zk1;
	Wed, 05 Mar 2025 07:54:31 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id d0130eab;
	Wed, 5 Mar 2025 15:54:23 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2] arm64: defconfig: Enable Rockchip UFS host driver
Date: Wed,  5 Mar 2025 15:54:12 +0800
Message-Id: <1741161252-138526-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtKHlZJShpDQhofTkpJQk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95654c729f09cckunmd0130eab
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PSo6Pgw5EjIBEDgOECEYMhcz
	C1EaCh9VSlVKTE9KSk1KSU1PQk9IVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUNISzcG
DKIM-Signature: a=rsa-sha256;
	b=EPyMqHw9H8n7HlyKtEcwAG9wCWh1Synmf2b3spAA9E+jUZsFekwbvwB9aXwIw5vdY017ch2KoZxLK6VnlEYuqf0AJVJNE53fiXqKJeJiX73ZCAv65qOefjUFUG+2KDP86c21hYOtTOWYJdNHcRfXAWDmdKwcPjnvOQ9D4/fa1+8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=MVvMs78zkzkeqmzW6J2z1KTg9lkgT1zXvYuPWJfo120=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_235430_031190_4695BEF2 
X-CRM114-Status: UNSURE (   8.16  )
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

Enable Rockchip UFS host driver.

This driver is first introduced on Rockchip RK3576 SoC, and will
be used for more SoCs in near future, so add it to defconfig
will make these platforms work better.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3a3706d..907e92d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1191,6 +1191,7 @@ CONFIG_SCSI_UFS_HISI=y
 CONFIG_SCSI_UFS_RENESAS=m
 CONFIG_SCSI_UFS_TI_J721E=m
 CONFIG_SCSI_UFS_EXYNOS=y
+CONFIG_SCSI_UFS_ROCKCHIP=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_MULTICOLOR=m
-- 
2.7.4


