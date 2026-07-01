Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E48C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oouf/dK+KVCQpIL5LxKtT/u/Z+E2ntQeaZfCAiSQ8EI=; b=l6Es6QDb0mxPQcMqWxjADtDlNr
	i0+qSPOPpUc1pIhwCqW9bGCR1cfNaeQcctEfi2D/IBsi2JPxCJsT/DRwH1sRLGI2/wFVDBD3rm/un
	ZwnPLNZzkbWyrv5QqDm8aayiUyUE+PTHvSVTZ29gxNQX+/Cb0z+vSStF81ImUY1WO1TVuV98hXDco
	lQeyR6eDu1+PKY/D0WNXvVEEPhJjSE2hkPSKGUvhIbeXJ553uZfoHqTw7gsohe99N+FFHx8nV2UTq
	b8u5c0vfG865J+a5x1MzKj39OpOcaOayWg4fHQK4Q6OhnGd382STKohJVqIkIh5yM0Zua/OwyP3KD
	7UwLNqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezgq-00000002pRj-094Z;
	Wed, 01 Jul 2026 18:29:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezgo-00000002pRO-08mI;
	Wed, 01 Jul 2026 18:29:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0850B60138;
	Wed,  1 Jul 2026 18:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5FC1F00A3A;
	Wed,  1 Jul 2026 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782930576;
	bh=oouf/dK+KVCQpIL5LxKtT/u/Z+E2ntQeaZfCAiSQ8EI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VYkvCZduhCdySp7hXHzjgXIR7cuZyFtTKEveIl7wuCR8Uisy6nUQ0D+18L8KPP+Bm
	 zXy9qWlA79l62K19CEV7oach/0mgqjWFY5fsiZvmgWYdgbgXOpp70LjBpYVgrVwLWM
	 xoFCuzGmJrzEZrLYaA7W1wDnuKGHjOhhNEQsCm2p13YJxXEfjAX6YX0WmJrMJCRcrD
	 oibjmbB9SkkXkicl9IysYY72s5H06OzlgTjHIN5cNXjm1rYcWw3LlsaGBlNWV80DTi
	 sryYFJjyD/9wGMdnMIu4I1PwQJpjvPi+mYiU4TZeESzGnV2G19Stgtdz/mpADJuvmh
	 qYd75WqKxmwHA==
Date: Wed, 1 Jul 2026 19:29:31 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: rva333@protonmail.com, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>,
 Conor Dooley <conor.dooley@microchip.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4 0/4] AUXADC driver for the MediaTek mt6323 PMIC
Message-ID: <20260701192931.1be293bd@jic23-huawei>
In-Reply-To: <3f914030-44e8-4f63-ae72-7fde7d843325@baylibre.com>
References: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
	<3f914030-44e8-4f63-ae72-7fde7d843325@baylibre.com>
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

On Sun, 28 Jun 2026 12:34:20 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 6/23/26 3:16 AM, Roman Vivchar via B4 Relay wrote:
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
> > ---  
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> 

Applied patch 1 - with some hand editing due to another change
to that binding, and patch 2 to the testing branch of iio.git
which I'll push out as togreg once the bots have given it a clean
bill of health.

I'm assuming 3 will go via mfd and 4 via the soc tree.

Thanks,

Jonathan

