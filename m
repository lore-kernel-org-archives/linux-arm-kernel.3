Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8203E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRC7z4Sk0+zr7sT02/jVlflc2yDG3KVJ3Wx0roL3xqY=; b=DXyvOZOlbUo8rPVs/wq5/19T6m
	Uves8G4xwdl4pNpFZ5Z/I6Or2826S5rP4G/LfxfGFkYNwtQbm5SmRTkQxgi6mRfzsesE7SWSASqmR
	idhNnPIi8gk91nly7f+6ivhq2e4tJlPjrjBA8iyq/ynmsRyMo3onu+mU7J6ixUtZspDdhIg0iHm/W
	7DC4INyDHg26E1/Ak7Cqbh/hX5xXoiMFrwBqtzItX8n7HvGscKk/LG0mDaqz22a3VO8Dex595AHld
	U0fiKtPeT3Klx0Z3sPRJ71z2lPrwtaR2K17D650eYwOK5LSDg09EnY+P2T8FVM6yr/6TdE1NUaxXs
	fRPb42fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIA6-00000004psQ-26RC;
	Mon, 13 Jan 2025 10:59:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXI8q-00000004pjp-2WsA;
	Mon, 13 Jan 2025 10:57:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 840A31424;
	Mon, 13 Jan 2025 02:58:22 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FFBB3F66E;
	Mon, 13 Jan 2025 02:57:49 -0800 (PST)
Date: Mon, 13 Jan 2025 10:57:44 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andras Szemzo
 <szemzo.andras@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 06/12] dt-bindings: clk: sunxi-ng: add V853 CCU
 clock/reset
Message-ID: <20250113105744.6f7a47b9@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v67_yMB_4SCjFOR5S6nDxX9=zbX-mDM6YjjL_NRxrEMUFg@mail.gmail.com>
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
	<20250110123923.270626-7-szemzo.andras@gmail.com>
	<de280eed-bcc8-4802-9734-5e95ad1f6611@kernel.org>
	<CAGb2v65arvBMg+reReVqK-Y6dL+CSrSx4618msiRKcNf=Vk1=A@mail.gmail.com>
	<fef71e03-489f-4503-9d1b-d61051d45dde@kernel.org>
	<CAGb2v67_yMB_4SCjFOR5S6nDxX9=zbX-mDM6YjjL_NRxrEMUFg@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_025756_731739_F8178600 
X-CRM114-Status: GOOD (  30.41  )
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

