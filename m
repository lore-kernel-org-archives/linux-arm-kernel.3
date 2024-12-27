Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC567E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 00:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tI8fAVJ1uAPNiv8kdfp5pXx4igSbpdzSBXGFRrOolg0=; b=Dv7n2FnyJMP1UgxljeV2SPbQJ7
	OaSKU0MXm4A/29nsSPlljwJ3XDYt9DLBPK+kJNDTBBO/NAUN83r6XHIGr8U/CxsVOm7HTZoUGDVHA
	/w7tLRviLfZBkvDww0DscawuzE1Eu4ThyVGmn5IwcvTAzsO5xmWMJQfk4hOgWv0we1EPby30meMZ0
	2Rk2Hq6T3xg2v/QnadAY/WtpEjppdqyQ7kS4nKMrU8AQG1UY5Wc9YUX+7jgb77LwSzBkz0vBmpONG
	8Mawe91U+4OP5KFYBYm4Ss6btqtq2MNSxRi6ne7z8nOyI9EITOO3JwAVugM4jqVJoj0whnRnoTyCP
	xmgMoc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQyKE-0000000GkWn-3Bbr;
	Fri, 27 Dec 2024 00:35:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQyJ3-0000000GkMZ-0Z3b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 00:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1F4A5C5BE2;
	Fri, 27 Dec 2024 00:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE37BC4CED1;
	Fri, 27 Dec 2024 00:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735259659;
	bh=b+gm1WSzwJE9pv5g6KUpAQXcbNCHd04L3jmCW0zzBRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmiUHS6TySLMGKePlezMOxMkxAatvmMvvPHB/EjLta1hWsADt4Q4SzpUiJKctCK77
	 R1Wu+SuMXoi++HZgO0r+DXJUCHF6t/GaBGZU4sdYIo72ytCzsAZXYcqUNyROZ9Del9
	 /1/6csmTfZkNZkuBtg3u2/iPhCaeAW+6H/El4qeQuwYR9mxNRZ/mdw9MXNMjlOdZpZ
	 muq/CW5ikFl/2PaUavau9+6l66ea8hUpoJNraIqr96+LcPmy6xcuv+A+XmWOlqhpnP
	 1+CEcJS2mEXuSKQ7zTJMPbY9p7EHTir5YUqkwkvyUcnYvqf3TJSbPjccw+679fT6EE
	 NINe52RhA+l5g==
Date: Fri, 27 Dec 2024 01:34:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] i2c: imx-lpi2c: add target mode support
Message-ID: <vfesmhe47tj5cwib4dl5zxxy7sn5g4swjg7tozcv2otcqgsjpd@sjj35a7c5fhu>
References: <20241125143140.1613282-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125143140.1613282-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_163421_225682_15EB1B68 
X-CRM114-Status: GOOD (  11.65  )
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

Hi Carlos,

...

> +static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
> +{
> +	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
> +
> +	if (lpi2c_imx->target) {
> +		u32 scr = readl(lpi2c_imx->base + LPI2C_SCR);
> +		u32 ssr = readl(lpi2c_imx->base + LPI2C_SSR);
> +		u32 sier_filter = ssr & readl(lpi2c_imx->base + LPI2C_SIER);
> +
> +		/*
> +		 * The target is enabled and an interrupt has been triggered.
> +		 * Enter the target's irq handler.
> +		 */
> +		if ((scr & SCR_SEN) && sier_filter)
> +			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);

you have answered my question here and thanks for that.

I was trying to apply this patch but it didn't apply. Do you mind
resending it?

Thanks,
Andi

