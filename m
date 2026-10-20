Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642C760A260F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kz78TdE2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dUaiSYOh;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=R8rsXKOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8yfQEcljjdCYG73U7/b7AoriibsdHfzmxVKPS8fPUs=; b=kz78TdE2wGcZITWqCEbyG0KbpS
	cdaH6Sb9iYHixXC6kVmqltgW0aaCEvLwZ3H5YVc408Wk4oVW3VqfvMlgAEzrt6a4+mrgngXsT4uzy
	X1wpzT4DjFbuz2xMU9yYDXun1mbMZeD2sn1xz3gWsTaf7j+HCMny+eDtBm1xzUEX8QwuwjlPIASbe
	eUtRSsnZZktgt1Hv1YXfONX978+iuQ8iqLO6XwYv/rcTrb6QnQKwkuACulXUjlhOkw/Gr3jJZH1UF
	Ej0grDO0gECusT6Nk8TyvqT/YhtWEIEhXmhKQAw/HyAMFHFuVgFuNIumn6wrViuizT1YuEUHvj4nT
	ojkR9DLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJA2N-00000009oMP-3LKJ;
	Tue, 20 Oct 2026 13:37:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJA2K-00000009oLX-3qp9;
	Tue, 20 Oct 2026 13:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=m8yfQEcljjdCYG73U7/b7AoriibsdHfzmxVKPS8fPUs=; b=dUaiSYOh4ExQgbxc0XsYsgdbyc
	gYXUFCtnQX4zJfjSf2fkKrm0fM4isdR2wiFzdlG58Roqr//HTuuy7O9n8UzDM44L+y/R2ZbO5Kj5p
	wIc5yXe30gACnxEAmLIaqjRips6Dntr6K1BDHOX94v4Or3JUgrLRHkmgw4Yis9OTG7uP6md6EBP6c
	N14ugyk1ub/oW/XJbhU66nl1sysj1WNgWb6YPQFk/Q02r04QOSDX3AfWEhuB1UCQb74oa46TS4jkB
	VXYaQPmqDpSkaJhTmErnQH+6Ix3byO9HToUyKre1SuKo6ocvEoR7xyiAUmTRUxjvkgQv0Ov3AQxnv
	dlkCpU+A==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJA2F-00000004ltv-3zYb;
	Tue, 20 Oct 2026 13:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=m8yfQEcljjdCYG73U7/b7AoriibsdHfzmxVKPS8fPUs=; b=R8rsXKOlypisObnCg9uR6fNJlX
	3Ubrwa1LV61x/Q2ZHgC5nkXY6zgx+U0J3139rGr7qgrXVCaOFicihD2ArvNXmk3po7ySxW+/iKiA+
	ZSVKW6spvm8mn7dKG86W6sztHwm1Zaue5dFIOkgFPxaJDeZsyVWimViZN6t2uR58W/fgW2zSyADH/
	8N77TIADYxy7+zZMLREv7YAkIfD5l6c7xqSXjnqB0poA9y0O92RuJavkgLP9bEJe05gVeX13vUjgk
	nRHqV/V6MLrFK3mGyzBM96C2HURgOjSjJup1Yf6oMTK4ddLWw3jTrM9y2A+/+ivOZdy+vdYmznz+I
	a1VDQpHA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
 =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>,
 Michael Riesch <michael.riesch@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
Date: Tue, 20 Oct 2026 15:37:35 +0200
Message-ID: <2501273.NG923GbCHz@diego>
In-Reply-To: <73ef0d06-75c5-4c10-b4c3-c7b3c07a1e18@collabora.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261019150631.GA265407-robh@kernel.org>
 <73ef0d06-75c5-4c10-b4c3-c7b3c07a1e18@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_143749_967824_3F127F0F 
X-CRM114-Status: GOOD (  42.87  )
X-Spam-Score: -0.2 (/)
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

