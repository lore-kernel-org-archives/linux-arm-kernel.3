Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61619C636C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCxy7nPmXcHGLakXz3lC+/2LUTI/Fcg3Ywa2YZdLljw=; b=C5UZhViXy6fJxrklRySMnVDvM/
	JzTyvmeJMvXM9A2fm5mSAos2C+4hX2orZ+YgpIIi/DUZkZTXPv3apSlpJvkrjE23oOjJJWAr2xq92
	a8sKw3QZo/uf1tSkrjKKJL05955t36V05T6NIeFd0BKxGf4XEdwyWLOQYsL67DEW4Mx7FZHgOc/Uz
	bwrGNnuWqvomkgcE2A0B9BFPZp0UbDEfVOlNdx2pl4hblbgJLrTTemSIxk5yWVZMW76h/lscbTGZq
	v7/klQS4NS3CbClSqiKop4j2QdKqF3tZWBD7312tpuvsO5kli6qLtghItDq7v7oONNGdTCyFMc+fO
	ZJYOCArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI7A-0000000H086-3BQD;
	Sun, 22 Feb 2026 22:39:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI6n-0000000Gztt-3OzY;
	Sun, 22 Feb 2026 22:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LCxy7nPmXcHGLakXz3lC+/2LUTI/Fcg3Ywa2YZdLljw=; b=yE5qHB98H27TW9vtWTEyFM/LNQ
	MZ4AMVdaDCDfRoD+yTGx6wqLscafQ7gj9Ia1bCm+M5Py2YFNQYzMDT8a3VKtoZRi//NgAzr3HZo6Q
	pT0Ipzid/gZp2jOR2txbPyDwy0DrNzx5bdMwrvtUo7EBo7JB0Q3B/2K8FEZQH90+wK9sc5LDYR8kW
	KFjQSu7A9EhihKfxFBdqSNqkwrwYpphUzgTKKgr2D5fDrUv9kHyRKSeZ8n3xsVXfs759kU1lxxIZ5
	DOIHqEFmu11O9Okg4vPhBgTRQwftlO4cgPatPt4nHAlXpgLwCQYCvVo/XvnDaASlffWdTmm6BMlPm
	8VYxxd3w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Christian Hewitt <christianshewitt@gmail.com>,
	Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH] Revert "arm64: dts: rockchip: add SPDIF audio to Beelink A1"
Date: Sun, 22 Feb 2026 23:39:10 +0100
Message-ID: <177179992309.1861430.17263056064282547963.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <0af77a02c2b0806d4ca72066392a5453fcc89a8f.1767111968.git.robin.murphy@arm.com>
References: <0af77a02c2b0806d4ca72066392a5453fcc89a8f.1767111968.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_143925_862908_73C23C46 
X-CRM114-Status: UNSURE (   8.30  )
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


On Mon, 26 Jan 2026 12:32:04 +0000, Robin Murphy wrote:
> This reverts commit bdc4d388c6452498ab62ef2564589f40e0c8c262.
> 
> While Beelink A1 mostly follows the high-end RK3328 reference design,
> it does not in fact have the S/PDIF connector, only HDMI and a 3.5mm
> jack for the analog audio/TV codecs - the tiny form factor literally
> doesn't have room to fit more!
> 
> [...]

Applied, thanks!

[1/1] Revert "arm64: dts: rockchip: add SPDIF audio to Beelink A1"
      commit: 696d0082956cac2df3f27fee75cf2c8d4a2c2cfb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

