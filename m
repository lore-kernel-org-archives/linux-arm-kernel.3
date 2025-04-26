Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5938C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 09:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T531Ib4+zriZvU0QZafbnBWnttRxk2oMWt2rRqOFaJ8=; b=IRYul5JUqvhGARJPuqJajEDUbV
	2A0mu72znQjGQYnTpaz5U6eUdwzakUQSlu2JchyTqB/AZHpI0RwFM2sJtn3KmN46JSyDGKnME5e1y
	e3SKblCUSvxKiIxjozO2ej2zNBmW2BponBCfEQYGPBxKW33A+Ee8ilrNiUaTIeqzHUpn1rp79fcY+
	5wyG4BhiHTJVC4yezMOzVoVSgplKoHH5iDip9B+65e6gmknfeJgFFFjZDnlz528QedfHuF7TLoq5e
	XE/c9bzXzk63UWKlupf8JIXYuQabV0vgGRrJLs6wvuqVGH0LVBiGBpaywFOyQ7cznutQyAnyjWN8o
	fhoB/jlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8bZE-00000001mrj-3HRK;
	Sat, 26 Apr 2025 09:11:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8bVl-00000001mJW-0Sko;
	Sat, 26 Apr 2025 09:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1CA78A4D2FF;
	Sat, 26 Apr 2025 09:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F1CC4AF0D;
	Sat, 26 Apr 2025 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745658467;
	bh=tWnubF9yZCDGQjCpvAPwhcthzUF61M7My64owmsX1wE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BGvie6s6s+W7PK3hxSq8nPlG8ennMfM3lnISFEQrUyC4UzK78trdr7Q3N4PxZWKGm
	 u3JYC0P0nu2po5zLfchiwxvN07nheJw1c8N3DJ0oYXgLh08sxsGZzR+BZhoCgqYD87
	 kykCpg/vW//2i+YNodprO2sgjUXdo+RjDbir/vOJ6Aq1fSh2X3o5aharuwWiRNr/wQ
	 HJB5V2cdNkHE2Yqtyhq9ZamuUFceakG8CT0ggdIczCuVeA0YaxctVXQcTQcrXHPZbe
	 J0BHWNzQwvXFFybH2feeOqiJZWQXbxgWkrSLrYO/nUzaMAHa5G1KZNn7WjNo2k3f3o
	 Wt/RAbFEwiipw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-31062172698so33117551fa.0;
        Sat, 26 Apr 2025 02:07:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKrjdQvM2DnRSZCV4DGdHq1xUqaLBD6zo9G2P5/yBVeRrXW6wPRQmXbbQXEheMkGkCp33k2cCbIw/Sb0moUq7C@lists.infradead.org, AJvYcCXheP8Mco/K/kXcbU/o9psarcbvsjitqkSctIzitDbVGjMl1NT9h5bEScTsguzfGn9wVR87HyWfpVsL1E8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSiiwG3mmy45bOK9oWKExt4AC/veYv+mDTQgkWZ1QuNBKb9haV
	hcvQ93He7PB+p5KNAOrr+gyktS1D/SRUBM2fH+ZCeQeYhXnj089f3shaB9AJrSofETxzMzn8rUQ
	aeXkH5Gf6gLVOHeDkFzZTmnxWQag=
X-Google-Smtp-Source: AGHT+IFQ6d5LkceuPYf/xl1qz8Cz4agL96VnxeacTrxQe8bWMsw0LVAsS8Ui3mFUbafLHpHr7zqezdjks0Oba2s2Raw=
X-Received: by 2002:a2e:a9a8:0:b0:30c:1fc4:418e with SMTP id
 38308e7fff4ca-31907611d52mr17479061fa.26.1745658466100; Sat, 26 Apr 2025
 02:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250426065041.1551914-1-ebiggers@kernel.org> <20250426065041.1551914-4-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-4-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 26 Apr 2025 11:07:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHd7zDfH3FzrEiEd07SHa9Kg_P0LYaKNZL-WFR1gYwxww@mail.gmail.com>
X-Gm-Features: ATxdqUGuJmhadssxS6Ou5Vd5gSzDagv6eV7-J6URiZ1n5H0_6vtm3_ipq2KqSAM
Message-ID: <CAMj1kXHd7zDfH3FzrEiEd07SHa9Kg_P0LYaKNZL-WFR1gYwxww@mail.gmail.com>
Subject: Re: [PATCH 03/13] crypto: arm64/sha256 - remove obsolete chunking logic
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_020749_206859_D31770A8 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On Sat, 26 Apr 2025 at 08:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Since kernel-mode NEON sections are now preemptible on arm64, there is
> no longer any need to limit the length of them.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm64/crypto/sha256-glue.c | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

