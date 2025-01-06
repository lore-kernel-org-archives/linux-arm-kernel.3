Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF621E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHbfba2And8Zt61kt2iQlQFV09J2mMoF5FODcPSTfG4=; b=fSyO646RuGwsPsv+zCnHqYCM53
	sb+3V4VMQjWDCVzlr7RHLHF3HeZTpjDN1TvvXIHK1gVNxpkd8G3ZI84eXATywJ6Sa3kWTAt6n7yIj
	kE4BThAimdBh9PRERrWj3U9O9mB22r49UCVQu6BP+CN7K+upQT3ZfpXOwuuHJCKtBmpH8c+fkE8qU
	Op0GRJ8tyiUqov2bEI7i2MKb/gc+wR9AkEJQncXXUC2wL20cr+SaYrgZM0Ggh4jL/CtZqoDb2fZpH
	X/X9PBGQYXHpKnuhYnvbScWR/385Jo60SNWI0vP//aYhzW1GQWb5jTBavDlSkyv8j2ExJ3+uajX18
	3FmeXo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUr1h-000000029a0-0dON;
	Mon, 06 Jan 2025 17:36:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqyc-000000028xg-3zNz;
	Mon, 06 Jan 2025 17:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736184796;
	bh=raQLplo3YHOodoFbQHsJDY5RmZFdu7k7k0Vckr3LSak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kDFkE5aJYDigmfNcmJgranJ0zk6OGy24hbawUOhJcOWil7PyDjnBDsvmHO6Jlrm4L
	 ZSBHl+utX0uxSdH3gLio+HX82zPFbYwalLRUXT9BQjZG+g9ZyhwAXT1Rjj2+93oafn
	 rGqEhVmjMYcU8rFpHx3+Sm6tT9I/2VBPl5FJo3F/ZkOzd3G7AZdZzj36w/7pZGXXUI
	 P9fJSZdFp/f0Pf0YU2FvpJIryrg1UtNC2iWia/Iwq/mMU8wZ/PiMIGhL5s6I+PvdE/
	 2OsYJd4PdQIFYemReHB3Xa8q5mScj3HKE+wlqO6GZIUAiXEDrzmnpTa1BzYr+5buml
	 HkqUiXnxJAXlw==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68E3817E15B6;
	Mon,  6 Jan 2025 18:33:13 +0100 (CET)
Date: Mon, 6 Jan 2025 14:33:10 -0300
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
Message-ID: <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
 <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_093319_957428_930F54D6 
X-CRM114-Status: GOOD (  23.06  )
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

On Thu, Dec 26, 2024 at 04:30:17PM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Wed, Dec 4, 2024 at 3:22 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiring
> > a dmic codec to be present for the driver to probe, as not every
> > MT8188-based platform might need a dmic codec. The codec can be assigned
> > to the dai link through the dai-link property in Devicetree on the
> > platforms where it is needed.
> 
> A followup question about this. The DMICs on the Chromebooks are attached
> to the PMIC codec's input side, which then converts the signals to standard
> I2S and passes them out to the SoC through its AIF1. So the original code
> was somewhat incorrect, though it works.
> 
> How should we describe such a connection, given that the MediaTek sound
> bindings aren't a full graph?

What you're describing is that the hardware topology looks like this:

--------------------      --------------------
|    SoC           |      |   MT6359 PMIC    |
|        UL_SRC BE | <--- | AIF1   AIN0_DMIC | <-- DMic
--------------------      --------------------

But that the dailink definition in the machine driver had the DMic codec
connected directly to the UL_SRC BE instead, alongside the connection to the
PMIC, unlike the topology above.

My understanding is that the dmic codec was added simply to allow the usage of
the wakeup-delays. From [1] it appears that DAI connections between two codecs
are possible, though rare. So the PMIC -> DMic connection description might be
possible in that way, although I'm not sure it brings any benefits besides
closer resembling the hardware topology.

[1] https://www.kernel.org/doc/html/latest/sound/soc/codec-to-codec.html

> 
> > No Devicetree currently relies on it so it is safe to remove without
> > worrying about backward compatibility.
> 
> Removing it didn't seem to cause any issues for the Chromebooks that
> do actually have DMICs. I suspect the only difference would be that
> the wakeup-delays no longer apply correctly.

That's my guess too.

Thanks,
Nícolas

