Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F442C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3SRU/TDBo/tfOH6JoaPn06v8I/Q1ljpHPKh21D3Jgw=; b=k7kFwc3bI7Hc/CKL+6X/s17x5x
	ocb8UdG4UYIFnN+5TZO+rqKiKJsghlvSKwBC02XPqTpiS7f0dZYXMz6fyxIXboVRYgoo4xoppQatB
	cZqEshM64YRbQAFaRlBVMA+XFLdnOVsZ2fcH96jeuqhZWN1H8+YF9StEAym/0SxWNGg/r2m166q0p
	WF55k7dDQWlxI/YoN0wxf8tJrO2nbw20EvYX9TsSXOuXfWY087s8JWmdRN845tp3yuIrdMXtisZI0
	P61l8CNh2BeIWTX+/BZuDpV/Srk8ytjbImgYSoexPGnlbh3AsZeASMiVoNEOj2UOqFg5hvlShno8K
	vKPBODOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm79f-0000000Aeqo-0Zls;
	Sun, 23 Feb 2025 08:16:03 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm78B-0000000AegI-0Fht
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 08:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=n3SRU/TDBo/tfOH6JoaPn06v8I/Q1ljpHPKh21D3Jgw=;
	b=RCtDqBhCNuIrI9hy8GZFB1a0sHFGaDzajlFD8ozBMopzGI7CR/9wG3aUu/LHLd
	0ouIQ679RbCOxLaOnRVbggWzKKP6jwSmP9r6nVDCLqs2bbJEinA5pqJ356RjVYtU
	SfvLyTPKzL+nPQ6NszY8LSkEnekdnKoWPjHBUGiKxN3zo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgB339XU2Lpn4weMCQ--.22264S3;
	Sun, 23 Feb 2025 16:14:14 +0800 (CST)
Date: Sun, 23 Feb 2025 16:14:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale:
 imx8mm/imx8mp-verdin-dahlia: add Microphone Jack to sound card
Message-ID: <Z7rY1DCwS3RjjS9s@dragon>
References: <20250217145744.179213-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217145744.179213-1-eichest@gmail.com>
X-CM-TRANSID: M88vCgB339XU2Lpn4weMCQ--.22264S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyrKF13GFWfWw4xtFWDArb_yoWxKFb_Wa
	n7CF1kJr1ktFsrG345Gr45Ja1I9ay8AryrWryDWFZ2v348Ja4rZ3s8KFn5WF1Uta929F47
	Zw15XFsI9rWa9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0kR67UUUUU==
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhD8ZWe6kuHc6AABsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_001431_480308_9A2511F2 
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

On Mon, Feb 17, 2025 at 03:56:39PM +0100, Stefan Eichenberger wrote:
> This patch series adds a Microphone Jack to the simple-audio-card of the
> Verdin iMX8MM and iMX8MP Dahlia carrier board device trees to separate
> the microphone and headphone functions.
> 
> This resolves the following boot-time kernel log message, which
> indicated a conflict when the microphone and headphone functions were
> not separated:
>   debugfs: File 'Headphone Jack' in directory 'dapm' already present!
> 
> Stefan Eichenberger (2):
>   arm64: dts: freescale: imx8mp-verdin-dahlia: add Microphone Jack to
>     sound card
>   arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to
>     sound card

Applied both, thanks!


