Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7661FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10Ziy3jcJKOprR/fU+6CyZGW0L6ZCnb3h3abs6jVrMg=; b=fFgfj1XuMqTC3aRmJOQ68xDXTE
	kcGH+rqJmgyc1uFXmz7g4+zzjEPduEKX5P6f7umypGibPWytq+bg5I6fv+tQ/2Xrxqfyyy6dd0u2x
	2qShrPe/D+DvzA/vscjq5DwfQDZF6suDqsVEIRO3PnJogBmsHU1KqMxndyus0gpNAsccI/70w2gTP
	5KhDgL1SV8Cf70xKekDZWf+cjyj1W9CpVAQeb80QLWoy4BRRjiBiUhv4PHCs3BjzPF1cj09+EezyN
	fogEU1opJdCvGQDOtv91NS3Zw8ap8c0SvW4W/CF0406g0B0PSNiPvFW93VcVshAaAqugVVwPP+zxH
	nZGCulvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38hJ-0000000CqT0-14b5;
	Fri, 11 Apr 2025 07:21:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u389G-0000000Cm5C-0w5S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 06:46:00 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:389d:1fcb:c0f8:ff7c:208d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EC03667;
	Fri, 11 Apr 2025 08:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744353836;
	bh=10Ziy3jcJKOprR/fU+6CyZGW0L6ZCnb3h3abs6jVrMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sc7ZlrFVKbOa/P3OwvaHd4QXPZ+dbPoAzOJzNEf9oCSxro9+V4nhjyVXfULJWg93D
	 36RBmOrl3nTiiejffOXDW45+uZtX9Ncp1GxlUNW3RrOCOiTEUEgAjNFt499KdG8to8
	 6x1Xtxzjf5wPRN1dqhIWCxDbBMdJoZp2G2WN4Cfo=
Date: Fri, 11 Apr 2025 12:15:50 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Andrew Davis <afd@ti.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, Judith Mendez <jm@ti.com>, 
	Nishanth Menon <nm@ti.com>, Hari Nagalla <hnagalla@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Beleswar Padhi <b-padhi@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Markus Schneider-Pargmann <msp@baylibre.com>, praneeth@ti.com, 
	"Khasim, Syed Mohammed" <khasim@ti.com>, tomi.valkeinen@ideasonboard.com, v-krishnamoorthy@ti.com, 
	s-tripathy@ti.com, s-tripathi1@ti.com, c-shilwant@ti.com, r-ravikumar@ti.com
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
Message-ID: <tp4v4kbe7j2opr4ba2kpujmzjtsesnq3by2lbi6ympe2lh6owg@tjchqh2bqkjg>
References: <20250405001518.1315273-1-jm@ti.com>
 <20250405001518.1315273-7-jm@ti.com>
 <6868f593-0728-4e92-a57b-87db6a0037f6@ti>
 <f42607f5-e39d-48a1-89c0-11d4982a2426@ti.com>
 <e131298f-3713-482a-a740-ff89709270b4@ti.com>
 <091c0869-525b-4b40-b5fe-a5c1907ec606@ti.com>
 <czmir7yvss3oreveesyrjqfdcawyn2axtstomsj3yx5sntqwo2@r3udnsyrxvkp>
 <5969e1e8-0bb7-4334-a0c5-b4c396b8b6af@ti.com>
 <dccef5d7-46c6-4e08-98f3-ba0e8168aaff@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5qa2kcidthusc3og"
Content-Disposition: inline
In-Reply-To: <dccef5d7-46c6-4e08-98f3-ba0e8168aaff@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_234558_584091_63671741 
X-CRM114-Status: GOOD (  47.11  )
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


--5qa2kcidthusc3og
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
MIME-Version: 1.0

On Apr 10, 2025 at 13:22:29 -0500, Andrew Davis wrote:
> On 4/10/25 6:38 AM, Devarsh Thakkar wrote:
> > Hi Jai,
> >=20
> > On 10/04/25 15:48, Jai Luthra wrote:
> > > Hi Devarsh,
> > >=20
> > > Thanks for the cc here.
> >=20
> > Thanks for the quick comments.
> >=20
> > >=20
> > <snip>
> >=20
> > > On the basic camera + ISP usecase, afaiu the downstream edgeAI SDK us=
es
> > > custom gstreamer elements that make calls to the aforementioned R5 co=
re
> > > that controls the ISP. On top of that there are additional gstreamer
> > > patches that are not yet posted upstream for review from the communit=
y,
> > > so the userspace design isn't really set in stone, or upstream-friend=
ly
> > > yet.
> > >=20
> >=20
> > I don't see much relation of carve-outs with Gstreamer or it's pending =
downstream patches. The memory is mainly managed from firmwares (mainly ope=
nvx layer being used underneath) and there are even non-gstreamer pure open=
vx based use-cases/tests which use these carveouts. At the end of the day, =
the firmwares from the only SDK which is released publicly for AM62A uses a=
ll these carveouts.
> >=20
>=20
> These are programmable cores, you can run whatever you want on them. You =
can
> make your own firmware if you like, we have support for them in our MCU+(=
FreeRTOS)
> offering today[0](look at all these firmware you can build/run!).
>=20
> In a week or so I'll start pushing support for these cores into Zephyr,
> bringing in even more firmware options for these cores.
>=20
> I simply do not see why one firmware, shipped with one of our SDKs*, doing
> things wrong should force us to hack up our DT here in upstream Linux.
>=20

