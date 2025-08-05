Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6653C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJddaOeU3Hkdby17XMp2Ksf7awKJoNwMP512nK3y868=; b=LhBcCS6HBRQzwKxkFTnwyY42AZ
	75/girVpd/7t7pnbH5rjLFbxAcSrwRrED/avezIlhv26y/1rz6AczZg1dPQSR/02jYiK8ySmXJx57
	stR4FWSVNaelPa0dkXYV1eyWrM0ZtCalcferzaYxdzdq/7MW0d4oFALlh5MpXTb6cxR5s+sj/0FAb
	qJ9N96RQh6xV3i6X0YwFIMNaivSk7of8XfsNAWVMiaCtUKNH5zJqmL1kONOSohtL1dVG/Qxc2iH5K
	8aHSxEo4ifclAT3G+FJrVdGuPiOy7y7Ow+fxUgpV4atS1M3Dx4ebJfSQwXuQwP5Q/6xw9lZNFVkNP
	mA9nj+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBXL-0000000Bwx5-2OwB;
	Tue, 05 Aug 2025 06:52:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBPM-0000000BvI4-0iUt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 06:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55699A4BB3D;
	Tue,  5 Aug 2025 06:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C91FC4CEF4;
	Tue,  5 Aug 2025 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754376263;
	bh=zmCWDbWtpbzzMgGs32xyb++YFUupJejY/iPWbySknCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UOWSRomr0pF+kNq2Wqx0WlNWOK9zgM8cUY4Q8tKNvhWGi7wzFQdn2ouq4/W9+uH85
	 mzCdCgNqfZslO1QHOiHipKSZvLTfL8KESWciykzs3LDpWEmdYWFp+YItmvxl7WUBr4
	 LZU4bjSpoT3Dse6+qPk9lzuxQ1i79ZeHBY3qtTkUlaMiw42Pss9n+Wok3g4oJwxsQb
	 vttuoPPbgCp6JTHu69W+t2Mjl6Dl+xWNJIvyr/I7GOjMRd9TmlwPDeQ98JQIn44OQW
	 TqrUjW/ZeBMqSYB9xaslr0IJaWLP3EGmNFSFN4BJ0OjrszA4lrqI1jOBi/1ARtSeNW
	 172AqkZbP6dYQ==
Date: Tue, 5 Aug 2025 08:44:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, thomas.petazzoni@bootlin.com, Jyri Sarha <jsarha@ti.com>, 
	Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl
 property
Message-ID: <20250805-imperial-bobcat-of-improvement-5cf705@kuoka>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <20250730-fix-edge-handling-v1-3-1bdfb3fe7922@bootlin.com>
 <20250731001725.GA1938112-robh@kernel.org>
 <8a2b1876-d1d4-4523-ae6a-bd14875772cf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8a2b1876-d1d4-4523-ae6a-bd14875772cf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_234424_454590_F000209B 
X-CRM114-Status: GOOD (  21.94  )
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

On Thu, Jul 31, 2025 at 11:50:16AM +0200, Louis Chauvet wrote:
>=20
>=20
> Le 31/07/2025 =C3=A0 02:17, Rob Herring a =C3=A9crit=C2=A0:
> > On Wed, Jul 30, 2025 at 07:02:46PM +0200, Louis Chauvet wrote:
> > > For am62 processors, we need to use the newly created clk-ctrl proper=
ty to
> > > properly handle data edge sampling configuration. Add them in the main
> > > device tree.
> > >=20
> > > Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform =
Display SubSystem")
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >=20
> > > Cc: stable@vger.kernel.org
> > > ---
> > >   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/bo=
ot/dts/ti/k3-am62-main.dtsi
> > > index 9e0b6eee9ac77d66869915b2d7bec3e2275c03ea..d3131e6da8e70fde035d3=
c44716f939e8167795a 100644
> > > --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> > > +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> > > @@ -76,6 +76,11 @@ audio_refclk1: clock-controller@82e4 {
> > >   			assigned-clock-parents =3D <&k3_clks 157 18>;
> > >   			#clock-cells =3D <0>;
> > >   		};
> > > +
> > > +		dss_clk_ctrl: dss_clk_ctrl@8300 {
> > > +			compatible =3D "ti,am625-dss-clk-ctrl", "syscon";
> > > +			reg =3D <0x8300 0x4>;
> >=20
> > H/w blocks are rarely only 4 bytes of registers... Does this belong to
> > some larger block. The problem with bindings defining single registers
> > like this is they don't get defined until needed and you have a constant
> > stream of DT updates.
>=20
> In this case, I don't think there is a "larger block". This register exis=
ts
> only because TI had issues in the display controller [1].
>=20
> Here is the extract of MMR registers ([2], page 4311):
>=20
> [...]
> A2E4h AUDIO_REFCLK1_CTRL_PROXY <unrelated>

Here is clk ctrl proxy...

> A300h DPI0_CLK_CTRL_PROXY <this register, 32 bits>

and here as well, so pretty related. This looks also close to regular
syscon and we do not define individual syscon registers as device nodes.

Best regards,
Krzysztof


