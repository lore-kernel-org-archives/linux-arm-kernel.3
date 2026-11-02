Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C4B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ShQSLcZo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kku90+qM041/ZsQ9tSwaVmVz4Dm8H3ilNwTawTrWwWg=; b=ShQSLcZoPNDy3MiF2y174XiyB7
	AXs/yjVPg4+rcqhhl0DM0tgtsXH0n0GM/8vJykmow7uzbzoohNrQAbdjP01qs1a/CXXsXn3LA4gi7
	Gb+PaS8a2PtBBup0pjtdLRHp8LrLmRzveGYdAa5TeUE2rnsLKMtW3RdvSGdQ1Sk/yNqzjdJzYbDrO
	8gqbh5FYcfIu4a2+NuQW4P0vBJzd59Cdog0lX9/XawAYN4EDEzAhlPmWRg+zdqtPfKGSx8FbkHhsZ
	apMNVhB0fUq44OKwXHEzJ7zgSj9rODtj9Cfum+T6aXB5C0zQ7LEyN6xyJRa5qRkwpqcHq73s8wF3K
	z9lnUcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNozS-0000000G8Fe-0ukv;
	Mon, 02 Nov 2026 10:10:11 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNozO-0000000G8EG-1V2R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:10:08 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so731975137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 02:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614205; x=1794219005;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kku90+qM041/ZsQ9tSwaVmVz4Dm8H3ilNwTawTrWwWg=;
        b=ecFcXUEz4jnFDQ369Qs75PqaKYl2bDajoDGEUfP/ma/2NQ4RofcyVr4mnFDJiaXCqB
         Ifn4FcwCwtujffjcslNClBKoMfdwVKcRUKuQOMsPOK4Apo43/EKKhxd0ipl+1RaTvtVO
         kee9xkC4L8mO2+pLy34WW2fV2WmqmPvlZgFXqK1zeVjN95U9du2nIxq2oJc+/VuUo3Vo
         TZLFkjPfJIr/PkvaVEudrUa2KNmU1JfZz3O1PE22F3o8i/zPpFGNeUC41Yq0QIpFai7v
         bx/GU9/6Wp/LJsxmQFt+VJ/UI/T58ncawems0YBmvi/36bRJJNEMhsW/vNxTn0G5xLWx
         TpJg==
X-Forwarded-Encrypted: i=1; AKwUvBzEPshCiojCVgPdNiobK+7BOZJ+8SaLdUD03Gnn4UpuloDa3imcnkI0THI9VSTbp/LRG/QJKNLXyZso2gDkF+Rd@lists.infradead.org
X-Gm-Message-State: APuU4Z9qvcgLBcrzsB/XSjEyEVOQVltsKg7EcWcsiyE6SARWVJOfRUfW
	aFTSled3UAUvW+rk6RGkXDmVh4HNG39/Qpt/SAcMDdxdQW06JXAy+YqLfIpLfyoP
X-Gm-Gg: AYBFou3Tig+CelQQeq9E5WuUumXFHbwK4d5W4U6kPTF2a70hbGLhWKo6+biEvsSZv9F
	SDqdUZaPNUqYpypGrVHKMIMjTbFtNBPnrWRd/mQ92R7aEsKYvc4raUv9LfLc/9C3CQn120oTL5l
	KJc+/wzmW3isl7BIiXDziQQD4s4vN2Jkd19Ya/1HcNfb+JVcouvc4wKUjslxdWyJfKqk+E9r6MQ
	6NXI1ueog0m+eMFLwq3JzhXFPZUJYMv1Q7eJadki8yEP6FNT7+TalwAWC++P8jORwY/MYBYotdK
	cZ25bjfqYlxFsJ72dIlEY288mPOmt5n/vVdVBmolHultBD4TP9qfr/I2XZfJdCHEAom6ZQi5Zl9
	DjucgIhW1zGP91ct16tj/7kOgI0FH3VdtZH43nGcWyyZejV0MJU83KCJRyJv6NTOB9zdsyhwMs1
	V0TSf0mBGhMYAnER4jmqBqRVRGM3hPqgBF/zUYRqRy0IMhaIT4ddZwQ+VXyyb84kKZhjpKQ00o+
	osp55LKdtEsEWj/mGzz3qSRUdXfVNvsacZoX3T/7F0PWTizYS1qprF4om8TwcrHi+Qh6VsT+ljd
	zNUPYz0cw08Tb5BrylTv5Yp3MCOWewNr6rWyS40OSYQvRhcPtURT69MGc90jBlgUUQ==
X-Received: by 2002:a05:6102:50a8:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d072715882mr3478253137.31.1793614204829;
        Mon, 02 Nov 2026 02:10:04 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee437d86sm11653647241.8.2026.11.02.02.10.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:10:04 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7ce77f98658so662119137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 02:10:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzRQBQJXohwzQZSQPSw7hpmI5LTmyerpPzP5jwkH3jJ4eqmqLHVZ3iWgnWRQZNApKxm4jWV8e0ZfPewb2x45veP@lists.infradead.org
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id
 ada2fe7eead31-7d0725ceb28mr3125663137.12.1793614203445; Mon, 02 Nov 2026
 02:10:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
In-Reply-To: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 11:09:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhOu+1YU7z0WR=2M5OuGjdXmH6m5__F7TmhRGQx52jMg@mail.gmail.com>
X-Gm-Features: AclHuK8J4Hpof_2n20HSIIi8CLwkgCm2egqJasTQSM_ACF5dfMV0X89nwIyfFeA
Message-ID: <CAMuHMdWhOu+1YU7z0WR=2M5OuGjdXmH6m5__F7TmhRGQx52jMg@mail.gmail.com>
Subject: Re: [PATCH] perf/renesas: Remove remaining RISCV_ALTERNATIVE references
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_021006_397298_F20CA6C8 
X-CRM114-Status: GOOD (  26.24  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 13 Oct 2026 at 10:39, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> As riscv always selects RISCV_ALTERNATIVE, the option was removed.
> However, a few references were left, making it impossible to enable
> RZ/Five support (ARCH_R9A07G043).
>
> Fix this by removing all remaining references.
>
> Fixes: b924210f542e13c7 ("riscv: remove RISCV_ALTERNATIVE Kconfig option")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be applied to riscv/for-next, or folded into the original commit.

As the broken commit is now in v7.4-rc1, this can no longer be fixed
in the original commit...

> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -117,7 +117,7 @@ config STARFIVE_STARLINK_PMU
>
>  config ANDES_CUSTOM_PMU
>         bool "Andes custom PMU support"
> -       depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI
> +       depends on ARCH_RENESAS && RISCV_PMU_SBI
>         default y
>         help
>           The Andes cores implement the PMU overflow extension very
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index a63df28df3b5e7c7..0b6876ef6dca228b 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -461,7 +461,6 @@ config ARCH_R9A07G043
>         bool "RISC-V Platform support for R9A07G043F (RZ/Five)"
>         depends on NONPORTABLE
>         depends on !DMA_DIRECT_REMAP
> -       depends on RISCV_ALTERNATIVE
>         depends on !RISCV_ISA_ZICBOM
>         depends on RISCV_SBI
>         select ARCH_RZG2L

... so I am queuing it in renesas-fixes for v7.4, unless someone
screams.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

