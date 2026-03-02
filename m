Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19937E9B359
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kO11BKmKFYoC09eco+6dmdwTd3OQRCC8tF7pTfHduz0=; b=R5Lu+Rp30SAzRTMka1HRr6sp+4
	AdrXdvQ17uGlmv9JnADIZixRmndibxpMfAxRNoU+E0i4G1waqULHFvgs03UIwD6OvwROQ8Z6HX0Zw
	6BFb33piSbNepzL+ZlgjYr9oNhIwQ6KTlrFo4mefzs5tlFgNagnttHTzPoCfttJmvLxisme0ftQW5
	20WP1ZSP4T8h9hMoz9TAfIG0UpmUaAtIDLQ9zpNIHX8QXsVSAwn+h/PsWVyYN4GK576HRDVoPwxKf
	vhdh/xnHKbZynJwOl1XLgaEjC259AVKzDKNKRbdBFG3cDx74Twxq9ldN1oUgxC4ykaTN+7ebcVrHE
	qDvefLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0dv-0000000CimI-3Kti;
	Mon, 02 Mar 2026 10:36:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0dt-0000000Cilp-1C28;
	Mon, 02 Mar 2026 10:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kO11BKmKFYoC09eco+6dmdwTd3OQRCC8tF7pTfHduz0=; b=EKp0nFdi5sCj9Lg7x8UsS+uiqc
	uOvigeWC9f4WnNKIN4GhoQw2dIh6fy7FDYFCbKnU/BNYLRbxws6nPC7s/rEmjkgmWtVT2qypJS6gE
	dSF84nfAkxRlqNyP86G63N5Ly7nfyn6gi3VYt479afbCYyC7CSljkjfZ3hhyrMagc6HHw1qyOmncN
	qH67492d+MY9KH43uYzR/wO0arMiOe/1VsHZK2Guye+xehGUYaiMgxPdCbXJsduK7c/P1pjB4ZEL5
	MWiykNb/FfbPcqLWjTIIFfXoSWW+Xnao4VUjXPfbxZhGJY+ylhYwamAaFx0+UAnk1SC28k0LNdI+N
	yFzfzckw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: rk3036: Move PHY reset to ethernet-phy
 node
Date: Mon, 02 Mar 2026 11:36:42 +0100
Message-ID: <5051965.GXAFRqVoOG@phil>
In-Reply-To: <CAOMZO5CfmS2UEd8JwbR7WHRhTVR4m6cOZUBxhXWAf2zxNhY-Fw@mail.gmail.com>
References: <20260228013257.256973-1-festevam@gmail.com> <2819870.mvXUDI8C0e@phil>
 <CAOMZO5CfmS2UEd8JwbR7WHRhTVR4m6cOZUBxhXWAf2zxNhY-Fw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_023649_493590_720C4157 
X-CRM114-Status: GOOD (  17.04  )
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

Hey Fabio,

Am Samstag, 28. Februar 2026, 13:15:52 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Fabio Estevam:
> Hi Heiko,
>=20
> On Sat, Feb 28, 2026 at 8:40=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> =
wrote:
>=20
> > please don't send patches that "simply" fix devicetree warnings.
> >
> > As you can see in [0] the driver uses these properties currently.
> > So while this fixes schema warnings, it will break the actual boards.
> >
> > So first of all you'll need to adapt the driver to handle the "official"
> > properties and also provide a fallback in the driver for old devicetree=
s.
>=20
> The rk3066a-rayeager board describes the reset-gpios inside the
> Ethernet PHY node:
>=20
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/rockchip/=
rk3066a-rayeager.dts#L155-L157
>=20
> Is this broken?

No it isn't :-) .

That's what I get when I try looking at patches on a saturday before
coffee ;-) .

With the reset moving into the phy-node, the phy driver will trigger its
reset itself of course. The arc-mdio also request the reset-gpio as
optional, so the whole thing won't fail if te gpio is not present.

Sorry about the noise, the patch is correct obviously.


Heiko



