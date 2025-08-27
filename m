Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23485CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duT0L2r7FaIbAZcTRZtdLlCsYnyVOXhLkCrUjVK0CJg=; b=uInfVwjfWNo2AUY8iq6T9gvL6c
	FNpvzdEGuJEy613lDlO23QFgC2yUYu6k1fkVip864oVIxp/AE4X6CAQEV4sB3KChHF7sdTN5nH8Ic
	X9uiLPZGmhaGkaDETZG1x3CBiIvo8m76urNmdi0wDTAYcllDDY+qTAYTWwcPl5K+8DAIZk8gFUlGM
	iTlFhU9sLngvoXOrA0C/JnX/VaX0rrcIbPGzC6dQes6xXfwj5KKt4QhNLvyVo2dex/LvRZOXoENS/
	nd5GSjsc3LZkxaqSnktghwa79+Ngrz0qRAf4mef+A+dAB4boddYZEHphTR58EHLCQQ2bStFJJ53+h
	aedt+yhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urITB-0000000G3Q5-3MJH;
	Wed, 27 Aug 2025 15:53:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFuY-0000000FWoG-0Npk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 13:09:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DF141688;
	Wed, 27 Aug 2025 06:09:47 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 119673F694;
	Wed, 27 Aug 2025 06:09:53 -0700 (PDT)
Date: Wed, 27 Aug 2025 14:09:38 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel
 Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: t527: orangepi-4a: Limit eMMC
 clock to 75 MHz
Message-ID: <20250827140924.1340417f@donnerap.manchester.arm.com>
In-Reply-To: <20250821132935.2070398-1-wens@kernel.org>
References: <20250821132935.2070398-1-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_060958_176607_28D75218 
X-CRM114-Status: GOOD (  21.63  )
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

On Thu, 21 Aug 2025 21:29:35 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi Chen-Yu,

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The eMMC on the Orange Pi 4A doesn't function correctly at full speed
> of 150 MHz under HS200 mode. Either the traces on the board or module
> aren't great, or the SoC's internal delays are incorrect. Tuning the
> pin drive strength did not help.
> 
> After some experimenting, 75 MHz was found to be stable enough. Use this
> as the maximum frequency for now.
> 
> Fixes: de713ccb9934 ("arm64: dts: allwinner: t527: Add OrangePi 4A board")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> index c52d09cf0888..fb5311a46c2e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -160,6 +160,7 @@ &mmc2 {
>  	mmc-ddr-1_8v;
>  	mmc-hs200-1_8v;
>  	non-removable;
> +	max-frequency = <75000000>;

I am not a big fan of this change, as it looks like we are papering over
something. I think the BSP runs it as a higher frequency just fine, can
you check that? Traditionally the BSP uses HS400, IIRC, maybe we should
finally bite the bullet and enable that?

Mikhail has some other assorted changes to beat his WalnutPi into
submission, among others a slight increase of the voltage, both I/O (1.9V)
and supply (3.4V). Also he increased the pins driving capability to 40mA,
did you try that?

On my boards I tried to lower the frequency as well, but didn't get
consistent results, though there was *some* improvement (at least probed
the block device and read the partition table). And I needed to go much
lower (40 MHz), so I wonder if this is all related to some bigger
underlying issue.

Cheers,
Andre

>  	vmmc-supply = <&reg_cldo3>;
>  	vqmmc-supply = <&reg_cldo1>;
>  	status = "okay";


