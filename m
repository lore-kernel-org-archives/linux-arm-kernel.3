Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4019FE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G981jZtYq9+m6LGqFjQopp1Q4KFWAzKgyvqnHiUisc4=; b=3UAiC1UQS12tio//BR2jsJWG2j
	aFLhznellmZb3rodUW2uU5Os45zdk+Eh0RpDu8uOE6mDAuVQCeSiqSaSeU/xInCQG4QSHxhmBCe/a
	pWzO4QedEAvcqmrAbhDcfP9NP/QkCQZ1+Lo/v5MtrG6AhPKV/AERSlwKAV+Ayrzuuv91+unT3lbXL
	nT2QzIgPfzwHqw7VjnCePUWsMIcDnbJy3Gk0pDTVrJWn/5MbLTSPdyfnr2/XJyKxWiJVqdnlsVWpy
	MwiwA9OaQrqHrvAl0iR4im3H8/oEUDcIdpYkui9IixaAfhaja8j2jTPSbr27Zgvsyr+5Vbm9qA9yr
	8mY3Bm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgWL-00000009mDy-2Sl6;
	Wed, 18 Feb 2026 12:19:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgWI-00000009mDZ-3m2f;
	Wed, 18 Feb 2026 12:19:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D7FF54E40F59;
	Wed, 18 Feb 2026 12:19:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A23D960738;
	Wed, 18 Feb 2026 12:19:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 224DF10368B83;
	Wed, 18 Feb 2026 13:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771417143; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G981jZtYq9+m6LGqFjQopp1Q4KFWAzKgyvqnHiUisc4=;
	b=xhCNSzyB7mBPbkbEi/35CRJeSC7kjISQzTti7ikeGonDDxTn39Zzm3dF7jAwRzizWzSGxP
	GSAFP35plXgFaVfcJpJmhFuh8Q4rkekH7uGM7xdabuynvx/KC+ClSMbN7LVT6kLKVpHT9d
	+HBGIRtztWn9pplPYXpb+aImCBPfb45cUheK8qFRzg18QaMYdgSiUgJqcRvGhFXjccBNnb
	fZF5TjysHDl+C8BQLDDdmMlfNTW5z5NJSVp0AxEBash0XkXip/x5gZm6+aXjkGiIwof8ZH
	UK0KlAo/42u4JCh07OVqXBI9wg/XVOfNZqD+AZeEDnzUQpJBjMbqmVXcQmlOtA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 13:19:00 +0100
Message-Id: <DGI2YVYBECUM.3O0UN9VMKF7FJ@bootlin.com>
Cc: "Nicolas Frattaroli" <frattaroli.nicolas@gmail.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-rockchip@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel@collabora.com>, <alexandre.belloni@bootlin.com>,
 <thomas.petazzoni@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
X-Mailer: aerc 0.20.1
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
In-Reply-To: <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_041907_074994_EE328AF5 
X-CRM114-Status: GOOD (  19.32  )
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

Hello Detlev,

On Tue Feb 10, 2026 at 10:54 AM CET, Luca Ceresoli wrote:
> Hello Detlev,
>
> On Fri Jan 17, 2025 at 5:31 PM CET, Detlev Casanova wrote:
>> In commit
>> 9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates"),
>> the set_sysclk callback was removed as considered unused as the mclk rat=
e
>> can be set in the hw_params callback.
>> The difference between hw_params and set_sysclk is that the former is
>> called with the audio sampling rate set in the params (e.g.: 48000 Hz)
>> while the latter is called with a clock rate already computed with
>>   sampling_rate * mclk-fs (e.g.: 48000 * 256)
>>
>> For HDMI audio using the Rockchip I2S TDM driver, the mclk-fs value must
>> be set to 128 instead of the default 256, and that value is set in the
>> device tree at the machine driver level (like a simple-audio-card
>> compatible node).
>> Therefore, the i2s_tdm driver has no idea that another mclk-fs value can
>> be configured and simply computes the mclk rate in the hw_params callbac=
k
>> with DEFAULT_MCLK_FS * params_rate(params), which is wrong for HDMI
>> audio.
>>
>> Re-add the set_sysclk callback so that the mclk rate is computed by the
>> machine driver which has the correct mclk-fs value set in its device tre=
e
>> node.
>
> I'm afraid I just found this commit breaks audio capture on the RK3308.
>
> Using 'arecord -Vmono -d 2 -c 8 -f S16_LE -r 96000 /dev/null' I get:
>
>   rockchip-i2s-tdm ff320000.i2s: ASoC error (-22): at snd_soc_dai_hw_para=
ms() on ff320000.i2s
>    ff320000.i2s-rk3308-hifi: ASoC error (-22): at __soc_pcm_hw_params() o=
n ff320000.i2s-rk3308-hifi
>
> Tested on:
>
>  * Radxa Rock Pi S
>  * Upstream kernel
>  * arm64 defconfig
>
> Tested kernel versions:
>
>  * v6.12 works
>  * 5323186e2e8d (this commit) fails
>  * 5323186e2e8d^ works
>  * 21cfbeae7d7c (same patch on stable/linux-6.12.y) fails
>  * 21cfbeae7d7c^ works
>  * v6.19 fails
>  * v6.19 + 'git revert 5323186e2e8d' works
>
> I don't have more information at the moment.

