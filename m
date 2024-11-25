Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB794D3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUO3cLlT3vdLxWhuhdutCmu0MQDfhoRgoCbEY54Csm8=; b=qoNxRIuk9COldUjuqt+nIHtDfS
	mJekRAdo9znD4777EnrVxSYEdYG51UVqccF4FcHtGHaV0FIA9I/RQsS4E0Ne02UjiDohdVqRHsRWS
	BfOhKar4zK44E8Z2UqTvV1GvdaCCrTEPC1RqIXxJlT7BsgE5+IsF2Ix6K36zjMIoJuvwyJbt9aaHC
	XRAsKmnud0jYSeTO93uD6AoVE2JuwOUXnMUTGadhpDtze8yv8smvfEpY/TSXrs18LeCuDRxBlV3l9
	oUexGHwW8ZC+ArwKR8VWQOsSAxrkcgjcAnXWxXfGGclfIG/USsllPY6pgDwG47LCGhh/SwDzwLc9v
	iw3WbYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWBB-00000007jhH-0oLS;
	Mon, 25 Nov 2024 10:18:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFW5w-00000007h7W-48IF;
	Mon, 25 Nov 2024 10:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DEF2A5C5707;
	Mon, 25 Nov 2024 10:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0524C4CECE;
	Mon, 25 Nov 2024 10:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732529608;
	bh=hUO3cLlT3vdLxWhuhdutCmu0MQDfhoRgoCbEY54Csm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecXyt2kIURgzHaGqA6Om1ND2ZukCSUbhfaBgrTVsLdakQL+39aWUtBY8cVoSZlqdT
	 dRUwWGz50dH5iV7nF6vRMvqpQpO6xflP3jTA2CWkLuo0/tSXMMPT9IZk533d3ETFFZ
	 PUrlqfbTHHr6GC/Q7Nh/2CsDVLIG2Y9KTCtiw2GQvO1agESZR/y+t5VRVptpwuv4r6
	 KCzDOe8VEYuNOTyeoKKxYb/vgGlz1h66d2Z4vRgBj17djGa0JjdWrWo7OwLQu3ud03
	 SJMORycZfj959fobpZojpgvxp5bui2gfQ8cguN6GQ/nt9w6oroCQLb1zr3MpNrU5bt
	 TD5FIj632msXg==
Date: Mon, 25 Nov 2024 11:13:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <20241125-spirited-industrious-roadrunner-e8154d@houat>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
 <20241122-cobra-of-authentic-discourse-e2c5b6@houat>
 <03b5a671-e0c0-4d18-a103-e7f0ab18e20e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="h3ivafm5bqasam2u"
Content-Disposition: inline
In-Reply-To: <03b5a671-e0c0-4d18-a103-e7f0ab18e20e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_021329_063475_63460217 
X-CRM114-Status: GOOD (  18.99  )
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


--h3ivafm5bqasam2u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
MIME-Version: 1.0

On Mon, Nov 25, 2024 at 10:40:22AM +0100, AngeloGioacchino Del Regno wrote:
> Il 22/11/24 10:20, Maxime Ripard ha scritto:
> > Hi,
> >=20
> > On Wed, Nov 20, 2024 at 01:45:12PM +0100, AngeloGioacchino Del Regno wr=
ote:
> > > Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> > > found in MediaTek's MT8195, MT8188 SoC and their variants, and
> > > including support for display modes up to 4k60 and for HDMI
> > > Audio, as per the HDMI 2.0 spec.
> > >=20
> > > HDCP and CEC functionalities are also supported by this hardware,
> > > but are not included in this commit.
> > >=20
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> >=20
> > Just a heads-up, you should really be using the new HDMI helpers, it'll
> > remove a lot of boilerplate and potential bugs.
>
> Hmm... the state helper you mean? Or the inflight series from Dmitry?

Ideally both, but targetting only the former would be great already :)

> In any case... yeah, you're right, let me check which helpers I can
> use: that's going to be done for v2 :-)

I think the scrambler support would be great to add there, there's a lot
of bugs in most drivers. If you feel like it :)

Maxime

--h3ivafm5bqasam2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0RNvwAKCRAnX84Zoj2+
du1BAYCjKyk+nF1tolybBaGVQDKxzLMP0aXHCAkIJNAu09aAHat9Y0MhN/kPIBXf
tfkB+7MBfjQt2wnl1ouI79g9WFI8G9PRbpuZNHwGd7TOzG9Ro+rG6xY9J8nMPV8N
WxjwIWRu/g==
=mo8X
-----END PGP SIGNATURE-----

--h3ivafm5bqasam2u--

