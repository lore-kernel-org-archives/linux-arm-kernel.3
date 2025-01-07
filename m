Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCBAE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdbOhL/k5RPMO1JEvPu6XdE2AY7voRbi9xPRQHAjqHI=; b=fXF2pvp0PiDQntWMNapkfy72HF
	Ryyg8xT3ujNHqYqtA3eSU1xISJ90THtLJ8m27K9kIKXDfgNDLze6QDkv7eSFlr5sMeheznplsG+0o
	2qV0UyqVnHGyrm/rlie066nCeUQ1rZ79/80o1LynpJH8SCA9No57fhN2B6s3n2hbWYOmue/ju4qBO
	48wAX+Wy9Cg9YSGJosvVRXAEySHvfP/n3/uX8Maebr/kqVyrEf0WGk5VzaNK75h8dPw5wbh+X+tKO
	SGG/50PxGZgCUc+YfcVKJEmWcTIXFcG7Vbgq5bk0ylQOxW73Esvbn87EFc/X0itRYAWyriV+1IoY9
	PGMSnIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVs6x-0000000BvFO-0Yto;
	Thu, 09 Jan 2025 12:58:07 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVs5j-0000000Bv2p-1DwQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1736277829; bh=lnUY3E9Xp9HZsjvS0v5cg5xxXO+EoQQewQPHH6SCUvo=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=ctOF7/uOLwYBNG3JYhZ7w6tnM+ObaiBgyN67W6Hcf8v8aqN6QE40ifinp3fbc5B3a
	 RqQ5eWCFNBhGzhMIGoBVOxCgPgeOZb2Kdu0uW9sTc+gVhVoOZn0D35urnDBmTYf50B
	 O53JWrsosK91kVSE/s04Tf9MbzAPUSH/rnyOkiZk=
Date: Tue, 7 Jan 2025 20:23:48 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnaud Ferraris <arnaud.ferraris@collabora.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 0/4] Add support for jack detection to codec present
 in A64 SoC
Message-ID: <dfb3lsuqf4yowkovwwi6iiroslb4r357u7ddevntdk72ivxcjz@3spuwm24ubwr>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Arnaud Ferraris <arnaud.ferraris@collabora.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240302140042.1990256-1-megi@xff.cz>
 <CA+E=qVdq7AHYj1scKbyGmarSZ7u=vLMsQ63nDTDQBu2UaL=Xag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+E=qVdq7AHYj1scKbyGmarSZ7u=vLMsQ63nDTDQBu2UaL=Xag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_045651_508611_FD861665 
X-CRM114-Status: GOOD (  32.82  )
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

Hi Vasily,

On Fri, Dec 27, 2024 at 03:58:44PM -0800, Vasily Khoruzhick wrote:
> On Sat, Mar 2, 2024 at 6:02 AM Ondřej Jirman <megi@xff.cz> wrote:
> >
> > From: Ondrej Jirman <megi@xff.cz>
> >
> > This series adds support for jack detection to this codec. I used
> > and tested this on Pinephone. It works quite nicely. I tested it
> > against Android headset mic button resistor specification.
> >
> > The patches are a rewritten and debugged version of the original
> > ones from Arnaud Ferraris and Samuel Holland, improved to better
> > handle headset button presses and with more robust plug-in/out
> > event debouncing, and to use set_jack API instead of sniffing
> > the sound card widget names, to detect the type of jack connector.
> >
> > Please take a look. :)
> >
> > v3:
> > - removed all device-tree related code
> >   (it's not necessary for core functionality, it only helps make the jack detect
> >   functionality of the codec be usable from simple-sound-card driver, and I'll
> >   send it spearately, because it will apparently need several more rounds
> >   of review)
> 
> Hey Ondrej,
> 
> Has it ever materialized? As far as I can tell, this code has been
> sitting dead due to missing dt-related code.

The code is used with some non-mainline patches. There was a bit of
a problem with simple-sound-card not being flexible enough for complete
functionality of audio jack on Pinephone, so I had to extend it a bit:

https://codeberg.org/megi/linux/commit/afbe7688083cd1e3ab98c37e0fe0c28d530829e1
https://codeberg.org/megi/linux/commit/95552b66a269c2da434edd3880f9819c0bd5602f
https://codeberg.org/megi/linux/commit/c15070c220e7425dd0d0445ae0eacdb4a4872ad7

Here's a bunch of patches that I use currently for complete audio
jack detection functionality:

  https://codeberg.org/megi/linux/commits/branch/audio-6.13

But no, complete upstream support did not materialize, yet.

I'm not sure about the direction. Whether to push more features to DT or
just write a sound card driver for Pinephone, that would be able to handle all
this without extending simple-sound-card or DT changes to codec driver.

Kind regards,
	o.

> Regards,
> Vasily
> 
> > v2:
> > - use set_jack/get_jack_type
> > - get rid of some custom poking inside card internals to figure
> >   out what kind of jack port we should setup the codec for
> > - read jack-type from OF as suggested here:
> >   https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-component.c#L288
> > - add DT bindings
> >
> > Thank you very much,
> >         Ondřej Jirman
> >
> > Arnaud Ferraris (2):
> >   ASoC: sun50i-codec-analog: Enable jack detection on startup
> >   ASoC: sun8i-codec: Implement jack and accessory detection
> >
> > Samuel Holland (2):
> >   ASoC: sun50i-codec-analog: Move suspend/resume to set_bias_level
> >   ASoC: sun8i-codec: Enable bus clock at STANDBY and higher bias
> >
> >  sound/soc/sunxi/sun50i-codec-analog.c |  73 +++++-
> >  sound/soc/sunxi/sun8i-codec.c         | 346 +++++++++++++++++++++++++-
> >  2 files changed, 399 insertions(+), 20 deletions(-)
> >
> > --
> > 2.44.0
> >
> >

