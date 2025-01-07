Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C871E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyaCVBO7oWHWvc6bh2eiIo3LwDMxtIJ0UProiroXyHo=; b=NRynVy2gEjIRLJMPinzQPzjThQ
	IkwvjlXbaRT5guwxUnyIjtlGIj2ib9sj7zGEfVnsbILfTYUwTTgGIvInBXrT0rW2G0+ID/09qvyS5
	wrXQcukjLzz4uDJu/b2hhsI/d9eLn1kjMxc4bgrf5nYJPum3dHGgXLiPtrmCsAmazdZLuDSLwfES0
	8/t4k4nnovXSdUdhY7gps5YKtaFfGfgnr8gX6esUqCm1fd+PjVd/MslnvhIUAOLPfeEMp3Uxl5pNe
	Q00SgUBN0ojNRw+w/1wEjJhLIvegiyhfk1gDZ5JnD7mRNm4WwCzXmdtAkfbb1yNnHXUE136vMGnaS
	FVJguQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8H9-00000004fsV-0HQx;
	Tue, 07 Jan 2025 12:01:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV83P-00000004crn-3E7e;
	Tue, 07 Jan 2025 11:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736250441;
	bh=0TrZCAQ8WrM1LVeDaQMb9nE1S6brNmw6AnHjH6a6Fg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LW/OkmuPaFhGWT8QxW+Ex4JfwpJKnGLdogXm+UszlR33SmmKKetmcdqQXbFSrb9A/
	 QJsuncfkKV2EcU/UTTBbmkpwfO+4DkgE6UFadjtWL16jXnZgD10LyJnFrR6KHGtC8H
	 2xJOAoMK66QfC9q7Hm7YpZBg7JYOJFzwxXpdAv3qVZO6b0HtR2Onz+c3QpAhsko2cE
	 cJ4AyDHDbulTUT3T7n4bZhQb3VtTg7fgRc55b/nMXFGHjzXJMIB37hrs80cGBKQFB4
	 NDgdouUYrO2tFGkE0MYfza8BW2nRpAdI9UM/emmGO0kLGINT/XsfsrSJzsC7KVQkZU
	 U5yUm/5RMQzDw==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F98D17E1562;
	Tue,  7 Jan 2025 12:47:18 +0100 (CET)
Date: Tue, 7 Jan 2025 08:47:15 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Fei Shao <fshao@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic
 codec
Message-ID: <2c305aa4-860d-49a7-b20e-c5df58110533@notapiano>
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
 <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>
 <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
 <CAGXv+5E5L5nNCT54O+LW6DdaWifLuA46pXcRNpSw1okGUp+JFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5E5L5nNCT54O+LW6DdaWifLuA46pXcRNpSw1okGUp+JFQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_034723_952112_787B82C2 
X-CRM114-Status: GOOD (  35.42  )
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

On Tue, Jan 07, 2025 at 01:03:08PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jan 7, 2025 at 1:33 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > On Thu, Dec 26, 2024 at 04:30:17PM +0800, Chen-Yu Tsai wrote:
> > > Hi,
> > >
> > > On Wed, Dec 4, 2024 at 3:22 AM Nícolas F. R. A. Prado
> > > <nfraprado@collabora.com> wrote:
> > > >
> > > > Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiring
> > > > a dmic codec to be present for the driver to probe, as not every
> > > > MT8188-based platform might need a dmic codec. The codec can be assigned
> > > > to the dai link through the dai-link property in Devicetree on the
> > > > platforms where it is needed.
> > >
> > > A followup question about this. The DMICs on the Chromebooks are attached
> > > to the PMIC codec's input side, which then converts the signals to standard
> > > I2S and passes them out to the SoC through its AIF1. So the original code
> > > was somewhat incorrect, though it works.
> > >
> > > How should we describe such a connection, given that the MediaTek sound
> > > bindings aren't a full graph?
> >
> > What you're describing is that the hardware topology looks like this:
> >
> > --------------------      --------------------
> > |    SoC           |      |   MT6359 PMIC    |
> > |        UL_SRC BE | <--- | AIF1   AIN0_DMIC | <-- DMic
> > --------------------      --------------------
> 
> Correct.
> 
> > But that the dailink definition in the machine driver had the DMic codec
> > connected directly to the UL_SRC BE instead, alongside the connection to the
> > PMIC, unlike the topology above.
> >
> > My understanding is that the dmic codec was added simply to allow the usage of
> > the wakeup-delays. From [1] it appears that DAI connections between two codecs
> > are possible, though rare. So the PMIC -> DMic connection description might be
> > possible in that way, although I'm not sure it brings any benefits besides
> > closer resembling the hardware topology.
> 
> I suspect we would want to keep the wakeup delays though. AFAICT they aren't
> the same number across the board (no pun intended), but actually differ
> between devices, perhaps due to differences in the actual DMIC used.

We can still keep the delays. We can keep assigning the dmic codec to the UL_SRC
BE, only through the DT now rather than hardcoded in the driver:

	dmic: dmic-codec {
		compatible = "dmic-codec";
		num-channels = <2>;
		wakeup-delay-ms = <50>;
		#sound-dai-cells = <0>;
	};

	&sound {
		...

		dai-link-1 {
			link-name = "UL_SRC_BE";

			codec {
				sound-dai = <&pmic 0>, <&dmic>;
			};
		};
	};

It still doesn't match the hardware topology, but the delay should work the same
as before.

> 
> If we don't want the full description, maybe we add the wakeup delay to
> the PMIC codec then?
> 
> AFAICT [1] is basically hardcoding in the dmic-codec in a different way,
> so basically reverting your original patch.

Hm, on a second look I think you're right.

Thanks,
Nícolas

> 
> ChenYu
> 
> > [1] https://www.kernel.org/doc/html/latest/sound/soc/codec-to-codec.html
> >
> > >
> > > > No Devicetree currently relies on it so it is safe to remove without
> > > > worrying about backward compatibility.
> > >
> > > Removing it didn't seem to cause any issues for the Chromebooks that
> > > do actually have DMICs. I suspect the only difference would be that
> > > the wakeup-delays no longer apply correctly.
> >
> > That's my guess too.
> >
> > Thanks,
> > Nícolas

