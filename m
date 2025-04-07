Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6C4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/hLJ//pzM4un2bQ2ayC32XDMKmA5ak0QqcGXXfNyzk=; b=gBk/XFZvPasju+3E5IuWEF+rob
	m7cDmTY4LiLEY6ganQFk9/dAU3m8JglVfFIQRv04RCjh5waEkmfBXKr8cm+IRUwDB4/aMmO1GAMAX
	J+aqPxfl04K5DlHsl0F/XqkaWbEVSGTBLvQoueSrgPwmCPUmrbkZjjxFzV9kWfWQ5SJ0QOd6RTTOa
	grKDHGJnAiDLQiEsHuG7KQGdbPLIkpWmVGOU3rcUnarPQeBXT6/lAjknPk6R+cFAKNL2TgX3XOnxB
	4FUHsUHB9K9IaSwZJy+ZVpPqa3Rcx+qbhjv2WgaOtNYC+RkyRKH7h6rtCtMqPLr1C4s5TRxeBINeZ
	25ZoHL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYN-00000001cqh-1eMD;
	Mon, 07 Apr 2025 18:50:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pZx-00000001G8m-1ivX;
	Mon, 07 Apr 2025 16:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2E09A478CD;
	Mon,  7 Apr 2025 16:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC6EC4CEE7;
	Mon,  7 Apr 2025 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744044248;
	bh=Y/hLJ//pzM4un2bQ2ayC32XDMKmA5ak0QqcGXXfNyzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UzmZScU/uoH9Tm7HKXop1oqBcJA6LDr4GPS1uR1DSHakslwRy1DtdncBdZ5/WgSPy
	 ItZncV+gWIzdjdOr1Fs2isqKIhqTGKfjj96bllzDPg0YjbwRZ72Km8WlxhZSDKdXIs
	 tyW6tdu7e1NVcAsVtDjOiUkiCct05PAIPW36DOR29uyaZWxJ/CnD/011tAAGLrq+V1
	 fa2zK4EXjyVpViVpLfHRbgzDSqN0ux+kPZZ++2xCk4pZ+hbTbijyZbjGtx8X28CBJw
	 nRWEtHbuGhSE7B4SDonOGz3rjB2azaqo5CdDBSgYKWSaORrINMmWxvEDpoJQYXSG72
	 MzVCQm/tw5+kQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abec8b750ebso778762766b.0;
        Mon, 07 Apr 2025 09:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnE9QXoVpAhPT3KqYHIEFafiTBYGQkP6HaQgqjAWJZ58JkCGCrIOpCWi+nCb33gKXXIBnDxna04cCsLeGpeaw=@lists.infradead.org, AJvYcCUyCQkJbH0Rczn+Je1IV+QkXf0ZKJ2LHHCnMBGyiPEJkB9RikKJ/NBXcAwVlG/D80Z5oaRhn/V4AgrpNq1ooVWR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr3s4JNOsCvwRr78DqYNt88TJ7yWp/noOGmp+wil9gk+9gcYAa
	JcDZAksZkDRld0dkod8lQqliWe/CthbdalYW+0SnYLftHQRrxf+Bv9SeEkHxDjQYUbfmFz8XYBc
	KTzk2iYi4o2FWLwwvpM1hKmaUBg==
X-Google-Smtp-Source: AGHT+IGLOtOLmhpSq0PLbaQYhuI2hTXNomO3c9M6XDkDTB0xbkcQkN/9c1/rJNryKU1+tfluzQLXvqqsDiAM+1t+d6w=
X-Received: by 2002:a17:907:da7:b0:ac2:3ea:c23c with SMTP id
 a640c23a62f3a-ac7e7116fd7mr754949966b.5.1744044246963; Mon, 07 Apr 2025
 09:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <5552256.Sb9uPGUboI@phil> <CAL_JsqJo+9ycUFHVZ2Darh_RWaRuJGX6KKQGsbeuDWav7vKA2g@mail.gmail.com>
 <8512245.T7Z3S40VBb@diego>
In-Reply-To: <8512245.T7Z3S40VBb@diego>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Apr 2025 11:43:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJVi5tf8bh6AnZwNwiBe+EG2CHQRGQGLK6SdMzQiiSbWA@mail.gmail.com>
X-Gm-Features: ATxdqUFxaCjS80Qj_U9puWLvAEoD3V9o6VjAwVp2ZHTzEA7_GR-X9ZqxugryY_s
Message-ID: <CAL_JsqJVi5tf8bh6AnZwNwiBe+EG2CHQRGQGLK6SdMzQiiSbWA@mail.gmail.com>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_094409_574719_3E890323 
X-CRM114-Status: GOOD (  22.56  )
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

On Mon, Apr 7, 2025 at 11:40=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Hi Rob,
>
> Am Montag, 7. April 2025, 17:56:37 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Rob Herring:
> > On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@sntech.de=
> wrote:
> > >
> > > Hi soc maintainers,
> > >
> > > I made an error and accidentially applied a patch that was meant for
> > > the mfd tree. Thankfully Stephen noticed that when the duplicate
> > > commit appeared in linux-next.
> >
> > Both commits are in v6.15-rc1 now and the revert is not, so this
> > should not get applied/pulled. Or you will need to revert the revert.
>
> yes, that was the intention.
>
> Back when I submitted this PR, I talked with Arnd on IRC the next day.
>
> As both commits are identical sans some Signed-off-by lines, he suggested
> not trying to put a revert in, but instead let git solve it itself, becau=
se
>
> arnd on IRC:
> > [...], but I worry that this would make things worse if 'git merge'
> > ends up doing the revert on top of the original commit once it gets to
> > torvalds. Not sure if that's still a problem in git these days, but
> > I've seen it happen in the past.
> > if two identical patches are in different branches, just leaving them
> > there is usually easier
>
> So this PR was already marked as "superseeded" in patchwork back
> on march 20th.
>
>
> Nevertheless, thanks for making sure no funky revert happens now.

The commit is still in linux-next though. That's how I happened upon this.

Rob