I see, if the not-yet-upstream firmware can be updated, then I don't see=20
any reason to hardcode carveouts here.

For this patch as is,
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> *Speaking of the "only" SDK's firmware, if you take our Yocto meta-ti lay=
er and
> build an SDK yourself, you get firmware by default that *doesn't need ext=
ra
> carveouts*! [1][2]
>=20
> Andrew
>=20
> [0] https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/make=
file.am62ax
> [1] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/ti-=
rtos-fw/ti-rtos-echo-test-fw.bb
> [2] https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-=
ipc/am62axx?h=3Dti-linux-firmware
>=20
> >=20
> > > IMO if that architecture is still under discussion, it might be better
> > > to keep the edgeAI specific carveouts out of the upstream DTs.. just =
in
> > > case the carevouts have to go away, or change significantly.
> > >=20
> > > If you are sure that the regions and firmware architecture is set in
> > > stone and won't be updated even if there is a complete redesign of the
> > > userspace/application level stack for accessing the ISP (let's say u
> > sing> libcamera), only then it makes sense to add the carveouts right n=
ow.
> >=20
> >=20
> > Yes as I said if whole firmware arch is getting updated then better to =
wait. I think probably the firmware team marked in cc can comment on that. =
Moreover I don't see any point of adding only half the regions as that woul=
d anyway not work with SDK supplied firmwares, for e.g. RTOS-to-RTOS ipc te=
st run by firmwares on bootup would fail, along with other camera+ISP and A=
I use-cases.
> >=20

PS: Devarsh your mail client has format=3Dflowed enabled, which causes=20
line length overflows when replying to it.

Please disable it, as advised here:
https://www.kernel.org/doc/html/latest/process/email-clients.html#thunderbi=
rd-gui

> > Regards
> > Devarsh
> >=20
> > > > > >=20
> > > > > > I understand your point, currently with this patch remoteproc l=
oading
> > > > > > will not work for some cores. However, the goal here is to stan=
dardize
> > > > > > as much as possible the memory carveout sizes, push the "demo f=
irmware"
> > > > > > to request resources the correct way from resource table, and m=
ove away
> > > > > > from this dependency and limitations that we have with our firm=
ware.
> > > >=20
> > > > I understand this, but my view is that w.r.t firmware only goal sho=
uld not
> > > > just be tp demonstrate correct way of requesting resources from
> > > > resource-tables, optimize the carve-outs etc but also to demonstrat=
e the
> > > > primary use-cases (camera+ISP+edgeAI) which the device is capable o=
f.
> > > >=20
> > > > > > should soon be able to generate our own firmware using Zephyr,=
=C2=A0 which
> > > > > > Andrew is pioneering, so with this firmware we should move to t=
he
> > > > > > correct direction upstream. Downstream we are still using the m=
emory
> > > > > > carveout sizes that the firmware folk want so desperately to ke=
ep, for
> > > > > > now..
> > > > > >=20
> > > > >=20
> > > > > +1
> > > > >=20
> > > > > I have this Zephyr based firmware for AM62A working and it uses t=
he
> > > > > standard IPC regions as specified in this patch. I'll be posting =
the PR
> > > > > for it in Zephyr upstream by the end of week.
> > > > >=20
> > > >=20
> > > > I understand this, but will this zephyr based firmware support visi=
on +
> > > > edgeAI analytics ? Does it demonstrate all the unique capabilities =
of AM62A
> > > > SoC ? If not, then what would be utility of such firmware on AM62A =
where
> > > > these are the primary use-cases w.r.t AM62A ?
> > > >=20
> > > > Why should upstream device-tree use carve-outs which match to this =
demo
> > > > zephyr based firmware (which apparently not many are using and is n=
ot going
> > > > into any official SDK release) instead of official firmwares going =
into SDK
> > > > ? SDK released firmwares are being used by so many customers and SDK
> > > > documentation maps to it, but zephyr firmware that is being pitched=
 here,
