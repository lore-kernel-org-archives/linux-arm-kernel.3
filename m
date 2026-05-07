Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C111CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4r8mXmt6skT6Iq4+j8vT+vFH5yMYCK775SlOiUC7Pz8=; b=aozkGfyNatpZ7a7Mys5nm7Z979
	uW2IN7sTk+vTYXb0Q3zD4jf1JkDjvi7cBoWkm7NqwCl0RQgSjURRkFbnDiavXoHz7SzeU54mX4IRX
	Yx8NNgL42XNMjDJx9QaZVQr6Ai1uW7Us7V+fU9VvJryrGYJCgklAEgLLtwlFCNmbHofYyvvgqgWIt
	laLwhsxTJk8db+n7s11vJB9EG8h+V9Pwa+8BOsTtiFZzoCo6kMu+VdDPLZP7ZPsYlWs72WFpTFAf1
	AAbpnEsu54rk0PVosGEysH83+eGeFBtAJ3EgFyO51rOVyB4M04qSyl2vhgscZKxyKVQxB0kt/kaNF
	DSFca+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx8N-00000003gbW-02VH;
	Thu, 07 May 2026 11:43:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx8L-00000003gbG-3rr9;
	Thu, 07 May 2026 11:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4r8mXmt6skT6Iq4+j8vT+vFH5yMYCK775SlOiUC7Pz8=; b=cIprbon4xAZUZxkLolSUwuPPuW
	4u9IsCOsQY0qCm0oV82oN+GCBIxfqX5u5XV8hLtAn8vUNqCYITPS6L+tbA68Nv6wdQXMmE4vrbN8L
	gY/XRHRXz2CYOM4NINMoDCiSrC07dKkwa6AAvSzkoGLZXzrM47t3Ia6IqSDG3qgbC+QIDnnuXZLx9
	pXQUdI29P27pslgsUInh7kPeRxusaLLnkDWCKzgZXSQb7zLOyQK4uKC29qbCa0md8QnJRqgQtGps9
	Io65q1yeYIefAvHF9LRUGJMlC/QGr16KvvORol2YRkZjQBf03TDI5eHrBBZLMe56s4fWt0Bf3y+4b
	r5mwZ+QA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx8H-00000003Nxo-2XUl;
	Thu, 07 May 2026 11:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4r8mXmt6skT6Iq4+j8vT+vFH5yMYCK775SlOiUC7Pz8=; b=CrnNjN0m1XtdyHqmY1+DsuV07f
	lXViUR5+x6r0ra86n7QkOwbcU9cOmz6apNfoWfKVfKmcJ0LTLLHu7825NJV++k9NI0JkU8ZbOfOJ0
	8U8tTajXryp345oruqepaUy0z0sRG7tMwko2jAZWy5hG0fd1Ddzfss/vs9nf4VZk7koMLfx6y0tNG
	IjcH5Ymz08Nax4PCDgDuLTP7d5c7A9EVicNV/qLjb73snybFH8ZkjDQuKCX3dICtovMpiBpKGl6bE
	r/CkQXJUkeTN+Q9fvmAiv3/uxerNxIMwlZBBdkOOpmtLi7ILOe/5+Q90pXE+RE0TrP/WM+FlhBLpQ
	DSRMe4rw==;
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: display: rockchip: analogix-dp: Expand
 clock-names "hclk" for the third clock
Date: Thu, 07 May 2026 13:42:50 +0200
Message-ID: <4528155.7s5MMGUR32@phil>
In-Reply-To: <6496645.8F6SAcFxjW@phil>
References: <20260507112948.1115003-1-damon.ding@rock-chips.com>
 <20260507112948.1115003-2-damon.ding@rock-chips.com>
 <6496645.8F6SAcFxjW@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_124310_093297_589AA021 
X-CRM114-Status: GOOD (  17.69  )
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

Am Donnerstag, 7. Mai 2026, 13:40:09 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Heiko Stuebner:
> Hi Damon,
>=20
> Am Donnerstag, 7. Mai 2026, 13:29:39 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Damon Ding:
> > The RK3588 eDP controller needs the video datapath clock "hclk" to work
> > well. Previously, it works without explicitly adding this clock because
> > the 'rockchip,vo-grf =3D <&vo1_grf>' property implicitly enables HCLK_V=
O1.
> >
> > Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add =
support for RK3588")
> > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > ---
> >  .../bindings/display/rockchip/rockchip,analogix-dp.yaml       | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchi=
p,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/roc=
kchip,analogix-dp.yaml
> > index d99b23b88cc5..d2bc8636b626 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analo=
gix-dp.yaml
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analo=
gix-dp.yaml
> > @@ -26,7 +26,9 @@ properties:
> >      items:
> >        - const: dp
> >        - const: pclk
> > -      - const: grf
> > +      - enum:
> > +          - grf
> > +          - hclk
>=20
> are you sure about that?
>=20
> The edp uses the vo1-grf - so what enables its clock?
> For example the hdmi controllers on rk3588 also use the vo1-grf and
> explicitly handle that clock.
>=20
> So who does it for the eDP?

Ah, ... found the hclk_vo1 in the following patches.

Still the binding commit message could use some more words about what that
clock is, and why it can "replace" the GRF clock from earlier SoCs.

Heiko



