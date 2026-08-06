Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB56C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UfkwtaLNTyQVqOw+5SWsbqKwOlCXb/h/GoPtpUt3w4=; b=Or949yz4ZVud4PPl8YW1zyqLsE
	wX3fLjZeuE4CZ7f2IXXdUbV63KJpxiuDltw9yUlyZDbcedLLaAbDSdlzlWZy9BsRhFUwO7bENabUc
	SzmT+qG3xelX4iuE9QyJtKI2E+kCZv7/eSr6qq7DntO6k1Kvaotq/vookAroOaNTigT5V9J9JE1iX
	eqKY97TcIDrPEbK6Wj5yBWapyin9tXEr3zM0ICJICgljR73qSHO1/eg6wgC2NpDedw/KeAehgK+Ac
	C/zqjGOi+tmyYCXWsiDdcazUH3h9+n8Ha8JZKLj0uF7Ay1T9tOmOeHptUz5Waj+CztUTJGTSgMcRF
	j2cTryCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1qH-00000006Mq3-2LBW;
	Thu, 06 Aug 2026 17:25:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1qB-00000006Ml7-3tf4;
	Thu, 06 Aug 2026 17:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786037109;
	bh=z+cuir8dVnqy7vIB/Megx6Nr1nRbB+S4lxaUmDLUFZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bN9ynZIH0gW+c9lrsVqF4xe9XIwTEWFDUsf006p6e6IHZG5rB2a2OGeOOMOo/pR7A
	 3/gGbgKC8xxTqtJJkof5gu7qD8TdgSIaYHRVZfWxLotSQ+PrwHlzs20uIqsTebwDzP
	 dqR+Mmn3+tYCSwHPOKEsgg1cpgxudfjyuHNMAVtQJBd1FnClm7YtbgZme2ueq55Wf2
	 z6IeA4cqVptu95nKVBgS/aNKWrpbljJjskAW2yymOyqeg9myUX+b+cU5qpJwo/9LNn
	 7/z2Sn9ut2bBYH7jds2Pzbz9grj9g24iRG/LVH2eIbXxtwV99yen2ccZme5NVjYs4S
	 GN1jP+AN4BqzQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C24A217E075D;
	Thu, 06 Aug 2026 19:25:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 802B948002F; Thu, 06 Aug 2026 19:25:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:24:58 +0200
Subject: [PATCH 3/4] arm64: defconfig: enable Rock 5B camera support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-rockchip-defconfig-additions-v1-3-6b1d8baa0bf5@collabora.com>
References: <20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com>
In-Reply-To: <20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=z+cuir8dVnqy7vIB/Megx6Nr1nRbB+S4lxaUmDLUFZw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0w3WXG01gvim1p5B3xuNmAETRXDdAHdPJV
 0lc7L+WPAZC9YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdMN1AAoJENju1/PI
 O/qa5mQP+wf+lLs/H+LVdnAUmuPdBTv0VTfryUG5tSPRK+/CtTJKoKfqAiXHVW4MyRMSKCFE3Z/
 jo/06KqoR8oo5pna/RgIWg0EGh5Wnetht+m8KfVAbAae+XjXoveN2XhblkW+HIuCqMdb6SHengm
 a+jzK9fPfw+7nKe/ZeLIcoEjkXLDjVBlbwJe5WiUFZ1q6rwq1365DJ6S3gOguAJf5Xel5IbWyLU
 Nxh05V/Nqt0pd8tx0I7CfnrXcDZNpAlSv8+yKmEJ7MMRYBI6mtdD09UD1F4NmH33ccgoCS4Vgnj
 0OHPfa70Rjd5a0arOGrwR+dPm8gdmICLTNSEGbKdUuT+bAEcA/GS85bO1dDOu6Q1nLczDftpWCO
 rXBXaY9ldmmsko+cqRGaEEI3v8MpW0N2SWtlwInPrnFsxal71YwETuo17zeqHxyzpdAV5q8Fi+n
 bMgvRdTkr8O5VQV/qSXIa/hPrzA8jCltWyWnKwsaFIx/HCtbQ64ZwNJ+DMQDBVJzeUYYPTMm6Eo
 cRwHQHjYhiIqB37/5AgbxPH/4cqT0RzNqsOIxdrcr32/jr7+1gfaZ7bYac3/ww5gZFtQkmsfYcJ
 ddoPqTiSks0FZeLoriwSZSPHXRWyq9SylZp1mn4SZZS38zUud09Z5RGNHhjK/zVBvA8xanR9UHH
 Wy+agCJKp9L4AUHoQ3QsxCA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_102512_162143_084F5B15 
X-CRM114-Status: UNSURE (   9.55  )
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

Enable the Rockchip MIPI RX Innosilicon DPHY driver, which is used
by different generations of Rockchip SoCs as well as the Sony IMX415
camera sensor driver used by the Radxa Cam 4K modules.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c7d9dfd120e9..648010c26edb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -950,6 +950,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX412=m
+CONFIG_VIDEO_IMX415=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
@@ -1787,6 +1788,7 @@ CONFIG_PHY_RZ_G3E_USB3=m
 CONFIG_PHY_ROCKCHIP_EMMC=y
 CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
+CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=m
 CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=m
 CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=m
 CONFIG_PHY_ROCKCHIP_PCIE=m

-- 
2.53.0


