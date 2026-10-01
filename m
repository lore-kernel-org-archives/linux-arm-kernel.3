Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD4DCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/Xpv/Ld+mjY+s1jwjSTwM7Z2N6DMmA39ET1qM/P03U=; b=YJGIycke49L8KXtZxHjoIaHUC6
	XcHlVNctYVAc1qV7/Nj4kkzv5YgK9OC5lMk1CQkFLvY5aRqkNY0wXCfQv/hZQwMiWbhagZ2DLCC/K
	tTVbJmu3WxNsRq1D/QDzqg9Y9ArZ9WvKMFn2zTA/rDKLqmq1KktzeQrQWbSEauxTfbYa3v1URBvSp
	XNq2k9DkxO+vAyIJuD9X8tGwmEj54jj+h48PsxnFirkerQ4VLkvuHQzYR6xU9J7qvAiSKx/QkbQqT
	/72NghPwKqu1UMwGKlbvKXeyi73cbg1nyHxFNFm7UrYvFp6tyvSSmEjl4cbCjHXxOfIcIu4QsZ0IL
	bXU1pV0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBez-000000084TV-2v2g;
	Thu, 01 Oct 2026 07:56:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBez-000000084TO-04Yf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:56:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8511242AF5
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6933F1F00898
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790841416;
	bh=A/Xpv/Ld+mjY+s1jwjSTwM7Z2N6DMmA39ET1qM/P03U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fany3a8Hrfdl8cgiWkQqWcAGusDt67p1Z0IHYWxTvyk86an+cHLwyu+xLvPQzxEVc
	 ecHKlv5ZwsYCqAQ+hyjt6y6radJlHOKBOkl22sNX78Mhw8fb6Aqj/3Et5havmkUkgU
	 VbxGwZHkQJqO9uHlZTP3zAZAin67yZxFGVECdqhYUa7jyE3jCh2KMFAjxTBYwKy6Yo
	 4N0VZzBJ+pkAoTWtH35xw4ACJe2KOYaKW2RdoTsj6E3TNDzocDMDxFJj2I1YdYFeYi
	 ij7tasuUVt2JA6F1I8L9nDUoGfErzhMUrDlErOeOaAApPjmD0ZmyezyGgY3r4v3vlS
	 s/j3Kj46bX2rA==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76b373054so22426531fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:56:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw77DUIYaAtvty7/Xb5+GSZt9lDCMPymqTdGzYGnJ/58WepuNSHqcxC/th0z4fgB5DrE8GJxvGRHkSNYLsvV3R3@lists.infradead.org
X-Gm-Message-State: AFq9FYLJX9+zkD2Va1EoF17EhGlKfciT7mowcE+3xsuyVBGlt54PMqD/
	oLpzb/vdtGfAYSNTiS12o+6kpkH4QsQ2qKLj0hMugwj6Zxzh+Qrt11+Tx04Ux2iCGBAfOUd5WQx
	grKqINtMlApTqmFOMghSfZjDAhNx1yX8=
X-Received: by 2002:a05:651c:19aa:b0:3a6:7094:b41d with SMTP id
 38308e7fff4ca-3a779732efamr12637801fa.10.1790841415198; Thu, 01 Oct 2026
 00:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260917211452.i.365-kees@kernel.org>
In-Reply-To: <20260917211452.i.365-kees@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 09:56:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLm=rWBqRT=SQGfj6D0jYoU1H8HSX3Cy+expg17W71xFvA@mail.gmail.com>
X-Gm-Features: AclHuK9DtT1wfkmby2eLKl-7MGj8F-6aYEGT9yi4ELgmjp-n_Oto8Rs1ZdDaY-s
Message-ID: <CAD++jLm=rWBqRT=SQGfj6D0jYoU1H8HSX3Cy+expg17W71xFvA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: s32cc: Remove const from groups allocation type
To: Kees Cook <kees@kernel.org>
Cc: Chester Lin <chester62515@gmail.com>, Kees Cook <kees+treewide@kernel.org>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
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

On Thu, Sep 17, 2026 at 11:14=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> From: Kees Cook <kees+treewide@kernel.org>
>
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
>
> The assigned type is "const char **", but the converted allocation type
> would be "const char * const *", as the size was taken from
> "*func->groups", whose type "const char * const" is const qualified. As
> there is no general way to remove const qualifiers, take the size from
> the assignment target instead. No change in allocation size results.
>
> Build tested ARCH=3Darm64 allmodconfig with GCC aarch64-linux-gnu 16.1.0:
> drivers/pinctrl/nxp/pinctrl-s32cc.o
>
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Patch applied!

Yours,
Linus Walleij

