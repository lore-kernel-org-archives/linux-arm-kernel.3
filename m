Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3EAC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 08:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hepHrFJcxPhVYRiPOJOyKOkDEQoWQDlVDHhDmnPdRfY=; b=PdUP4iMf6Ok1WOS7S/B5FCESdS
	9L4u7k9XjOgPD/ldntSbttW3IW8bHAxPJtfJZf2aOjAnb4KbTBrNXW3RW1OVPtHeecxwrJsC+zyc4
	fx3lkiN6ElrbOGBP3Z3nd9GFbzVlgkp+WF6/ne6EKGrZeoTWgZIHI+fcXHHfrP9IhM+W3fucYlQ4M
	vsn47hLOmfc9ai1DiNFpxf8EUvdjKcLBH/9ZjJhfAtUlwVvsA/XkHyTX7zhw+rorQLJjlFN1OPCy+
	6CcKgJ8RDoe3gzmhi6+ec3Sm2jjDKZBHh6uB/tR8BYwzQfHbA4HsYR1f7a7/vIqxgkB2qo0Pcee7Z
	wArTHCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXrL-00000000m41-1bJQ;
	Thu, 28 Aug 2025 08:19:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXdW-00000000imG-0Ksy;
	Thu, 28 Aug 2025 08:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD1C54027B;
	Thu, 28 Aug 2025 08:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37569C4CEEB;
	Thu, 28 Aug 2025 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756368331;
	bh=Szqu3ISPHcSpDClnU/NQVEOhbXjcDa2CwfQfHM2oTVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gMnagQH3MSE3OCmKYpRsd8lUsxpc8Ung8Xj9N13IShaXG1JpVQ17BGz/vZbJ8ayia
	 JATXdShQIFwJtWM16pujBqztN/HTAHa1eI1ruO392vGQ5bcnBpM/XVuQPAhLb+epfg
	 l+vq7JbmIEiI0o7x/Jv6L4M7n+VVeNbukGTI3/GpD9kQYUwecJAhxnypY82JF2OpgN
	 OpDKH2Xbm6L24Rh++PCS5s0FIDKVW188ch6qzc0yfxjVB+EvXvlGjVysaI9/dnMl9w
	 EBrj1g+TwpS5VfAtcAXeVX4ofcMrlcOTM6deJOEiGJCGib96kXayOKOspPBjlGlk7s
	 hAB3OigOpxutA==
Date: Thu, 28 Aug 2025 10:05:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Andy Yan <andyshrk@163.com>, heiko@sntech.de, hjc@rock-chips.com, naoki@radxa.com, 
	stephen@radxa.com, cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org, 
	Laurent.pinchart@ideasonboard.com, yubing.zhang@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
Message-ID: <20250828-tangible-wakeful-coati-ec27d1@houat>
References: <20250822063959.692098-1-andyshrk@163.com>
 <bochli5u37mhc6eup7h2oz3yeignofbbj4k5nrvm2k7zf6f4ov@t2sje4gmveqa>
 <d040da3e-501f-45d8-bcbb-95fa77e94a59@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ymx6junihpockhkm"
Content-Disposition: inline
In-Reply-To: <d040da3e-501f-45d8-bcbb-95fa77e94a59@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010534_708298_F123635D 
X-CRM114-Status: GOOD (  30.03  )
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


--ymx6junihpockhkm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
MIME-Version: 1.0

On Thu, Aug 28, 2025 at 09:50:34AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 28.08.25 um 00:24 schrieb Dmitry Baryshkov:
> > On Fri, Aug 22, 2025 at 02:39:44PM +0800, Andy Yan wrote:
> > > From: Andy Yan <andy.yan@rock-chips.com>
> > >=20
> > >=20
> > > There are two DW DPTX based DisplayPort Controller on rk3588 which
> > > are compliant with the DisplayPort Specification Version 1.4 with
> > > the following features:
> > >=20
> > > * DisplayPort 1.4a
> > > * Main Link: 1/2/4 lanes
> > > * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> > > * AUX channel 1Mbps
> > > * Single Stream Transport(SST)
> > > * Multistream Transport (MST)
> > > * Type-C support (alternate mode)
> > > * HDCP 2.2, HDCP 1.3
> > > * Supports up to 8/10 bits per color component
> > > * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> > > * Pixel clock up to 594MHz
> > > * I2S, SPDIF audio interface
> > >=20
> > > The current version of this patch series only supports basic display =
outputs.
> > > I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the A=
LT/Type-C
> > > mode was tested on Rock 5B, DP1 was tested on Rock 5 ITX by Stephen a=
nd Piotr.
> > > HDCP and audio features remain unimplemented.
> > > For RK3588, it's only support SST, while in the upcoming RK3576, it c=
an support
> > > MST output.
> > >=20
> > [skipped changelog]
> >=20
> > > Andy Yan (10):
> > >    dt-bindings: display: rockchip: Add schema for RK3588 DPTX Control=
ler
> > >    drm/bridge: synopsys: Add DW DPTX Controller support library
> > >    drm/rockchip: Add RK3588 DPTX output support
> > >    MAINTAINERS: Add entry for DW DPTX Controller bridge
> > I tried pushing patches 1-4, but got the following error:
> >=20
> > dim: ERROR: 5a68dcf5837a ("MAINTAINERS: Add entry for DW DPTX Controlle=
r bridge"): Mandatory Maintainer Acked-by missing., aborting
> >=20
> > I'm not sure how to handle MAINTAINERS changes (or whether it's fine for
> > me or not), so I will probably push patches 1-3 in a few days, if nobody
> > beats me (or unless somebody points out a correct process for
> > MAINTAINERS changes).
>=20
> That warning has been added recently to make sure that patches do not get=
 in
> without sufficient review. It's overly pedantic, though.

It's not "overly pedantic", it follows the contribution rules. I'd argue
that, if anything, we've been overly tolerant with that kind of
practices.

We do have a bug with handling MAINTAINERS changes at the moment. But
everything else shouldn't be ignored: either patch MAINTAINERS to
reflect the actual contribution path, or get the maintainers Ack.

> If you're confident that you have R-bs from enough relevant people,
> push the patches with 'dim -f' to ignore the warning.

And let's not just advise that either.

Maxime

--ymx6junihpockhkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLANyAAKCRAnX84Zoj2+
dvcTAX9rZO7QwXxbtcVqDnn23mh2i9KEU6GCe3pKfMrxhyxr/xeu+2p/6ozBtwvy
dnuUOUwBgO9N54kfuFqmTdfZIBhi2RTQ4iuHn4jAnfkBH1wkyB6OhyEze6gnXwEZ
eUsIzifPzw==
=bTVf
-----END PGP SIGNATURE-----

--ymx6junihpockhkm--

