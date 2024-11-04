Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C0CD1BDFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 21:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ge7cZ9ZbzoR8ao8b7oGum7vK7hHAW59mt0jCVyFPlis=; b=nc7MAwRHTHhx0HRy1Xdg+OONlv
	Eo6E/WSKBPsffVOPFgia5f9B6MazYrlLeopPmlxd0cdlMDm9sRc+W1XYZrZfHiEU5bGWu+2eeeMxm
	qRMH209rSPhLv13NuvM1KXF4n/AAwquEoQCJ9qpnxjhepSIRjRLI24f3kI0fKgzQTD0eu1Rs34TQw
	jbI0JAv4mVYdY74kwfFOCUZAS1XOdJDkiZg6hw2+p43gS4P80VQ4Iu/LKbAhyrO5VXpQ9H0XDZ62W
	24ayu9q1GGkrap9qT4IpWY2DQdVogfLn9ez+XTRLS0o+Ykw6LvO85Co/e6rYMs+v4rOgs+oYWuuCW
	WBOogemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t84mt-0000000FC4w-272c;
	Mon, 04 Nov 2024 21:39:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84NC-0000000F7Lf-2FFs;
	Mon, 04 Nov 2024 21:12:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 401875C55C5;
	Mon,  4 Nov 2024 21:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC93C4CECE;
	Mon,  4 Nov 2024 21:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730754749;
	bh=Ge7cZ9ZbzoR8ao8b7oGum7vK7hHAW59mt0jCVyFPlis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnVXECTHl2d+Yh8Hee++kEQr98gw8XdgecRqVNdWREggQWAkBRHHq7B8eZ4HV0mdH
	 t6eKgu5p8k3PhjbmfHlxy9Y5SDAFP/uUtmYVT1tEecHuzlvH6eXKLoQ7CN6OJXHGzD
	 1LoYsgokBL0q1187pOGSqiMTVkxknbFkKn94l7jvdl+2v71UuaCRXi0QydVJdlNrOg
	 yluv3wPSNWyJalJ9p4K+PoTHsEtFAOTIohOuBD9+ZYHA6fHLwRTX9MIM3/8Y/GaIx1
	 5HZ6HHZBvIisEMb8CI+TwDRFVwSf28+Nx4XHOMkwvV4LnJNQNXFsLR4umfUnIblTLt
	 ZPFOLsOEYz+dg==
Date: Mon, 4 Nov 2024 21:12:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
Message-ID: <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
 <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JSrXVVE4KL1bPTNt"
Content-Disposition: inline
In-Reply-To: <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
X-Cookie: The meek are contesting the will.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_131230_654447_B3B75B3A 
X-CRM114-Status: GOOD (  11.19  )
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


--JSrXVVE4KL1bPTNt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 04, 2024 at 09:06:26PM +0200, Andy Shevchenko wrote:
> On Thu, Oct 31, 2024 at 12:27:25PM +0200, Andy Shevchenko wrote:
> > Update header inclusions to follow IWYU (Include What You Use)
> > principle.

> Hmm... I think we are waiting for somebody to Ack / review this change?

Yes.

--JSrXVVE4KL1bPTNt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcpOLcACgkQJNaLcl1U
h9A+Xgf8DL0xbsC9QTvJ6PRG9kwZT0mqrDxTEqD2aa7uKL/BWe/4iYsDhzva68pJ
kMULqD+2acYoXMapAq5yXLcHKceCj0yGRUegY3xin06Qn5mxAIqq/+kUXwSYxHZ6
GRZcB6QZZYIjuxMGbSFBbFYIU/yar28WL1JWFDoE8uLljBz0LeW2RHEqRgro6FnZ
pXqcXsV9o7gruTH+FWeQukJ6yc2bun7IA2UQRrtFSW43u4lKNNv2IIweXu2hcek6
lCq0OTQSDcK3wwTOKivjHm2e61Rxz0XWwrnHD4+94UZiGmvUITQWEeyBpgkZ72w1
/UfnNCQ32IQc9tb3VECJdVgZekfXtA==
=xe2s
-----END PGP SIGNATURE-----

--JSrXVVE4KL1bPTNt--

