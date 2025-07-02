Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F51C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AR2YdjUQDruKw3xwEOLHDbUEwgTRlLLrLUuQcRkPcwk=; b=IZlOfV7yfonOdbGM4jroT9dJ2Q
	1Ebgi6pNKQMbkxhtvBxaF5/VQgALbQUWldCsi9buMwCoknIKicI92VEeL4zmG+QZW3IS91Q4snLoa
	FVuxYC8G6PWhxw3BuPRkVaiWVRMUEyf6z4klfRiHS8xABxH3RBEBXMglu3yLstJi4zTD4J5EXhuFT
	5Iv3yV3k+Jqz4Kh9dH8+82r3mIlypTtWtQzhJfvg+AW1Wmz20xxe2VMH10NPmNUGGfi0Rkqc7uwmk
	3vNm0sdJAemCvb4yiJu7G+fHiEOD+1NPS6OCtlpE1RDL+R6GAKWBguxGmIWevcOhWyd/B9dxmBV+n
	VQKlFhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwV5-00000008IgS-40sM;
	Wed, 02 Jul 2025 12:23:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvlp-000000089Vl-2ESO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 11:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B4615C6C22;
	Wed,  2 Jul 2025 11:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E239DC4CEED;
	Wed,  2 Jul 2025 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751456216;
	bh=AR2YdjUQDruKw3xwEOLHDbUEwgTRlLLrLUuQcRkPcwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mF+MxsfngCXb328CwhUUDfE58INzeO/02EHWhYdfq92zRhxhdu9m3eJy38g/Z2+my
	 PEo2RicQ5A29nvdeyqkEhYXmYPboIIoBnvwoyjTo33CStZrq6JwcxbeXINWGNT7z3f
	 V0h82qzbUvYiU0/w0GdHs6pl8GqKnD7kpM5FIhdB/O3UqCLfHOsR83L6FB+gFjKTY0
	 VvjpbF/cL+u6rtx027/kfZy2nlIfRBljuP/L2/yJYG1Tzj1L1m4ah1WTAD5SV3yc9C
	 atIKqU3Z259Hwdsi1bfTag54achQvlF3vPxb6tcJRRGnxMXaQac8Pe1qjRKwYG5wv2
	 f6PbOLbcQg9gQ==
Date: Wed, 2 Jul 2025 13:36:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>, 
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
Message-ID: <20250702-psychedelic-stalwart-jerboa-a626eb@houat>
References: <20250701201124.812882-1-paulk@sys-base.io>
 <20250701201124.812882-6-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="v4szwvinjjahevo3"
Content-Disposition: inline
In-Reply-To: <20250701201124.812882-6-paulk@sys-base.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_043657_664308_BBCC168E 
X-CRM114-Status: GOOD (  24.79  )
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


--v4szwvinjjahevo3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
MIME-Version: 1.0

On Tue, Jul 01, 2025 at 10:11:24PM +0200, Paul Kocialkowski wrote:
> The DE mixer clock is currently set to run at 150 MHz, while the
> Allwinner BSP configures it at 300 MHz and other platforms typically
> run at 297 MHz.
>=20
> 150 MHz appears to be enough given the restricted graphics capabilities
> of the SoC (with a work area of only 1024x1024). However it typically
> causes the DE clock to be parented to the periph0 pll instead of the
> video PLL.
>=20
> While this should generally not be a concern, it appears (based on
> experimentation) that both the DE and TCON clocks need to be parented
> to the same PLL for these units to work. While we cannot represent this
> constraint in the clock driver, it appears that the TCON clock will
> often get parented to the video pll (typically running at 297 MHz for
> the CSI units needs), for instance when driving displays with a 33 MHz
> pixel clock (33 being a natural divider of 297).
>=20
> Running the DE clock at 297 MHz will typically result in parenting to
> the video pll instead of the periph0 pll, thus making the display
> output functional.
>=20
> This is all a bit fragile but it solves the issue with displays running
> at 33 Mhz and brings V3s to use the same frequency as other platforms,
> making support more unified.

It's beyond fragile, and doesn't have anything to do with the DRM driver.

You should set up the clock tree properly in the clock driver, and then
add NO_REPARENT to the DE clock to make sure it stays that way.

And then, you can change the clock rate if you want to, but at least you
don't set a rate and hope that the side effects work your way, and won't
happen again.

Maxime

--v4szwvinjjahevo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGUZ0QAKCRAnX84Zoj2+
dkUOAX9QETvGjudIqLH1LHrODK1oz9R7fTZgMW27nwd0xCKcdeLTvQKST2uEzWle
vJapl8MBfAx2o6ST5tt4OTYqAlQbnHgSbySZjkHgRUqtZhP/pvQc99/anfjE9qN1
3VMToXuhRg==
=p0B2
-----END PGP SIGNATURE-----

--v4szwvinjjahevo3--

