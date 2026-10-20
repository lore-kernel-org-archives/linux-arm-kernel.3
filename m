Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332A8606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TtgKNJoJ;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Bx3qI1te
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IElBYbGaJp62Ej/HEfWVK4DUW4gT7qobiXVvxG5fehg=; b=TtgKNJoJ8bs+TKYyZoB5rDZUip
	Ag770Riozr5EuMTkRtNRQGivi1ooH9yPFu20uhmf/LCaZuxLVBDZBjoaN2xCt/g/cm52Y48wfZU5F
	syghI0HefAMm34vJIOpc0JOysFNiP8iGUjCoD6OIPZMHy/yfL49h1gyAe8Nda/gmLq1UkArE6Dk4B
	M2RhObMOhIFka7qKCGlFdehGDVAPxBb4IpRm4xpSdqAGgJLbwkD2+qz0vMJgJbSIZmeFoLCL5CIam
	UTfDIqe4GqTLaBIGt7P3MRdp10sv6KMWwkfS9ekSom9t9FWMn2wVPFiQtKWZ7OJx/vt+bVGiIkScu
	7cvivELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBHy-0000000A0Vu-37B6;
	Tue, 20 Oct 2026 14:58:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBHv-0000000A0Ux-3cxj;
	Tue, 20 Oct 2026 14:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IElBYbGaJp62Ej/HEfWVK4DUW4gT7qobiXVvxG5fehg=; b=Bx3qI1teo6GmUTEO+wejgphvYp
	e32JMyy5L4EWdvdu40d0P+NnumYmV3e9XSdkUuO3eOLBxmEc/N048ALyaHFg2YLWqlKdJiXSinnhS
	UQlTIZmBeKOBLdgj2zg2no7IPcgDk6tSKh0gzs546A0IIIqHjKW82plioGlj7PFy3GDHy2bRn3WPN
	d4rgsJqH6OSkGZbDAwQgidNPRo3BgPzhCbIcrf4jE8uCVXOmd6AfPbKN7TJ1eNfB+MM0AHCXACUTA
	+cW59MX50PrH6g1UplDEuxpzQI+ISsZFas8f5ZaQnCSr83vVbmdDOcJzGBXvQhkhiiuw8dC0PnaXc
	vGrqQ24A==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add a cell
 to select TX or RX
Date: Tue, 20 Oct 2026 16:57:34 +0200
Message-ID: <25254818.ouqheUzb2q@diego>
In-Reply-To: <20261020141039.GB4157247-robh@kernel.org>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com> <2501273.NG923GbCHz@diego>
 <20261020141039.GB4157247-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_075804_092684_A760D32E 
