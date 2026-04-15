Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83464F43821
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X423UGRy0ZAt+/V3gZHEoyo/x53TY58dVujUIeUwt54=; b=c3VAYYbdYqV4CqxUvUVpwSJ7LW
	w5MlYZcq5bGKNioqbjq68TE8i+PNX3M5XhqLZfLdVwWuWOrskN9dLMGYmC8bHX074iFCfATzaNKX9
	/sxA+wzLVxpHGsuTO2EARJCdcWtY0v1N7BobRRj5aMwFjUMeigr+a2auWJU6ajO9ckzD+mMo+oVoh
	TdfU116MrYxB0uMSF68uahqDQ7wu4XNMTklUlSB0wePc42DsOHlBbERrp9nPJZg13UxL/IeFRy32A
	+WVk6cTH+0BryVap5bs30EEoOx2pP3IgeIR55x3hPTUP8IzUq85JJVW1lW252v0vQMvvyM0tBiyUF
	04lFBFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0sH-00000001DeM-0DpP;
	Wed, 15 Apr 2026 14:05:49 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0sD-00000001DdA-3s3J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 14:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1776261933;
	bh=X423UGRy0ZAt+/V3gZHEoyo/x53TY58dVujUIeUwt54=;
	h=From:To:Cc:Subject:Date;
	b=U5K0Sxuk3aURMoa4GUdWYUqjZjdmtTia9c+S1ImF3DyRtTn2ixZZFQ9fbYR6E5yCQ
	 hhhWmrl9w3egpaefiloPMPmp6EthbluNDqeo1Nu7R13MGWnz0nY9Me4iVZOij1xbpk
	 4K/bdtmbgBniBLRjrPeAv/iL83eTqAaEpsVaSofY=
Received: from localhost.localdomain ([171.223.89.103])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 15D1AA0B; Wed, 15 Apr 2026 22:05:29 +0800
X-QQ-mid: xmsmtpt1776261929tv2p75q34
Message-ID: <tencent_516ECD6F12A7B8D859A1752D090236D2AC05@qq.com>
X-QQ-XMAILINFO: NT7uTz3cNku2MZfqQBUSGlXDFAuplL9vYEoRLr0LYx+fxn3ouHGV68HFF2wdVT
	 m7J+hnvPHLVml45ITgD4T89j/dTRInU2lZqoRR5TH16cFBxMUQaGcTZ2mG6dbItLgAj5Kq/QtqLh
	 qoKMUnHPARGvy8jfpIv70vTy0eExf5vd2kqFC9xWc2A/hDOlmVM5pFNpLra9kqOqkFIDOKxCTx5e
	 3ak2z6h9G/lApyWsBsvmBp9TSH13WjReieY1vYwSZVpI7jc78QcEBSSNFakxu4wDheVbxP28vOlx
	 +vnFrHbuItoF+MuSOsw0klP6Jy3ZawoR6zvElDJGnC8+yz13148U9kk1pg39Dyx7kPR4R8VlmsiR
	 boPj0fpnx3Q4dUuFhqol+L8B2eMom22ePMOoOWfDMJenNxBedUT5whsUnHx6zoENkCFS8VcIoi5h
	 eS2lHnoOPsmHduwKJcduWrDrbKRcBlrF7Lx9GeMvtjLkkXYI3toYlmop1+CyQEPKZjprH6NxS+bx
	 qpiZ5n7JmLmOspvcJXkzrAfQN41gCuIxQQfR+MAHRk+IM/2XALi3eKpJUIz69sC1cHPWmisRr6sf
	 q4iu4GhuQjm4WovxNbpP+Wy0yUXjjT/qjg2JEMdSWM1IUsSqPyAwiYSktPypi/5UU6SZsFVY+zlS
	 g8dtbTHxU5ksGkojOpuROlTY1uqLC15+yjJZoVOaeSWEWippE+YUmjKXs4cx+L0gY/valgCsMaYf
	 tIPy0oNX/dcCXh+c6Uz25YpqBgUbTbzN3gs2ixf0qb+P0+iFvppKMiT18vpDJAkSvg+VX3/FoOMI
	 psORiDX25zHTr+tMD2o91XeJcylRrODyyr8Ejtt+lAwwtOm43anRY9azWFuxhhQVYk7SkBfxiXyj
	 x1GaFbsyKZzHCVivJdTE6A68DPOrunFCJ2NPneehxSELANPHoDCYX0gd30b1M05/AViE4uqshrHA
	 BpaUDsCfBAHPdBa5UtMupJgW/XVNHI57QdCRk+otlFz1VyEkGcFhmOP9HoDVyRbB/+GfXNFFQU5V
	 M0ODDXvsI3biGUl5TwzUse2NueQC0xExAjXiIHa4S8u9TmwI2X8HJM1yYb2x9X7qfJGZmt3g==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Renjun Wang <renjunw0@foxmail.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH] drm/rockchip: dw-mipi-dsi2: add sentinel to rk3588_chip_data table
Date: Wed, 15 Apr 2026 22:05:09 +0800
X-OQ-MSGID: <20260415140509.8325-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_070546_492163_4007B94D 
X-CRM114-Status: GOOD (  10.25  )
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

The while loop walks rockchip_dw_dsi2_chip_data  entries until reg
is zero in function dw_mipi_dsi2_rockchip_probe(), so rk3588 needs
the same sentinel termination as rk3576 to avoid reading past the
end of the array.

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
index 0aea764e29b2..8fd4653520df 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
@@ -483,7 +483,8 @@ static const struct rockchip_dw_dsi2_chip_data rk3588_chip_data[] = {
 		.reg = 0xfde30000,
 		.grf_regs = rk3588_dsi1_grf_reg_fields,
 		.max_bit_rate_per_lane = 4500000ULL,
-	}
+	},
+	{ /* sentinel */ }
 };
 
 static const struct of_device_id dw_mipi_dsi2_rockchip_dt_ids[] = {
-- 
2.47.3


