Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB73E6F09A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 03:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8eD/9xKOfuW1a5aPO+P+oTlB82ZVFjGxpbnAcOwcBM=; b=pMLRMXOQBVdfWw+RaBtenpbJf0
	aM7P3j3BTkWymDQ8dkAZZHOKravib3QKYW2xcmzUpc2DS821aUe3iMh06lqaUeEJLgmz0zDfPgtr0
	XQTVbtL3ufyvXupJxSCJTJoX7IadA766BKcab9lfPHlefkulcz5hWopMQu9vDhQVJXtYZr0Sc+HyV
	5+xduMuNgMxb71GVbmjUrYUxiuSl3//+jV1XyiGwVV+gpgJoUab7Lvrxp5D9osLFIwi5b3U0WYTJ6
	3OBLXc6p9Mo7DrEs+JAGkcL3OobrTek1jZDcO9jgleYADHo+NesivZtSueAiE5F4otOR/w94msS4U
	ZuIooQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t74UD-00000008vKL-0GHh;
	Sat, 02 Nov 2024 03:07:37 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t74SR-00000008vBW-0izx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 03:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=p8eD/9xKOfuW1a5aPO+P+oTlB82ZVFjGxpbnAcOwcBM=;
	b=Bg8QAQuulN5NSlNJTqdEjQzv8SKn88C1nZQLOFMQBu/oE238yGdnjssZJraoIR
	IgogDHuOJH0H3s41FKACyXiJ7AiZRa6JByrSKq3cbzIdLSJsbVBFzAELVNEP4CuX
	Rb97m8219Hzl3lsanR20qFgw9YZ70vnQmqVO/PZT5grDA=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXfyz7liVnl_l6AQ--.14941S3;
	Sat, 02 Nov 2024 11:05:33 +0800 (CST)
Date: Sat, 2 Nov 2024 11:05:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	shengjiu.wang@nxp.com, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: imx6sll: Fix the last SPDIF clock name
Message-ID: <ZyWW+3NsvR3poTTY@dragon>
References: <20241024181409.1461997-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024181409.1461997-1-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgDXfyz7liVnl_l6AQ--.14941S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEg6LZWclifsbEgAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_200547_550810_22C0A121 
X-CRM114-Status: UNSURE (   9.26  )
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

On Thu, Oct 24, 2024 at 03:14:09PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The last SPDIF clock is IMX6SLL_CLK_SPBA, so change the last
> clock-name entry to 'spba' as expected by fsl,spdif.yaml.
> 
> This fixes the following dt-schema warning:
> 
> spdif@2004000: clock-names:9: 'spba' was expected
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


