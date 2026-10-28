Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76B860A261C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 18:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M8mAnHmT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vY+8YDjn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=; b=M8mAnHmTeT8VA6aYsdq46f4bWZ
	lXdMUcjiALapwsGf+aJ75Zu4nviB0sNPTM5/7SFGlivcDbHdGIHz406+p81JSd24IBsS5BUqGJUY1
	jngYrJv8+aP5jlBd2hLwYn9BezhP5BaPJB/X4B0y6qc7bpRyDsbfM66G75DHykQv5jes0dtwciM/1
	+z0q/Upwd+x/Stv9HrfnTVq22+aYXf6jtd0KbimBhaoqkKe7cHps8M9axPFJLdm/++Mi7oNIC4lQR
	SriuWhLboS9eqqpYM0seZRaknuDTPdlZW3sb/5OQJ1CKRTU82WcGi/dJKq757PLIMev15YIYMWFYL
	/Jy7i/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM88T-00000007jeY-2AOs;
	Wed, 28 Oct 2026 18:12:29 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM88Q-00000007jcg-2fa4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 18:12:27 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6790c2eb033so219569d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793211144; cv=none;
        d=google.com; s=arc-20260327;
        b=JAC3YloHWwnRSLQ2KlXh8xTHywyGjtRZfgLdcGrz+Qz2/Ehm3y404ukUVJ1oDEY/v3
         +DeuogqNG49+8UZJUmmrvQOucCMcg818JPbNbbeOIswvbQzKkyxv9I1SIpXcIoQNPVWm
         b1QQxpeSoi0iw3QTzlcuPGTNdANS3kNcarF2GQ+uRZjPiN5jBCMISv+tyb4mzi2aep6M
         hD3puZ4dc+bD7Eds+j2gkirXipchvE1gPrTFpRaeOtGNXym1PTRnzSOCEDhF8W0Vs0CK
         wq0nvrJk7k1Nz5Y6Y6AWMe0E8PV73qIGkb2XjBtdu3jSDMcrnH8IVrDrTh5sZR9QfRCT
         SeRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        fh=YmDTXZ5tlBD1WZjzuo5muJhHZGEfzgwwIubZ8GPvELc=;
        b=aIcseCC8WN3+1DLFKbI1NT57mxwpqNmCTR26LclWlxSAhZavllEhIetuM/7oYb79NW
         Wt6zNwtF/TA5ZYe/d7eVbAmgu+teQs14y8wQLHjq+B2sVWZHM4pWzfbYE4Jv46D0/tIq
         DE+L6AhCI3PtOShLX/Rx1/bazaEkMCAqnWUUsLbKIeTVQZg/JLHKBJC7Y4zqJA3QHk9o
         JjdQexjAoBH/SL04wuXqP5Fuk4+CUSbDG0p+SCeNOOEcibdn6t/bAFh/bT1/R8jnkGuS
         /mLeMLJG1j0xelS5VlN4tUNZfXOuoPCDFAV9Lt17Kv7D+87uO6ijuyw52auEC3spJR56
         P2Zw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211144; x=1793815944; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        b=vY+8YDjn9tRaYh8yoqC6zqVTy3wnCiYOBkEEYJ8W0Gar7jXof2O69c6AXZCg3ZtKcK
         wevtSM9Lvmn+YIOemqQEsp8l3J1euqQ0UnxiCEYtgRegqg9bwbQMrNnpUq8xrZp2qG+3
         e3nyemmhg/sfGNVhRZRbNvacgiQVAmezcS8TFUt1Dz86MO7D7yL2Z54PJfLYLlsNlZls
         j9odQm+IIsjqOQFzVQR9OcgfA3iPctdUb/CJFZTgMWqQ4iLbsVgIk1Mx7EZW+sssdbtK
         e3/HpEFqSN/MWwrzh57fTbxSyisJjonBJoFTd+d9xTv3IzjvijKJ2lvUrJrdOwGWOpoc
         4JEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211144; x=1793815944;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        b=mnGPVCYH94xLebGuhqLc0/dh2T8+Q5EB82OH7eDSE4gT4+zfCf8CV2dVdv47kv8sCr
         ULEwYyLg3OF5ujDPKWM/4HRJgnk1F+EbogHJuKv2A2jeiJ3wp36dFhDus3WtEkwLuafp
         686/byx+O37TbJLwXtyLqEJcNGJQMjzhKBiimRxi23yDAeY2hVHJyiURocZEElPeu0K6
         woVoJcTM2znkJib3KY0pzCqp1S3+Yy/gRVqJv8HELVqyj35g4gBrZCjQyS7UPO1TYa5M
         +iWZNQPURyaFi1C/muUr40FVkM4l+wBasVuudsrrHANEsYq7xz0nUMhuuionVESU+W9D
         wrnQ==
