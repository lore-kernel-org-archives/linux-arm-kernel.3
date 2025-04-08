Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A69C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOxUvMH6Zjumv6uHhZAYRdSZLUXfa/+e73bmK4g3BQ8=; b=SWX+JiqjPjBOL4jwx2a+8EfOPr
	sZ6qqJISw/iFCMEV6MZSYg8uAlqDvgaw1nKH3N1tuPEdJqhwOdJaKUJAE2C359HqkFr+PKApqE7yg
	slnduxy2GwDNGDOVSdzS/HY9m4dD8wtoH0GqifGQUzGDMOv0GQJXp0EDeOA7Vk5MRsorHyGntbAUk
	DzCebT8098do7cS86WbCVqArKfJZahScA488hBt6TSdBM1Yn62m+gABkKaS8GP9GQDHELxqN6zUp6
	qQCCC8+fJCP0OYnJJ+FvTfmFHeSzQqCEYXaZizIrFUjQSHKzo6oEI0jbFQtFE7KVKY2hzkqftH5CH
	dmjXZTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29pH-00000004MEN-3RFM;
	Tue, 08 Apr 2025 14:21:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29nV-00000004Lzl-1LjD;
	Tue, 08 Apr 2025 14:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YOxUvMH6Zjumv6uHhZAYRdSZLUXfa/+e73bmK4g3BQ8=; b=ePGC82kzJBY/yq1PD5kMYbXCXg
	pvjT/0wBdmPg69EVUa5+WAk+HJaPIMT17bcZxqeuKBXgEgs09ZW7ZKoVOIHy1Bsb1dJ+csPHrfY8Y
	IFTp0IMWG7r0E+9wv0Bu8Cr3K3KrASy5tAirBVK5wIA8o+3Oly8KXH3i8nZ+kGJsSAXkppFZ9MR8Y
	z88RLyu8ZYI/BaFMoEId/t5P5xdK68B/vs6S/eTi0VafM5Ydv91RicAz0/3UhkEi2IpwfKrLY7s1R
	Bo4VedZS7BO5+goFyYngm8hIPI9ms3vIfZsE1ZIQS6ZbyG0Z4TdMngAzVkLdVzBSYBuYWvm1SotIK
	ZC4LHAcA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u29nT-0004Js-C2; Tue, 08 Apr 2025 16:19:27 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
Date: Tue, 08 Apr 2025 16:19:26 +0200
Message-ID: <2021039.usQuhbGJ8B@diego>
In-Reply-To: <CAL_Jsq+EwYZYYePusUZbOh+n6-MVt2AFGEiPg8AzHR73K-9-BQ@mail.gmail.com>
References: <5552256.Sb9uPGUboI@phil> <2000188.PYKUYFuaPT@diego>
 <CAL_Jsq+EwYZYYePusUZbOh+n6-MVt2AFGEiPg8AzHR73K-9-BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_071929_381541_AE73E3F0 
X-CRM114-Status: GOOD (  29.22  )
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

Am Dienstag, 8. April 2025, 16:01:21 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Rob Herring:
> On Mon, Apr 7, 2025 at 11:49=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.=
de> wrote:
> >
> > Am Montag, 7. April 2025, 18:43:54 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Rob Herring:
> > > On Mon, Apr 7, 2025 at 11:40=E2=80=AFAM Heiko St=C3=BCbner <heiko@snt=
ech.de> wrote:
> > > >
> > > > Hi Rob,
> > > >
> > > > Am Montag, 7. April 2025, 17:56:37 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Rob Herring:
> > > > > On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@snt=
ech.de> wrote:
> > > > > >
> > > > > > Hi soc maintainers,
> > > > > >
> > > > > > I made an error and accidentially applied a patch that was mean=
t for
> > > > > > the mfd tree. Thankfully Stephen noticed that when the duplicate
> > > > > > commit appeared in linux-next.
> > > > >
> > > > > Both commits are in v6.15-rc1 now and the revert is not, so this
> > > > > should not get applied/pulled. Or you will need to revert the rev=
ert.
> > > >
> > > > yes, that was the intention.
> > > >
> > > > Back when I submitted this PR, I talked with Arnd on IRC the next d=
ay.
> > > >
> > > > As both commits are identical sans some Signed-off-by lines, he sug=
gested
> > > > not trying to put a revert in, but instead let git solve it itself,=
 because
> > > >
> > > > arnd on IRC:
> > > > > [...], but I worry that this would make things worse if 'git merg=
e'
> > > > > ends up doing the revert on top of the original commit once it ge=
ts to
> > > > > torvalds. Not sure if that's still a problem in git these days, b=
ut
> > > > > I've seen it happen in the past.
> > > > > if two identical patches are in different branches, just leaving =
them
> > > > > there is usually easier
> > > >
> > > > So this PR was already marked as "superseeded" in patchwork back
> > > > on march 20th.
> > > >
> > > >
> > > > Nevertheless, thanks for making sure no funky revert happens now.
> > >
> > > The commit is still in linux-next though. That's how I happened upon =
this.
> >
> > Ah right. I've recreated my next branch earlier today, after the -rc1
> > release, so this should be gone with the next linux-next.
>=20
> Still there today and now we have:

Not much luck for me this week it seems.

So I've now re-created the for-next branch again, especially without the
stuff from below. I guess the Revert slipped in again via that miss-merged
branch.

Looking at the rec-created
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/lo=
g/Documentation/devicetree?h=3Dfor-next

that revert should be finally gone now and not reappear.


> ['tsd,px30-cobra-ltk050h3146w', 'rockchip,px30-cobra', 'rockchip,px30']
> ['tsd,px30-cobra-ltk050h3146w-a2', 'rockchip,px30-cobra', 'rockchip,px30']
> ['tsd,px30-cobra-ltk500hd1829', 'tsd,px30-cobra', 'rockchip,px30']
>=20
> Which appear on no list.

And I've also fixed my scripts to not miss-merge branches not actually
intended for next.

Heiko



