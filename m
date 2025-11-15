Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B00CEBF87
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 23:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l82rx51AsbqXiASt6mT5fRvFZ6R8MXZa4sonzok/Imc=; b=RDDdFO7XiA4QQsjpE2iJKclwvd
	CgBETleuGAOh2V6X+p+SfgSO9gv9W4XpsFFkCkT/W7d1ndhAGL2VLsaCyLoGwWIAy8CjSdzg3063/
	lvVlHlIjPobTlG/jlG743LVYmnrfHbsfRCXUVn3oCZ2lz3vYE2nDiYtf3GGWST0tAjbvZZ15KEqlO
	0z4RA/SWcmyqc89t8tGVxRGa0CVrVikUK110ZS9AROVxUkCIwF7E9jEOBs5ci2hOfqVTvPTMGuqT/
	G4gFzSmlxWAggqi6Pnw0Mx1Gp8c8bi4PssAaKWIO7DHb8G70kO0S+FSNQ3ayKH6GkY8ON/e4O6U9G
	jBFHUhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKPgY-0000000EC1k-3NCs;
	Sat, 15 Nov 2025 23:28:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKPgV-0000000EC1A-2Dwh;
	Sat, 15 Nov 2025 23:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=l82rx51AsbqXiASt6mT5fRvFZ6R8MXZa4sonzok/Imc=; b=kPR3e9wPKNamPD854AOIQaiw7l
	4xZAMXQlw5rAnZnUA1xYhV+d34O7688QgFE2vXy7evtO4fro+OUGIzZrB//0wFT5hdNSahDyScp1k
	2Dtgi/V3CBdov3nX9VbfibUDul+kavFcjajuE3iif/w06k4cWaUs3nRFb9cJLsOlupJraZAEwCsgG
	hqAyHSnhCVoSVA2Aivj25mxGAhAqjylfTMWE33/PMMIK+6J9hQgk52XNYQTiLY0MHOwsZlhmhv/CH
	IaZzAn/EjPhn03M7HfHYiA7CAAOF3mM/0MguWXmqVH2Tv1xWb5jGEfPknhK2hP2O4yIwJr50mR33b
	CEsbmNAg==;
Received: from i53875bd0.versanet.de ([83.135.91.208] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vKPgK-0001oE-GP; Sun, 16 Nov 2025 00:27:48 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Dragan Simic <dsimic@manjaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Asus Tinker Board 3 and 3S
 device tree
Date: Sun, 16 Nov 2025 00:27:47 +0100
Message-ID: <2455319.NG923GbCHz@diego>
In-Reply-To: <24561990-8293-0505-5837-eca416d01bb7@manjaro.org>
References: <12d6e151-dfa0-ca0a-5888-ddffb2dbdec7@manjaro.org>
 <bb74679a-ce21-4373-bcc5-1214e9bf832e@rootcommit.com>
 <24561990-8293-0505-5837-eca416d01bb7@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_152759_615689_5469D0A2 
X-CRM114-Status: GOOD (  25.70  )
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

Am Samstag, 15. November 2025, 08:14:58 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Dragan Simic:
> Hello Michael,
>=20
> On Saturday, November 15, 2025 07:03 CET, Michael Opdenacker <michael.opd=
enacker@rootcommit.com> wrote:
> > On 11/15/25 01:53, Dragan Simic wrote:
> > > Thanks for the v2!  Please, see one nitpick below.
> > >
> > > On Friday, November 14, 2025 16:46 CET, michael.opdenacker@rootcommit=
=2Ecom wrote:
> > >> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> > > I'm sorry for not mentioning it in my earlier responses, but this
> > > line is redundant, because it duplicates the From value found in
> > > the actual email message.
> >=20
> > This actually comes from my Git settings. I need this when I send=20
> > patches to the Yocto project and OpenEmbedded. That's because their=20
> > mailing list server which alters the address of senders ("<sender> via=
=20
> > lists.yoctoproject.org"), and ultimately the commit author identity in=
=20
> > Git. See=20
> > https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fix=
ing-your-from-identity
> >=20
> > I've checked that my patches apply fine and that this "From:" line=20
> > doesn't appear in the commits in the tree.
> > So, can I keep this?

Yes you can keep that, I don't see a problem with that additional
=46rom header.

> Actually, I forgot to mention that the From headers in your patch
> submissions are a bit wrong by containing just the email address,
> without the first and last name.  That issue should be fixed first,
> regardless of the presence (or absence) of From tags.
>=20
> Thanks for clarifying what's the reason for having the From tags
> regardless of the actual need for having them.  Maybe setting Git's
> "format.from" option to true at the repository level could solve
> this nicely, while also exercising the Git-fu a bit? :)
>=20
> BTW, my responses are currently jailed by the linux-rockchip mailing
> list, requiring manual approval, as a result of the mail server I'm
> using sometimes inserting some strange invisible UTF-8 characters
> into the email subjects.  Oh well. :)

I guess that mailserver needs a fix :-)


Heiko