Let me add some more info to my previous report.

The function failing is clk_set_rate() in rockchip_i2s_tdm_hw_params().

I added some logging to rockchip_i2s_tdm_hw_params() and here's the output:

  On v6.19-11566-g254edc893f3a (current Linux master)

  At boot:
    [    3.324622] rockchip-i2s-tdm ff320000.i2s: The target mclk_tx freq i=
s: 50176000
    [    3.324720] rockchip-i2s-tdm ff320000.i2s: using zero-initialized fl=
at cache, this may cause unexpected behavior
  When launching arecord:
    [   18.429389] rockchip_i2s_tdm_hw_params:653 i2s_tdm->is_master_mode =
=3D 1
    [   18.430154] rockchip_i2s_tdm_hw_params:654 i2s_tdm->mclk_tx clk_i2s2=
_8ch_tx
    [   18.430815] rockchip_i2s_tdm_hw_params:655 i2s_tdm->mclk_rx clk_i2s2=
_8ch_rx
    [   18.431465] rockchip_i2s_tdm_hw_params:656 i2s_tdm->mclk_tx_freq 501=
76000
    [   18.432097] rockchip_i2s_tdm_hw_params:657 i2s_tdm->mclk_rx_freq 0
    [   18.432677] rockchip_i2s_tdm_hw_params:658 i2s_tdm->clk_trcm 0
    [   18.433230] rockchip_i2s_tdm_hw_params:659 substream->stream 1
    [   18.433858] rockchip_i2s_tdm_hw_params:678 mclk clk_i2s2_8ch_rx
    [   18.434423] rockchip_i2s_tdm_hw_params:679 mclk_rate 0
    [   18.434977] rockchip_i2s_tdm_hw_params:682 clk_set_rate(clk_i2s2_8ch=
_rx, 0) returned -22
    [   18.435743] rockchip-i2s-tdm ff320000.i2s: ASoC error (-22): at snd_=
soc_dai_hw_params() on ff320000.i2s
    [   18.436699]  ff320000.i2s-rk3308-hifi: ASoC error (-22): at __soc_pc=
m_hw_params() on ff320000.i2s-rk3308-hifi

  On v6.19-11566-g254edc893f3a + 'git revert 5323186e2e8d'

  At boot:
    [    3.283853] rockchip-i2s-tdm ff320000.i2s: using zero-initialized fl=
at cache, this may cause unexpected behavior
  When launching arecord:
    [   11.952290] rockchip_i2s_tdm_hw_params:631 i2s_tdm->is_master_mode =
=3D 1
    [   11.952955] rockchip_i2s_tdm_hw_params:632 i2s_tdm->mclk_tx clk_i2s2=
_8ch_tx
    [   11.953615] rockchip_i2s_tdm_hw_params:633 i2s_tdm->mclk_rx clk_i2s2=
_8ch_rx
    [   11.954355] rockchip_i2s_tdm_hw_params:636 i2s_tdm->clk_trcm 0
    [   11.954917] rockchip_i2s_tdm_hw_params:637 substream->stream 1
    [   11.955477] rockchip_i2s_tdm_hw_params:652 mclk clk_i2s2_8ch_rx
    [   11.956048] rockchip_i2s_tdm_hw_params:653 params_rate(params) 96000
    [   11.956769] rockchip_i2s_tdm_hw_params:656 clk_set_rate(clk_i2s2_8ch=
_rx, 24576000) returned 0

I cannot point to the right fix but the value 0 in i2s_tdm->mclk_rx_freq
appears as a good clue, perhaps it has never been set.

I hope this helps.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

