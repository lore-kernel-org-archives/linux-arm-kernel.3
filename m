Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C676EC56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=669I622W7Km88PXo45A8x+GE5SMgUb2sVCvST/fwGWA=; b=N9sRixBT3xo5ofVBOmlr5Zl6HH
	SXx54j9HoDNl9sZ+Oyw5h9mrgGmXg3KLP3DBty0pQ+SKtZGL9OueSnpeIt9nQzGabfxAg8OoGTVOf
	F+Xgw823c1mYGtYni/H8JgMoT2CTWIMIAMDFGnLtjmZeDKacktMvXjcwn+Tb7vHdX1CMS8vlGWVoP
	a2qhcKxovxoiQR9nMQdWu41BvBIcjHzekGPy4/d9ULiRlz6EA2VT7VnUYGHzA8vG4VEpxNFhNeUMi
	B6xulmiIc2CuwWIGzr9ESh1hhZpfcTaVLaH15O5GmzUcwDuBPl+Jrthdqb0hPrst3nDFe0/Ix8h6f
	iEwiiZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1qG-00000006Mp0-3lNc;
	Thu, 06 Aug 2026 17:25:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1qB-00000006Ml9-3dzy;
	Thu, 06 Aug 2026 17:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786037110;
	bh=kZgKoVVIFup432J5wyz+w2YrxBYWFvZYNT1wMMh2tgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZUhr8TDul89hyUnLDsO+FRh5lXOQvN2xTIH9JXCqs49FoZlfGjca5FTVqFEU2XIXp
	 YlQYBtLWGm82M35MjIDL/pArdeA7sbVEe34/IoE9vRscbVOIkmcyGF5BaJ9gSU+GlL
	 sgbGiC50ZBmgf2l7CFYz/rD/3gtA2d/QTFha2hAWSNpRaSXwlVRkz5Lwr/939isEoK
	 wfQSp4B2ScR0OTX1G3Pntqq9gUI+SE7CJ9AV7O8kAya4HXwBRVZiFD42vMi4MJbw9L
	 zgBKGEvCFbiWm5Da/XCgB5WJ8Q3yqeZHXeGfKDlKrvgnPiWTr5G22GHkOTt+jUwoj2
	 //Emss92YgbKQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C647317E0B39;
	Thu, 06 Aug 2026 19:25:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7D348480028; Thu, 06 Aug 2026 19:25:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:24:56 +0200
Subject: [PATCH 1/4] arm64: defconfig: enable Rockchip VDEC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-rockchip-defconfig-additions-v1-1-6b1d8baa0bf5@collabora.com>
References: <20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com>
In-Reply-To: <20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=754;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kZgKoVVIFup432J5wyz+w2YrxBYWFvZYNT1wMMh2tgY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0w3V4MpxaQx8VBjtposIXJIzyIdcFEzc78
 UZHB05hrNoWhIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdMN1AAoJENju1/PI
 O/qaVD4P/1cnzDHENypa2GuwJZKgH8VZzH+EqpAj8MQSfu+zlEKAHqSI67Lne4XBYyD0P5MzazQ
 wgPdVZQNjSJbJuong+ySDIjGNZipsc5mrHgYjyIX96qVkmUQFwkMWYK1B0/nSEVYo5DJohZfJyK
 W1rRXTs/2fko8+pYDyMbGiBzqjlsa4ky9f+ZjlVaIeFXJHGPp4S+YwdIw4duASrH+Nb/sLZMVbq
 IujJoyqNaykGbxsCHOac1gI0bLN0y9X/zjlTIX8aWR5dAkVPp/lHoSRqTCDHL2Q9Z+TuGo9Y5VM
 U5tOTWPD0A5GXola1tbtFGElnXOuQ7zCyrOUC/A+q/sZjUx9bRjR/h1bVHPtjWbUOBjQ/tt2gKT
 LkWO0Oy6lJJrSbPQ0jyaw/yFMq3W17gaiWm3YKuAZ+KBo8lf30VIwDvE3lnTyRSI8fTmKkbviCs
 M9Q8Wi9Aq5X+awnjdM3BynqhWb8bvdof1+ClFI/SNc1ZTwR9ipSl9795AjX917yHCJ5g0W5Y+Yy
 6suOt5IE7JKGBZCu/flRbj5eiJrcyXSvH6hTskKo4wdmgFy4NSBpCdpo2c/OnceCgnGv0CpIzrf
 HOvAaCg2pB3g4+Li+YYj4n50XhyhIy/C9RdMMB2WTR/54j8srss7bvtFHTE8da0mUZQhqh5Gspc
 LPEDcmQ2JBcqDfB/uPrcpZw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_102512_065010_F67A4913 
X-CRM114-Status: UNSURE (   8.86  )
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

Enable the VDPU381/VDPU383 video decoder driver used for H.264 and H.265
decoding on any board using Rockchip RK3588 or RK3576 SoCs.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..c84df0a9cf6e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -939,6 +939,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_VDEC=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m

-- 
2.53.0


