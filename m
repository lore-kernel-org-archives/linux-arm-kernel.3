Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D29CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 03:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lfbb59Z653T2kjJpk8QzXlXjSD55hbRo8AmzH45kE8=; b=zoXnPAtH1uw5Pu0kq1u0YmCn/y
	VLBI1ym09LdhCUlceMfnTsK6+Ggj+XBr+g3K2/iSkfYu1NqHIJOjl/vNhnHlY7tGUi0/L/2brK5gs
	Yyawr1Y1HzIe3OdU1zb7PynW8EFmc6uZl+C+2z0Y6al9aSeiM0RmjkFdZWcexr9t5uNpN1Yy4uMwu
	VGECvg8WPca0BlWoflOLSM3Sb1d47pRmmDW99Zd/r5AK2HhCeTAxRVYhZPh9fuUo92o5WskF16KyQ
	JHdyYPlPgMf4dncZDzT4YyYQntJ2M2Nwa7TWFd3i/KjNr0Wg58juOHkRR51xg5SR5kVO6kcM3FS1o
	QKTVNHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwY4O-00000000cGj-0vHK;
	Thu, 11 Sep 2025 03:34:00 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwY4L-00000000cEt-1wt6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 03:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9lfbb59Z653T2kjJpk8QzXlXjSD55hbRo8AmzH45kE8=;
	b=BgHRdRcgS4ePFTe3iK+gqw0Bx/wuh6tIqL+9EY5lyDoskjqNv3S9ifbHaXqkJX
	ETu66++yDjNGbkm5UmOqL9YfRuo7V0DnnwdIKzrufBEN/YRWnaA6J/S09HOSpe7S
	ARMo73gN7biOrc+xBtZfiVZGcVSs/ZU3W19jzz9trzhfY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXhtsaQ8JoCKRgBA--.51790S3;
	Thu, 11 Sep 2025 11:33:48 +0800 (CST)
Date: Thu, 11 Sep 2025 11:33:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: freescale: imx93-phycore-som: Remove
 "fsl,magic-packet"
Message-ID: <aMJDGigkz986YC0M@dragon>
References: <20250908111705.2956825-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908111705.2956825-1-primoz.fiser@norik.com>
X-CM-TRANSID: Ms8vCgAXhtsaQ8JoCKRgBA--.51790S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzSoGUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhyiCGjCQxzcSQAA30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_203357_841260_5F0F6B02 
X-CRM114-Status: UNSURE (   8.57  )
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

On Mon, Sep 08, 2025 at 01:17:05PM +0200, Primoz Fiser wrote:
> FEC WoL (Wake-on-Lan) functionality depends on using Ethernet PHY in IRQ
> mode. However, on phyCORE-i.MX93 SoM, polling mode is used instead for
> the FEC Ethernet PHY. Consequently, WoL is non-functional. Thus disable
> it by removing "fsl,magic-packet" property. This allows us to save some
> power during device suspend as PHY is not kept awake.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied, thanks!


