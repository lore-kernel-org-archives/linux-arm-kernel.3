Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344CCEA3F2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiRrYJ72zQo1WMZ9lVj3XZTV0dKHYq/gmc5+HrpHpm8=; b=p26nVhqp3MY85Q3oiX5Z61ZWie
	bbnWH/2LvEOq1g4TAtdDJrwa8aBODJqxomx1LRW5ZcKyT+NrC3PFOOOVIY0QVORggzX4SMao/6ci7
	Rz6H2DvEUvqS3419IQOasa6+8pYnoDa2fK9EC5NXltDVY0Pz4gU0PzS9RYTDyZHaVVlN/aNwVTXRs
	4REK+4ebWqhGsrB39riq9HLjQjvkXitOsWc/FggtVOf77U6F4OBnz2plv5sDXbEGhJ9epNiEVrwDJ
	1CosmGwFVD/dE7U7mLczx+fAqKSMwLtMLfyU7eVaX9DkftRR+8dG266lyBW/0c8VH4NBHOlYzuUnj
	7LhSp0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkS3-0000000Gmla-46YK;
	Tue, 10 Feb 2026 09:54:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkS1-0000000Gmku-3JHZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 09:54:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 479A3C8F1FE;
	Tue, 10 Feb 2026 09:54:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0877A606BD;
	Tue, 10 Feb 2026 09:54:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9975119D10B8;
	Tue, 10 Feb 2026 10:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770717250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xiRrYJ72zQo1WMZ9lVj3XZTV0dKHYq/gmc5+HrpHpm8=;
	b=sh26Rq50pKO+hha3iylHdSe9ifBNiwrXtydKZ0jYK1V4jUREnbZoVLnl5pjvCqXKadU6Yw
	OFHVH0UNkPJcGDbg2lcsrYmJnnU1jXsf9jPFu8XmKZ30omHJ05jfTAa7epIkHzSCP1p7hq
	qLqYjeQ+1jtj35e/IB585nBYhHvbr4m1zgD2bkk8q8wwHr0d76DoLgtmiWWjxk0UZVuew5
	ziioJ8kH1/FTcIg9y9aWTpy7C+P144MWiVh/Tz4vP80hf9iSHgtXTw8JN4ZOkLPdT3VhMH
	yG7HIvhQgu7zni/fAtyYLmGRX4GsBjn6htrF1RZtT82PrL0ZvW7g0xu6RVDTzQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 10:54:04 +0100
Message-Id: <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
Cc: "Nicolas Frattaroli" <frattaroli.nicolas@gmail.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-rockchip@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel@collabora.com>, <alexandre.belloni@bootlin.com>,
 <thomas.petazzoni@bootlin.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
X-Mailer: aerc 0.20.1
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
In-Reply-To: <20250117163102.65807-1-detlev.casanova@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_015433_966944_C80F3B25 
X-CRM114-Status: GOOD (  18.62  )
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

On Fri Jan 17, 2025 at 5:31 PM CET, Detlev Casanova wrote:
> In commit
> 9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates"),
> the set_sysclk callback was removed as considered unused as the mclk rate
> can be set in the hw_params callback.
> The difference between hw_params and set_sysclk is that the former is
> called with the audio sampling rate set in the params (e.g.: 48000 Hz)
> while the latter is called with a clock rate already computed with
>   sampling_rate * mclk-fs (e.g.: 48000 * 256)
>
> For HDMI audio using the Rockchip I2S TDM driver, the mclk-fs value must
> be set to 128 instead of the default 256, and that value is set in the
> device tree at the machine driver level (like a simple-audio-card
> compatible node).
> Therefore, the i2s_tdm driver has no idea that another mclk-fs value can
> be configured and simply computes the mclk rate in the hw_params callback
> with DEFAULT_MCLK_FS * params_rate(params), which is wrong for HDMI
> audio.
>
> Re-add the set_sysclk callback so that the mclk rate is computed by the
> machine driver which has the correct mclk-fs value set in its device tree
> node.

I'm afraid I just found this commit breaks audio capture on the RK3308.

Using 'arecord -Vmono -d 2 -c 8 -f S16_LE -r 96000 /dev/null' I get:

  rockchip-i2s-tdm ff320000.i2s: ASoC error (-22): at snd_soc_dai_hw_params=
() on ff320000.i2s
   ff320000.i2s-rk3308-hifi: ASoC error (-22): at __soc_pcm_hw_params() on =
ff320000.i2s-rk3308-hifi

Tested on:

 * Radxa Rock Pi S
 * Upstream kernel
 * arm64 defconfig

Tested kernel versions:

 * v6.12 works
 * 5323186e2e8d (this commit) fails
 * 5323186e2e8d^ works
 * 21cfbeae7d7c (same patch on stable/linux-6.12.y) fails
 * 21cfbeae7d7c^ works
 * v6.19 fails
 * v6.19 + 'git revert 5323186e2e8d' works

I don't have more information at the moment.

> Fixes: 9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling ra=
tes")

I'm the author of commit 9e2ab4b18ebd mentioned in the 'Fixes:' tag, so it
would have been good to Cc me. I would have had the option of testing your
patch and this regression could have been solved before getting in
mainline. I think b4 does it automatically (and perhaps get_maintainers
with appropriate flags).

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

