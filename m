Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CACC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:Message-ID:Reply-To:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCx/1LsBWaFcKZorRW0A39gqzWAeDXdSVlnLPs6g2no=; b=FQVEnWPTtsd7vz
	2cR9P6SLqbT3j5dqKjir7Z5ywa2i6A0PZYqngy9ArQAhqVLgScRi3gBcfLIJbovtLt6XvAFAuELwa
	PW9IYmpqbu1xSjhE1V6Tu44ot7/IaqH7slmmzzh9MxoLLpg/7s+1p5EQAsU1Ra1ceFuI+rdUn61P8
	jF2a6EUt/oZ/jv1OVKEZnD22kfvvNvMwciUIpsUJGVrMx7ee8+7wMqZ85mY8ATfb3Riie40xAC9cP
	A7sBJUg2FNAF03ihi9j+jxDyExdZHF9z3qK2LxleZeD3ZYmv34eBUbBQScMJIS/bp7KNhvt9gkYx5
	zcm0AT2s7WRjK5Vou1RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwh20-00000009woD-0t7y;
	Wed, 19 Aug 2026 14:12:40 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwh1w-00000009wnZ-3SUc;
	Wed, 19 Aug 2026 14:12:38 +0000
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B22312010D6;
	Wed, 19 Aug 2026 16:12:30 +0200 (CEST)
Message-ID: <032e7297-65b3-477c-9fcc-f6e4bae17a8a@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG
 decoder
To: =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Benjamin Gaignard" <benjamin.gaignard@collabora.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Ezequiel
 Garcia" <ezequiel@vanguardiasur.com.ar>, "Andrzej Pietrasiewicz" <andrzej.p@collabora.com>, "Hans
 Verkuil" <hverkuil@kernel.org>, "Chen-Yu Tsai" <wenst@chromium.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Lucas Sinn" <lucas.sinn@wolfvision.net>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, "Sascha
 Hauer" <s.hauer@pengutronix.de>
In-Reply-To: <5715409.BjyWNHgNrj@diego>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
 <5715409.BjyWNHgNrj@diego>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 14:12:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_071237_019123_D5C47BB7 
X-CRM114-Status: GOOD (  15.18  )
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

Hi,

On 2026-08-19 14:46, Heiko St=C3=BCbner wrote:
> Hi,
>=20
> > +static int vdpu720_fill_chroma(struct hantro_ctx *ctx,
> > +			       struct vb2_v4l2_buffer *dst_buf)
>=20
> [...]
>=20
> > +/**
> > + * rockchip_vpu720_jpeg_dec_init() - allocate the per-context DMA side=
 buffer
> > + * @ctx:	context to allocate the Q/Huffman table buffer for
> > + *
> > + * Return: 0 on success, -ENOMEM if the buffer could not be allocated.
> > + */
>=20
> again comment style ( "/**", also the ctx line could use a blank line abo=
ve it)
> Seemingly one function before this the LLM did get it right?

It's not as inconsistent as it seems. The exported functions have a
kerneldoc header with /** and the arguments described, the static
functions just have a freestyle header. Documentation/doc-guide/kernel-doc.=
rst
also doesn't have a blank line between the function name and the first
argument.

I could change the static function to kerneldoc as well if you prefer
that.

Sascha

--
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


