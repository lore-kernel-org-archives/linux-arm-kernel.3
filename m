Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C23C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ka7QnJN4tdnWVmhlb/tOiO+HN/iNCJ+GTmw5iPpNAhE=; b=VowLhLp31PHIvMwfwK02hDl5sw
	ohIciLv2a7RObZAOOLOIrpFqUzCMxusLxdoJ3PGgoVgeSvlgWQnFPWeT0Fjf54r4J+xpmN56gIvE2
	xMdnqVj9Eb2UNyZkOv2LyDIcnfiE1gkazHuTA/1+oyoUNRTFZxSxX6r62mzWsK2FXEMoAKjNtYaWM
	Az06PEK5C398c/LHvTDn5nqsDxmhp/+eSu62LOkuJ03/tnxMCa+orQqZs6r7fw3k3R3UKiu19WZew
	2DG23+bi+AlXcASMA9jSDFg737We8OGEbNZg/Z6qVACwvisgd+QuguHgmoWDgQMbw5td9ihBzIlOV
	YIVibsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuOL-000000022tn-1Ru3;
	Wed, 01 Jul 2026 12:50:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuOK-000000022th-2YEc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:50:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D217416CA
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 12:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013BE1F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782910212;
	bh=ka7QnJN4tdnWVmhlb/tOiO+HN/iNCJ+GTmw5iPpNAhE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NsVendUc+xlXbwfcV/MeSOuOSKIWnrzKOb697WibrhMO8d2jJZgICMwCA8tVdR1WL
	 EyFY+UfVwi3MQiSWnRYitDADK57Eki3DZVoz9HuCulWm10rE7CT2jKzn88EK//ta5T
	 bo2yhX6leUxqHqxfVlIfLrrDKoejNg/Ejr+kCVfYomuDjnPjctsBpLsNACwAGtkD10
	 oiTUa5/nsGAjOwL2O23VTAIwtB7yIZWkmjO+FvTFd3G8pcplooUcPznoWC5Z3tq3XP
	 wl4z21/n1Z5iWGNo6qbstil1SHlARsmwJkyXvrNwrvnLSqIzOdTENuMpYeUkm4m1lJ
	 oIpqz34CZj88w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aebbeba529so564065e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqBuBPpc+qtEH/2+P4GpaGvuVQ10K7wXXGs2M18GBSuufa+ZekB7EamLMdilMLVstcQZe8Mdo42Ib4nsz9nmjD4@lists.infradead.org
X-Gm-Message-State: AOJu0YyGU8yjbp5Khs+k4aTID7pWOwJCE5CXXGT5ZVCsQOJSFoYDcOiD
	CIlZnL8kUyb7kF7jO1FGCOCpQgVRyUtOFdbMUnueEEf6iOof5dNDU4Vz7GLcSE0Xptjnw/cCpEa
	G2pMpBZLvUrWeZadEHo6LOyTb9tjTN1Q=
X-Received: by 2002:a05:6512:312a:b0:5ae:a9eb:c5bc with SMTP id
 2adb3069b0e04-5aec68b8a6bmr211539e87.54.1782910210712; Wed, 01 Jul 2026
 05:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-arm32-cfi-bug-v3-1-e3c37e2b80a4@kernel.org> <akT1lr2iNzbnGEzH@shell.armlinux.org.uk>
In-Reply-To: <akT1lr2iNzbnGEzH@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 14:49:57 +0200
X-Gmail-Original-Message-ID: <CAD++jL=_j69pFuM+vv-8Q7x4VA=PUX8iV1Yfw4YkdxGDFo9D1g@mail.gmail.com>
X-Gm-Features: AVVi8CcUQBe3Ypind6UEgo4R6TXZ3SBFDAQ1fOheUwkqZ3hP3JStneA4_dlmptA
Message-ID: <CAD++jL=_j69pFuM+vv-8Q7x4VA=PUX8iV1Yfw4YkdxGDFo9D1g@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: breakpoint: CFI breakpoints only on demand
To: Russell King <linux@armlinux.org.uk>
Cc: Nathan Chancellor <nathan@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	slipher <slipher@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 1, 2026 at 1:10=E2=80=AFPM Russell King <linux@armlinux.org.uk>=
 wrote:

> Have the LLVM compiler people responded to this bug yet? What is their
> plan with the silly choice of BKPT usage for CFI failure?

Haven't heard anything.

My tentative plan is to follow this up with a patch to LLVM (and I guess
then later also GCC...) to enable handling CFI faults with a read
to the guard region at 0xffc00000 instead of using BKPT so we get a
good old predictable segfault instead. I was thinking something like

-fsanitize-kcfi-guard-region-address=3D0xffc00000

My idea is that the unwinder can then see that this is caused by KCFI
and act accordingly, but already the existing stack trace should make
it pretty obvious what happened.

It's the best I can think of at least, haven't seen any other ideas.

Yours,
Linus Walleij

