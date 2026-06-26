Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D12C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHONzNZurmNs9NAMZL5smtkhZLFBha363Qf59K5VhA4=; b=n3/UAeEDMLiPaSgDO/T1etEQNi
	UbeLKpIQV8sd1UHRRBGlhV5dqZEofdbXJY0NIYQS0fZOXvLIpcvmfyUbaTVyZdB+3fARG0hQE1QPW
	n+3w0YkHwNDzEYpsxIWmIvojuAKSWoV42g3t7zLkWOWJhSjLNWx094h4vtosM3Q37b6nrX5CBTqvf
	b1k05NtekH1tr6XOgjOr0cO9BFy9j/r4z3E50hsAHSYIFhdF7z9yXwghWSkd1uWR/OXA8JxKquEhU
	H92VWYIZMEgdntEfig8fQersNHzwhCuPyHzL46gC5iEFid9W1YOxP50RDYrhY6t8Otsg2hVWhP0K8
	blJOY8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8I1-0000000BXQe-042W;
	Fri, 26 Jun 2026 15:16:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8Hz-0000000BXQX-1BXp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 15:16:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B63754193E;
	Fri, 26 Jun 2026 15:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578E71F00A3A;
	Fri, 26 Jun 2026 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782486978;
	bh=dHONzNZurmNs9NAMZL5smtkhZLFBha363Qf59K5VhA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PFB15Ka7QCMaorqN+koVilBviVzAfYITGm3A5OF1OjTy/RUU/03kmsaHMN52swvSP
	 qCJwBChsrFRBA5N/S6N69VBM3oMbyvvkwIcPev04rcipikuStMaOUiklqK3BDfp2y1
	 /2dk1lldLP+lkJYuamo9+jw0mo1r9KHj11SEED5z7nBO4+SgLGfn8A6MKfBA/bVQqj
	 k2dQJdKU/BLI9HO+9w8lTqs4JbDUDfvDYAqIsWHWmmAO4vRBc14P0bDYgSDjPtC5dy
	 04w4d5XwOWS+rrXn3ZyVz0140+xYmvFf0kMNH2H3sKARE4Ayog1TeJ0vYwEslIfm93
	 dVU3vpWLz+jFA==
Date: Fri, 26 Jun 2026 16:16:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
Message-ID: <20260626-alive-step-a2c82b4f0706@spud>
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-2-a0987203069@gmail.com>
 <20260625-bobbing-annotate-d1c4d6874ee2@spud>
 <20260626-zit-amuck-e743e58d2e15@wendy>
 <84b93c496fabdeee05d2f962a1b764fdbfaacdb7.camel@iscas.ac.cn>
 <20260626-agreement-express-b16c71315f7b@wendy>
 <996c3d442e92e7f908fb3a32973805dd2d2680d7.camel@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QLHakFN0+CeUBvUt"
Content-Disposition: inline
In-Reply-To: <996c3d442e92e7f908fb3a32973805dd2d2680d7.camel@iscas.ac.cn>
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


