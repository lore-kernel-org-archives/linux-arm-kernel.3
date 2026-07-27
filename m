Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D53C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BExrr++CeQtOIGv/JPdP57pAUZPeVdTrEbBe5GDruhA=; b=CLgNZpeVKLZJJNQWczvKedFXa7
	69Rh98hLG43wnP/zEf4LDAdccovJUOiPT3EUznzSXUZ06ywLuF9gvdEKQsWNIno63z5iJ84DfGyB4
	gCVFXNFSxC26otNXdhQNsqnffhr6FdYdBaq1Qt6luu2iXkZ51EF8ULyHCPsDiI2lPMxj2+pjTR57i
	Axlnh7XJ1EIcXSSSBsd/PRZ2tigjy4Wph93mlm684+MPtgAw19WXe04dvFu1jOoRbvVRi6E0En7vc
	fkVYdfQK9CGq/SLz09iyymzPQiKdbrCM7gTkjg+tEcdUX6NmvKMWeNW3Eyp+Kh4yUz8/Dut934GDx
	wHegJvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRHA-00000003mAZ-0C6w;
	Mon, 27 Jul 2026 19:46:12 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRH7-00000003m9s-3V2W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:46:10 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-930f72317a6so202509885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 12:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785181568; x=1785786368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BExrr++CeQtOIGv/JPdP57pAUZPeVdTrEbBe5GDruhA=;
        b=WAiglc3mhDGcvuZD05qeFDbFPhXHI0d470IlYFD3s5EFaDSJglosfIPRmmG3jyZ0MP
         g5Aq8DXZ1wOHB6FmkeOD49hVnmWUCO3CEvky9H6Qj9sj1IMZCeea2SLuMTBYGejbmzWp
         d87KlevgB4mH3FoDajaXRsNiF/w2ads84qNHzyA5omyKh1OToQVxa32uVngHRoYtxrKT
         n7FohLKbwGIvTriwAu8cxk0tricSDY5OkEcewzVRWoRM26YIcZeGT8C+S0GARefPHp7r
         dvGgIIPI5jjcB9fB6p7A8yphkm+3ajKItCW0W3LWl3t8fxZk+O9V3W25z+vmYiF0Q9tK
         Etaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181568; x=1785786368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BExrr++CeQtOIGv/JPdP57pAUZPeVdTrEbBe5GDruhA=;
        b=SOwMtii3TWBh52pwR6MIzn1NRvx70AXSbSyOV7T3pekSZish3d7tIjQ2C5pyPZ8pnf
         6J28RsoiSRwH27cEzIo6bFgqp7ICxOke5JWk5BSv/YZZS9ac+3zmXVqJjNqROGC4EhiT
         B+SUs2kGL0z0c9pZh5csENQJD0u14tApXyQii2gXuggSOvcplgaKzUe3DtgXugC/5080
         SqksSJ4wuct0fIwQera2pXJoh9F27KR4vSJy4KtBINlOcREXDVvJu63m9bajI62vALn/
         ON7RqAtb/VBQu0I+Zipgh/Cuf/ZFvZOg+patypDADCGz19t664GQ5auJN1qlaNCaoURm
         QjFg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/tKPA+Jm6NriU2scQZDdA57KeirOuylRP8DtWYR45MBvnx2BZz79xIG9ODkDVBlQDyzam+0LUzqrHBSxASoav@lists.infradead.org
X-Gm-Message-State: AOJu0YynOL9SvNTJJwVSOOeIjpW9G08UpjqUmoLUPJBgLxDIQJeQQqva
	sY6chm9qCdXCCoNhsTK8cU5VaSUOOTa4xqFU0NFFkhCKYm2w1HrwwoBT
