Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2A2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 17:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+/KxXBskIK0RDTyhCfGrQo8tmuDxH8xOQwGZDnbOPQ=; b=huRW9OfMzY+vvbg0KofiFwnf8s
	d/xx5RKSMAQlD2FkKJLQK0Fi+ueyiRlMJWpmm6j3GDJI4grCtvy7r+jCMyGToz8P88mKlE43uZY0y
	rXgxMHm+aLGO5i58oXV6fLIRYBFWnLxaDZdExS84xfJfWgM7LtXg7KpA3a9hgR1777MK/ktQ23768
	oOoQPUxnc0V6YpAvidjlkPj5OXj2JwKTS5zTRlyZK1bPFLh+3i+cNG6aVuzuxIfJ6Q4uAFOa6dpzy
	uMWjxvRqBm+jgw08V03Ll/7ePgK89VfQbAg2712gBHgxVVclNsaZS2DuuFraHV86sSVDVzHIb8qez
	eTIJxzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAFs-00000007aFd-3zX9;
	Sun, 11 May 2025 17:14:24 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEADp-00000007a62-1uDw;
	Sun, 11 May 2025 17:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1746983499; x=1747588299; i=frank-w@public-files.de;
	bh=4+/KxXBskIK0RDTyhCfGrQo8tmuDxH8xOQwGZDnbOPQ=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OX7AyRVEpFno29IwtlTF2VTBMnL6+B/hMphY9BZduRqbICI0urp+cWWCA91uWgkZ
	 xGlO2sb+/XdfxUYJuT0y/LgAhv3c417X3o4faq7ZXEYqkb1+EgBS9md17avwMXSsS
	 1FxWgHOWlQ45pqgCooptU69Idn+20S6Mt8BIeL/HEF0Bloqx4Wso8xyOht7RXd/Hl
	 aZt5EcB71LIvUHh/h6JaVJEPm679Vv1n7Oe7Gg5r6g/bd1dO5GLhiQ518y3xqPHOU
	 xadwoqn4n3g9F1dBspCuPrMm9XldMc2Vy2og9fUqoCdKHW9BEeuvgr4rpEljev62D
	 fAMyEtf3u6uXMtpNDg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [194.15.84.99] ([194.15.84.99]) by
 trinity-msg-rest-gmx-gmx-live-74d694d854-64x2n (via HTTP); Sun, 11 May 2025
 17:11:38 +0000
MIME-Version: 1.0
Message-ID: <trinity-a7d75144-e618-4e09-ab4b-42e8557adb93-1746983498805@trinity-msg-rest-gmx-gmx-live-74d694d854-64x2n>
From: Frank Wunderlich <frank-w@public-files.de>
To: andrew@lunn.ch, linux@fw-web.de
Cc: olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
 Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 daniel@makrotopia.org, lorenzo@kernel.org, nbd@nbd.name,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Aw: Re: [PATCH v1 02/14] dt-bindings: net: dsa: mediatek,mt7530:
 add dsa-port definition for mt7988
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 May 2025 17:11:38 +0000
In-Reply-To: <88d93b58-84f3-4394-80ed-9adf67d525f4@lunn.ch>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-3-linux@fw-web.de>
 <043d1a0a-1932-42f3-bcd8-17fad10c5543@lunn.ch>
 <88d93b58-84f3-4394-80ed-9adf67d525f4@lunn.ch>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:IEgHLeNpmXm8RjqZWMnrNFlf2ZQICiEArO7hSHNKwiHWYLtBLg/DWUlg1cBIYLoCCfipT
 UZLgTYfr0qJOwNc1fcYe45/v7asWaMd0+3Z8htRjIf3oFfEVPXxi96WPvAbUCqKagU1CguYfJyGv
 NwviTo/6uLvP4wYdr6ck8N77JeBjgdDXlSUIleVJ6utOXEvHiWDwhDauu5JQ3ybh5g7Ktr7L5dzS
 eYyYzY8DSsUeh0HJPEtbfMgeAVY5KCC9f+l8oNVNHQe52ybkw6ZR7VFIHLeeYtGRsG4lPvL9b/tr
 n1ntMXXuJDyMAjXDTekZB+66Ps4yMppb3I1fEhQRlqaRk7fSed7nw7U+oW2GYliShc=
UI-OutboundReport: notjunk:1;M01:P0:LzP0Bc1axNI=;228SBXE+fpIqt/AekccYzb43SZD
 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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_101217_802938_55B38142 
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

> Gesendet: Sonntag, 11. Mai 2025 um 18:45
> Von: "Andrew Lunn" <andrew@lunn.ch>
> Betreff: Re: [PATCH v1 02/14] dt-bindings: net: dsa: mediatek,mt7530: ad=
d dsa-port definition for mt7988
>
> On Sun, May 11, 2025 at 06:34:30PM +0200, Andrew Lunn wrote:
> > On Sun, May 11, 2025 at 04:19:18PM +0200, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > >=20
> > > Add own dsa-port binding for SoC with internal switch where only phy=
-mode
> > > 'internal' is valid.
> >=20
> > So these internal PHYs don't have LEDs?
>=20
> Ah, i got that wrong, sorry.
>=20
> What i don't know about here is if you should be defining your own
> ds-port binding, or taking the existing binding and add a constraint.

Hi Andrew

thank you for first review.

this patch is only for allowing the phy-mode 'internal' and corrects the w=
rong mapping to mt7530-das-port which allows rgmii and sgmii which are inv=
alid on mt7530.
i splitted the changes in binding to not squash different changes.

the phys with leds are on the builtin mt7530 internal mdio-bus which i add=
 in patch 3.

regards Frank

