Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B9DCD3443
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6/tMmYTq6DtnatvcoDchlsCVFmwM4BWTs/6gz+uuGI=; b=uX0ZPpJWsg/Fx3B/sqDal5bRPR
	gjzeCgVTvhFUXou5MayjseTSzfzW+bMCuuBj70ixGA9LXdtwGRcIstQ4DakJWQjWcjKeRf0w7bsqN
	FyAefj/aLG/6qjogWSp0uMlD1nRCMYy7HV8mCt+jFjL9vVnf+qZdQUBM3CrTjdWyOYcSBkIaaBewb
	Ml5OQhz9LdseU0EIjrtC3l82e+goibaie44dvkQSghNjpLzobzPSFr783aGnnDRFogTgxVw+s3/v2
	jh3RwmIxMHqvvGBpcWzIQJALNHb6Fds+ZzT+C5uh2Nen6OJlTIosvdJDSdeSeL1TlgHB/X62NLyeH
	/Fh8yZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJGCE-00000009P1P-2wRR;
	Wed, 12 Nov 2025 19:07:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJGCC-00000009P0z-2GCk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 19:07:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B193D4444F;
	Wed, 12 Nov 2025 19:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580F6C4CEF8;
	Wed, 12 Nov 2025 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762974475;
	bh=4X5km6tMQI+rmQ+2RA+kgRbD/MaASgUWl21z9NvFxCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEVCNybnc6t6289XVBYkcWqOoxpXqCnrLBLYLoiHlIbKyjkbGJommYxYZ4GvUKdzk
	 RvCaaYP4cH5e7LLxqfEh/U5J3NbcNb9zsGx7irU6L2ggZu686KokOvrxociihCrdz5
	 dJwld8Pz0SSqtx5kTdGzsQdfnbx8hipENl9Wi6lNZNvCXnCb9b5gngZtmYSqEKO6wj
	 5nkefY3+3deZoLjCDjmW1duP1O9r17D6AOg4pER2uFLTODAnUbspPTpahmODQvVy32
	 cdL9DSF+KFzEqfM/EGASoFTjqu4im0ljDP7j6qlpVZV6ov6xCd8GSzIZLOvBJkNhd/
	 +2SZ5Fb6iN0MQ==
Date: Wed, 12 Nov 2025 19:07:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: Describe the reset
 constraint for the versal platform
Message-ID: <20251112-bagging-diameter-4ebab1f9ed45@spud>
References: <20251112155430.1326426-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="92AFPMtx3g8andt7"
Content-Disposition: inline
In-Reply-To: <20251112155430.1326426-1-radhey.shyam.pandey@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_110756_620560_2BEB9D2B 
X-CRM114-Status: GOOD (  15.30  )
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


--92AFPMtx3g8andt7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 09:24:30PM +0530, Radhey Shyam Pandey wrote:
> AMD Versal platform USB 2.0 IP controller receives one reset input from
> the SoC controlled by the CRL.RST_USB [RESET] register so accordingly
> describe reset constraints.
>=20
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 43 +++++++++++++++----
>  1 file changed, 34 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Doc=
umentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> index 36f5c644d959..cd0cc9da242f 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -50,17 +50,22 @@ properties:
>      description:
>        A list of phandles for resets listed in reset-names.
> =20
> -    items:
> -      - description: USB core reset
> -      - description: USB hibernation reset
> -      - description: USB APB reset
> +    oneOf:
> +      - items:
> +          - description: USB controller reset
> +      - items:
> +          - description: USB core reset
> +          - description: USB hibernation reset
> +          - description: USB APB reset
> =20
>    reset-names:
> -    items:
> -      - const: usb_crst
> -      - const: usb_hibrst
> -      - const: usb_apbrst
> -
> +    oneOf:
> +      - items:
> +          - const: usb_crst

Why do we need all this oneOf stuff if both have the same first reset?
Can't you just set minItems: 1?

> +      - items:
> +          - const: usb_crst
> +          - const: usb_hibrst
> +          - const: usb_apbrst
>    phys:
>      minItems: 1
>      maxItems: 2
> @@ -95,6 +100,26 @@ required:
>    - resets
>    - reset-names
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,versal-dwc3
> +    then:
> +      properties:
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
> +    else:
> +      properties:
> +        resets:
> +          minItems: 3
> +        reset-names:
> +          minItems: 3
> +
>  additionalProperties: false
> =20
>  examples:
>=20
> base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
> --=20
> 2.34.1
>=20

--92AFPMtx3g8andt7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRTbBwAKCRB4tDGHoIJi
0jX7AQCAHa54UizRxsLeHp9VJzAq+vFdLs6YxvkaigFx6sowxAEA+An2kZel0I/A
Ftl+wdLtzBFFGVzZh6cSv2qGpvIuVAU=
=Er4U
-----END PGP SIGNATURE-----

--92AFPMtx3g8andt7--