> > > > who would be the potential users and what would be it's utility ?
> > > >=20
> > > > [1]: https://www.ti.com/tool/PROCESSOR-SDK-J721E
> > > >=20
> > > > Regards
> > > > Devarsh
> > > >=20
> > > > > For this patch as it is:
> > > > >=20
> > > > > Acked-by: Andrew Davis <afd@ti.com>
> > > > >=20
> > > >=20
> > > >=20
> > > > > Andrew
> > > > >=20
> > > > > [0] https://lore.kernel.org/lkml/20241011123922.23135-1-richard@n=
od.at/
> > > > > [1] https://git.ti.com/cgit/edgeai/meta-edgeai/tree/recipes-kerne=
l/
> > > > > linux/linux-ti-staging/j721e-evm/0001-arm64-dts-ti-Add-DTB-overla=
ys-for-
> > > > > vision-apps-and-ed.patch?h=3Dkirkstone
> > > > >=20
> > > > > > ~ Judith
> > > > > >=20
> > > > > > >=20
> > > > > > > [1]:
> > > > > > > https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/
> > > > > > > arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=3Dti-linux-6.6.y-ci=
cd#n103
> > > > > > > [2]: https://www.ti.com/tool/PROCESSOR-SDK-AM62A
> > > > > > >=20
> > > > > > > Regards
> > > > > > > Devarsh
> > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opp-table {
> > > > > > > > @@ -741,3 +771,57 @@ dpi1_out: endpoint {
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 };
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > > > > =C2=A0=C2=A0 };
> > > > > > > > +
> > > > > > > > +&mailbox0_cluster0 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 mbox_r5_0: mbox-r5-0 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-rx =3D =
<0 0 0>;
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-tx =3D =
<1 0 0>;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 };
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&mailbox0_cluster1 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 mbox_c7x_0: mbox-c7x-0 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-rx =3D =
<0 0 0>;
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-tx =3D =
<1 0 0>;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 };
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&mailbox0_cluster2 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 mbox_mcu_r5_0: mbox-mcu-r5-0 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-rx =3D =
<0 0 0>;
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-tx =3D =
<1 0 0>;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 };
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&wkup_r5fss0 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&wkup_r5fss0_core0 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 mboxes =3D <&mailbox0_cluster0>, <&mbox=
_r5_0>;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 memory-region =3D <&wkup_r5fss0_core0_d=
ma_memory_region>,
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 <&wkup_r5fss0_core0_memory_region>;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&mcu_r5fss0 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&mcu_r5fss0_core0 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 mboxes =3D <&mailbox0_cluster2>, <&mbox=
_mcu_r5_0>;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 memory-region =3D <&mcu_r5fss0_core0_dm=
a_memory_region>,
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 <&mcu_r5fss0_core0_memory_region>;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&c7x_0 {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 mboxes =3D <&mailbox0_cluster1>, <&mbox=
_c7x_0>;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 memory-region =3D <&c7x_0_dma_memory_re=
gion>,
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 <&c7x_0_memory_region>;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > > > > +};
> > > > > > >=20
> > > > > >=20
> > > > >=20
> > > >=20
> > > >=20
> > >=20
> >=20

--=20
Thanks,
Jai

--5qa2kcidthusc3og
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmf4up4ACgkQQ96R+SSa
cUWHnBAAsnTCPfRwfgVpFb0AOE+j+oPJRLwuQVa+QsvI3Oq7mTmVvPPyzhQkzROI
77st6GKuoOhDOO3xR8wubgWmIsDxvsdbIbZTWfC9Wjn/wg9wpEQw9tJwEk/SCFOL
m+1htpMQts7DDsK2IMhy7d0GeRt/Vv55uFITgW4YyFQYfT22dvmEGAoENBShik+Y
b3Y+OhVGKAyl+wuJdkb9QrV1np19Ty2KEvg0xyFyxgL/SrdOpQWa5sLk//BOt3Hq
pn2I0hQ9AN4Gjee0iH+fdcr/1I3JGrIg0kztYCSk14net/xj8Ja0XrVE6NvogBfq
gHImn8DHSeUyPamJrqtTpp6PAq7H/OBlCK28dBF7Up6aJ0pwirqfh11arpo/5K76
dVSawQD3X2CvLyl2sylVivTQBJy8CrcTlF+arwC05R1fK3QGAQWyM4DI45cWf/a7
MiN+rQvnFpBqJNOVrORYxsUecIe8uP+fV4uxqyLpXB1oEjwpCJiJuweouCBIWg6g
60SyERhRJA+PLmtd2LwPxaJUV1rJuuPNeLb/QLUvm96ORN2zrpBUnrwzQIrLzxyH
yoMDRayjh7p97VuvKd7sRKkuNi71ohBqr7EEF4UwsTHhefjYuoIuMt4WqPNAeG1E
BFSp/+FnSQLb6thmSsqXwVc5R/kxQCIO5oLzHjCDDanJ+0iHesI=
=HZyO
-----END PGP SIGNATURE-----

--5qa2kcidthusc3og--

