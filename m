Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55676106ACD7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTQJeusSuIuO9m60Ig5K6NHxUSreeCyAh8DGp2ovulk=; b=vkKcNVJ6qAKQ8uPCdPcECzqd2+
	5/EYTEF5vyd4aQqS8h99vfd4dviH2l6z/yTha7/9RLDKeN9zerarYKFxoEuEUsVlD2YH3EYAOOuv+
	jQ6tHZctJVrKPEn76JxkDBPKreI/lNHpXP04cbJ9iM2UyN9J6aDTOD8AbSETK1JNNkbwiA0zj/Grf
	lBtbwxPrlpqDoA3mtuwK+PHZIzoBEX3G0znFPvSNreaNIet+EoYjfIdxiPaVYDfVGTxNGaV+nNrF4
	xcdPYUvE1KcWPrdjy8eSLY3ALJy+S7qUH49K4sr0tEb77UypziSPrAtQkg97km9Kp1yDmnXxnW3rY
	LsVBmYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0k3U-0000000EksY-3sx4;
	Thu, 12 Mar 2026 17:42:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0k3R-0000000EksA-1i85;
	Thu, 12 Mar 2026 17:42:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 981D740A8A;
	Thu, 12 Mar 2026 17:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D81CC116C6;
	Thu, 12 Mar 2026 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337356;
	bh=BvynsxQT+72Rrn/uUDDfsNj/GLSJx+wlAMlrdvLf+NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b42H45l/gDxAJEGfU3qTzBjD5/TLjqEZCpox7A9y23bQ9X8cfOwytTgRTG6/sneL2
	 yMrLK8HaLmlBQvNFmI9wJiNgFOxizT51v99W4BOe8Aq0pG4DPwx/B5turcZUsAnKGG
	 N24AMEuHGDi+h0jVsDIb8DduFqPfD5cvgN2yOq1a68l2LmJ6vul46oBx3gEggY8d77
	 X0YInjHaJQ1qBpHiOZISuTdYh5GQYHKvKWV5X4JaEPSU5RP4PsH54PMCh5TnDHau/3
	 8mdokoNztYo8m58TrFJphotlXvS505D/P2NEZomy/4Okie4VJ2bnkcwfCUhlWLqfK5
	 dXOVbl1fmXO7A==
Date: Thu, 12 Mar 2026 17:42:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com,
	bartosz.golaszewski@oss.qualcomm.com, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v3 1/7] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Message-ID: <20260312-decathlon-unheard-33543f7c9f38@spud>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
 <20260312113040.68189-2-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EkrqEmDpWds7n/h2"
Content-Disposition: inline
In-Reply-To: <20260312113040.68189-2-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_104238_770556_413AA192 
X-CRM114-Status: GOOD (  17.78  )
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


--EkrqEmDpWds7n/h2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 07:30:34PM +0800, Yu-Chun Lin wrote:
> From: Tzuyi Chang <tychang@realtek.com>
>=20
> Add a generic pin configuration property "input-voltage-microvolt" to
> support hardware designs where the input logic threshold is decoupled
> from the power supply voltage.
>=20
> This property allows the pinctrl driver to configure the correct internal
> reference voltage for pins that need to accept input signals at a differe=
nt
> voltage level than their power supply. For example, a pin powered by 3.3V
> may need to accept 1.8V logic signals.
>=20
> This defines the reference for VIH (Input High Voltage) and VIL (Input Low
> Voltage) thresholds, enabling proper signal detection across different
> voltage domains.
>=20
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v3:
> - Rebased onto the devel branch of the pinctrl tree.
> - Improved commit message and description.
> ---
>  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b=
/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index fe936ab09104..fd49a0d53bf0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -162,6 +162,11 @@ properties:
>        this affects the expected delay in ps before latching a value to
>        an output pin.
> =20
> +  input-voltage-microvolt:
> +    description: Specifies the input voltage level of the pin in microvo=
lts.
> +      This defines the reference for  VIH (Input High Voltage) and VIL
> +      (Input Low Voltage) thresholds for proper signal detection.

Should this be added here:
  - if:
      required:
        - input-disable
    then:
      properties:
        input-enable: false

and made mutually exclusive with input-disable?

> +
>  allOf:
>    - if:
>        required:
> --=20
> 2.34.1
>=20

--EkrqEmDpWds7n/h2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL7BwAKCRB4tDGHoIJi
0pKEAQC6Ey1baSsob113/Wx8B3QdXrW3HwDRHNbW+DMmvy+UjQD/XOOL9otVRpeA
+g1SsE3I8Zj7rlmTtKL+9i55DXfyTA8=
=JhZK
-----END PGP SIGNATURE-----

--EkrqEmDpWds7n/h2--