Am Dienstag, 20. Oktober 2026, 00:20:47 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Michael Riesch:
> Hi all,
>=20
> On 10/19/26 17:06, Rob Herring wrote:
> > On Mon, Oct 19, 2026 at 04:15:03PM +0800, =E6=A5=8A=E6=99=BA=E6=88=90 w=
rote:
> >> Hi Krzysztof, Rob,
> >>
> >>> Existing OS should ignore surplus cell if the driver is coded properl=
y.
> >>> Same as adding new properties or new front-compatible.  The question =
is
> >>> how the existing driver behaves?
> >>
> >> As you pointed out on 5/8, the xlate checks args_count !=3D 1. The DC-=
PHY
> >> driver was merged in v6.15, so every kernel since 6.15 fails on a seco=
nd cell.
> >>
> >> 1. Keep the second cell. Add the patch as follows:
> >>
> >> - if (args->args_count !=3D 1) {
> >> + if (args->args_count < 1) {
> >>     dev_err(dev, "invalid number of arguments\n");
> >>     return ERR_PTR(-EINVAL);
> >>   }
> >>
> >> + if (args->args_count > 1 && args->args[1]) {
> >> +   dev_err(dev, "only the transmitter is supported\n");
> >> +   return ERR_PTR(-EINVAL);
> >> + }
> >>
> >>   With Fixes: and Cc: stable, the stable kernels maintained at that
> >>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
> >>   dts, and the receiver fails cleanly instead of getting the transmitt=
er.
> >>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
> >>   It goes in with the series, since two-cell dts only exist after it.
> >>
> >> 2. Use a flag in the upper bits of the existing cell, as Rob
> >>     suggested. Existing kernels are not affected, unless a board enabl=
es
> >>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
> >>
> >> I will write the impact clearly whichever  approach is selected in
> >> the related commit messages and the cover letter.
> >>
> >> I think the cell approach is easier to read and more symmetric in the
> >> long term,
> >> but it breaks more. Which one do you think is better? Thanks.
> >=20
> > I'm not a user of this platform, so I don't care. Up to the platform=20
> > maintainers to decide if breakage is acceptible. You just need to=20
> > document the issue in the commit message.
> >=20
> > Rob
>=20
> It's a bit of a pickle, all this.
>=20
> I gave it some more thought. In the end this is an IP block with two
> PHYs. No more, no less. One cell is sufficient to address those, and it
> could be 0 for the transmitting PHY (DSI, display) and 1 for the
> receiving PHY (CSI, camera).
>=20
> Of course the two PHYs can operate in either DPHY or CPHY mode. The
> phy-cells have been (mis?)used to select the proper mode of combo PHYs,
> and this principle has been applied here too.
>=20
> However, we have the special situation here that the mode can only be
> changed for the complete IP block (and thus for both PHYs at the same
> time). As Bryan points out, we need to check and complain if the PHY
> mode is not set to the same value for both PHYs.
>=20
> I suggest using a property
>     samsung,cphy-mode;

I guess, a maybe nicer way would be mimicing
	Documentation/devicetree/bindings/phy/intel,combo-phy.yaml

with its
	intel,phy-mode =3D <x>

with x coming from include/dt-bindings/phy/phy.h
for the distinction between cphy and dphy, so we don't introduce yet
another way to describe this.

As you said, the electrical wiring is completely different between the dphy
and cphy parts, so is a property of the board.


> (name to be bikeshedded) that sets the complete IP block into CPHY mode
> (DPHY being the default) to distinguish between the modes. Since both
> modes use a different electrical interface, this is clearly a hardware
> thing and thus suitable for device tree.
>=20
> Then, we can address the two PHYs with the help of the already existing
> phy cell (without any bitflag tweaks to the value).
>=20
> The sole drawback is that we need to accept the PHY_TYPE_DPHY and
> PHY_TYPE_CPHY values that some OS in the field might pass. (For Linux,
> it should only be the former.) And we need to handle those values
> correctly. But I think this is not more painful than the other
> approaches. At the same time, this design seems to be the most correct

The current cell values are 10 + 11, so as long as we don't re-use those
exact values for the other constants the driver should somewhat easily
be able to recognize an old DT?


Heiko



