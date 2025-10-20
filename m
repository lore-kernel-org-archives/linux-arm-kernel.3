Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADCACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cs0Sz4USsSfuwMxi4PfdiqTuZfj+bT5+l8lmaC7NVa0=; b=r0DDczyEYI9oKlJQloyjIh7r/3
	jByR2fpVZFU1CoW60s2LKDF7s5cMiZvrbHO2Df0nBJqhdoUhGYgJw8KYhpsOtPTfzMGsd/n19fKjN
	H8ePPGp5c+8H03OEz1OEugf2P2m2cWUOcb4ely/exaKmrqQRLgHtuURVmICF50JLVDUIyOQtQzdSb
	bkNipdBZAjBzeuxluWTWWbyEyeYMVquxwVzAvJYS7fKsl3h5zu/EvnxxwD0xDqZ/botOX+A1+1Sjo
	HGwoNGQhSCMZYwMUuUmxAtkTsVJW574MNkVMc5e0mxF/To3GrcjIFArpB51DsmxJeU7aft8qcSWzm
	Vw/zpJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp6n-0000000DYU1-2mIy;
	Mon, 20 Oct 2025 12:35:29 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp6f-0000000DYEy-24Bp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Cs0Sz4USsSfuwMxi4PfdiqTuZfj+bT5+l8lmaC7NVa0=;
	b=JVb1W5J73osHVHtj7ZFhwxZPBMxXh3JkPA85TUoQTEpywrzYv1zpboJ2iJyvZK
	pMFjS9G5U6ehjxL9jV4oDoE8tUAbcxZVBXv75ylpPw7K2YDzJIN5tnCk9tp1BDFu
	7OVmWhzNGlVVEe/2dZ95mEzuYQiNtNn+gvv+orwDYbsGY=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDHX6t5LPZobttTAA--.29784S3;
	Mon, 20 Oct 2025 20:35:07 +0800 (CST)
Date: Mon, 20 Oct 2025 20:35:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: freescale: debix-som-a-bmb-08: Enable HDMI
 output
Message-ID: <aPYseXEu6beqgxff@dragon>
References: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
X-CM-TRANSID: Mc8vCgDHX6t5LPZobttTAA--.29784S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUc89NUUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhsBZmj2LHsiEgAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_053521_905732_3D48D43C 
X-CRM114-Status: UNSURE (   8.19  )
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

On Tue, Sep 16, 2025 at 03:47:09PM +0100, Kieran Bingham wrote:
> Enable the HDMI output on the Debix SOM A board, using the HDMI encoder
> present in the i.MX8MP SoC.
> 
> Enable and configure all nodes required for the HDMI port usage.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Applied, thanks!


