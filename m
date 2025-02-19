Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC0FC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40NCiaKEOu7DJNX9zchvj4jQWid80X1JbhK4hzOlNPc=; b=dupVTXZse5/DEWp8Uyu5Q7aBIP
	bwlMKOrUIISWCciJQVUcTaqOg0UYSiDBwfEtEmgGn+ammNby8mW9QaGXEYi/I1NyvYpJSxJnFryGR
	V6y8VePRJr2haG4nxVfk+BpAK8K0f90QPEyvvftppN8j4so6MoNKJzu0b7kFQHBaNVJeHwp2/XgoP
	9xDtK0OO3EgZ6OXLj+HoYGTlT5Ngg7hymXafJTWrdHiAzMIfVTe/j+UKawm/kt2UteZCC7OmBIPYa
	D/xN4Z7rP3dnIQfI05skOT/yhVNL/x9bRvMNP6N28Ay+RqtO52+fZoZ8bFze+fIlvjZbtmvaiG4c2
	ZIheTLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkLH-0000000D1Uz-3hjd;
	Wed, 19 Feb 2025 13:42:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkJn-0000000D18t-2Ays;
	Wed, 19 Feb 2025 13:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739972450;
	bh=q8VAsnW/0ra4NwqP0nteF98m2Puu+tEfH8h+6E5FYtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CZD+BjSFARhosTN4Cz8MuhSpkYh6oZ90S89HvHqutF0aBde7dPYDykfCOrpOj9ihe
	 Red0CwOmQ80E+S5lPsRSo60cEId8Q3yOUaqVf/7EI7hAfMBzNA+fGIbQazw0N3nyEk
	 6s0hNHvozsAdEnLI57habzG4730BFxgvTUM0MOxEVSNWm020w0wkFQPOT/EDobNXbM
	 np8x7ms0FdX7BvzpdkuA3KI0hjAnnw37A6ha8NnLSJy15YC+L/RZBuLpvg5XTgIPzN
	 eV+YUHLJx3rTRsaWOQVsMMMMHE1djKhz8dG8ZJvJNfkCu1R3iBZAX68jVtmDAIkGe+
	 zNb9MKkGZNbMA==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2EBB417E14D5;
	Wed, 19 Feb 2025 14:40:45 +0100 (CET)
Date: Wed, 19 Feb 2025 10:40:43 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	parkeryang <Parker.Yang@mediatek.com>
Subject: Re: [PATCH 4/6] ASoC: mediatek: mt8188: Support DMIC in AFE
Message-ID: <51ac7a72-9113-46c6-98d8-2924a9572966@notapiano>
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
 <20250218-genio700-dmic-v1-4-6bc653da60f7@collabora.com>
 <6cd2be03-a3e8-4bdc-b91e-51b3e1029782@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cd2be03-a3e8-4bdc-b91e-51b3e1029782@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_054051_704600_1FDAFA70 
X-CRM114-Status: GOOD (  18.58  )
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

On Wed, Feb 19, 2025 at 12:29:13PM +0100, AngeloGioacchino Del Regno wrote:
> Il 18/02/25 21:52, Nícolas F. R. A. Prado ha scritto:
> > From: parkeryang <Parker.Yang@mediatek.com>
> > 
> > Add the AFE routes that connect the DMIC (I004-I011) to the UL9 frontend
> > (O002-O009) and register the mt8188-dmic DAI driver during probe.
> > 
> > Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >   sound/soc/mediatek/mt8188/Makefile            |  1 +
> >   sound/soc/mediatek/mt8188/mt8188-afe-common.h |  1 +
> >   sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 24 ++++++++++++++++++++++++
> >   3 files changed, 26 insertions(+)
> > 
> > diff --git a/sound/soc/mediatek/mt8188/Makefile b/sound/soc/mediatek/mt8188/Makefile
> > index 1178bce45c50ba252672a32b3877732a5a76c610..b9f3e4ad7b07ba9e21c846706371c53269f894db 100644
> > --- a/sound/soc/mediatek/mt8188/Makefile
> > +++ b/sound/soc/mediatek/mt8188/Makefile
> > @@ -6,6 +6,7 @@ snd-soc-mt8188-afe-y := \
> >   	mt8188-afe-pcm.o \
> >   	mt8188-audsys-clk.o \
> >   	mt8188-dai-adda.o \
> > +	mt8188-dai-dmic.o \
> >   	mt8188-dai-etdm.o \
> >   	mt8188-dai-pcm.o
> 
> The Makefile addition doesn't belong to this commit. Please fix.

I was divided between adding it here or in the previous commit that adds the
dmic driver. Only in this commit is the mt8188_dai_dmic_register() added, so
this is the first commit in which any of the code from the dmic driver is
actually used, hence why I added it here. But adding the makefile entry together
with the driver code, even if it's not used, makes sense too, so I'll move it
there.

Thanks,
Nícolas

