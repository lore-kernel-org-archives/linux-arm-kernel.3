Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB73C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UYMWLzFZgQHSVYk4FL4YUyO+pfgGdExXCbPW+ik3y+4=; b=bdl0MPGmCMZRnKzAaf8yg3e0Vy
	OUQu4X68I5InJCmhg75V9MuBtS2jVhTLK29kfHjqAU56FaWMQI3F/meLOez+YP+F+NJw8hDMRjmaw
	YuXIYzAXlIekXsiSb6DcXg+I2it9Xl57yZ5hVCUfqhiBSQwLchDNOWqCk0mL4BY66uebsDZ8iO0VK
	2McN29hcEkG5tqaiC9t4wCXpJtCVImwKfmFB8dM/D045dHVMJmx59n6rhD6c0xlZLqpdvPEHxW5nS
	fl2A9OwxfPP5rKRa/FAwyJwwNJLZJuxt3FJ8RxrD7z7x7gcQ7oM1bvvfeGkYQpETESgyA5ypfFiL0
	A0LHQA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ldf-00000006pDX-1maQ;
	Tue, 15 Apr 2025 19:08:07 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lSY-00000006nJH-0nhC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744743381; x=1745348181; i=wahrenst@gmx.net;
	bh=UYMWLzFZgQHSVYk4FL4YUyO+pfgGdExXCbPW+ik3y+4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EyqweYdvnmxrRmHLibc86QyBjdp029oUW78vZhD/MzZe2bzw3CriN+nmjMqoaKHG
	 rz3yQznj7qE8Sszz7xtPUZ87pxt83Wtpgup9m05kDPT8/DXVi6a9U5jU4TDFZyWdP
	 XMu6JmebElAJPaHmJlzWEBs+7bBly10+kp9/9vU9ZxI5YDZDEiERDwYrLsxZOVYiP
	 dRc0tDDc3eqfzKVxeg0X2C4i+dGxPbZhBPb2KlSrf6pt5VRQs6YSTS3X4zTJOnTMf
	 Q77/euqtONiuN/WDeFtS5/ZViFuZdYUZr5ed6ASKTyhenhhZLzqGHjuzb809RYC6X
	 IwKQ5YqzaOMBYL3EAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XPn-1t0xKG2usD-00tJjh; Tue, 15
 Apr 2025 20:56:21 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] clk: bcm: rpi: Drop module alias
Date: Tue, 15 Apr 2025 20:56:14 +0200
Message-Id: <20250415185614.16292-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9XpCaveuznyPGNgtnucqnGlX95StybJoBKOBjgoWG0DGePBQKYd
 lAwmzfKUVVRd3ZQ0v7Nk/09Jp/xLLGUYs5F/wra26xttk3E713PynzCFwDoEq2kxre9oS8r
 wzit504Id8vwcD9qbnyujPDGtxM27oCTXia7s1QCOFy8fm1qI1UAzajIQJrCorm6xpvfTqb
 x1MElVx8u0fx6QJ7w/aZQ==
UI-OutboundReport: notjunk:1;M01:P0:heA76azIid8=;G9ygqNvqNP3GPV5EPaWH8KsBIZ8
 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
 W96Ur1Vmlw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_115638_530241_A3019CED 
X-CRM114-Status: UNSURE (   7.97  )
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

Since commit fbac2e7787ac ("clk: bcm: rpi: Allow the driver to
be probed by DT") the module alias isn't necessary anymore. So
we can drop it.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/clk/bcm/clk-raspberrypi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspb=
errypi.c
index 0e1fe3759530..9bc11bafa41a 100644
=2D-- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -480,4 +480,3 @@ module_platform_driver(raspberrypi_clk_driver);
 MODULE_AUTHOR("Nicolas Saenz Julienne <nsaenzjulienne@suse.de>");
 MODULE_DESCRIPTION("Raspberry Pi firmware clock driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:raspberrypi-clk");
=2D-=20
2.34.1


