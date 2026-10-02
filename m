Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6357BCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sspt/fP36As20fuJhsLuvVeSjvOsGDiZOOk9QMjN5X0=; b=hZbmfaadZRYQ6tun5GkHQdVHs3
	2CADKuuKbKpVGQArhMCcVpPhDnk5YNIrsqS0+x2AYFIU9GN8NLqUBcyEQiP3NW0NSQ5TOOSWtBgjN
	izA6Sdcoh/uKJMglDK7H8ykYPKt8cuevbV2VTbuQrjy2EEkEY0pMGGWAOfK23DWfhBvXDqFX10VOV
	1/Ah5R4vGbQPpFcAmaXtIBU3Vuy3wBB6ZCYHlVzPx3nUn2WOLC8rdp+Dh1bqQauyq1DR8yl7x3yYh
	WVAOCWsjFiAW7a+1vVuZ843wnUepRNth/lwsseKLh5+33X/ayZb/hZzPvEOLwCJNuZcYZxbu38g9C
	Gcu9+KkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZVc-0000000B8Z8-1vPh;
	Fri, 02 Oct 2026 09:24:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZVa-0000000B8YT-3PO5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:24:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2AB660A6B;
	Fri,  2 Oct 2026 09:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8031F000FF;
	Fri,  2 Oct 2026 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933089;
	bh=sspt/fP36As20fuJhsLuvVeSjvOsGDiZOOk9QMjN5X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aNfhITaAIwoEb/OvK7YZRvIkH9xuAFFJIclIEqqhZFSV2hbE1zgQwLKtipq7wMsxk
	 /CkMlNQnjRQABpWC0V7KfNQhr5YF0VoCdJwOu2LGB4Rci3FPIguQmK8nTh4iHjRYH/
	 26XF9zeL6lnSHCMrWrXPRCDBRMncOlSsvks2tJsvgZh4yzY13lW1xNDBiHXRi41Yn/
	 QzhiDbAVSe9PIA6W2vMCE0HofiLT/BcSyz1BR07YTehZHUClGcdZIvBUnRe15QgiP4
	 MXHdSyUH2skZek5PbAU3D8eYOqbS/b/bhai5LJxc4Py60KdaAzhsg0O7+1dNXAlVr5
	 LQp9o4YXPtAyQ==
Date: Fri, 2 Oct 2026 11:24:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ASoC: stm32: add mdf dai support
Message-ID: <20261002-gleeful-lurking-swift-5926ab@quoll>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
 <20261001145702.2628429-4-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001145702.2628429-4-olivier.moysan@foss.st.com>
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

On Thu, Oct 01, 2026 at 04:56:47PM +0200, Olivier Moysan wrote:
> +static struct platform_driver stm32_amdf_driver = {
> +	.driver = {
> +		   .name = STM32_AMDF_DRV_NAME,
> +		   .of_match_table = stm32_amdf_of_match,
> +		   },
> +	.probe = stm32_amdf_probe,
> +	.remove = stm32_amdf_remove,
> +};
> +
> +module_platform_driver(stm32_amdf_driver);
> +
> +MODULE_DESCRIPTION("stm32 MDF DAI driver");
> +MODULE_AUTHOR("Olivier Moysan <olivier.moysan@foss.st.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" STM32_AMDF_DRV_NAME);

Why do you need this? You have OF table, no? Does it mean that OF table
is redundant and should be dropped?

Best regards,
Krzysztof


