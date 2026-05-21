Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23908CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 23:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuXgeCnji3vg9DTM+nKRuB/6/d26RWL0oGImlyNcPbw=; b=twwQ7bzmnVHC/XjmbeqgcWJdRG
	VSgsJGkp//BoJ8TyeYMGsCueVNyA/OH6mJNY2l2gLlCAN3LbU0VKrrzkDHBHUcSNqTDd8/1awWMtA
	1ieUI5T6safkyGs4nEKFSWVErOD/3jA7R+fxozGh7up5+U8w5V0GThKRL+770+SNli8MWDMYNnlXC
	K4fbWGTH/1bPOxEBKUQ6kE5iVBHAkbRWeTvovbY1Vcm5sIyhveBQcmHI2cJL3twXb+NYh54zyxBRV
	zNg8RUArd7Cqv3L9EhgwDrrjR/OfYJhsjFKxEbDX/Q4ENJb0eu3rTpK94LOw58DiA9UXbT+5z2MoF
	gv/U+FYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCbw-00000009IJb-1VBE;
	Thu, 21 May 2026 23:15:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCbu-00000009IIt-08G6;
	Thu, 21 May 2026 23:15:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42EF040D63;
	Thu, 21 May 2026 23:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99951F000E9;
	Thu, 21 May 2026 23:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779405325;
	bh=PuXgeCnji3vg9DTM+nKRuB/6/d26RWL0oGImlyNcPbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DxhLHMYU6tWsxNh9zW97uFyxTP7/DurE9I8PIJvZLot2zke61AorZxPxFUSpYjoVe
	 kO6WmZxmuBvE7vn9OVlCQTcto1d0HuCFhIhkhU+d6+V4zn2cZFFWYekylUEH5K3y+2
	 EGdqpb96jpzE74ZxG0j+wbfglvBvps2+MSJ1rgM/sdeJIEJWe/zcXA8t0ZPmagvNpU
	 9A1q3sD0rLXrOjhKRD5e/T068x7eUESObiyjgUDW8lObhNaEMab4v/lT1OFnnGOo8U
	 jxL2nEifcCDUXATscqxKY2WYueXeYVNdRD+AZfoukgvEJA22ucfw9biKD6IaFroBrr
	 D132M18RQ9tYg==
Date: Fri, 22 May 2026 00:15:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format
 I2S output data
Message-ID: <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
 <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kGRBy1aXTob5Y1K8"
Content-Disposition: inline
In-Reply-To: <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
X-Cookie: No shirt, no shoes, no service.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_161526_113273_FCFC87D9 
X-CRM114-Status: GOOD (  11.37  )
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


--kGRBy1aXTob5Y1K8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2026 at 05:10:40PM +0200, Valerio Setti wrote:
> Create a new DAPM widget for "I2S formatter" and place it on the path
> between FIFO and output DAI interface. Remove I2S output formatting code
> from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.

This series, it looks like this specific patch, is breaking pcm-test on
my libretech Le Potato board, the clocking looks to be seriously messed
up.  I'm getting:

# selftests: alsa: pcm-test
# TAP version 13
# # Card 0/LIBRETECHCC - LIBRETECH-CC (LIBRETECH-CC)
# # LIBRETECHCC.0 - fe.dai-link-0 (*)
# 1..7
# # default.time1.LIBRETECHCC.0.0.PLAYBACK - 8kHz mono large periods
# ok 1 # SKIP default.time1.LIBRETECHCC.0.0.PLAYBACK
# # snd_pcm_hw_params_set_channels 1: Invalid argument
# # default.time2.LIBRETECHCC.0.0.PLAYBACK - 8kHz stereo large periods
# # default.time2.LIBRETECHCC.0.0.PLAYBACK hw_params.RW_INTERLEAVED.S16_LE.8000.2.8000.32000 sw_params.32000
# not ok 2 default.time2.LIBRETECHCC.0.0.PLAYBACK
# # time mismatch: expected 2000ms got 4425
# # default.time3.LIBRETECHCC.0.0.PLAYBACK - 44.1kHz stereo large periods
# # default.time3.LIBRETECHCC.0.0.PLAYBACK hw_params.RW_INTERLEAVED.S16_LE.44100.2.22528.192000 sw_params.180224
# not ok 3 default.time3.LIBRETECHCC.0.0.PLAYBACK
# # time mismatch: expected 2000ms got 4852
# # default.time4.LIBRETECHCC.0.0.PLAYBACK - 48kHz stereo small periods
# # default.time4.LIBRETECHCC.0.0.PLAYBACK hw_params.RW_INTERLEAVED.S16_LE.48000.2.512.4096 sw_params.4096
# not ok 4 default.time4.LIBRETECHCC.0.0.PLAYBACK
# # expected 48000, wrote 4096
# # default.time5.LIBRETECHCC.0.0.PLAYBACK - 48kHz stereo large periods
# # default.time5.LIBRETECHCC.0.0.PLAYBACK hw_params.RW_INTERLEAVED.S16_LE.48000.2.24000.192000 sw_params.192000
# not ok 5 default.time5.LIBRETECHCC.0.0.PLAYBACK
# # time mismatch: expected 2000ms got 4489
# # default.time6.LIBRETECHCC.0.0.PLAYBACK - 48kHz 6 channel large periods
# # default.time6.LIBRETECHCC.0.0.PLAYBACK hw_params.RW_INTERLEAVED.S16_LE.48000.2.48000.262144 sw_params.240000
# not ok 6 default.time6.LIBRETECHCC.0.0.PLAYBACK
# # time mismatch: expected 2000ms got 6135
# # default.time7.LIBRETECHCC.0.0.PLAYBACK - 96kHz stereo large periods
# # default.time7.LIBRETECHCC.0.0.PLAYBACK hw_params.RW_INTERLEAVED.S16_LE.96000.2.48000.192000 sw_params.192000
# not ok 7 default.time7.LIBRETECHCC.0.0.PLAYBACK
# # time mismatch: expected 2000ms got 2287
# # 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# # Totals: pass:0 fail:6 xfail:0 xpass:0 skip:1 error:0

Full log:

   https://lava.sirena.org.uk/scheduler/job/2786342#L1934

The prior patches seem to test fine, it's this one that seems to
introduce the issue.

--kGRBy1aXTob5Y1K8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoPkgcACgkQJNaLcl1U
h9Cr9wf9GZVxQsEvIE5A3ipkHKDFMMS69vG4WyE+XAQvUUYD24bVJHKuASshuek5
MPsHrOTy8LYEDCuVOLdMd0ilswgl3O/W1BSwdePwFon3Xec2T2UizWpdEk6d8Zsb
EVFQcE3Lmzdcgq17uma30ijZhzLWJnG3ZeSeeMQIEGlrxowrfpvjIh48v2XQ5IB1
kvkE0pcQYxWV27Blv3YSz7F4QzRPi0wpOgUDZitASb+bf1GJIyeNnBgp5d70s9kf
gpTN5jw9FYrgnv03F8FT36d8+SCoLpiW8nVx1aWs1tyj/mEV1UPMJZMh1de3WCxt
mMqEy1yvKUpQqO+oiEKrda1zNeYf9w==
=witK
-----END PGP SIGNATURE-----

--kGRBy1aXTob5Y1K8--