X-CRM114-Status: GOOD (  57.48  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 20. Oktober 2026, 16:10:39 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Rob Herring:
> On Tue, Oct 20, 2026 at 03:37:35PM +0200, Heiko St=C3=BCbner wrote:
> > Am Dienstag, 20. Oktober 2026, 00:20:47 Mitteleurop=C3=A4ische Sommerze=
it schrieb Michael Riesch:
> > > Hi all,
> > >=20
> > > On 10/19/26 17:06, Rob Herring wrote:
> > > > On Mon, Oct 19, 2026 at 04:15:03PM +0800, =E6=A5=8A=E6=99=BA=E6=88=
=90 wrote:
> > > >> Hi Krzysztof, Rob,
> > > >>
> > > >>> Existing OS should ignore surplus cell if the driver is coded pro=
perly.
> > > >>> Same as adding new properties or new front-compatible.  The quest=
ion is
> > > >>> how the existing driver behaves?
> > > >>
> > > >> As you pointed out on 5/8, the xlate checks args_count !=3D 1. The=
 DC-PHY
> > > >> driver was merged in v6.15, so every kernel since 6.15 fails on a =
second cell.
> > > >>
> > > >> 1. Keep the second cell. Add the patch as follows:
> > > >>
> > > >> - if (args->args_count !=3D 1) {
> > > >> + if (args->args_count < 1) {
> > > >>     dev_err(dev, "invalid number of arguments\n");
> > > >>     return ERR_PTR(-EINVAL);
> > > >>   }
> > > >>
> > > >> + if (args->args_count > 1 && args->args[1]) {
> > > >> +   dev_err(dev, "only the transmitter is supported\n");
> > > >> +   return ERR_PTR(-EINVAL);
> > > >> + }
> > > >>
> > > >>   With Fixes: and Cc: stable, the stable kernels maintained at that
> > > >>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
> > > >>   dts, and the receiver fails cleanly instead of getting the trans=
mitter.
> > > >>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
> > > >>   It goes in with the series, since two-cell dts only exist after =
it.
> > > >>
> > > >> 2. Use a flag in the upper bits of the existing cell, as Rob
> > > >>     suggested. Existing kernels are not affected, unless a board e=
nables
> > > >>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
> > > >>
> > > >> I will write the impact clearly whichever  approach is selected in
> > > >> the related commit messages and the cover letter.
> > > >>
> > > >> I think the cell approach is easier to read and more symmetric in =
the
> > > >> long term,
> > > >> but it breaks more. Which one do you think is better? Thanks.
> > > >=20
> > > > I'm not a user of this platform, so I don't care. Up to the platfor=
m=20
> > > > maintainers to decide if breakage is acceptible. You just need to=20
> > > > document the issue in the commit message.
> > > >=20
> > > > Rob
> > >=20
> > > It's a bit of a pickle, all this.
> > >=20
> > > I gave it some more thought. In the end this is an IP block with two
> > > PHYs. No more, no less. One cell is sufficient to address those, and =
it
> > > could be 0 for the transmitting PHY (DSI, display) and 1 for the
> > > receiving PHY (CSI, camera).
> > >=20
> > > Of course the two PHYs can operate in either DPHY or CPHY mode. The
> > > phy-cells have been (mis?)used to select the proper mode of combo PHY=
s,
> > > and this principle has been applied here too.
> > >=20
> > > However, we have the special situation here that the mode can only be
> > > changed for the complete IP block (and thus for both PHYs at the same
> > > time). As Bryan points out, we need to check and complain if the PHY
> > > mode is not set to the same value for both PHYs.
> > >=20
> > > I suggest using a property
> > >     samsung,cphy-mode;
> >=20
> > I guess, a maybe nicer way would be mimicing
> > 	Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
> >=20
> > with its
> > 	intel,phy-mode =3D <x>
> >=20
> > with x coming from include/dt-bindings/phy/phy.h
> > for the distinction between cphy and dphy, so we don't introduce yet
> > another way to describe this.
>=20
> We already have the plain 'phy-type' property which takes the same=20
> PHY_MODE_x values. We don't need yet another vendor specific property.

even better then ... and I didn't look deep enough it seems.


> > > (name to be bikeshedded) that sets the complete IP block into CPHY mo=
de
> > > (DPHY being the default) to distinguish between the modes. Since both
> > > modes use a different electrical interface, this is clearly a hardware
> > > thing and thus suitable for device tree.
> > >=20
> > > Then, we can address the two PHYs with the help of the already existi=
ng
> > > phy cell (without any bitflag tweaks to the value).
> > >=20
> > > The sole drawback is that we need to accept the PHY_TYPE_DPHY and
> > > PHY_TYPE_CPHY values that some OS in the field might pass. (For Linux,
> > > it should only be the former.) And we need to handle those values
> > > correctly. But I think this is not more painful than the other
> > > approaches. At the same time, this design seems to be the most correct
> >=20
> > The current cell values are 10 + 11, so as long as we don't re-use those
> > exact values for the other constants the driver should somewhat easily
> > be able to recognize an old DT?
>=20
> I think you will still have an ABI issue of what does old OS do with new=
=20
> values?

wasn't the main contract, a newer kernel should support old DTs ?

Aka the DT is parked in some firmware part (u-boot?) and gets handed
to the newer kernel.

I don't see deliberately handing a newer DTB to an older kernel as a
very common occurence?


And from a practical standpoint:

We're talking about devices with DSI displays that are at stake here,
so we're in the embedded world.

In other areas we're still fighting basic functionality like actually
handling the type-c orientation correctly in the usbphy.

So I really don't see a device with a user-updateable mainline kernel out
in the field, apart from people hacking around on their devices to try
out new features and new kernels, simply because core functionality
is still evolving in mainline.


RK3576/RK3588 devices still ship with a vendor u-boot/kernel, with
completely incompatible DTB afterall.


So yes, supporting old devicetrees on new kernels I do see as important
but someone working extra hard to combine a new DT with an old kernel,
I really don't see as an issue here.


Heiko



