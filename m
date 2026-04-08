Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C9F105D996
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Zf8tghgY31ELN1oGicZic8C6mc3PnABGIIZfUK3NRk=; b=yYBpAbuRwNd6SHnPUs7i4JIjJb
	/yL8lsEg9ycT7xRXoe7UKDUyqM+mrVDzqgVnjCDBvGKMwnd0M3M4j0jXe2xCzTVosLRMNT89IjjEO
	8OZkEXCwhrVSEqeWyblz8Vqgj/b6LGzRcYI02zgrkzW/BU+7MW9vU5BlVG4qR93DALvm6hCi/x7yN
	GUdCL5PA+Ao8sCiZXq53weRpIcNLCg520AjaNuCjtkrwkgbIUWZzAlK7ltMt9iheG2tVws0CUO47T
	7vq1VcxRmf7RMHOHxgpq5rScD8s44yebaOEOaGN2umkAWqMY5DRog3gbcGc3VVCg+5f9DOW5syGkW
	nksUPWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ4t-00000008A7r-0Sgv;
	Wed, 08 Apr 2026 02:55:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ4r-00000008A6z-2Em0;
	Wed, 08 Apr 2026 02:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2Zf8tghgY31ELN1oGicZic8C6mc3PnABGIIZfUK3NRk=; b=jR2+SrJLnQCSzm4jIWbHWv2Rhw
	b0EMddjNO/Ek0yfXFTjBcBmVrfFZcNUFjGhnT0feXVlYclKLWmeeGLd8MqCCqg3SJ6Qc72fOdlVg9
	jbDCOYoXvenpRepjp7rG7ctWm8Pg4Vor919DbT/1ILCAAGCVftWN7hGODu8zn6tHvX+VGI8ylJ0VO
	5SC4mXyVYvrd0CiwV1ZjZ/xEUAOkRW0jNrzAuDpSueis31Dq9XILhvtf+fVQ2+I2KEUWHFM8hIEKb
	Rkv1qHJy/itBbtNeNo554iutGQ0pSrQ4kuPUBuTY8lr67BKvMOmXudYXTBRUoj2r/NI9kS3pikUOi
	x/WugqjQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ4n-00000004feA-2dnj;
	Wed, 08 Apr 2026 02:55:36 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6382qjoF72349153, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775616765; bh=2Zf8tghgY31ELN1oGicZic8C6mc3PnABGIIZfUK3NRk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=R5Q5mQoa/E6fu+nf2x6zha3XeOFxVYpthbhE1jGMzYLo+81jtmmx9Rgjwmji4kivP
	 Yy9AaGUq0TKSYLtkMlJgtp/ezTX3BrlPdM/XBNPG3N87B19kEkbjEC6UzSf5TvCBz4
	 kKJ0eBZfYH4uiTQPZmsKLENi/UnJ2o8OB1LYKUzz0Xqnx0mLXdeBtH3lGmqUUsqzF/
	 QXevYY+IO58IbLa8kDOGtGrfHcoO4qCQ7IAF+/dWgJmGjFsAhF4rX22/0CKTwA7e/g
	 zTU+N0MyrAxc6fiy/04x4hvvk7QsTWJ5Wt1ju6tf81sIvZzbKo7Biry1+XFbfD4YhS
	 geDG+U5LGCSLQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6382qjoF72349153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2026 10:52:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 10:52:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 10:52:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 8 Apr 2026 10:52:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH v2 1/4] gpio: Remove "default y" in Kconfig
Date: Wed, 8 Apr 2026 10:52:40 +0800
Message-ID: <20260408025243.1155482-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260408025243.1155482-1-eleanor.lin@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_035533_946939_F448B024 
X-CRM114-Status: GOOD (  10.77  )
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

Remove the default y to avoid bloating the build for non-Realtek platforms
when COMPILE_TEST is enable on other platforms.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- New patch.
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..5ee11a889867 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -629,7 +629,6 @@ config GPIO_ROCKCHIP
 config GPIO_RTD
 	tristate "Realtek DHC GPIO support"
 	depends on ARCH_REALTEK || COMPILE_TEST
-	default y
 	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for GPIOs found on Realtek DHC(Digital
-- 
2.34.1


