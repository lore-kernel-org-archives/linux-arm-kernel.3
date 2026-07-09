Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A45C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 23:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwdYdybpiL0XEa9EfKFkDvxx2HxR0uRQFmPGoHruEz8=; b=pg2NBBARle1WwAu9BXOTIus6+V
	JMOMJLeeAImps0LwRNiZcBLqF8UJ2oFE0PCeMtJQdmMYEC/ZnlcDKE8QQuprNKHdE/+ht7p5oWOP/
	LZ0rUcpU6BosASMAvj5iGHrhoQ6tDpv8huaAEXmFz/c5Kw2h6rArDehskafVZNkzMt4WSrRVFczrn
	O2cgrC/1o7j15ieo8Oh3lgTksvDVClD0nJj0yqupBImvDRcAGmVieYLmR0bAurgWNiplV1Gn72INm
	VBkBPK5+km+PTVgHxUpfxlcJQvmfQ/VTBmwUikK6RS64yiY/BEeQjbtMeJ7N+ckWMJYGmCBUK3jH/
	pIzWggTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whyZZ-00000003rTP-1iNy;
	Thu, 09 Jul 2026 23:54:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whyZY-00000003rTF-0Hbm;
	Thu, 09 Jul 2026 23:54:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BD0341269;
	Thu,  9 Jul 2026 23:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92631F000E9;
	Thu,  9 Jul 2026 23:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783641267;
	bh=nwdYdybpiL0XEa9EfKFkDvxx2HxR0uRQFmPGoHruEz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M542QeCelKml3h1uJ1XQYp8QugIw2+NHmc5YUtO2rJlhu+SKAIbICvHidvONUVA1K
	 tbsI4a8OlL/atikHfUw6LQ5c3/Ow7MjFrcFYKs3OnJHZIUDPC7m99u49AZk/6TZ7p6
	 wSRZg+HlmkamLa/ImDnEtj0Za9bfiFJBVJBVeqAdkhCnjW7zLZgBFS5kJ5DKcn09AP
	 X8jqdwTP7Iy32zMtQCb2WIpSeumTRekRduA+/0uRNs5o+tLdWcZs1vGuvNVl937+Ot
	 FAktRLc36OCabsEIBtc1xAJwitwWsXh3LorqR4o15dix145vZyFx0q7Ko8GZLheZxt
	 K075RmpfscQcw==
Date: Fri, 10 Jul 2026 00:54:24 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rva333@protonmail.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>,
 Conor Dooley <conor.dooley@microchip.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v5 0/4] AUXADC driver for the MediaTek mt6323 PMIC
Message-ID: <20260710005424.5c559b5a@jic23-huawei>
In-Reply-To: <f2d5801c-1d12-4a61-ac23-aa24dfd0ee5c@collabora.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
	<f2d5801c-1d12-4a61-ac23-aa24dfd0ee5c@collabora.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 9 Jul 2026 13:33:46 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> On 7/9/26 12:52, Roman Vivchar via B4 Relay wrote:
> > This series adds support for the 15-bit AUXADC hardware block found on
> > the MediaTek mt6323 PMIC.
> > 
> > The previous version of the series for all AUXADC, EFUSE and thermal
> > drivers was split after Krzysztof's comment [1].
> > 
> > Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
> > mt6323.
> > 
> > [1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6
> > 
> > Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>  
> 
> Whole series is
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Cheers,
> Angelo

As noted on discussion of previous version. I picked up the IIO side of things already
so I'm assuming nothing else for me to do here.  Shout if not!

Thanks,

Jonathan