On Mon, 13 Jan 2025 16:45:10 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Mon, Jan 13, 2025 at 4:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 13/01/2025 09:06, Chen-Yu Tsai wrote: =20
> > > On Fri, Jan 10, 2025 at 9:56=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote: =20
> > >>
> > >> On 10/01/2025 13:39, Andras Szemzo wrote: =20
> > >>> As the device tree needs the clock/reset indices, add them to DT bi=
nding
> > >>> headers.
> > >>>
> > >>> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com> =20
> > >>
> > >> That's never a separate commit from the binding.
> > >>
> > >>
> > >> ...
> > >> =20
> > >>> --- /dev/null
> > >>> +++ b/include/dt-bindings/clock/sun8i-v853-r-ccu.h
> > >>> @@ -0,0 +1,16 @@
> > >>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> > >>> +/* Copyright(c) 2020 - 2023 Allwinner Technology Co.,Ltd. All righ=
ts reserved.
> > >>> + *
> > >>> + * Copyright (C) 2023 rengaomin@allwinnertech.com
> > >>> + */
> > >>> +#ifndef _DT_BINDINGS_CLK_SUN8I_V85X_R_CCU_H_
> > >>> +#define _DT_BINDINGS_CLK_SUN8I_V85X_R_CCU_H_
> > >>> +
> > >>> +#define CLK_R_TWD            0
> > >>> +#define CLK_R_PPU            1
> > >>> +#define CLK_R_RTC            2
> > >>> +#define CLK_R_CPUCFG         3
> > >>> +
> > >>> +#define CLK_R_MAX_NO         (CLK_R_CPUCFG + 1) =20
> > >>
> > >> Nope, drop. Not a binding.
> > >> =20
> > >>> +
> > >>> +#endif
> > >>> diff --git a/include/dt-bindings/reset/sun8i-v853-ccu.h b/include/d=
t-bindings/reset/sun8i-v853-ccu.h
> > >>> new file mode 100644
> > >>> index 000000000000..89d94fcbdb55
> > >>> --- /dev/null
> > >>> +++ b/include/dt-bindings/reset/sun8i-v853-ccu.h
> > >>> @@ -0,0 +1,62 @@
> > >>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */ =20
> > >>
> > >> Odd license. Did you copy the file with such license from the downst=
ream? =20
> > >
> > > AFAIK all the existing sunxi clock / reset binding header files are
> > > dual licensed. OOTH all the YAML files are GPL 2.0 only.
> > >
> > > IIRC we started out GPL 2.0 only, but then figured that the header fi=
les
> > > couldn't be shared with non-GPL projects, so we changed those to dual
> > > license.
> > >
> > > Hope that explains the current situation. Relicensing the whole lot
> > > to just MIT or BSD is probably doable. =20
> > That's not what the comment is about. Dual license, as expressed by
> > submitting bindings/patches and enforced by checkpatch are expected. But
> > not GPLv3, GPLv4 and GPLv10. =20
>=20
> I take back my statement. It seems we have a lot of GPLv2 or later going =
on.
>=20
> include/dt-bindings/clock/sun20i-d1-ccu.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun20i-d1-r-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun50i-a100-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun50i-a100-r-ccu.h:/*
> SPDX-License-Identifier: GPL-2.0 */
> include/dt-bindings/clock/sun50i-h6-ccu.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun50i-h6-r-ccu.h:/*
> SPDX-License-Identifier: GPL-2.0 */
> include/dt-bindings/clock/sun50i-h616-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun5i-ccu.h:/* SPDX-License-Identifier:
> GPL-2.0-or-later */
> include/dt-bindings/clock/sun6i-rtc.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun8i-de2.h: * SPDX-License-Identifier:
> (GPL-2.0+ OR MIT)
> include/dt-bindings/clock/sun8i-tcon-top.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/suniv-ccu-f1c100s.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> include/dt-bindings/reset/sun20i-d1-ccu.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun20i-d1-r-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun50i-a100-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun50i-a100-r-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun50i-h6-ccu.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun50i-h6-r-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun50i-h616-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun5i-ccu.h:/* SPDX-License-Identifier:
> GPL-2.0-or-later */
> include/dt-bindings/reset/sun8i-de2.h: * SPDX-License-Identifier:
> (GPL-2.0+ OR MIT)
> include/dt-bindings/reset/suniv-ccu-f1c100s.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>=20
> Is there a requirement that new files have to be GPL 2.0 only, not
> GPL 2.0 or later?
>=20
> Documentation/process/license-rules.rst says:
> The license described in the COPYING file applies to the kernel source
> as a whole, though individual source files can have a different license
> which is required to be compatible with the GPL-2.0::
>=20
>     GPL-1.0+  :  GNU General Public License v1.0 or later
>     GPL-2.0+  :  GNU General Public License v2.0 or later
>     ...
>=20
> Aside from that, individual files can be provided under a dual license,
> e.g. one of the compatible GPL variants and alternatively under a
> permissive license like BSD, MIT etc.

Documentation/devicetree/bindings/submitting-patches.rst overrides the
general rule, for binding files, and it says (GPL-2.0-only OR BSD-2-Clause)
is preferred. Also when I checked checkpatch indeed warned about this. As
for the existing files: yes, many of them are not compliant atm:
$ git grep -h SPDX include/dt-bindings | sort | uniq -c | sort -n | tail -13
     10 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
     13 /* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
     13 /* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
     14 /* SPDX-License-Identifier: GPL-2.0+
     19 /* SPDX-License-Identifier: GPL-2.0
     27 /* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
     31 /* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
     31 /* SPDX-License-Identifier: GPL-2.0-or-later */
     33 /* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
     36 /* SPDX-License-Identifier: GPL-2.0+ */
    176 /* SPDX-License-Identifier: GPL-2.0-only */
    192 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
    281 /* SPDX-License-Identifier: GPL-2.0 */

But for new patches we should definitely aim to be correct. Differing
license requirements are one price we pay for not having a separate DT
repository.

Cheers,
Andre

