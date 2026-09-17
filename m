Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F44C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0kQ20G2GyxZdcHxUkGcj/TBXWhOw07BqxWa+U6dizM=; b=gMBUtYhGH8XQVyTzFBD1DC3/jG
	NPB4TOt8Cx5jWtfY/WWXk4ZMWx1ICBdbd73JW7BnYNtKELliGsiYtt7hVlVpps8iOcEupl5TsBKG4
	vu3PLS6CtPqUW/bsSvcubAd/fHzHB4dVRO7zyTxYyHbGNVqCKV6oNA0icCIJHWRUaBDOUN1nX4YKc
	SJ61vT5+VpAt3tRODwCriutbS82EKDVclbZxLylmrdAD4yWZU0kOtjUJ37ru7YS2ym7r1uEB/v75r
	K05fU2lnUBV5/wKsJTq9+ooTS07I1qKzgDdUtS2f0v+Y2llTmhh/oKDjZpzGtcET1nDYcS5Pd0GHt
	tqt2zblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Coa-0000000BWB3-2lsE;
	Thu, 17 Sep 2026 14:10:16 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CoY-0000000BW9g-15wk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789654209; x=1789913409;
	bh=U0kQ20G2GyxZdcHxUkGcj/TBXWhOw07BqxWa+U6dizM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VpH4rEUBVwNKZgtPJluSktDjlAEaDfH9VaOD8Ng8JlUBzmMpsjdlGr8CVNiWja20l
	 gO+htypaYTX/BL0L05eQMXuidQd9iztEmx6LJOJy1jYmXmLXWk6XsV76zS+eCsA9pJ
	 rzJxATVC1aU0YNUbVeDpfD5H0fQGgkEpzU/7kF+rYpOfCaxw2Cx2aYofu16/UFk3sX
	 sOd3eseesWQLxg21VH/VbgXWW6C+UF1annJDvjofIez00QrXGyM16DTiOKz5eB+lyb
	 7iyjkWnxJBtzIq0qxrVqwyrOhob62RKIfxEMdGJS1Rdj8Ig8BJKR/jFpKka0mW9gpZ
	 peV8noiaE7Cog==
Date: Thu, 17 Sep 2026 14:10:04 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: mtu3: introduce platform data
Message-ID: <W3RQEXxvwip3Mexf-O8unMK1o-0tjlq2OUYD6DJVSdy9d6JmV0JJsp6RmWGcecqc8KGiLlxpuP-vE2u03s29zsytiROc17Vp_EoVQdjqyIg=@protonmail.com>
In-Reply-To: <b3b2f2ae-1eb1-4d3d-9f4b-4de3868802f1@collabora.com>
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com> <20260917-6595-mtu3-v1-2-a2ba7c230d68@protonmail.com> <b3b2f2ae-1eb1-4d3d-9f4b-4de3868802f1@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 2e9365794284a1e4314c717f619a219150d8bd88
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_071014_442250_FAD208F1 
X-CRM114-Status: GOOD (  12.29  )
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

Hi Angelo,

On Thursday, September 17th, 2026 at 4:41 PM, AngeloGioacchino Del Regno <a=
ngelogioacchino.delregno@collabora.com> wrote:

> On 9/17/26 09:32, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
>=20
> That's good, but the commit title doesn't explain anything.
>=20
> usb: mtu3: Add SoC platform data for FIFO slots ?
>=20
> ...or anything else that actually explains what you're doing.

Ack.

>=20
> > Some SoCs, such as mt6595, require specific quirks for the MTU3 to
> > function properly.
> >
> > The mt6595 IP block doesn't support multiple slots for the FIFO,
> > resulting FIFO wrap.
> >
> > Fix this by adding platform data with a field to handle FIFO limitation=
.
>=20
> Well, also say that this commit brings no functional differences for the
> currently supported SoCs :-)

Indeed. Will do.

...

> > +=09unsigned single_slot:1;
>=20
> unsigned fifo_single_slot:1 ?
>=20
> ...or you can bring the entire pdata structure in there for easy future e=
xtension.
> Your choice.

I don't think it's worth pulling 4 or 8 bytes just for one flag. Let it
be a bitfield for now.

Other comments will be fixed in v2.

Best regards,
Roman

