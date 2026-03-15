Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B319FD58B1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNaQ0BsHiddXMrjewzicJZlRsUVWB3SEJXeHCB8rjO0=; b=yPyBgI721hIwnSJBd3vRrofJ9o
	gFQb/tjR+SIbFbzgEYQPvFEBCqFU6nYXXtzFVd9x/+BrRzvf6rtEO4poHfQYZOVpocLubkrhbFilp
	gG4Z1PvAIOA51C565ebgdpXiXBrekiIrS9gHJy7Umkg70bZ0DnEZeAx548DeooxjboSQhNU5knxm9
	m+HqHmxGG8pVZqpE3qXzGtN7XaaAEJL/YU7uXGVCBGmXGNFdKSWcIZaS+gTCtJ7lIj6q/wgqaFA7h
	zWaY6E43yCKh3Wk+xrYmVSirSesPkeyyUUbKe7ZF7yZv7t2Q4afN9VccmsdalxLJMtSNd2k6OcMO2
	sE9sv0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1k8e-00000002aEN-2pBL;
	Sun, 15 Mar 2026 12:00:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1k8c-00000002aE0-184c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 12:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2C46441E4;
	Sun, 15 Mar 2026 12:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A802C4CEF7;
	Sun, 15 Mar 2026 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773576003;
	bh=lxBUJrkmPutJFyxxYY70RzA9EEjz2HZtBHDF1SXNhSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKR+ab0ToiqNTWHpKevrNoHmxXta5IWsylx4pb44fX5XqPvMbmQdoSi45r/SNZQHO
	 FiHWz1aW6F1/GRsXBMo5cQ+vVfHY31Cz9vhCcZOTHkM/2u03BGcEfZOQ4yolbi25hQ
	 C/8jisi6ZNiGM4sYsM2F9526x2p57/Bc/grnhD7or8acqDw04GHj60CD99qpf9eID2
	 t8bZAcPn/NIkG4RNO0y9dAxN9JVSVX51LFnAS2Zmvll6IAOjYN5mFVjcVRjadgUOTR
	 H4Z7aJuO1Wb8RYawDlPSgKkqdnZfpuv3ZNNJqGyss7IDeGNn4z/8zsWdOW5IEUJ3A0
	 bpn2/qreyo1Jw==
Date: Sun, 15 Mar 2026 11:59:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
Message-ID: <20260315-rebel-catapult-fab5d4e77349@spud>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
 <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>
 <20260313-quantum-modest-prawn-896bde@quoll>
 <DH1P27ZP9QYQ.2IP3X8G218GR8@baylibre.com>
 <849c07bd-2f8d-4982-b5cf-c336807ab8ed@kernel.org>
 <20260313-kettle-craftily-aa087e6b74db@spud>
 <DH2KR1W7CWZW.35FWVV4MNS0NE@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5s+wKzVm3gU0jb2w"
Content-Disposition: inline
In-Reply-To: <DH2KR1W7CWZW.35FWVV4MNS0NE@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_050006_356073_59A0D174 
X-CRM114-Status: GOOD (  41.51  )
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
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kendall Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--5s+wKzVm3gU0jb2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 03:28:25PM +0100, Markus Schneider-Pargmann wrote:
> Hi,
>=20
> On Fri Mar 13, 2026 at 5:18 PM CET, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 04:49:14PM +0100, Krzysztof Kozlowski wrote:
> >> On 13/03/2026 14:38, Markus Schneider-Pargmann wrote:
> >> > Hi Krzysztof,
> >> >=20
> >> > On Fri Mar 13, 2026 at 2:13 PM CET, Krzysztof Kozlowski wrote:
> >> >> On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann=
 (TI) wrote:
> >> >>> If memory-region is used, require memory-region-names.
> >> >>
> >> >> Why?
> >> >=20
> >> > This was a suggestion/comment from Conor in the last version:
> >> >=20
> >> >     Is this really optional? Shouldn't it be made mandatory so that =
it is
> >> >     easy to tell the difference between the two configurations?
> >>=20
> >> Then write it in commit msg. You have entire commit msg to explain why
> >> you are doing things, instead of obvious what. We can read the diff.
> >>=20
> >> >=20
> >> > https://lore.kernel.org/all/20260303-hesitate-preoccupy-5e311cbd3e58=
@spud/
> >> >=20
> >> >>
> >> >> I don't understand also why this is a separate change, but maybe an=
swer
> >> >> to "Why are you doing it" would cover it as well.
> >> >=20
> >> > I made this a separate patch so the git tree never has any
> >> > binding/devicectree warnings for memory-region-names even in-between
> >> > patches. That's why I created these patches in this order:
> >> >=20
> >> > 1. Add the memory-region-names as an optional property.
> >> > 2. Add memory-region-names to all users of memory-region.
> >>=20
> >> So what is the point of this if it is optional? IOW, what does this
> >> commit achieve? Almost nothing.
> >>=20
> >> > 3. Make the property required if memory-region exists.
> >>=20
> >> but only required here? You need to organize your work in logical hunk=
s.
> >
> > My rationale for my original request was that the meaning of the second
> > memory region is modified by this series. Previously it was always
> > "firmware image sections", but now it can also be "IPC resources".
> > Nothing changed in terms of the number of memory regions (it was 2-8
> > before and 2-8 after), so without making memory-region-names mandatory,
> > there'd be no way to tell which of the two configurations are being
> > used.
> >
> > This patch should likely be squashed with the patch adding
> > memory-region-names, so that it is easily to provide an explanation for
> > what's going on.
>=20
> My goal was to not introduce any warnings in any of the patches.
>=20
> That is the reason why I only added the requirement for
> memory-region-names at the end, after adding memory-region-names to all
> users.
>=20
> The alternative patch order as you suggest is:
> 1. Introduce required memory-region-names
> 2. Add memory-region-names to all users
>=20
> After patch 1 there will be new warnings about memory-region-names
> missing for every user of r5f memory-region until patch 2 is applied. I
> can happily squash this patch into the patch introducing
> memory-region-names. I can also update the commit message to describe
> why I split the patches this way.
>=20
> Let me know what you prefer.

Personally, I don't think that transient warnings that won't appear in
linux-next (just in the individual trees) are worth splitting for, when
the split is artificial and goes counter to explaining the motivation.

--5s+wKzVm3gU0jb2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabafOQAKCRB4tDGHoIJi
0vmlAQDXTszQ/SaIi996hoyGcUzmvmQKd9smF0NlFNXUhneLxgD8D/pzwTGw2Npz
4bEHbuKvDetJcOngtdSmF0DE0DVTsg8=
=rQWI
-----END PGP SIGNATURE-----

--5s+wKzVm3gU0jb2w--

