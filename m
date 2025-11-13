Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9484DCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqYikByT1SlfqKsSnbFwTTETF4iKjYU6Faix6h9yVlk=; b=HnElylwFfAiTdFiaKsRfkm4Xak
	hga6rOrlddw/wGxDFP2LQH+kmZ6hms/5YDi+NAxkktLvXuvXKWMs/YclTKfxHVMci+dfuR3Q8DNYY
	PV8P+kUGTEb3j+tOcs5VrZ7haqyL8kvse9yvJ3iIFIThhWQGuXCY7merI/F+eo3PDaX9JJPac6c4V
	4nJ2OizYl81/4jwBDnLJQx6yg6GphljcjZHoZcxjj6KovrgIClfmPxSGDmkYa1xz4cLuruZtgZ0Ya
	snfPPdX0TpVeU9dwBgtsj5OucpClutMkfH0kq26JJ9Yg07p+QLqwAUX4xOXnhs5XbnodwsHnkVBdZ
	CNl89CSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcnx-0000000AzDJ-2mw2;
	Thu, 13 Nov 2025 19:16:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcnv-0000000AzCp-3ZVD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 19:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA9C1440C9;
	Thu, 13 Nov 2025 19:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE21C113D0;
	Thu, 13 Nov 2025 19:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763061382;
	bh=IblUqGpTbIRtiXEqbdz5S15EKx867g0thOANjT9zzo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jAWm3OCdZCohQVKp5xXcn4czTWQ2MTmmYQBUnepiL/xkhVs6FGcaMfyOJocxIz7Bp
	 5V1tpOfeN/K8T7KYy8X/7mAkx2OyFLh336Et0Q8Xr4N6XyTYOUBc/j6rhxx/P90J1r
	 w2YIuNuxfi2VH0RJo2wSezaWCaZ7uUnHVrpbxdVG3LWs5GMsAJMv5QaW2quFEtKicP
	 K12bENP+L8JMTxNVY1si2rwXPADgiezPGKXDCtVWufNcSKOD6PqjHfQRr5D1OIiw5u
	 u9JNu2wVtrmHHuBzWHK2yOj/8BefmBT2ArjGapig3s8vDGX4KDuSvXVKvpHQcuEJr9
	 T+6Q/gD9Wrpig==
Date: Thu, 13 Nov 2025 19:16:18 +0000
From: Conor Dooley <conor@kernel.org>
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Simek, Michal" <michal.simek@amd.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: Describe the reset
 constraint for the versal platform
Message-ID: <20251113-risk-doorstop-4ec156b58d0a@spud>
References: <20251112155430.1326426-1-radhey.shyam.pandey@amd.com>
 <20251112-bagging-diameter-4ebab1f9ed45@spud>
 <MN0PR12MB59537C0F520B40977620BFCDB7CDA@MN0PR12MB5953.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R/LfrMLgE6sszEZI"
Content-Disposition: inline
In-Reply-To: <MN0PR12MB59537C0F520B40977620BFCDB7CDA@MN0PR12MB5953.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_111623_932417_6AA2C126 
X-CRM114-Status: GOOD (  22.15  )
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


--R/LfrMLgE6sszEZI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 12:15:02PM +0000, Pandey, Radhey Shyam wrote:
> [Public]
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Thursday, November 13, 2025 12:38 AM
> > To: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>
> > Cc: gregkh@linuxfoundation.org; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; Simek, Michal <michal.simek@amd.com>; linux-
> > usb@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; git (AMD-Xili=
nx)
> > <git@amd.com>
> > Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: Describe the reset =
constraint for
> > the versal platform
> >
> > On Wed, Nov 12, 2025 at 09:24:30PM +0530, Radhey Shyam Pandey wrote:
> > > AMD Versal platform USB 2.0 IP controller receives one reset input
> > > from the SoC controlled by the CRL.RST_USB [RESET] register so
> > > accordingly describe reset constraints.
> > >
> > > Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> > > ---
> > >  .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 43
> > > +++++++++++++++----
> > >  1 file changed, 34 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> > > b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> > > index 36f5c644d959..cd0cc9da242f 100644
> > > --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> > > @@ -50,17 +50,22 @@ properties:
> > >      description:
> > >        A list of phandles for resets listed in reset-names.
> > >
> > > -    items:
> > > -      - description: USB core reset
> > > -      - description: USB hibernation reset
> > > -      - description: USB APB reset
> > > +    oneOf:
> > > +      - items:
> > > +          - description: USB controller reset
> > > +      - items:
> > > +          - description: USB core reset
> > > +          - description: USB hibernation reset
> > > +          - description: USB APB reset
> > >
> > >    reset-names:
> > > -    items:
> > > -      - const: usb_crst
> > > -      - const: usb_hibrst
> > > -      - const: usb_apbrst
> > > -
> > > +    oneOf:
> > > +      - items:
> > > +          - const: usb_crst
> >
> > Why do we need all this oneOf stuff if both have the same first reset?
> > Can't you just set minItems: 1?
>=20
> Thanks. I have now set minItems:1 and defined compatible based
> reset min/max constraints. Doing some more validation and
> will send out the v2.
>=20
> Example:
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -47,6 +47,7 @@ properties:
>        - const: ref_clk
>=20
>    resets:
> +    minItems: 1
>      description:
>        A list of phandles for resets listed in reset-names.
>=20
> @@ -56,6 +57,7 @@ properties:
>        - description: USB APB reset
>=20
>    reset-names:
> +    minItems: 1
>      items:
>        - const: usb_crst
>        - const: usb_hibrst
> @@ -95,6 +97,28 @@ required:
>    - resets
>    - reset-names
>=20
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
> +          maxItems: 3

FWIW, this maxItems is not needed as it matches the number in the list.

--R/LfrMLgE6sszEZI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYuggAKCRB4tDGHoIJi
0gT9AQCko4kdzAGADmzJ9rqSW1og+tEAc0KZ4IN9qoyyNQ7pigEA50Ga3HW83D8L
WvF3aHpMsTZijeLjVl33kuBr+RPqgAY=
=GL2A
-----END PGP SIGNATURE-----

--R/LfrMLgE6sszEZI--

