Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661EFEA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmiIi7mrpmFyjVusTkJBYSfoQnHnQMebnoeDL33M1go=; b=stZe7JUk8RNCvVTPkRqGz/xq4A
	p2XZqiz0FaMmvJxOgLJdNudbUYP/axIr9/pC9gKlwPtttBivLfUA1kA47u02C7GarEPX15UlVgKPI
	4CzHOGoPQYiSaFgHpqE06fyvaiDlk3yMOWjKNfJqeSZRmebq5x7j1Mm6EYRnLBuiCosOtawxArCjB
	QTNPv9Kq/HyoxDC6i/iE8kdOC0jKWVNEqBUPEA6XE2yAE8WjOQdB1CAB+BlVywfDqN/EhByA/GxqI
	HJABLznS/VUWEJwFCoylHvsfjDbXoz4RkjmUFH4O/yh9qANqmrgZEQc5eOc3LmQYk1/2l0AOSJjHU
	jALwrQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztQf-000000096AR-1aLZ;
	Tue, 10 Mar 2026 09:31:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztQe-0000000969v-1BDo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Mar 2026 09:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QmiIi7mrpmFyjVusTkJBYSfoQnHnQMebnoeDL33M1go=; b=V9li8TmL5G2dM/2hqnqo6QNScr
	AJAGG7uuhzZdAbi1ASbHuebT13ucFEzs4Lvag7qS2QtP9Axi276IS6Vh/c2lhHutFA0P9VzLNlX/Q
	xlAamwgrkFADCO5RvV4VcJlO2VhHHzaFUIfAkf8P3Rz8OmF65rDfnFmDOiuafRNg8hLjAZ47rFeGW
	pwfqMh5IompXP8mZhKyYhdphMVF+johxupAF10cRsPGSuce1R+D47j/cHuOcR2I6aNVqC92SmEIeT
	to6JCKZsnzUK3D8CyrT2jIkR/v1KyIrgJ9jlZSa52HnSn33EUCKnOFeYDvW0bBO6UB6fIk1WHWihd
	iHk9l/rQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztQX-0000000E7wI-09Z2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:31:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 575F543F5F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382A8C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135055;
	bh=agiCRx0LS/bfEJl/CwuVWUUNv8yCzJiBoPST+kfXouk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MX18Ydfp7DvcWWdKTSqMxo/9iGz9m+pEYOhYU7+fPSwAa2tamoHRXITRm0QtO3w6a
	 DxIrRIolRzwan1cxqGV997I1tYAltfDYyFivXflV4HcJNPgf/1QXaE9AnLTnNzmFgm
	 SSxyTK5lBj8wnwH1Bizephl0aPQMmA0AZZ3pEH15X4Nn8US6M/VaBvnqFp6LuJmSNu
	 AuQCzG8Iu3O3/8Xl3oQkqWygRt173/hkvifMAsXSTHihH24RJU7F2Is3C408fZGCdx
	 BHk2dwRljMolc7TIwzJc0YJnTRYkBX9tDz2FSd9tFOONf5YawZFY5Ocqg89/9Xp7gi
	 8CS2++qr9if3Q==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fc4425b6bso126244797b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:30:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXInfmqZ6P9+lav0scQrYomHCQwBinqR+SXn+2c16a3E5A4yUmuvoIiIS7fre7UClE7ObfPPPT1W2Eo3+VnYACy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4aSlkCsCr6c3N71WsGr/PggyM7GMoif4hNNQIMGMGeb9hvYfh
	GW/LoC9P1AqtLOpOibealgKPSDWMqcgIHKC+6zD4dP4fo8jMjJeCc59SuZCQ4rDbFsZWbwoWepy
	A6/NPrbbXeDOykPuCVdR2kiyu4GtOpWI=
X-Received: by 2002:a05:690c:6d81:b0:797:afeb:de93 with SMTP id
 00721157ae682-798dd672745mr141065777b3.12.1773135054620; Tue, 10 Mar 2026
 02:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:30:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLnwhtf5Xc3JGoFB=4usGHk+0YqoZn8uE-jkspgkg58VCg@mail.gmail.com>
X-Gm-Features: AaiRm52eP1yr7ANILgx2XyXkmjF2STcxuzgrGYJxJFGEnHNkuVbhE64J6uxuaQE
Message-ID: <CAD++jLnwhtf5Xc3JGoFB=4usGHk+0YqoZn8uE-jkspgkg58VCg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] pinctrl: realtek: Core improvements and RTD1625 support
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, afaerber@suse.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_093101_591147_364550A8 
X-CRM114-Status: GOOD (  10.64  )
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

Hi Yu-Chun,

On Fri, Mar 6, 2026 at 8:52=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.com=
> wrote:


> Yu-Chun Lin (14):
>   pinctrl: realtek: cleanup license string
>   pinctrl: realtek: Fix return value and silence log for unsupported
>     configs
>   pinctrl: realtek: Switch to use devm functions
>   pinctrl: realtek: Simplify error handling with dev_err_probe()
>   pinctrl: realtek: Fix grammar in error messages
>   pinctrl: realtek: support system suspend and resume

I applied these 6 uncontroversial patches to the pinctrl tree, so you
can rebase on my "devel" branch in the pinctrl git tree as soon as I
push out the changes and just resend the rest of the
patches.

Yours,
Linus Walleij

