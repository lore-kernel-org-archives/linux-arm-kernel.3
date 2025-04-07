Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEFFC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOzc5uHgTpunL565FHUIuaOtIJTW1Qb46HIAlOqLvkM=; b=DQjSfNiTfHfRF7H5PbZP/cibry
	s6fWp4PsS6VJyqbI5A+MfWywqehsx1q47VZNoGPF9nb/0uHrZcTq9OiEhljrLob2x5VgwXkSvraxv
	/EJX99PYzHNH6zUhlnIUyaPoy4AvJRHH0wXMehnu7RwpJlddGuw9JxKUYS1dJDEJDvE6Gz5wWioR+
	cSC2gioMt9+c8VHMlGzv2cwZ8I8rxG9aQrf0Mi5Rq5obJqMXZyBGLdukoExDTLAzZBulwpkAU1pv2
	LHfXcvEcQnfOD0QBVaZnrDPj7e9CH9NDZUpMzr+udu6yGigmS2ZPZ9Bio8HPODxieXvLZAG0eVf/L
	aCRGs1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYK-00000001cmG-25qz;
	Mon, 07 Apr 2025 18:50:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pWe-00000001FHA-2HTo;
	Mon, 07 Apr 2025 16:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IOzc5uHgTpunL565FHUIuaOtIJTW1Qb46HIAlOqLvkM=; b=rVRiuJUqpKQykF8IkzHHG1cYvl
	JfEJJbtQfqEUPsVe1juk2WFvDDMk7dLDBF+irDIUAVIk6wJ/zplj/kSlIP/OIoGt87145H67z8vNW
	mskp3VybCCW1sfrEONXKw7hYSBYo1GjEWBkT6g7+C5m35n75rp/roJ14iUxlQbMtkgqASkMF45Uow
	6diPFyhKrsmyx9IAgOZhP/jzBrF8Q8kTlYySrLNmwGuUuENNpUzzGkfUcV0nefjajff8m8lGaIo/r
	rJZatAVdvTUpfI59PVQ4URaidawh+aAuXzTxKjJlwnciGwt2MKQdZKo97DZ/a6+nh2kiOV8XT7hNZ
	tWgaZHWg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pWb-000000084EW-2z9c;
	Mon, 07 Apr 2025 16:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=IOzc5uHgTpunL565FHUIuaOtIJTW1Qb46HIAlOqLvkM=; b=Etr2fVxehCjpIrJHzIW5mQnYOA
	PxQxQfhCrypqAnMSjd13JR1V0d6pUqUq2QA+ZyOQ/C7dZ9+akg0C3raLrdohWQe5l7JWcEMHdIN6b
	uxTShx6CW3d4ofUWlE1i5/HGR3f/sjVRmHuCiEzazgtgWYTlb6DCt8EhDNYuwHH+oXwT6aqB6vAto
	mjlzEe/d+L7Gv3QwHv6cZDP769kSpzjH6GdTLMeVbOZBzQQMmD1bEr3215rd+qvLw2zcYzuJtem8X
	vkjykClwqum3YnqoIDYcKRiW91VLUxKA2pp32NJ26DM5IjWtztry7+BO5z1Uv5KKvJh2F1a6G7OG1
	aodoA1gg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1pWX-0006V7-WE; Mon, 07 Apr 2025 18:40:38 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
Date: Mon, 07 Apr 2025 18:40:37 +0200
Message-ID: <8512245.T7Z3S40VBb@diego>
In-Reply-To: <CAL_JsqJo+9ycUFHVZ2Darh_RWaRuJGX6KKQGsbeuDWav7vKA2g@mail.gmail.com>
References: <5552256.Sb9uPGUboI@phil>
 <CAL_JsqJo+9ycUFHVZ2Darh_RWaRuJGX6KKQGsbeuDWav7vKA2g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_174041_909542_F34AC9CD 
X-CRM114-Status: GOOD (  25.14  )
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

Hi Rob,

Am Montag, 7. April 2025, 17:56:37 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Rob Herring:
> On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> =
wrote:
> >
> > Hi soc maintainers,
> >
> > I made an error and accidentially applied a patch that was meant for
> > the mfd tree. Thankfully Stephen noticed that when the duplicate
> > commit appeared in linux-next.
>=20
> Both commits are in v6.15-rc1 now and the revert is not, so this
> should not get applied/pulled. Or you will need to revert the revert.

yes, that was the intention.

Back when I submitted this PR, I talked with Arnd on IRC the next day.

As both commits are identical sans some Signed-off-by lines, he suggested
not trying to put a revert in, but instead let git solve it itself, because

arnd on IRC:
> [...], but I worry that this would make things worse if 'git merge'
> ends up doing the revert on top of the original commit once it gets to
> torvalds. Not sure if that's still a problem in git these days, but
> I've seen it happen in the past.
> if two identical patches are in different branches, just leaving them
> there is usually easier

So this PR was already marked as "superseeded" in patchwork back
on march 20th.


Nevertheless, thanks for making sure no funky revert happens now.

Heiko


> > The following changes since commit 73d246b4402c3356f6b3d13665de3a51eea7=
b555:
> >
> >   arm64: dts: rockchip: remove ethm0_clk0_25m_out from Sige5 gmac0 (202=
5-03-15 15:49:00 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t tags/v6.15-rockchip-dts64-3
> >
> > for you to fetch changes up to cee24bc73d4f3f47344a1a54100a69c72f1db061:
> >
> >   Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible"=
 (2025-03-19 00:22:18 +0100)
> >
> > ----------------------------------------------------------------
> > Revert of one commit that was applied accidentially and should instead
> > go through the MFD tree. It is already part of that tree as
> > commit 7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register
> > compatible").
> >
> > ----------------------------------------------------------------
> > Heiko Stuebner (1):
> >       Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compati=
ble"
> >
> >  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
> >  1 file changed, 2 deletions(-)
> >
> >
> >
> >
>=20





