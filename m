Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35281E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SO3Xh29xRkdmQmLn6fa6N/djXaj2dmx9KQNMok66AoA=; b=AAkIhpPChuG9TPkECia0Sc17SN
	rkG3+wwoLZErKcO3OYBnaSfSYFcqMQ0CIQn/rWdN7yHH1hG9clAZMiyK9+HIh7OCUIDYkGFrxmuwc
	ZV635Nkp50kv+BUBXI9SqKCDA230TILnQ2RIZhROAtpt7jLK28wVeY1ZwQqLEVXZsq2N4384fQj92
	0pqxMb7OsYkUyV56c/ZH+5awbh8R6+ryaXmyfry/njUoA3Y12mA3u0YGOJ8UmTzgJkW4VNGpTswAa
	n13eaFrQ8Z19+ctvfoS+B5JZfxvDi8o/TlLT4j2WXBzBRDNb8Q/JalHHEOTq4P1imxmgpDHyoM/Wz
	3w1lshHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVtT-00000001MBm-3p9a;
	Fri, 06 Dec 2024 10:49:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVfL-00000001JTb-2n3d;
	Fri, 06 Dec 2024 10:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SO3Xh29xRkdmQmLn6fa6N/djXaj2dmx9KQNMok66AoA=; b=vhB6ht+507ZVQSUB/53u6YxVEU
	kkBQESnINzaHc1MK6vkAs0aYmwVtf6XKW8ezYAx8gR6xYpsigr9GLQEwjKX6aRBOyabg4wRVEnmbX
	ziVvluAie5euLgQmRYlvSAbtuFx/Iq8dVaQG+nS1Hd6wUzPQakaV3Xi5gEZLrIs21SHuWZ1KmTChV
	DzzwqQ2Hr+wU8UhIRB7Y4ZVrxEZe5ADNKv6po5N85a4R5MfwBbeBeK6DlMtN1Mn46LGSyyUF1xF8b
	1fSWBlXHad+EZ0mdZujv/FFcCX3KMwsuMK/5dNF0eyXje0nTX6HRzFtoIZ/iP0zCtwb3MvX6Ffwib
	R3oVHnwA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tJVfI-0007XU-0C; Fri, 06 Dec 2024 11:34:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: heiko@sntech.de,
	cristian.ciocaltea@collabora.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/2] phy: phy-rockchip-samsung-hdptx: annotate regmap register-callback
Date: Fri,  6 Dec 2024 11:34:00 +0100
Message-ID: <20241206103401.1780416-2-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206103401.1780416-1-heiko@sntech.de>
References: <20241206103401.1780416-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_023431_744408_042D3912 
X-CRM114-Status: GOOD (  10.81  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The variant of the driver in the vendor-tree contained those handy
comments in the regmap register callback. Having the different ranges
describe what they are looks helpful.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 4ced1479e2dc..c5c64c209e96 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -766,13 +766,13 @@ static struct tx_drv_ctrl tx_drv_ctrl_hbr2[4][4] = {
 static bool rk_hdptx_phy_is_rw_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
-	case 0x0000 ... 0x029c:
-	case 0x0400 ... 0x04a4:
-	case 0x0800 ... 0x08a4:
-	case 0x0c00 ... 0x0cb4:
-	case 0x1000 ... 0x10b4:
-	case 0x1400 ... 0x14b4:
-	case 0x1800 ... 0x18b4:
+	case 0x0000 ... 0x029c: /* CMN Register */
+	case 0x0400 ... 0x04a4: /* Sideband Register */
+	case 0x0800 ... 0x08a4: /* Lane Top Register */
+	case 0x0c00 ... 0x0cb4: /* Lane 0 Register */
+	case 0x1000 ... 0x10b4: /* Lane 1 Register */
+	case 0x1400 ... 0x14b4: /* Lane 2 Register */
+	case 0x1800 ... 0x18b4: /* Lane 3 Register */
 		return true;
 	}
 
-- 
2.45.2