X-Gm-Gg: AR+sD10Og4OKUg4flPrNFFyw4C/edChFNgqXcOwdehwLUONTqgel6LRyMFyiS3DC1JA
	eojeyzvhQ89i8LOVJnoNgpZVPlk6g48ukEd4XGQ3/ky2fQZ/ubnbCUuLbb7zRR2PJ/0KOFirNNw
	YoUd4S4Xi+38VjQeeS+ACsdAq1H4eWnt3PuECVNMuI7mS3z7diPCUqRqD514ZTeHuw8TW/FGdXG
	XfB+/XM1nFtq9UCYm9pHkYdA+n7A5qy4palw+65I8btLuptmI0b2WpcbOO7kdbtpMfyJBhg3/M1
	PPJgQj6xcIBqkKhNdH//nbhPFN+MVbp+OMDCiajPxQvwXOElftRqDixu/iN07dYGvr1a75WCfeN
	77OhM4U72NjHJvygVb+FLaCcdtUw9hhltgk5IVx1a941ZQpagNjviI+sxQNjuCS+ZP5nY6u/qiY
	zoVrR/jwhNtPMmo9zhZCw5oUbgJAj3x+1G2JzNpPbXtC49hXpht3hU4vs8Xr4nat6FD1VbwMGqB
	EcR4zW3YkgCAljmuxjyqSdV/Thp9+inUlTrOgsrXNURK7tmsdrxseY=
X-Received: by 2002:a05:620a:a191:10b0:930:ab28:945c with SMTP id af79cd13be357-932fe356c16mr54818285a.50.1785181568176;
        Mon, 27 Jul 2026 12:46:08 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e854f5b7sm71788406d6.20.2026.07.27.12.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:46:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH] mailbox: bcm2835: use platform_get_irq and simplify probe
Date: Mon, 27 Jul 2026 12:46:04 -0700
Message-ID: <20260727194604.11061-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_124609_902834_6673D0E8 
X-CRM114-Status: GOOD (  15.32  )
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

Replace irq_of_parse_and_map() with platform_get_irq() for the mailbox
interrupt lookup, and move IRQ and MMIO resource acquisition to the top
of the probe function before any memory allocation.

Simplify error handling throughout: use direct return of platform_get_irq
and PTR_ERR values, remove the redundant platform_set_drvdata and
dev_info log, and inline the final return.

Assisted-by: Opencode:Big-Pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mailbox/bcm2835-mailbox.c | 37 +++++++++++++------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-mailbox.c
index ea12fb8d2401..0ca75c378a60 100644
--- a/drivers/mailbox/bcm2835-mailbox.c
+++ b/drivers/mailbox/bcm2835-mailbox.c
@@ -136,28 +136,30 @@ static struct mbox_chan *bcm2835_mbox_index_xlate(struct mbox_controller *mbox,
 static int bcm2835_mbox_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	void __iomem *regs;
 	int ret = 0;
+	int irq;
 	struct bcm2835_mbox *mbox;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
 	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
 	if (mbox == NULL)
 		return -ENOMEM;
-	spin_lock_init(&mbox->lock);
 
-	ret = devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
-			       bcm2835_mbox_irq, IRQF_NO_SUSPEND, dev_name(dev),
-			       mbox);
-	if (ret) {
-		dev_err(dev, "Failed to register a mailbox IRQ handler: %d\n",
-			ret);
-		return -ENODEV;
-	}
+	spin_lock_init(&mbox->lock);
+	mbox->regs = regs;
 
-	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mbox->regs)) {
-		ret = PTR_ERR(mbox->regs);
+	ret = devm_request_irq(dev, irq, bcm2835_mbox_irq,
+			IRQF_NO_SUSPEND, dev_name(dev), mbox);
+	if (ret)
 		return ret;
-	}
 
 	mbox->controller.txdone_poll = true;
 	mbox->controller.txpoll_period = 5;
@@ -170,14 +172,7 @@ static int bcm2835_mbox_probe(struct platform_device *pdev)
 	if (!mbox->controller.chans)
 		return -ENOMEM;
 
-	ret = devm_mbox_controller_register(dev, &mbox->controller);
-	if (ret)
-		return ret;
-
-	platform_set_drvdata(pdev, mbox);
-	dev_info(dev, "mailbox enabled\n");
-
-	return ret;
+	return devm_mbox_controller_register(dev, &mbox->controller);
 }
 
 static const struct of_device_id bcm2835_mbox_of_match[] = {
-- 
2.55.0


