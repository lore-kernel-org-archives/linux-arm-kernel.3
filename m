Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3C9E677EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 06:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvmNlpMTSaGbNzPaTN+BMBPIP2pkxKmlsbNMka7+MqM=; b=ROKxVxaucUVqPpaExYfBxI2oli
	qxl4MfR4aeZjHcS9jP0LCgbgMijiIyWvfUk3wYi5c78E8xfxPnzvhJNie+bKyKOM01VTbow6ri1ji
	Y1TeiRnHu9qPzaGxSLYtNPJ/ZgjbX1ks8pXWihyfyRifrquuVU7KnZW1epwloZ11yfrBCmdPGTwAn
	bm6YLa/xDxfivSx/mASY0K9D95Wzk9Kts87j3piGLlEH4kN5WoScmqlKe2H7o0goSTHAB+USGDhqQ
	9Wryd3coryyasYYU0fmX4LUrR9yEiheLiESevApuRpKxif0fs+oFSsvG1sn+NpUnqFIlvAShgA+Ru
	asO1HN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t77zV-00000009B4s-1OqG;
	Sat, 02 Nov 2024 06:52:09 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t77xn-00000009AsG-3ABc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 06:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vvmNlpMTSaGbNzPaTN+BMBPIP2pkxKmlsbNMka7+MqM=;
	b=bXg6nIqeWrA0J7CAwyYKPYT+bmO+9lZe0hSd5v63NxeMawf1h6dYI8451rB10p
	OaR4I82z5pJFlYW5r/k8IIcyj2n8PsjdsmWBi7rnTEKRvkv7R9t2w/2unR/JW5EZ
	V7tl0db3Sn+s9dmICkOkSjYEg4qCksyWYpJhUY+au7gGQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnrySkyyVnoHd+AQ--.15062S3;
	Sat, 02 Nov 2024 14:50:14 +0800 (CST)
Date: Sat, 2 Nov 2024 14:50:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	shawnguo@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com
Subject: Re: [PATCH] arm64: dts: imx8mp-navqp: Add HDMI support
Message-ID: <ZyXLpDoyNtzm2RRy@dragon>
References: <20241027225408.195475-1-gilles.talis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027225408.195475-1-gilles.talis@gmail.com>
X-CM-TRANSID: Ms8vCgCnrySkyyVnoHd+AQ--.15062S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx18BUUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgCLZWclifuLwgAAsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_235024_483661_84B103F3 
X-CRM114-Status: UNSURE (   6.74  )
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

On Sun, Oct 27, 2024 at 06:54:08PM -0400, Gilles Talis wrote:
> The HDMI connector on the board is a micro-HDMI (type "d")
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied, thanks!


