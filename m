Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DBDC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Subject:From:
	Message-ID:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kcg/VpsEsEhvDBR2wFVPEe6e4HtfXO+m5leMiIe6dx4=; b=zMkSjWcbBTJ3eeq8YpVUmLHOI6
	Oqx4+4U4TPwnu9eSZgIibI2Nxq2//DJuS9ELL9y1iEeTRV5dldmwLRnrbzhQbnLGDCe+gHaGPB/ML
	QxmKV+U+0Ww8hA/+ld9rMHhBTES83mIuzrcAka5mcZYZ+kZEOZMaI//t7KnIF4iR0u++6mQ7s5+hX
	ZoBpvNqnCHcDsm6/7yZhBS5E2gIpjDy2gjQTrlo1yDTLsCUM8tG+keDBWIS3FQ4sGF7H8yY2/IYeF
	SCWdpOQ1CZS6IAfPJN0mv9BYit3DHdWigiP5zkwVMyCPaI8GvFEMtYsthN0kCsa5W7kFoYwooIPEG
	byaVj6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJmI-000000082Fx-2nWY;
	Tue, 18 Aug 2026 13:22:54 +0000
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJmC-000000082F7-1Uk8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 13:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787059363; bh=kcg/VpsEsEhvDBR2wFVPEe6e4HtfXO+m5leMiIe6dx4=;
	h=From:Subject:To:Date;
	b=SS5tZDu8hDvQBQvCsrOKCP5JFNknhk82ZHzQLwO0cCSPX9XA+5JqDk2V6v30Y/2ry
	 qKL+Wz+u5p3SKfMeGtZZbRb2L/jMGonGhXLL4g0q5WRPzZ2ZWESUkZ/GEm9Q26dg3L
	 SLNdnfVTk5/1AnrkDILDWIJgnk/E1iG6CTdYCZ0g=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1721C6D8; Tue, 18 Aug 2026 21:05:50 +0800
X-QQ-mid: xmsmtpt1787059270todi280c8
Message-ID: <tencent_95E7173942FAE82639FD03E6FFCE5516D60A@qq.com>
X-QQ-XMAILINFO: MFkgsonL4eTus6TEoug5APrlpO0T8uodIWRsEjz9yhvlX/LKLLBbfGPzZXiw1d
	 7zcM0NuOO3Zztut+A4eTyD4FkMIu9wEdH//seWNq+Eu3Nv9OHbNkbprpa8zwsFAuWIg1qL3VWeFH
	 tmlcFIl9771njUF6Y5siBWBda9nBu4f274b9jMwP/QEi1B4obp0RIB5TUYdH4fYWBQ0gCVsdSErA
	 T5TatQiuHrlRfQA9nTpjvuL9wnT/o/W0zpYd1OIJnZIFhTpox7maWxzzD7N2SA6ChfyuZPPGJSgt
	 GNbjW7GzeLNBNOcEAiG7U0GsITOzprHozTdQ+72uf6o+iRAuJby8e/QKju9CDDvQkiC3ZeG053q2
	 h8XWF33BLOsw4L9oCwiCJP7oCOb5dTN9lLUu4y2ol0bueFuhlvrWGqabFyVUgyW9Can1jWR4oeDo
	 1PUV9bQYf0q2MDdH7puvkwVwU782G+ZFkyhDU0p5BkPh5tlsRkVYi/Qb7NhkHkrkFeNNg279fXLL
	 Cbo00r9u5eJMyRHaqZoMwKyDOg7GasEVg1HKpQCPRIq4FFZSoFv8+v/n9UPWPjkt0rDiWREGoWNK
	 J1ib26m7Jb3uUd2EA0RFJartQQt2z33vS6uNMFJX7RD8foJcn5KAXfcLlrlqGjPiQBCGFwn4k/IS
	 kR3cR8aKnpolzpQI7p/nLLL74Ew+qerixfYvb1y5lYL90NnkYljfDxQMywmbJ+3OtIrJVLrZIGUX
	 Vi9bv9+Ues7lwrJGo7hcP3u/ZiiJkeiCIhX8FjHE/uaiDwkH0gX+srHZzAZkU2DEIl7R/HeYrpxL
	 9kYQYzp42aZuA7LWsbzsltB8uuB29MG+TaiYTxOfIlQ7bCgCXId8AfB/8DwTRrPN1qJ5FtHyAW/g
	 X0K9d09ki+p2r+tWIepHYUYKLcyEV9H9GSK5R0R3irosxZn/W1IaaEIXR0eMP7g9SDpyHBlFK7j8
	 dUy2uSTWlbtQy9rL8AXZSUorJe/vpA2GsqWeDqMq3wMTbX635oVzxl9uPU/7iYfKGlYlJKEpOvaz
	 kf+ELsQiLE6bP2836HuKB/Ijh+BL/RY7Cf3yw5fgpi9TYV47R9qvltyo44UBFTz+qJE0YqXw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Jiawen Liu <1298662399@qq.com>
Subject: [PATCH] misc: atmel-ssc: handle clock enable failure
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrei Simion <andrei.simion@microchip.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 18 Aug 2026 17:22:40 +0400
X-OQ-MSGID: <178705936098.291840.14459285014555134889@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_062248_710774_9C820CBA 
X-CRM114-Status: UNSURE (   6.72  )
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

Return error from failed clock enable.

ssc_probe ignores clk_prepare_enable return before register writes and
unconditional disable_unprepare. Unchecked prepare/enable may be
unprepared on failure.

Check temporary pclk enable before SSC register access in ssc_probe.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
--- a/drivers/misc/atmel-ssc.c
+++ b/drivers/misc/atmel-ssc.c
@@ -192,6 +192,7 @@
 	struct resource *regs;
 	struct ssc_device *ssc;
 	const struct atmel_ssc_platform_data *plat_dat;
+	int ret;
 
 	ssc = devm_kzalloc(&pdev->dev, sizeof(struct ssc_device), GFP_KERNEL);
 	if (!ssc) {
@@ -225,7 +226,9 @@
 	}
 
 	/* disable all interrupts */
-	clk_prepare_enable(ssc->clk);
+	ret = clk_prepare_enable(ssc->clk);
+	if (ret)
+		return ret;
 	ssc_writel(ssc->regs, IDR, -1);
 	ssc_readl(ssc->regs, SR);
 	clk_disable_unprepare(ssc->clk);


