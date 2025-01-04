Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C55E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JslSRXZQW2B2iI6OD1h+BkI2tuoDRo7TYAnl4czhQGc=; b=xdlkEaIOdnSAEuV1J66WF0Bepc
	V8WfdV4M/NdT1Yohw+17cEIILKQW+Aq0vkkzMyFExArEBsvV8T/z8Zd9MxYNzCoAP2wmYIV/crNBh
	8lVIAAYDtbTFNfdD9JE5+hoKjuqf6FRNYGVFWrQjj6RuiXcyp6iGWLfkzWxqxhjaUlhYjL4lpvoaS
	9UuzXGM/aaiiCZx4kZJsZbNcioi6WIlmXi39+JmDQaYhDWaeS5zwehWgNjMrlKmiArgR0LFvrbnho
	/7IccmwQBK2WmN9gPICqp1GmIKTsRulTi/Uy6whsjXEIR2PtoJqiMIA6f5kEm8Y/6Dy+oloOkewYU
	qWjIrvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU2u7-0000000EwwA-1w9l;
	Sat, 04 Jan 2025 12:05:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU2sv-0000000EwrE-2YTk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 12:04:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 995801480;
	Sat,  4 Jan 2025 04:04:31 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E520B3F6A8;
	Sat,  4 Jan 2025 04:04:00 -0800 (PST)
Date: Sat, 4 Jan 2025 12:02:56 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman
 Beranek <me@crly.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Dragan Simic
 <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, Stuart Gathman
 <stuart@gathman.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X
 and PLL_MIPI
Message-ID: <20250104120256.65511a28@minigeek.lan>
In-Reply-To: <ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
	<20250104074035.1611136-2-anarsoul@gmail.com>
	<CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
	<ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_040405_687420_71073B28 
X-CRM114-Status: GOOD (  21.10  )
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

On Sat, 4 Jan 2025 11:33:23 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/01/2025 11:23, Chen-Yu Tsai wrote:
> > On Sat, Jan 4, 2025 at 3:40=E2=80=AFPM Vasily Khoruzhick <anarsoul@gmai=
l.com> wrote: =20
> >>
> >> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> >> select TCON0 clock parent in dts
> >>
> >> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCO=
N0 mux")
> >> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> >> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> >> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> >> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >> ---
> >>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-b=
indings/clock/sun50i-a64-ccu.h
> >> index 175892189e9d..4f220ea7a23c 100644
> >> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
> >> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
> >> @@ -44,7 +44,9 @@
> >>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
> >>
> >>  #define CLK_PLL_VIDEO0         7
> >> +#define CLK_PLL_VIDEO0_2X      8
> >>  #define CLK_PLL_PERIPH0                11
> >> +#define CLK_PLL_MIPI           17 =20
> >=20
> > You can't really split code movement into two patches.
> >=20
> > With this patch applied the clk driver will fail to build because
> > the macros are now redefined in both header files. =20
>=20
> Are you sure? The values seem the same to me... I don't see how this
> could fail.

Yes, IIRC the C standard allows repeated definitions with the same
value. And I definitely tested this before (and hence recommended this
approach to Vasily) and it compiled without any warnings here.

Cheers,
Andre

>=20
> >=20
> > Barring recombining the patches, please add a patch before this
> > adding #ifndef's around the two macros that are moved.
> >  =20
>=20
> No, not necessary, just churn,
>=20
>=20
> Best regards,
> Krzysztof
>=20


