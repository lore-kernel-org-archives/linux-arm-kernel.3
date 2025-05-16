Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48694C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gfor9njBaRUlTG2E36G0WUNtL/s07q6oAid953MKalY=; b=bqWexvkbsJOjIXaS9j8cmFA9Yh
	o618aRm3Q5nDx41cKAUWpbytf7WJSYpj2MlJJ57pYsSoL4nl++60V6zBJmzok96ABIPM9HVCXdFUa
	hkymQqCh1XWuKbGGtS4Bn0SqrQxX+olDdAKiK0G1asZZOGBO6fhBH2jkVLr7UwFaFPkgsjHFjrvSk
	id6gz/oMId2OvTBRSlEStefkYeAHOfRtWtty2piqKhV/6oNyQn0u8urJIlj+jSq9L1BMsnCFwHM7V
	STh4zHV1nhdMmJp6Zw0iqtEqBNjk47APWTtOf85IdfPH7H/qiX2eDEKvr9mAxHPdPedsMjUty9Yn9
	PQ5vDKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwpg-00000003pLm-2hjV;
	Fri, 16 May 2025 15:18:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvr6-00000003dgz-0YwQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 14:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59E8E61155;
	Fri, 16 May 2025 14:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE996C4CEEF;
	Fri, 16 May 2025 14:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747404967;
	bh=Ir57TohQL0KRns31TnG4/ir/T9F377bTIMsPI537Qvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nu4aWrEUI/5uqe3wKQxK2G6ddxYztWjS/tlakBcslFmqlFhuQN5AyNPn9DzFhqYzM
	 ay2//QXgJHaZg1ZxRohNy+0nkyXTzH/WvIhyse573PEawRazrkmsEiETzNQSo4Q+Ew
	 QhMH+ZaTf7WhesfSL3ZHBc8SKs5k3BeAznCujNNgcPvj2G4JQGxnlMh3JXxxCzxap3
	 Q73YUlGBAMfg+FzSiqqzMQDGqdVYtaGAVpEJLCenbTwomlPfpm5hrfngsdkOBL/fh8
	 rCbu5moP6gIhSchaimz5vKWCoV4pcr1PMKr60iFgQhiasQInQJmGHrnynyfqmIEfxM
	 GTvu0t7jA9+cg==
Date: Fri, 16 May 2025 15:16:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: allow dma-coherent
Message-ID: <20250516-exclusion-suffocate-94a1c87c1262@spud>
References: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="++J8wUPqIH71Ph6D"
Content-Disposition: inline
In-Reply-To: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>
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


--++J8wUPqIH71Ph6D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 06:48:36PM +0530, Radhey Shyam Pandey wrote:
> On Versal Gen 2 SoC the LPD USB DMA controller is coherent with the CPU
> so allow specifying the information.

Sounds like it should actually be marked required on this platform, no?

>=20
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Doc=
umentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> index 379dacacb526..36f5c644d959 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -26,6 +26,8 @@ properties:
> =20
>    ranges: true
> =20
> +  dma-coherent: true
> +
>    power-domains:
>      description: specifies a phandle to PM domain provider node
>      maxItems: 1
>=20
> base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
> --=20
> 2.34.1
>=20

--++J8wUPqIH71Ph6D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCdIogAKCRB4tDGHoIJi
0iOiAQDWypdVROV/PgOlz0vB9+pT8ItFOLzc373ZCWhYPG4v9wEAs590WVLjPkDS
zFLXLiN0iThggG8xi6fqQW6pQFIthgs=
=2pq7
-----END PGP SIGNATURE-----

--++J8wUPqIH71Ph6D--

