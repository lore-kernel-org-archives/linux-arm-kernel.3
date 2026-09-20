Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53C9C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 03:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7vrX1llvn0cZ3Jj37kQmXbVjGghG5YtAIquoU3Ts60=; b=y+DGGhffZX3+Dl6pLdwo+JAmr9
	Ve9Vf4TNcDSxWMuMaRr0Wj14HCT+p47ur1E/pSvn9MEDbaD+vHXG7VfB/E7+yLEEWYEAZexIQa8Ku
	LNF8277Srlyypg20AQoNJ34D+deyB0zMksj1FZlwqkF51zJCGOJyh/dryeu4AcicErppxSh4xrrdI
	ViALCPgrlj40QMUj3Tqk8urmZptNjPmdE+M0zXiGtH7larFVZgzmMthag+LHmOrrvYAX3gVh2uJ2e
	YbnFhzNIEYoSPSI0wV6Yv6D3znmvSpm/h4ka2+rX+/OCo/3f/sN6jNqujk+HJzkDLbUG5Vx/BjyGB
	rUDVSTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x87wC-0000000Gmgb-2FQ0;
	Sun, 20 Sep 2026 03:09:56 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x87w9-0000000Gmfu-1o2x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 03:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Q7
	vrX1llvn0cZ3Jj37kQmXbVjGghG5YtAIquoU3Ts60=; b=RE7X0uw/It9kkLk400
	3/dBt28WNWsODQyqn6DbIqZJvF4QXzklteTNY7yGCXj3iuSUxXNztzQd4sbwZr+Z
	MBbyd74LZ8xXbB72UnRjNjBXb3BtW5jQzLO7ybhh/a0wwbv+cRXVUVEY6QHzhm/h
	Nk8Y2Pf4G/tcHkgxYWKihqD94=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3l9tlTq9qet5TBw--.12349S2;
	Sun, 20 Sep 2026 11:09:25 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: claudiu.beznea@tuxon.dev
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hppiscas@163.com
Subject: Re: [PATCH v2] ARM: configs: sama5: enable current Microchip KSZ DSA symbols
Date: Sun, 20 Sep 2026 11:09:23 +0800
Message-ID: <20260920030923.97971-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <c55123de-f466-41c8-b50e-df28ecf3bc18@tuxon.dev>
References: <c55123de-f466-41c8-b50e-df28ecf3bc18@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3l9tlTq9qet5TBw--.12349S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4iJPE3UUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QUz+2qvTmX7OgAA3P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_200953_822708_39135231 
X-CRM114-Status: UNSURE (   5.75  )
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

Hi Claudiu,

I checked both changes. The first removed the KSZ9477 family option in
favour of the common option, and the second renamed the SPI provider.
Please include both tags with the patch:

Fixes: 07bca160469b ("net: dsa: microchip: common menuconfig for ksz series switch")
Fixes: 4658f2fe8fbc ("net: dsa: microchip: common ksz_spi_probe for ksz switches")

Thanks for the review.

Pengpeng


