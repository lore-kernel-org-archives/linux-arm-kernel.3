Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414ABC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkZoduVqumtiEfQnQGzIJk1vG8qGeS4iGJFAehTc+vM=; b=sVjJFZ3Cp/UUAg+GcMsZjsdcWB
	cfAcdgY/L0ScqAzos3Q3i2MuGF541wTt+k9RLuRBBl/Vg7x6TXD0xLfmJ/bdn3ZZ6panQD4JlOjJU
	gPPTtVab0/KlSN0XrZysSRlw6KTvkF4IU51bP2wqXm8WBv90k0yUUExQMEHAPDgu3y6yH48l/L+7K
	hCuZAJcaLVFLhZuRVv1/xVVmQmyTUr9XT+KsEpHhKIRM5W80wYpfHFwatT8/QTYMqHsG/l3Daxm0/
	W2mTFRKm3qGqoAvkTYmS0KUtRAtf68AN/4GZt5veEiow+sz37CxdwsJ5LESmsTqKLC9sRUEo3wh/g
	WUgC2VJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9XQ-0000000EDyt-2W9z;
	Fri, 11 Jul 2025 08:55:24 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8kU-0000000E4X8-2mSs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GkZoduVqumtiEfQnQGzIJk1vG8qGeS4iGJFAehTc+vM=;
	b=bxxLkygmhvHTXs+MXsZXUX1n4jDPnz24VHGmwURFEn7WNma7xzcYqGLCvFzH1i
	K5Ci5gqr5HLCWaoAb20LyNlqAo9x/6r+JhZc9zYRyisvYYhLMfbUqLZsHfNZTXdx
	hnNIBZ58CxDEdmDEiyQfnmhcK418bsc3xYLVXA9PeYApU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3_ySIxXBoVFpTAA--.58278S3;
	Fri, 11 Jul 2025 16:04:26 +0800 (CST)
Date: Fri, 11 Jul 2025 16:04:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: imx8mm-venice-gw700x: Increase HS400
 USDHC clock speed
Message-ID: <aHDFiN8dn8zVnmZl@dragon>
References: <20250707201702.2930066-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707201702.2930066-1-tharvey@gateworks.com>
X-CM-TRANSID: Ms8vCgD3_ySIxXBoVFpTAA--.58278S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5g4SUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRGHZWhwiwXKEAAAs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_010451_052835_975D652D 
X-CRM114-Status: UNSURE (   8.65  )
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

On Mon, Jul 07, 2025 at 01:16:56PM -0700, Tim Harvey wrote:
> The IMX8M reference manuals indicate in the USDHC Clock generator section
> that the clock rate for DDR is 1/2 the input clock therefore HS400 rates
> clocked at 200Mhz require a 400Mhz SDHC clock.
> 
> This showed about a 1.5x improvement in read performance for the eMMC's
> used on the various imx8m{m,n,p}-venice boards.
> 
> Fixes: 6f30b27c5ef5 ("arm64: dts: imx8mm: Add Gateworks i.MX 8M Mini Development Kits")
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied all, thanks!


