Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A632606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Av55nSIh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AhPTozuL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gjE0e4Jpg2/L+9H+FXO8WVtezi6JzsD1ckb0zbLEW4g=; b=Av55nSIhOkk6k7
	72W9gXQZuY/Oo53p/u9T4sysOJWFmEL8Q8uCBsQvSUfJL7jpt/iSJYaSLIafHCsN0BipQxOw5+Epw
	DiyHuXI9SS5wjU1NOsC0nUKhmHsQ9jK527mb0mxUaYtUk3UScAZifzbjyO3JXCfM8197s4f9QW+im
	uBSn/jgLyTWHKIoChg3dLaOwevTzNILC7ipwdbGzLH1TZG4IAz2bfqnP3tR8rtqkIH66HXUxBMLlN
	vmFHZcdGS9LRCMKaqLXKNsQi7q5XyjiSxeU+Z8Hd0rBGs4+EToJHCiN9rQ/wr884acI6MmzPczJs6
	gsxpiZgEVrlCWrKJi6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObYY-00000005XXC-2WNT;
	Wed, 04 Nov 2026 14:01:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObYY-00000005XWu-10Io
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:01:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5F9F418C0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 14:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF121F00919
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793800897;
	bh=gjE0e4Jpg2/L+9H+FXO8WVtezi6JzsD1ckb0zbLEW4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AhPTozuL4KSFCX2IY3v/JSy++FpA7zvwoQWHbMLM8lBoWgCklGVemQWHkd2/Xpcs/
	 JfPwdF40o/ujsRHbnoOSbUpR6WfRt7rmtwljOh2iWLoA1X95eog1gkmHN9kW54gcdp
	 sivOTc/f81cO/jRGZuTUQLFPVZ0KsMbxQ/wTBKC8KPwHgKupZ0pZkap5LX9utCo1aV
	 Jcs7L+dImB+nxFJLhorYA5MOxZULqGH80PdPulfH78QyxDL/VXxFHxb1ffHzos8zHb
	 4e/VVCoJ6xUx+pjRY9P6bo9oG0KAD4GsjmTxb7cpn+w8u9aTyJfI6liEOlKpY52wpK
	 sQ0/TIuI2LN1g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so382836e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:01:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwwzwQYYM2xPz2dOlp5NYvCR4zH5dcxND6PR8AwnNCT5Zquo7uHMqtV+zqTv3unhezU36Sq13cm2nUUwHNR/AHj@lists.infradead.org
X-Gm-Message-State: APuU4Z/3QqAd346JknUQh43o+6JMperZoF1mQIDf+JcJGPjzBikL+TzB
	QnMcMR9jiif0UYBCfoir8YF1HQDky7bZv/Ks2kkjq8TjywDw3sIITK6JF/TrKM8N9NzQAsM0g+q
	yI/BARU0YKDYn7OCcs4SbO8tHwFrfpBQ=
X-Received: by 2002:a05:6512:130f:b0:5bf:b70f:5544 with SMTP id
 2adb3069b0e04-5bfd951f972mr4988129e87.9.1793800896344; Wed, 04 Nov 2026
 06:01:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030082932.193164-1-julian@outer-limits.org>
In-Reply-To: <20261030082932.193164-1-julian@outer-limits.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 15:01:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=gqPPvLC72ioyRUJtDvqO9xUCA9B+vK95smaiEY5a8Zg@mail.gmail.com>
X-Gm-Features: AclHuK9orhwXbJqsVZsNMjktFmZa1Og1q3CM8Pzy0ZRLDTTCV01s2sm6CKPLgxE
Message-ID: <CAD++jL=gqPPvLC72ioyRUJtDvqO9xUCA9B+vK95smaiEY5a8Zg@mail.gmail.com>
Subject: Re: [PATCH] ARM: fix big-endian check for IO memcpy and memset
To: Julian Vetter <julian@outer-limits.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 30, 2026 at 9:30=E2=80=AFAM Julian Vetter <julian@outer-limits.=
org> wrote:

> The commit 7ddfe625cbc1 ("ARM: optimize
> memset_io()/memcpy_fromio()/memcpy_toio()") switched little-endian
> builds to mmioset()/mmiocpy() and intended to keep the byte-wise
> _memset_io()/_memcpy_fromio()/_memcpy_toio() for big-endian builds.
> However, the check uses __ARMBE__, which is not defined by GCC. The
> define used throughout the kernel is __ARMEB__ for big-endian ARM. So,
> big-endian builds have been using mmioset() and mmiocpy() ever since.
>
> This is a problem on ARMv5 BE32 platforms like IXP4xx, where word
> accesses to IO memory can end up on different byte lanes than byte
> accesses. Fix the typo, so big-endian builds use the correct byte-wise
> implementations again, as originally intended.
>
> Switching big-endian builds to the generic implementation from
> lib/iomem_copy.c instead is not an option either, because it also uses
> word accesses for the aligned parts of a buffer and thus has the same
> byte lane problem on BE32. ARMv6/v7 BE8 mode would work with both, but
> it is marked as broken and is expected to be removed, so it is not worth
> treating it differently from BE32.
>
> Signed-off-by: Julian Vetter <julian@outer-limits.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this patch into Russell's patch tracker.

Yours,
Linus Walleij

