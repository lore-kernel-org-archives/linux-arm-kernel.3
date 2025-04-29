Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DEBC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xZF0fCVJ/DOQqNhoX6uI9qtKjJAMwNhaOgH0CA8ZdM=; b=zWtQg054Qf1qRYEz0ZW+BAGVhg
	ppJwiWwkL6OXkQTwnYaOca8WyekLrubqAd/Ty+MKQp+dLSeAftU41Earpw/qkGvh4SqiTBR5DDwhh
	z7WK+pwl1QT1jn+tlU6KnJf8kJ/MPwTHzYdMuYlk/L66NP2b3CSEryCscapoWEn5WkXjShhD8+PLT
	lItw5UqmO9kWyl7zwmi3biPCdeHOFotEL90NPJ6OIN6EeTeefNkf3lb8cC0Gf3NQxaoolUI24TdAG
	tMkykgxI5vHNSr86cyKXYkuU8Absq0f1Ly3vk3N7tBaoVGOcOr/oFvUrj+EBMRVWwD+49LsnZRW0K
	yHQhAi8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nYi-0000000ADZs-3rzY;
	Tue, 29 Apr 2025 16:11:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9n7Z-0000000AABD-1b3F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:43:46 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1u9n7I-0006Jb-0X; Tue, 29 Apr 2025 17:43:28 +0200
Message-ID: <aca3addbe510c58524af8d3fd069fe2ae4b1cd24.camel@pengutronix.de>
Subject: Re: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC
 DTSI
From: Lucas Stach <l.stach@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Tue, 29 Apr 2025 17:43:26 +0200
In-Reply-To: <c2d8374b-b623-447d-a695-3f2ead068265@linaro.org>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
	 <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
	 <c5538590-efe4-4b90-b291-6c429d8fa3fe@kernel.org>
	 <06efb082c24176e6401265b4349b677468850f7d.camel@pengutronix.de>
	 <c2d8374b-b623-447d-a695-3f2ead068265@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_084345_418984_434A9D64 
X-CRM114-Status: GOOD (  36.93  )
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

Am Dienstag, dem 29.04.2025 um 17:17 +0200 schrieb Krzysztof Kozlowski:
> On 29/04/2025 17:13, Lucas Stach wrote:
> > Am Dienstag, dem 29.04.2025 um 16:30 +0200 schrieb Krzysztof Kozlowski:
> > > On 29/04/2025 11:39, Lucas Stach wrote:
> > > > Hi Krzysztof,
> > > >=20
> > > > Am Freitag, dem 25.04.2025 um 21:48 +0200 schrieb Krzysztof Kozlows=
ki:
> > > > > Not tested on hardware.
> > > > >=20
> > > > > Ethernet interface, like other exposed interfaces, aliases depend=
 on
> > > > > actual board configuration, e.g. its labeling, thus aliases shoul=
d be
> > > > > defined per each board or each SoM.
> > > > >=20
> > > > > Some boards (e.g. Gateworks) follow this convention but many do n=
ot.
> > > > >=20
> > > > > This is continuation of my comments from:
> > > > > https://lore.kernel.org/r/16a98816-f43c-4f4d-940e-9da30cb1f73f@ke=
rnel.org
> > > > >=20
> > > > The i.MX boards have traditionally listed aliases for many hardware
> > > > peripherals with the same numbering that's used in the SoC referenc=
e
> > >=20
> > > ... which is not correct. Aliases should represent how boards are rea=
lly
> > > labeled, not how reference manual labels them.
> > >=20
> > While that is the commonly agreed interpretation today, I do not see
> > any language in the DT spec itself or kernel Documentation/devicetree
> > that would mandate aliases to be used in this way.
> >=20
> > In fact there are examples to the contrary like
> > Documentation/devicetree/bindings/serial/samsung_uart.yaml which says:
> > "Each Samsung UART should have an alias [...] as specified by User's
> > Manual of respective SoC."
>=20
> And that is an ABI. Did I affect ABI here?
>=20
> >=20
> > So I would argue that there is no hard line between correct/incorrect
> > for the historical usage of the alias nodes on the i.MX platform.
>=20
> There is. ABI is documented. There are things which turn out ABI, even
> though they are not documented, like node names. Was there a problem
> with refactoring these in NXP?
>=20
> No.
>=20
In fact there was significant fallout from the node name changes, as
assumptions in bootloader code on how to fix up DTs passed to the
kernel were invalidated. We did not make a fuzz about those cases and
just fixed the breakage in the bootloader, because we agreed with the
overall benefit of those changes to the i.MX ecosystem.
>=20
> >=20
> > > > manual. Boards always have the option to override those aliases if =
they
> > > > have a good reason to do so, e.g. labeling on the physical device.
> > > >=20
> > > > Other users besides Linux rely on fixed numbering provided by the
> > > > aliases. Both barebox and U-Boot number their ethernet interfaces
> > > > according to the alias.
> > >=20
> > > And?
> > >=20
> > Some usecases depend on the aliases being the same between kernel and
> > bootloader. Historically that has been guaranteed on the i.MX platform
> > by the aliases in the SoC DTSI, when the board didn't have a need to
>=20
> I know.
>=20
> > change them. With this series applied some other users may now end up
> > with missing aliases if the only include the DTSI.
>=20
> Bring actual case, what is broken by this changeset.
>=20
> >=20
> > > >=20
> > > > While you seem to add back aliases for in-tree boards, this breaks =
the
> > > > majority of boards that include the kernel DTSI from an out-of-tree
> > > > board. I can understand that we can't always accommodate these user=
s,
> > >=20
> > > This is not ABI, so every out of tree user is on their own.
> >=20
> > I am not too sympathetic about out-of-tree users myself, but I don't
> > think we should make their life harder deliberately.
>=20
> We are making our life easier by maintaining and improving source code:
> e.g. not creating fake aliases for devices which do not exist on given
> board.

Sorry, I disagree with this sweeping statement when looking at the
specific changes in this patchset. I simply do not see how this change
significantly improves future maintenance of existing DTs for the i.MX
platform to justify the breakage inflicted upon existing OOT users.

I'm not the one to decide whether or not to take those patches, but
IMHO the overall benefit of those patches to the i.MX ecosystem is not
a net positive.

Regards,
Lucas