--QLHakFN0+CeUBvUt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 05:09:12PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2026-06-26=E4=BA=94=E7=9A=84 09:57 +0100=EF=BC=8CConor Dooley=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Fri, Jun 26, 2026 at 03:58:14PM +0800, Icenowy Zheng wrote:
> > > =E5=9C=A8 2026-06-26=E4=BA=94=E7=9A=84 08:22 +0100=EF=BC=8CConor Dool=
ey=E5=86=99=E9=81=93=EF=BC=9A
> > > > On Thu, Jun 25, 2026 at 05:33:37PM +0100, Conor Dooley wrote:
> > > > > On Thu, Jun 25, 2026 at 05:44:43PM +0800, Joey Lu wrote:
> > > > > > +
> > > > > > +=C2=A0 - if:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contain=
s:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 const: nuvoton,ma35d1-dcu
> > > > > > +=C2=A0=C2=A0=C2=A0 then:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItem=
s: 2
> > > > >=20
> > > > > Anything that updates the minimum constraint should be done at
> > > > > the
> > > > > top
> > > > > level of this schema. The conditional section should then
> > > > > tighten
> > > > > the
> > > > > constraint, in this case that means only having maxItems.
> > > > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItem=
s: 2
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - const: core
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - const: pix0
> > > > >=20
> > > > > Does this even work when the top level schema thinks clock 2
> > > > > should
> > > > > be
> > > > > called axi?
> > > >=20
> > > > Additionally here, only have core and pix0 seems like it might be
> > > > an
> > > > oversimplification. I doubt removing the second output port means
> > > > that
> > > > the axi and ahb clocks are no longer needed.
> > > > Is it the case that your device supplies the same clock to core,
> > > > ahb
> > > > and
> > > > axi? If so, then you should fill those clocks in in your
> > > > devicetree
> > > > and
> > > > this can just constrain the number of clocks/clock-names to 4.
> > >=20
> > > The clock controller of that SoC is quite weird -- it has only a
> > > single
> > > gate bit, but controlling 3 clock gates. All core, ahb and axi
> > > clocks
> > > have gates controlled by this single bit, so it's why currently
> > > it's
> > > modelled as only core clock supplied.
> >=20
> > Yeah, then what's in the binding is definitely wrong.
> > Even if the same clock was provided to all clock inputs in the IP,
> > all
> > individual clock should be listed in the devicetree - although it
> > will
> > look a little silly to see clocks =3D <&foo 2>, <&foo 2>, <&foo 2>,
> > <&foo 2>;
> > In this case, 3 clocks controlled by 1 gate bit is an implementation
> > detail
> > of the SoC's clocking hardware, and not relevant to how the dc
> > instance
> > should be described.
> >=20
> > > Well it might be worthful to supply the bus clock before the gate
> > > as
> > > ahb/axi, especially axi, because both the AXI clock and the core
> > > clock
> > > constraints the maximum pixel clock.
> >=20
> > Right. And looking at patch 4/7, and the wording:
> > > The Nuvoton MA35D1 SoC integrates a DCUltraLite display controller
> > > whose
> > > AXI and AHB bus clocks share a single gate enable bit with the
> > > display
> > > core clock, so the clock driver does not expose them separately.
> > > This
> > > patch makes the axi and ahb clocks optional in the probe.
> >=20
> > It sounds like there's probably some issues with how things are
> > modelled
> > clock wise in this device, unless this is not an accurate statement
> > and
> > there's actually one clock provided to all three inputs. If they're
> > distinct clocks, with different rates, only having one exposed has a
> > lot
> > of potential to be problematic!
>=20
> Yes, I agree with this, they're different clocks according to the
> manual.
>=20
> I added the clk people to the CC list in a reply of the previous
> revision, but they didn't react yet. I don't know how to represent
> multiple clock gates sharing a single control bit in the clock
> framework...

Yeah, I have absolutely no idea. Maybe it requires custom refcounting?
Surely this cannot be the only device that does something like this
though.

> Maybe just supplying the ungated AXI/AHB clocks here, and let the core
> clock manage the gate?

I guess, but that seems incorrect and would require commentary about why
it's being done. Feel like they (the missing axi/ahb clocks) should be
added to the clock driver and binding, and any special workarounds done
there.
Of course letting the core clock manage the gate and making the enable
method for the gated AXI/AHB clocks be a NOP is one way of handling it
in the clock driver. Still a bit of a hack compared to refcounting it,
but it makes me happier to have the correct clock tree modelled in DT.

--QLHakFN0+CeUBvUt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6XvQAKCRB4tDGHoIJi
0vssAQDndJs9/ctwRc2c7FjHBwBiv4LpDbHHbKg3pi7OB4EvDwD/bUeIo9EzaeR5
PJstTNEZxtLCLfIx88hwML6Acinghwk=
=IOEf
-----END PGP SIGNATURE-----

--QLHakFN0+CeUBvUt--

