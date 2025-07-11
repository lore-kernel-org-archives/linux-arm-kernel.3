Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C17BC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DNNk/IFBr7dWHafFiTpxKVod8W0wZpsk+DYFpT8gb8=; b=E3khlWtOLFHUOvQ5DLwMS05b1y
	2QCTpvPJ74jsXFVyysTjbt39tDqhg5zqW7GuvdegFudzWnZcsZBBZW0/roog0fl92DGy8JCjdc+o4
	AYTdbIS/iXzkBAdPikB4LGH991Jzah9xPWgWedboxa0mWXEneCidSzEeCgN5Hmf0LVviHvXiDR6vn
	x15/FMY4dgHkmkLsN2jss7ld8Ac2fvyi38FI+oav98eZwMmnNP0C3yj971jRzM5IyuvPDoipJlimA
	9VxpWRzxL0X7XsHea+TvruBac1TjNt1euutrPEec0sb3KtBsXeo0aKgFwLOkooO1A1T8Ozd+hjibP
	VTRGARZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9ne-0000000EGrM-3Mox;
	Fri, 11 Jul 2025 09:12:10 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua91l-0000000E780-1Znz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5DNNk/IFBr7dWHafFiTpxKVod8W0wZpsk+DYFpT8gb8=;
	b=CJGcPeIRE536pGuDchS6MFgy7xfKfvIHrm9oeN67Xg7F46TetVArLXzWE2RXjC
	JyQ5FoXFDyQ8yG7aGTOwSZyvJ2C58D5ZBZh94bBfGV03NlYkRVN7QNrxIkGB9jzr
	qQF1+kQMuHItotKguJqj9rq87mCfEk5gHdN7PpRjF+EP8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXx8OuyXBoQ7lTAA--.14846S3;
	Fri, 11 Jul 2025 16:22:08 +0800 (CST)
Date: Fri, 11 Jul 2025 16:22:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 1/2] ARM: dts: imx6ul-kontron-sl-common: Add SPI NOR
 partitions
Message-ID: <aHDJrr-zjPxXvMu8@dragon>
References: <20250709071557.20602-1-frieder@fris.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709071557.20602-1-frieder@fris.de>
X-CM-TRANSID: Mc8vCgCXx8OuyXBoQ7lTAA--.14846S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUoYLvDUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBmHZWhwjvrFiAAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_012241_725444_9538BAF9 
X-CRM114-Status: UNSURE (   8.70  )
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

On Wed, Jul 09, 2025 at 09:15:54AM +0200, Frieder Schrempf wrote:
> From: Eberhard Stoll <eberhard.stoll@kontron.de>
> 
> Describe the partitions for the bootloader and the environment
> on the SPI NOR. While at it also fix the order of the properties
> in the flash node itself.
> 
> Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied both, thanks!


