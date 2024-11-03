Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EB0E67807
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 09:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hd3hoqAxo+sIaJnbd/+l3S6rvstB+d4XTwMycmbNR9U=; b=OZvXHRwZ7agyuqx5QT+levcKh0
	w+CCY27FMAgBuyHnXsBvWpfC/FhBuBdwts4eUIwsrFZqPohwQ18/sm5TNU8PvvAcZtIwjZhwWayzd
	nFdqBL0A4WQ1HcG6nSXuRMmZyIaFeSiMC9WaD5gUJDD6wnAd0SJQK5XedAHA45bvOjau3ifHjcrAI
	xyRxdZS63nqkMpJshH2WC4kwBy7PsEdhRUNtKn5jZF3PeZiCh2wc17+O3mBXBMa2ZQCh++Pa9EEGV
	8OMtMJkeRvO8G6QBMX0URJ7e/AayFe8Fe6WTrvq8Pp9hf37YNKLLb5r2sOqAr0E65LHDEJ6hxOqfj
	+/7436LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7WoW-0000000BDUS-0XkI;
	Sun, 03 Nov 2024 09:22:28 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Wmp-0000000BDLc-3Xp6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 09:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Hd3hoqAxo+sIaJnbd/+l3S6rvstB+d4XTwMycmbNR9U=;
	b=cpgCf1s6Pj+4pHo2nrO4q+eqjlO9emrkG8q+ttAhEjr9Lzp2Pd5B+yH7Je+RG1
	sPoz1GlDpCzUO2bPhpCaBNyPvCh88VCTCOAZejWAfldLoSKwXyIUU+xFxwWgLw/T
	Te1lHSyGtprDDXjncDec2YMFx/L+l0oBc3i/W1KYdIx2M=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXX7ZWQCdnm9KRAQ--.15895S3;
	Sun, 03 Nov 2024 17:20:24 +0800 (CST)
Date: Sun, 3 Nov 2024 17:20:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: alice.guo@oss.nxp.com
Cc: alexander.stein@ew.tq-group.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v4] soc: imx: Add SoC device register for i.MX9
Message-ID: <ZydAVhFvHWCk6oNH@dragon>
References: <20241031065438.3912960-1-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031065438.3912960-1-alice.guo@oss.nxp.com>
X-CM-TRANSID: Mc8vCgCXX7ZWQCdnm9KRAQ--.15895S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxhFxUUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQyMZWcmsdbyxgAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_012044_221121_610D5257 
X-CRM114-Status: UNSURE (   7.32  )
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

On Thu, Oct 31, 2024 at 02:54:38PM +0800, alice.guo@oss.nxp.com wrote:
> From: "alice.guo" <alice.guo@nxp.com>
> 
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
> 
> Signed-off-by: alice.guo <alice.guo@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Applied, thanks!


