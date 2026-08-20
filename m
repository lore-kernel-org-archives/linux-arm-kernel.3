Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3360C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:Message-ID:Reply-To:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SHnjDiUk/kxsq8N50jA/Sn6Ye5nah3e4I7WTFuXyMk=; b=fzBvZF77BQBwqX
	YHygycxN2J9yOU2fazfLPeP95xEm/aOLacm8hS/fI4TrkEVmFF96Df76PNKRitp9N+izu+KQO4PUm
	hAb/CyW4oSrdvZM4zK/C455vh/IkyqwLsDUvQuxV4+xnJsVlhuaYziA2ZT4f3YAZhZRwRRbOgHZPS
	yDjGJllBt3UD4zAlYI2mCueJ+Z8LzyeG7rR9QYYo6eOSmjq+JVcmjEu5J2Q7BnCNKXGox4xFMKKjQ
	3EJhlVbFH2aKvo+VJjce6Do3JjkfxHTQiEvJF/uYDyzS/UdBeSbv2b7Uydw6gJ/pLPrzCPqx8n27a
	j4w8rkSptmJ717Se7uvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzcs-0000000BK7y-3XDO;
	Thu, 20 Aug 2026 10:03:58 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzcp-0000000BK7W-2mCo;
	Thu, 20 Aug 2026 10:03:58 +0000
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 044E3200C95;
	Thu, 20 Aug 2026 12:03:52 +0200 (CEST)
Message-ID: <5436875c-9724-41f3-aaf9-76d43e05f0a8@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG
 decoder
To: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Benjamin Gaignard" <benjamin.gaignard@collabora.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Andrzej
 Pietrasiewicz" <andrzej.p@collabora.com>, "Hans Verkuil" <hverkuil@kernel.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Lucas
 Sinn" <lucas.sinn@wolfvision.net>, "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <2816bd84651dcbfd0cd76bbc56e461bd409f9611.camel@collabora.com>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
 <2816bd84651dcbfd0cd76bbc56e461bd409f9611.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:03:51 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_030355_852350_6FE80EA0 
X-CRM114-Status: GOOD (  12.07  )
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

On 2026-08-19 11:48, Nicolas Dufresne wrote:
> Hi Sascha,
>=20
> Le mercredi 19 ao=C3=BBt 2026 =C3=A0 12:37 +0200, Sascha Hauer a =C3=A9cr=
it=C2=A0:
> > +/* ------------------------------------------------------------------ =
*/
> > +/* Register byte offsets from dec_base=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 */
> > +/* ------------------------------------------------------------------ =
*/
> > +
> > +/* REG0: IP version / product ID */
> > +#define VDPU720_REG_VERSION		0x000
> > +#define VDPU720_PROD_NUM		GENMASK(31, 16)
> > +#define VDPU720_BIT_DEPTH		BIT(8)
>=20
> Can you share a dump and share these register reset values. Looking at the
> layout, clearly its highly modified, but probably derived from VSI multi-=
codec,
> but I'm thinking perhaps we'll learn more from that. Its always nice to j=
ustify
> when adding more chips that are not strictly VSI designs (or maybe it is)=
 to the
> hantro dirver.

Here's a full register dump right after reset:

00000000: db1f0005 00000004 00120000 00000000
00000010: 00004400 00000000 00000000 00000000
00000020: 00000000 00000000 00000000 00000000
00000030: 00000000 00000000 00000000 00000000
00000040: 000000ff 00000000 00000000 00000000
00000050: 00000000 00000000 00000000 00000000
00000060: 00000000 00000000 00000000 00000000
00000070: 00000000 00000000 000000a8 00000001
00000080: 00200000 00080f06 00000000 00000000
00000090: 00000000 00000000 00000000 00000000
000000a0: 00040000 00001556 00000000 00000000
000000b0: 00000000 00000000 00000000 00000000
...
000003f0: 00000000 00000000 00000000 00000000

Sascha

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


