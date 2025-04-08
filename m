Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8036EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJTrUxLCpXkjwGm6dEFFx0uFraK+mSJsogVi5jpWzW4=; b=kx79HqQZHkOsmJScgfWmzzKKhg
	B/acIZvVFuJw80KTJ+jVzuv4fZgtkEgncH2JxIh1CLvd4AZs90wLcb6z8L/jA0INLj2QJTA185o38
	v49lIAxbUsvFXS6vO3m9hvzRH6zvCkzrMKA57bXcDpddxix4/mrnYJ18/9fnmzrzlbgT6R+Lfh6ku
	2BcQantpS2W1VDYl2RnEHIrxRhtrTW682Fjd7nakigsayKdfAAbDGa3AdBsF1VbiCZVcuPXggS+xi
	l7eTJ0gHTnRaNU5DFZNYJBlCa1bo6mZ4FS1OLqa/uG67TxoFxeC0ITkKds3G3p4rgVqGwD+5wZuhv
	r5cbkjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29co-00000004K4l-41xk;
	Tue, 08 Apr 2025 14:08:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29WB-00000004IoI-1A9L;
	Tue, 08 Apr 2025 14:01:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D338244331;
	Tue,  8 Apr 2025 14:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6B0C4CEE5;
	Tue,  8 Apr 2025 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744120894;
	bh=AJTrUxLCpXkjwGm6dEFFx0uFraK+mSJsogVi5jpWzW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SdQDNuMJUZiUKqMg7G2AxEx6L+8ROcLJ5YjYK8jQvdj5gH4XXKyNbnJODutqrJnL6
	 nQ4YUZF4QwmTk9zf7B1D2TKImQlcS6Vn0hicpxawkbkZCHBiXz3fQJm+kJSLFrMosk
	 jcmUUjRoIbf937/GwutW51y6T/ka5LGoWp88RL+ITgtG7AtGAyWu0V+27or5TlZXkm
	 DhD6ryUJPDr0Umq+gkHlYIxLxsiKNrS4dMKTyWa8mJrc9bK5B3pzzHM4h8jKD+VK1C
	 JJzsBaqpMzRdN0IvjUAfWC9CGUCG3LTVVE396nBaDmQLmkoTUDUp+cbg++uny93Zd3
	 FEpXcrIRL1S/g==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso11070700a12.3;
        Tue, 08 Apr 2025 07:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFFcXE8+qP2/bMZsOisPnPXS4cwyCmZg0+dM3FAsO2AJpEhm+kN4nhaKNz7Hr/U8Grv2MTERgUpLrn87pAJWLF@lists.infradead.org, AJvYcCUZu44YA71/osCVrAsTUZiAChrOgWtqq11XoRKFiQlXdLgFn9BM54xr6oc45OYClNt9TPqSQID3xtdGDfrevFA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbAj9J0JaLFhiERZOjkN2F05rHP8tgyjcDFQcWP9eQSOJzqot9
	Hrmu3WArAMYiuW23LGmEnOP+27AsWERBeRrHl8r/eRV/+lLqw5LEg+6fbECGqfykogYVnC44eN3
	/tGpkxRuwY7J9KcBtbiE3GNy4wQ==
X-Google-Smtp-Source: AGHT+IGP9sd4kwLQh9cskvbaOURGKlmbwlRvhOGqjeU+701fsh0fIkFAcBdv9E8PkoqmV6SOnJfOslOAlnpG7pMPeOA=
X-Received: by 2002:a05:6402:5108:b0:5ee:497:d713 with SMTP id
 4fb4d7f45d1cf-5f0db8b37ccmr10221419a12.33.1744120892804; Tue, 08 Apr 2025
 07:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <5552256.Sb9uPGUboI@phil> <8512245.T7Z3S40VBb@diego>
 <CAL_JsqJVi5tf8bh6AnZwNwiBe+EG2CHQRGQGLK6SdMzQiiSbWA@mail.gmail.com> <2000188.PYKUYFuaPT@diego>
In-Reply-To: <2000188.PYKUYFuaPT@diego>
From: Rob Herring <robh@kernel.org>
Date: Tue, 8 Apr 2025 09:01:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+EwYZYYePusUZbOh+n6-MVt2AFGEiPg8AzHR73K-9-BQ@mail.gmail.com>
X-Gm-Features: ATxdqUH8Tr9HDZeB4zegoj3RV-fkJZt-T-YIfzDJpk3-wYrrf7UR40vozxN9hLk
Message-ID: <CAL_Jsq+EwYZYYePusUZbOh+n6-MVt2AFGEiPg8AzHR73K-9-BQ@mail.gmail.com>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_070135_354302_C9DA3A6D 
X-CRM114-Status: GOOD (  25.94  )
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

On Mon, Apr 7, 2025 at 11:49=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Montag, 7. April 2025, 18:43:54 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Rob Herring:
> > On Mon, Apr 7, 2025 at 11:40=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntec=
h.de> wrote:
> > >
> > > Hi Rob,
> > >
> > > Am Montag, 7. April 2025, 17:56:37 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Rob Herring:
> > > > On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@sntec=
h.de> wrote:
> > > > >
> > > > > Hi soc maintainers,
> > > > >
> > > > > I made an error and accidentially applied a patch that was meant =
for
> > > > > the mfd tree. Thankfully Stephen noticed that when the duplicate
> > > > > commit appeared in linux-next.
> > > >
> > > > Both commits are in v6.15-rc1 now and the revert is not, so this
> > > > should not get applied/pulled. Or you will need to revert the rever=
t.
> > >
> > > yes, that was the intention.
> > >
> > > Back when I submitted this PR, I talked with Arnd on IRC the next day=
.
> > >
> > > As both commits are identical sans some Signed-off-by lines, he sugge=
sted
> > > not trying to put a revert in, but instead let git solve it itself, b=
ecause
> > >
> > > arnd on IRC:
> > > > [...], but I worry that this would make things worse if 'git merge'
> > > > ends up doing the revert on top of the original commit once it gets=
 to
> > > > torvalds. Not sure if that's still a problem in git these days, but
> > > > I've seen it happen in the past.
> > > > if two identical patches are in different branches, just leaving th=
em
> > > > there is usually easier
> > >
> > > So this PR was already marked as "superseeded" in patchwork back
> > > on march 20th.
> > >
> > >
> > > Nevertheless, thanks for making sure no funky revert happens now.
> >
> > The commit is still in linux-next though. That's how I happened upon th=
is.
>
> Ah right. I've recreated my next branch earlier today, after the -rc1
> release, so this should be gone with the next linux-next.

Still there today and now we have:

['tsd,px30-cobra-ltk050h3146w', 'rockchip,px30-cobra', 'rockchip,px30']
['tsd,px30-cobra-ltk050h3146w-a2', 'rockchip,px30-cobra', 'rockchip,px30']
['tsd,px30-cobra-ltk500hd1829', 'tsd,px30-cobra', 'rockchip,px30']

Which appear on no list.

Rob

