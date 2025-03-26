Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2328C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 18:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxUE/Ikn8dIyONp7AHvxCIRpkDdsmt382WiNhKJ+hx4=; b=Wh153zJtaCdCJS8ubf6Az/5LOQ
	6eoUADTa8kZvP48JuNYaKUfpnbUoPy/mxFT4Y0dEJ3Jo1AgTkIHs7tLN7tP62pmmoS8BJGCce6ucb
	49lK4PpldCIDlXTzM1EgU+llMCQemeS8MlSIbPrMkznDrfLCWH4ntmUh2YdQr0EG5GJqKgejKMX/A
	T77bqfRil9vswf7Wbf3J4d6DMS7ipU8nB7qOE+Wi6PKDT5LLoy8ZK6wwGtSqZmvQz9B9KcqCCq2EG
	rxqM+qsFMuhmb0ma0T/EaK/0jPSCe4bIkdMfdjLr6xX4TtX7Z5djOJseiOrurxfrZG7uA5t3t347B
	t5wVFCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVBi-00000009Jpm-16lB;
	Wed, 26 Mar 2025 18:09:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txV5X-00000009IsL-1Svp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 18:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A034543F32;
	Wed, 26 Mar 2025 18:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80658C4CEE2;
	Wed, 26 Mar 2025 18:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743012170;
	bh=mCdk+P8p/pxLv5pZKLEF1MRBDsB6k071tpMVyXHg/i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DU7uG78fcayWWNWGPZI/LxhjRwbFf0OsHTKN4h0TxpNI2BotBiazAwhqSsBUSEUdk
	 s0GEk4PlA/khBLWS4nU/7WwdUecp7PpFI7q8xzTAtXJPGitYLtujmRDpWCa6gcv/IJ
	 YoSyWDmxUPC+kFOcxZeznrHy8OWHsUAk2ObcAf6QMJIQvcmetYj6AQOYWW9lunG19T
	 wuATgZm+59mKhninq8V0pcIex+Z3GIJEsvBsLmiXHkyYg0sDwaQdsxhdutn+IV9Cjf
	 vVLKSp8qm2KGES6cIk7mqRJA2tjZqedN9Iu5ZY1jw5hzW2LHbcddY8+ee6Tps7wo7N
	 IXK21x5v7Wgbw==
Date: Wed, 26 Mar 2025 18:02:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: stm32-rproc: Add
 firmware-name property
Message-ID: <20250326-giblet-endearing-cd76a00c6077@spud>
References: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
 <20250326083912.12714-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pIJa1m7h2upDJxWu"
Content-Disposition: inline
In-Reply-To: <20250326083912.12714-2-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_110251_406629_D040CAC5 
X-CRM114-Status: GOOD (  16.32  )
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


--pIJa1m7h2upDJxWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 09:39:11AM +0100, Arnaud Pouliquen wrote:
> Add the 'firmware-name' property to the remote processor binding
> to allow specifying the default firmware name in the device tree.
>=20
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.=
yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 370af61d8f28..a0a16bfe8ef7 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -139,6 +139,11 @@ properties:
>        If defined, when remoteproc is probed, it loads the default firmwa=
re and
>        starts the remote processor.
> =20
> +  firmware-name:

> +    $ref: /schemas/types.yaml#/definitions/string-array

This should not be needed, it's a standard property, no?

> +    maxItems: 1
> +    description: Default name of the remote processor firmware.
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.25.1
>=20

--pIJa1m7h2upDJxWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+RBRgAKCRB4tDGHoIJi
0vE1AP9J58xanH9W6GTrEbCuKn5eu2aDyiiSA/vp2NtSg8fYyQD9EWt7Ndn+h+NW
CEY02RuwuVdniaCzT+U+CADdHf+7SgQ=
=4xuG
-----END PGP SIGNATURE-----

--pIJa1m7h2upDJxWu--

