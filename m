Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20926E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 02:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHpYoWcC3a1yibTmmSQIGYWTas0Sv+4pH8WU+FAozOM=; b=QgM1Lvq5SzBT4zzfJJJvU7QXlX
	EssFy5+zOyzHwjI0ByqKQv8gqf+lhgdOXQ00s9QDweZ6iV99gyIncyer9h/NFU6K4TG6GrEUeXb2y
	kEf5NvJAaJxwq0rQHIPjEio+w83GW4jx8qIu+cqSgwYUrEEkq134O+WJsFA4+r6p8Q6tsrXe4MQoM
	F+vHwUjWJcDPWVy7Nw3I1n9XiXH6rahquCXNDep7iz+YVVlKXk1kbC/rfsBKTkIYxc6eyOwjJ3ToJ
	HtxDYLftIYJ3Fzblfl+rp9lJIMErdqqdJME+2eJgLbpty1UK0AH0kr0VsXuur7v/QKoSjDa9lszPN
	rsKwZDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQde7-0000000EySY-0XND;
	Thu, 26 Dec 2024 02:30:43 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdbl-0000000Exy2-2371
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 02:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=pHpYoWcC3a1yibTmmSQIGYWTas0Sv+4pH8WU+FAozOM=; b=B6Llc0TQLzww4Rky
	/dbg4HPyp+UBtHIXR5WjD4HGbvJDFE+hF5DvZoCmGG6meYjfz1OwGYukGVk1XBBh3PSLPVdieLhEk
	j4iUZDaO19Pl9D7Yp5AmRZ6JzB2AyMmU7z0QyMCmjPn2LU9xRX5Rl3tmcF8ZEZu/ymOa0r+6GznYn
	SFdJ6TKExnFsQnLzF4weKJ3t0ROAzdisHOBvoXMHo/LPSNFuyLvGzd/2bO14RfO6q9k7PgYbO4DrM
	OSB9Lm2hhNbuZth/24DIaECh74tb2F8qFsUzX3J145VVJA2oX/GDE6kK3XjneaFC0p0uJWgVx0TwS
	cVut6VQakL5qkxo+Yw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQdbR-007F0L-0b;
	Thu, 26 Dec 2024 02:27:57 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	deller@gmx.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 5/7] gpu: ipu-v3: Remove unused ipu_vdi_unsetup
Date: Thu, 26 Dec 2024 02:27:50 +0000
Message-ID: <20241226022752.219399-6-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_182817_617110_4EFA37D7 
X-CRM114-Status: UNSURE (   7.33  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ipu_vdi_unsetup() was added in 2016 by
commit 2d2ead453077 ("gpu: ipu-v3: Add Video Deinterlacer unit")
but has remained unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-vdi.c | 11 -----------
 include/video/imx-ipu-v3.h   |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-vdi.c b/drivers/gpu/ipu-v3/ipu-vdi.c
index a593b232b6d3..af9631fd4256 100644
--- a/drivers/gpu/ipu-v3/ipu-vdi.c
+++ b/drivers/gpu/ipu-v3/ipu-vdi.c
@@ -150,17 +150,6 @@ void ipu_vdi_setup(struct ipu_vdi *vdi, u32 code, int xres, int yres)
 }
 EXPORT_SYMBOL_GPL(ipu_vdi_setup);
 
-void ipu_vdi_unsetup(struct ipu_vdi *vdi)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&vdi->lock, flags);
-	ipu_vdi_write(vdi, 0, VDI_FSIZE);
-	ipu_vdi_write(vdi, 0, VDI_C);
-	spin_unlock_irqrestore(&vdi->lock, flags);
-}
-EXPORT_SYMBOL_GPL(ipu_vdi_unsetup);
-
 int ipu_vdi_enable(struct ipu_vdi *vdi)
 {
 	unsigned long flags;
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index 8870f65c9a8b..c9ed4b6a408b 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -463,7 +463,6 @@ struct ipu_vdi;
 void ipu_vdi_set_field_order(struct ipu_vdi *vdi, v4l2_std_id std, u32 field);
 void ipu_vdi_set_motion(struct ipu_vdi *vdi, enum ipu_motion_sel motion_sel);
 void ipu_vdi_setup(struct ipu_vdi *vdi, u32 code, int xres, int yres);
-void ipu_vdi_unsetup(struct ipu_vdi *vdi);
 int ipu_vdi_enable(struct ipu_vdi *vdi);
 int ipu_vdi_disable(struct ipu_vdi *vdi);
 struct ipu_vdi *ipu_vdi_get(struct ipu_soc *ipu);
-- 
2.47.1


