Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2500FC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaeVZUhJhsnBFWMdkw+zxAnz4qf4NB+2fch1KyGaEpo=; b=T8M14hgB9oubCYvngDY52fw6Ui
	DWyoefIGFzr1VkSws+PDFoZVbSd0q4ougFShcfMVnAlUCUqCNzGd+qMoqoIfz5HIitYb8qkV9Bf3h
	6yLvSPntjc9kcmFRg0DOU2mcdzlGqQKcQdEKDaXl4OVlc4diEMAANWbQYzrjXnNJeMpmFtAWrVLZZ
	n92xACAy4wpZocx7RsLdONzgUHVQrzPHkXW/v5sFbPe/uZ3N4dx+zHPCx1U2oPUp8WixJ9qIwmehL
	bE2+q1OVInIK1J8yyx8H7DaY9ibK6kynCsLjItj1vuYUNzSZgp6EQKn8ofsbFg6AwQnYq7YHXCHXs
	6BJK1pFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWWp-00000003kx6-01R7;
	Thu, 27 Aug 2026 09:36:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWWn-00000003kwq-0xqH;
	Thu, 27 Aug 2026 09:36:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 53238600E4;
	Thu, 27 Aug 2026 09:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8891F000E9;
	Thu, 27 Aug 2026 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787823368;
	bh=aaeVZUhJhsnBFWMdkw+zxAnz4qf4NB+2fch1KyGaEpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=elEcMd2KDDVwQhq3IrxC0ZuRb9j0i21rsxew5aE/SouSM630XfMX4XAc0DG3fmL8/
	 LmXVCgFuf7hV5sIcHgFQBpqBupnYxopwbe6bt38GN/00a+68IXBLQhLiE7bJKff3JV
	 C3CrderGwCshfuYpx85Y2UBMpMmDMX72d28be9omSp5iapATnmkiMYtnl1/9FKtdkK
	 poY2/l+5JVlFGHbnUBpqGydykoAa+i6749uEv0PLhgZ54SD4uBS7ZheVZcx0W0Q9I0
	 xzQr5uHejR8298W0c17Clst3uRgSUnS+zZPdULp5T5BjEyzbPBPpXPeCIqIdDR2CD5
	 pGPk4ZrgkTElQ==
Date: Thu, 27 Aug 2026 11:36:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: reset: Add mt6589 toprgu reset IDs
Message-ID: <20260827-rousing-emu-of-drama-dee69e@quoll>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
 <20260819101853.44681-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819101853.44681-2-l.scorcia@gmail.com>
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

On Wed, Aug 19, 2026 at 12:16:22PM +0200, Luca Leonardo Scorcia wrote:
> +#define MT6589_TOPRGU_PWRAP_SPI_CTL_RST		11

> +#define MT6589_TOPRGU_SW_RST_NUM		12

Not really a binding, drop

> +
> +#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT6589_WDT_H_ */
> -- 
> 2.43.0
> 

