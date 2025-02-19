Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD85C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzJ7CaXPWnaD0j4NZCCbi9ZiYtRZoPl8IlmG9ATr+Wo=; b=yg20ITZGZhkVIlgfpWbgVNFl0F
	QtrEz27yNvpFZFHIiTFaqN9wNDEE9HAJtYkG2gwrXJIp40HwV6mljeUZnAZ5Uv+R+4M7XPkhn1COx
	dwvQT/swZwkvakoXuDcTQjBXYtMvmDdrCCmt24phu40Awl6uK60Mi4W31eFxStIjhqB68vcAhJZDv
	sGX8WxFLFJ87E0tVPPP51BHo3wgxXbxZMYLaFkiOxvPZuYNJVfWy4/wF5F6vZkp7QR4pgw/93kOiw
	ZnlDM3fIksJHlu/HZBXMuvTJxrbctguCFDEVIHoibJaENbykphrGUS+tEP1kXTjt7UWaAIwuLXZx7
	j1Gda4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkDK-0000000CyvK-1sPF;
	Wed, 19 Feb 2025 13:34:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkk9j-0000000CxlK-41yI;
	Wed, 19 Feb 2025 13:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739971826;
	bh=O6x7SNy89g82HPWJGUfqA0X9THHPpDCJB2dBOG1XwF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+wa9Ip+3fVnUNZolzRaAGSL2sX+SgtItJw7JvBgQDuSf8T+1JlHglR7p0r/ZkpmC
	 tJ6AfyICKKTVWd1I+tcnoDj1r7vGdpBq9C1Ho38SxrC21H4WYTHQJrOpoT0MDkJhqB
	 tGOukiQF4+w0Eop1Qdg4pbhIN8dlOXpyEGrdXtW6gXh6h8mQzH7uZt70ZC60eJV7aj
	 9q0wuWAPXe962QypjHmLp0Rfy06a5ZJRJtQu0hZBEgCt5WUDmazZhedy44TGutYHsZ
	 PjLg9xNBmjbKvKDaSTU2ZFCFqQJx/7vO5VQZ8rhi+isQMRdgIcERR4c3R1lUtlb4s5
	 yk1PE4ZQ29y5A==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DEBE17E1566;
	Wed, 19 Feb 2025 14:30:22 +0100 (CET)
Date: Wed, 19 Feb 2025 10:30:19 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	parkeryang <Parker.Yang@mediatek.com>
Subject: Re: [PATCH 6/6] arm64: dts: mediatek: mt8390-genio-common: Add
 routes for DMIC
Message-ID: <5e7d7461-1af4-4e16-b808-072fe7c34e36@notapiano>
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
 <20250218-genio700-dmic-v1-6-6bc653da60f7@collabora.com>
 <CAGXv+5H1pfJMQPBTF_K72D3-JFsZDvZ277erZ449sc6FTkNFSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5H1pfJMQPBTF_K72D3-JFsZDvZ277erZ449sc6FTkNFSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_053028_154372_9D368DE7 
X-CRM114-Status: GOOD (  21.88  )
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

On Wed, Feb 19, 2025 at 12:29:15PM +0800, Chen-Yu Tsai wrote:
> On Wed, Feb 19, 2025 at 5:27 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Add necessary routes for the onboard dual DMIC present on the Genio
> > 700/510 EVK. The dmic is supplied by micbias0 and micbias2, and inputs
> > into the MT8188 DMIC DAI.
> >
> > Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
> > Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > index a37cf102a6e928440cc88e7e8fe0225fc28ec962..efdeca88b8c4e58f0c17825156276babf19af145 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > @@ -959,7 +959,11 @@ &sound {
> >         pinctrl-0 = <&audio_default_pins>;
> >         audio-routing =
> >                 "Headphone", "Headphone L",
> > -               "Headphone", "Headphone R";
> > +               "Headphone", "Headphone R",
> > +               "DMIC_INPUT", "AP DMIC",
> > +               "AP DMIC", "AUDGLB",
> > +               "AP DMIC", "MIC_BIAS_0",
> > +               "AP DMIC", "MIC_BIAS_2";
> >         mediatek,adsp = <&adsp>;
> >         status = "okay";
> 
> Shouldn't there also be one or two new dmic-codecs, and a dai-link here?

The DMIC codec is only needed to get a wakeup delay and avoid an initial "pop"
noise. Same as for the analog mic, for which I've recently sent a patch [1].

Depending on the order that things get picked up, I can either add the patch for
it to this series, or the series in [1]. (Well, looks like I'll be sending a v2
for this series anyway, so I can add that patch here).

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20250214-genio700-amic-wakeup-delay-200ms-v1-1-0094837c62b7@collabora.com