X-Gm-Message-State: AFq9FYIePR70vNi6lrJkgfzuz+RxXOenT8osEe0SxOA3JAF4Lzk9rXdY
	y6tvc/zhXmpMfViwCfDyMBTqosZT3I9c8VyYiuhR3+Im4UIpJaKCkAV5aW1SOoQPK4jXd8WQxCI
	QjNTVcksr6QZNXUtbzsb6WedZiCsZSj8=
X-Gm-Gg: AYBFou3yDY1bdCTuLIfsvCwd4dCZe28WRSjQlRjJCovGPiWyjoccDv/fwBK32u8yNk7
	7EwF3up5/bbiCkpjAc0m80RUQRxqd9E7/q/n2+XRR/UvM/YW2ph7Y0am4bTj5gx2fV4A12dcsYw
	F80PI3gWwT8mvZtAWXeo5Cw/33Tr2mT4Ukl2cBEtFJ2NBshvW+/vIZMisbYF6pxX26zo9wMPNQF
	r8qCpn0KKHfyD1xPUM7GSekJU0DpJP0PjhvtN9A1RS8HNJtaj99/JjSbuJy40M1B+2ZXvLjQXoc
	6W40IAvpbEaCm+hLGa1MwwyHNZGCB0GyFZ1bHjcYW0nT5EsOhOTSnLN0GpCnTlHa4bF7hf2eGoy
	cjXnVGuU9HjvADqw7PSmBiIlNtuozZ1MZYQ0=
X-Received: by 2002:a05:690e:a4e:b0:675:6f06:5642 with SMTP id
 956f58d0204a3-67a7b9945d2mr4650525d50.1.1793211144098; Wed, 28 Oct 2026
 11:12:24 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:12:22 -0700
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:12:22 -0700
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261023-bug-word-at-a-time-zeropad-kasan-v2-1-be0ecfbae847@gmail.com>
References: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
 <20261023-bug-word-at-a-time-zeropad-kasan-v2-1-be0ecfbae847@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 11:12:22 -0700
X-Gm-Features: AclHuK-o5YV67AfwlA9WNsjqOxV_ScugEYWYzUg986KltKOOqPQjM_oQFfVaIog
Message-ID: <CAPAsAGyEUL1fj2-1=NGBDDO-z47cOHmcFDFexY9T_1_1LCMQJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Peter Collingbourne <peter@pcc.me.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_111226_678822_31439763 
X-CRM114-Status: GOOD (  15.25  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qiliang Yuan <odys.yuan@gmail.com> writes:

> load_unaligned_zeropad() reads a word that may run into an unmapped
> page and recovers through an exception fixup. It does the word loads of
> sized_strscpy() and of the name compare in dentry_string_cmp(), path
> components in hash_name() and hashlen_string(), and the trailing bytes
> in x86's csum_partial().
>
> It is inline assembly on every architecture that implements it, so
> KASAN and KCSAN never see these loads, while read_word_at_a_time() at
> least checks the first byte of each word. A use-after-free or
> out-of-bounds read of a name handed to path lookup goes unreported, and
> so does strscpy() reading from a bad source, which the kasan_strings
> KUnit case expects to be reported. On x86_64 with generic KASAN:
>
>   KASAN and string KUnit suites      failures
>                                   before    after
>   CONFIG_FORTIFY_SOURCE=n              1        0
>   CONFIG_FORTIFY_SOURCE=y              1        0
>
> Check the first byte with instrument_read() at the start of
> load_unaligned_zeropad() on every architecture, as read_word_at_a_time()
> does. All callers only load a word whose first byte belongs to the
> string or buffer they read, so the check does not flag their intended
> reads past the end. Add a no-op instrument_read() for the powerpc
> selftest that builds the header in user space.
>
> Suggested-by: Peter Collingbourne <peter@pcc.me.uk>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> Reviewed-by: Marco Elver <elver@google.com>
> ---

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

