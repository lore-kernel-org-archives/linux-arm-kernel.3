Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F2B606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O1k5SHPi;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkakNWVr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tTqFMC2jfQkWpp4eCpCGIoJ+qOTGr5oTYuPt6Wn0ReQ=; b=O1k5SHPi3vJP+Y
	BNBVTT0YK/rGcMHK/5pr/f63KvwR8IegZqkbD3ZBfVY4+GGrHqp5OmwMpIYyA7LWZUw3G2+oDevYp
	PYzi+IX2TGaWfeETxxvzGkSXPXCn+U2PfmIxcgQz+tGfmNVGn84/eZ9dTdaw20ZQiCwFNAc6VG1aA
	fle539urVAZbyipB2/YuTeBzedZFdGlQnptFV0yy6ynLqBcLWeU/rWjFNYcCcMtcRmWaljwkUygtY
	8p1AmS5A9njbnBKflb1jwQIrQlwgzq93F3tYzcrYia+gC8f84todrPkTltEmd8DjCcqsKZGnTrZ9U
	lw9T9963fyy2zGwrXQAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOti4-00000008IHA-3kVy;
	Thu, 05 Nov 2026 09:24:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOti3-00000008IFE-2DgM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:24:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F339B60F3D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCFB1F00A1E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870678;
	bh=tTqFMC2jfQkWpp4eCpCGIoJ+qOTGr5oTYuPt6Wn0ReQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NkakNWVrpeJsHpQJZkDxNGNiBhdjE5CTeu0BAedaN9KKhqePQp6RTOZf4Bek5pCVN
	 bVJwEl6wMnv6pqrJVQ4so2nmQ+AnR2RQnxHTv92qHB+7P/ijwgoJyNXhi+YMHvtPVF
	 H/IPvS22QXuSFDaizD8YzQCYn3REuSABlBf6sklJqw4ZbDNLbkzKhkjHG/2iaoZ5wd
	 LWRdvXjuk24Zl30+q8nxvnaty1AX5vsSfYRlAXL3bG5h71c9Jvcb6k3aMcV5nqYuL/
	 q2iZfTm+9naaoTCsOhcA08yYYVPZJ4sqyp9qqb1aEdubjBKDlGqdPBNRRoWPJMmhBw
	 ZV5HMsbtriN6w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso1309678e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxCENnDNO/kvbxs96e63IL2mVstLIdCMjXDDEro9CsyVKcCQefKWe/z2bt2tENobGdX2s/y6peLAODa8imS3/zG@lists.infradead.org
X-Gm-Message-State: APuU4Z/MVpb2iOB+79ZZLS1wyjnFug7j+qyyRR6OsSlAILhlqjj+vZdT
	QjNX/xeUNT2keSIv60xDJLhnEeb3LJKMjl4wFMVCWRAJRWxteU72w66AomwwAQgKUOMAoGcAmF0
	+//KRSVLS9R2hkLP15HHYVoekGVbcbtI=
X-Received: by 2002:a05:6512:3f17:b0:5bf:d1c4:a01d with SMTP id
 2adb3069b0e04-5bfd95206b9mr6296528e87.2.1793870677493; Thu, 05 Nov 2026
 01:24:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org> <20261103213002.1673560-7-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-7-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:24:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLn0vx9bv7ZUvcPX+Q_E4o+zb-rtfEmsZgw00gMGTVY3Zw@mail.gmail.com>
X-Gm-Features: AclHuK8yYE1rSjLkW5nBivqJEc5ZKlRnSUlmLXkEBc7bHuzlAPbz8NNmplKC7xw
Message-ID: <CAD++jLn0vx9bv7ZUvcPX+Q_E4o+zb-rtfEmsZgw00gMGTVY3Zw@mail.gmail.com>
Subject: Re: [PATCH 06/10] pinctrl: realtek: Fix bit shift when configuring RTD_HIGH_VIL
To: Lee Jones <lee@kernel.org>
Cc: James Tai <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	Tzuyi Chang <tychang@realtek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 10:30=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> In rtd_pconf_parse_conf(), the RTD_HIGH_VIL case prepares mask as
> BIT(hvil_off) for regmap_update_bits(), but sets val =3D 1 without
> shifting it to hvil_off.  Whenever hvil_off is non-zero,
> regmap_update_bits() masks val with BIT(hvil_off) and clears the high
> VIL bit instead of setting it.
>
> Set val to BIT(hvil_off) so that the target bit is set as intended.
>
> Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input =
voltage and high VIL")
> Closes: https://sashiko.dev/#/bug/linux-e7077311-3f30-4b77-844b-1447519d0=
c84
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

This patch 6/10 applied for fixes!

Yours,
Linus Walleij

