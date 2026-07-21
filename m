Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68849C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSOO82rGZ9vf4QviO3ci9+FEx87mVFslO4kBFj925fQ=; b=P9HaliUkdwmhC9v9kFwKf0f76P
	RGWer/1UYnmkJtg4nuQEcjw1VBihUQmHJ8DFCxy6wgq9vVBAiB6FVNEQX5nyApwGYFHgxLHDOPkBR
	ahXPK7HY3TIGVOym51MQzvRYf2BqiuBpsBy88xhnPLk91I7CkK6gwXUqvSVAMZOQ+hWRfH7nWeSV6
	POUYfGFvUTone/sR0IZoYrQD2jFQSZ1B/HAe40C2EIEENLVtLcWJQ3f1Pir51BQQ1eRQ1jY13H8Pt
	UxXlhy3KRHpsYyQel3LLBVkOPHDxNms3ZMk4+Snuu8iLAH+sSr3O4kDo+ESPOj2mOQizlDaKPlERO
	N/pBzqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9cz-00000009QSv-1zLQ;
	Tue, 21 Jul 2026 12:31:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9cw-00000009QS8-3dGe;
	Tue, 21 Jul 2026 12:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pSOO82rGZ9vf4QviO3ci9+FEx87mVFslO4kBFj925fQ=; b=TJ4Oysv43cFrTxhtyiWLeDZnBv
	2AjXndaq382fbBu49j+SvshHJlKW8X8MFF2nNBBQI7TXsDoyXKgAVTj0oezpBn35Dq//vFxkPGVEc
	y2QuOd35TUYgbiGGSAgrs/Fcp6Tr+nYrrSFHod5KE+odP6OWylUmkF4MgNGf71dQty8u75VZwyaHO
	HgudQ3MHNt5DOKl4jWhN1lRd+O3tkqelcDlo/55VjuDU+nTy8x1vx8ymNKKHqfbjctkgAr2A4EreE
	DBLj0GGCI7N/RYtMRhq95q3Yn2AFDUzwdiIrz+JpLe2tOsVJqrBx4lIqyuUMcNJHLEDF7O8eT0t/3
	+zlTW0oQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Fabio Estevam <festevam@nabladev.com>, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Bartosz Golaszewski <brgl@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Riesch <michael.riesch@collabora.com>, Rob Herring <robh@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Yao Zi <ziyao@disroot.org>,
 huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
Date: Tue, 21 Jul 2026 14:30:53 +0200
Message-ID: <3926001.VQhiAETyHQ@diego>
In-Reply-To: <20260721-didactic-tan-dodo-112ffc@quoll>
References: <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-4-sjg@chromium.org>
 <20260721-didactic-tan-dodo-112ffc@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_053114_961465_0224394F 
X-CRM114-Status: GOOD (  20.85  )
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

Hi Krzysztof,

Am Dienstag, 21. Juli 2026, 10:16:33 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Krzysztof Kozlowski:
> On Tue, Jul 14, 2026 at 01:36:40PM -0600, Simon Glass wrote:
> > Add the compatibles for the general register files of the Rockchip
> > RV1106: the main GRF, and the per-bank GPIO IOC blocks used by the pin
> > controller.
> >=20
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >=20
> > Changes in v2:
> > - Drop the grf-cru clock-controller child and use the syscon-only
> >   group for the main GRF, since the CRU now provides the MMC phase
> >   clocks
> > - Use a single gpio-ioc compatible for the per-bank IOC blocks in
> >   place of the ioc and pmuioc regions
> >=20
> >  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/=
Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> > index 2cc43742b8e3..fd9235ac1334 100644
> > --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> > +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> > @@ -64,6 +64,8 @@ properties:
> >                - rockchip,rk3588-vo1-grf
> >                - rockchip,rk3588-vop-grf
> >                - rockchip,rv1103b-ioc
> > +              - rockchip,rv1106-gpio-ioc
>=20
> And this also answers my previous email (pinctrl/gpio bank): you have
> one GPIO IOC, not multiple ones, although commit msg tells different
> story. Confusing. The compatible here defines register layout (see
> writing bindings - it is explicitly documented there) so do you have one
> device or multiple with the same register layout?

It's actually option 3 ;-) .

The TRM describes separate General-Register-Files
	GPIO0 - the actual GPIO controller -  0xFF380000
GPIO0_IOC - 0xFF388000  (pinconfig)
	[ bunch of other devices like the video encoder ]
	GPIO1 - 0xFF530000
GPIO1_IOC - 0xFF538000
	...
GPIO2_IOC - 0xFF548000=20
	...
GPIO3_IOC - 0xFF558000
	...
GPIO4_IOC - 0xFF568000

But their register-layouts are definitly not identical. For example in
GPIO0_IOC there is one register controlling Schmitt Triggers at offset
0x58, ( GPIO0_IOC_GPIO0A_IE_SMT ) - because only the first 8 pins have
those, while in GPIO1_IOC, 4 SMT register start at 0x280.

So they do need separate compatibles, per your comment.


Heiko




