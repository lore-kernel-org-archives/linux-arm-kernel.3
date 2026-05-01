Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E12CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVmoK4JO4RI/G7aKQ2BqkJVjM64PAZNOdybgLpeuzUY=; b=S49kCXhZg8OEX/Mpqd34rp0Zxw
	kjO4lUTb3pNulQpuG/XApfOV/sXXZNTgQZCSAqUuwEr0z9BET6VigR6K3KqmiF103vec1aJhykM1d
	taU0kn/zTb9xlQihtBoiJ0uaxJIAXguzHQMjmJGq+AA7EbMNYYjs2ROaVXDo3z5MWnmaDr9Dw7Qtg
	AT2mKduRLKFOmjfUfjDtP1JKkeytz5QSHm5uhkdHbojXAbtlFj5V+n7c4g+uPY1zAEIdSEOO7uG9d
	4EVAH79QINLfjCGyDvym0QPKOSld9JUPg/H4XzvBFq46wf9QCunR63vi1W/3v5aXIK8jT4/5wiXg7
	ZHiewlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIq7A-00000007Ms4-4B3W;
	Fri, 01 May 2026 15:49:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIq7A-00000007Mrx-1QxP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 15:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA66F600AE;
	Fri,  1 May 2026 15:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B8AC2BCB4;
	Fri,  1 May 2026 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777650554;
	bh=kEBptyWNUcQXhlahaz6HoRE5/fku/pmWiKKe01rKllU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tel3gBT4JSk0jv3KMGWE7mVrkHtzK2MKnzUrBGYWelV/7gOOjIDUF+BEESuuGQymP
	 tL88eDhiFN3uLgtvxxg/sVOMP7if3SLODr36cwQzC6bYutQ9U6BPcLD+MLPBrukVrv
	 zvw1O/MSHZuB1qVRlHOAUwJTRVreiDJ7To8TVtrKcAP42LrUxu3w7wyfMJFVFW3Q7d
	 HFvERFzvdMuyblmh5NuMIxAdxi1FpYxfaTKeWqksHpXUlqQAcIaL2v3DgEzk/JtPa5
	 1Xn1W6/duJDZnHnUAygtsLK4wEK/m3fdKDpbZ9fEIfXCiqfiYxDEC3A/kjKZM4OIzh
	 YxJM9aZYZnsvw==
Date: Fri, 1 May 2026 16:49:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	ben.levinsky@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: xlnx: add firmware-name
 property
Message-ID: <20260501-strudel-sample-ded4d3ebf58b@spud>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-2-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iQ7bHvBbkiCwQUvk"
Content-Disposition: inline
In-Reply-To: <20260501143707.1591110-2-tanmay.shah@amd.com>
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


--iQ7bHvBbkiCwQUvk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2026 at 07:37:06AM -0700, Tanmay Shah wrote:
> The firmware-name property indicates which firmware to load on RPU
> during the Linux boot time. It is possible to stop the RPU after boot
> and load different firmware and start RPU.

The file supports 3 devices, do they all support loading firmware like
this?

>=20
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5f=
ss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.ya=
ml
> index ee63c03949c9..ae63c3e39ced 100644
> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> @@ -135,6 +135,10 @@ patternProperties:
>            - description: vring1
>          additionalItems: true
> =20
> +      firmware-name:
> +        maxItems: 1
> +        description: default firmware to load
> +
>      required:
>        - compatible
>        - reg
> --=20
> 2.34.1
>=20

--iQ7bHvBbkiCwQUvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafTLcgAKCRB4tDGHoIJi
0mgxAQCSN4vfXjReAU+odS32cFAbDxJepqbnJA6xsu0KLX7ffQD/RYD82fvE6AdC
JHdDzDSRHvKGzsddkWaMtCbu/yMIQwQ=
=536k
-----END PGP SIGNATURE-----

--iQ7bHvBbkiCwQUvk--

