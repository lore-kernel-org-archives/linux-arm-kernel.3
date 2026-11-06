Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396EC606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YCvY551Z;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hq0Bqfj2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4vVL1EiPkJtSj0Q5/MEZPPVQTmsj+iOOThXSePIk96o=; b=YCvY551Z67ERTd
	pHxExyASzIDdxnjWQbFT6eT+WMh3z9w0eNxpAyqPKveaKMYanZVME34gB+ogZdClAy0VBlA9kmw3w
	tAJDHJatNEjstrKkM/b9LID4T9FGgk+iN9BhzSE0IZ6bkYZIdvQWmHJtnzxjCWXg13IBspOl//DqJ
	Y/lJWPF9O+RCnjLLsUTcM7D+mSfPi7i0KqzHnygWmvbETsgkAM7MPEGN7uO0VH7CcEnlMg+yLg4DQ
	tZpGgjfkWKmRN6DGS5/7PobzuIpiBdPWkOqqmqkaBc/XN5X1cMfIcuNj01dE4ajIQjXOUlzzuBYgd
	vY1yCSqNrBp2lUtjpZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKIA-0000000CTmd-3vi9;
	Fri, 06 Nov 2026 13:47:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKI9-0000000CTmH-1J7B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:47:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DCCEA43F83
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AC61F008AB
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972860;
	bh=4vVL1EiPkJtSj0Q5/MEZPPVQTmsj+iOOThXSePIk96o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hq0Bqfj2UyhLMuTH5ekszeM/i7rugVYBcjwLWOQjWb5rKs5SSOkLzbvQOxdY/lWjf
	 qmNzTDIjow4/PpnuRv/OABiVlxSnKeMxeTZVMaknC3ZUax/bvINmgAKMlNidIiH88P
	 LGFWmh2WsKNsJl3zUmLa7jn/ECIt41Ur+LHGhk2bHnrozUx+tOpVNYzIcpCPuGVDzD
	 MIPAZVI/7RAaLoWyUhNo4XrDTQl55uGWDWrzWcfy+KQleJK//ZytW9nn55oa6HvI4R
	 tN5Xv/Mno20UNLkbF4V6WTbFWJqRwU16ONj5edIc9D+TkD83sv8Iy3jTTW6x45cCp0
	 O9ZoAgM2DqvwQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso480901e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 05:47:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzvpqIZIyBeg4IV/YG7G6d2DrLYafDCjgvcrfbDvCXv/PZbiT4jp+UTmxntQMh2Irj7VjooYGc/BfyMT9N7Mz9t@lists.infradead.org
X-Gm-Message-State: APuU4Z90mIdFBZCbDjnd+f9zDdjXQ2RVfXHVPG/FejclRyx817mZAgbG
	q5xp9jERg9XBohEylXgMbKTpMYj2NIME4hYuBVz5UmhkTSnAfDInL5ckaxdJswb7ZLK4fK985XS
	q/VzmMgaOJK2D0HKnDxSh+e81S6yjM6E=
X-Received: by 2002:a05:6512:3b11:b0:5bf:d6f5:f966 with SMTP id
 2adb3069b0e04-5c003adf1ecmr764970e87.47.1793972859536; Fri, 06 Nov 2026
 05:47:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org> <20261103213002.1673560-8-lee@kernel.org>
 <CAD++jLmF0U6ehFSuauqKDQiZRkuUnqpbZd--v2aqF2YZQF=HwA@mail.gmail.com> <5c414196f5e34bfeb7a94714e5542a72@realtek.com>
In-Reply-To: <5c414196f5e34bfeb7a94714e5542a72@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:47:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLmBht_EauPV1ggkw_pnydVbCTHk7s_dyHPN6OA_zXOKvg@mail.gmail.com>
X-Gm-Features: AclHuK-g1F9N5vtbEMFGavDY124RqKgGGFWqEsXHGpoz6PIuenneZBMpw1y5QLU
Message-ID: <CAD++jLmBht_EauPV1ggkw_pnydVbCTHk7s_dyHPN6OA_zXOKvg@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: realtek: Initialise omitted offset fields
 to NA in config macros
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: Lee Jones <lee@kernel.org>, =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	=?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 3:49=E2=80=AFAM Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]
<eleanor.lin@realtek.com> wrote:

> Thanks for applying this patch. Just a quick heads-up on the merged commi=
t [1]:
>
> 1. The first Fixes tag kept the original 'dcc9334435b0' instead of the co=
rrected
> 'e99ce78030db' I suggested.

I went in and fixed it up.

> 2. Branch: It was applied to 'for-next' instead of 'fixes'. Just checking=
 if
> this was intended.

Yes Lee reached out to me on IRC and asked that the paches be queued
for-next as nonurgent fixes.

Yours,
Linus Walleij

