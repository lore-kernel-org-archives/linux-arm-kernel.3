Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AB4106ACD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plq1XXv24TCp7ZGfzxGLFC0WCzxfqPDYZDyJ6P0duvA=; b=ZOXu8sD2vd/m6rjBqqwRtkqI0D
	Ft7ZPBuI1URAD/Zwedp1K8AyFzUw+V3vz7xuVU2IidpIQCtaOn/nohFv9fo+ZxYT2ZhtRSiaWHiOV
	kJD59ehxjTHEh2Q+W0FB1oIffcMRm9IS1ed1d7AJNMhJb0P4wqQErMy8OTxv+ChdZeu6zQaUMoJwO
	ZYMOAbYC3i9yV3VK2dw6XBdCuX9sqnhc7fCsvaYjfSdCugJ50PaWeg95rKho4Cxr7dZdjOuE4vC/I
	/h89mRxSQmMfL9h9HY30jtSyRdROtIUh1luCKzwL7IBa3ibCacG+XyMGObMg8hg700e/1LuopH2aP
	vXP6iioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0k5e-0000000ElL4-46dy;
	Thu, 12 Mar 2026 17:44:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0k5c-0000000ElKH-33dP;
	Thu, 12 Mar 2026 17:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EED7F4064A;
	Thu, 12 Mar 2026 17:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3470C4CEF7;
	Thu, 12 Mar 2026 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337491;
	bh=yebvafZP0usipZ2VI2/wrr+gTjJ5AXBS/zFdtn7K/2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDg/cgHN9xJ9PEZF1E0XNDoR5FPsdfKmziQjryC5acqoUEI4iWn3ci906JlEj8UyE
	 yZlxoXDnuOCe5MvxMrgjP+XKjsJdJMtmEIUJcro22n8I8lVKWHj6EV9sNq80MUyQwM
	 0/7spwN8zu9u6AbyTtHH4pJ2vOB7txWvrpDhRS3BgdKY6xX148t+EHWLbveBzk/yYq
	 JIl0R8uME1FJJWSSYZT6Z22yTAVDPjGq4c1PbMmRtv1quiwPpCv/kZTzefMoTeCrBG
	 IqlDEzQmXqCW2E4dJghCPBOF1voqoUya9VWHd7ENSdqUJU5roCtOocjrwvrwO4MOYy
	 3u5WoH2hfhSRg==
Date: Thu, 12 Mar 2026 17:44:46 +0000
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
Message-ID: <20260312-sizably-gleaming-07c514a1fb70@spud>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
 <20260312113040.68189-2-eleanor.lin@realtek.com>
 <20260312-decathlon-unheard-33543f7c9f38@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4RMzMPhgra36l44W"
Content-Disposition: inline
In-Reply-To: <20260312-decathlon-unheard-33543f7c9f38@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_104452_806004_F0130B41 
X-CRM114-Status: GOOD (  22.91  )
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


--4RMzMPhgra36l44W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 05:42:31PM +0000, Conor Dooley wrote:
> On Thu, Mar 12, 2026 at 07:30:34PM +0800, Yu-Chun Lin wrote:
> > From: Tzuyi Chang <tychang@realtek.com>
> >=20
> > Add a generic pin configuration property "input-voltage-microvolt" to
> > support hardware designs where the input logic threshold is decoupled
> > from the power supply voltage.
> >=20
> > This property allows the pinctrl driver to configure the correct intern=
al
> > reference voltage for pins that need to accept input signals at a diffe=
rent
> > voltage level than their power supply. For example, a pin powered by 3.=
3V
> > may need to accept 1.8V logic signals.
> >=20
> > This defines the reference for VIH (Input High Voltage) and VIL (Input =
Low
> > Voltage) thresholds, enabling proper signal detection across different
> > voltage domains.
> >=20
> > Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> > Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > ---
> > Changes in v3:
> > - Rebased onto the devel branch of the pinctrl tree.
> > - Improved commit message and description.
> > ---
> >  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml=
 b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > index fe936ab09104..fd49a0d53bf0 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > @@ -162,6 +162,11 @@ properties:
> >        this affects the expected delay in ps before latching a value to
> >        an output pin.
> > =20
> > +  input-voltage-microvolt:
> > +    description: Specifies the input voltage level of the pin in micro=
volts.
> > +      This defines the reference for  VIH (Input High Voltage) and VIL
> > +      (Input Low Voltage) thresholds for proper signal detection.
>=20
> Should this be added here:
>   - if:
>       required:
>         - input-disable
>     then:
>       properties:
>         input-enable: false
>=20
> and made mutually exclusive with input-disable?

Also looking at v1, should this be something like
"input-threshold-voltage-microvolt"? "input-voltage-microvolt" doesn't
seem specific enough to the described use case.

>=20
> > +
> >  allOf:
> >    - if:
> >        required:
> > --=20
> > 2.34.1
> >=20



--4RMzMPhgra36l44W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL7jgAKCRB4tDGHoIJi
0iklAQDDaR+ooSW9jjtSvBDLW2pOjn+aaba1tgyiGHOr0jn8ogD+N7WQElixbtTf
maZCbCcqdUL63/v1jNK9YGB0J9JrKgU=
=cwPc
-----END PGP SIGNATURE-----

--4RMzMPhgra36l44W--

