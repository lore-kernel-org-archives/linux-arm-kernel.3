Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724D5CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCdUfSq56tzjd9BJmamnogQpujr952D9LtJP/K+DvPM=; b=Uht9NDI3xsMLzBiaF0DZCKdo2h
	NoK0jBELS4cXDP/SjxjRYSHrozJrMHPAGjuKx6t+cXxnVcEXm88nDjfFUj47Qr/8f8m7rFh4Gg9oq
	riepIfi1cGfgJuD7iy1zVyHTKBp6nIuroTy7vsam2gyCIWbgOdlxVnqszDCg8+tX4E3PIFyy90l+g
	MyjyhRJMfzShIYLVru/tJ8X7SykCivxuIpIB6oR83XUBHQqBNbmZlGP4GchY6TXubM9/5PJa04IdA
	w99VSN9PWYpaH6cuWA6PauGoPK6OUPfnTFq3FoIlKKxxDmYGdNik748ZFkMjC4BpkaBzKElGVA/qt
	/kfh0Rjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jRi-0000000HUDB-1tBi;
	Mon, 06 Oct 2025 11:32:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jRf-0000000HUCi-2CUr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 11:32:00 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-26a0a694ea8so37783715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 04:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759750319; x=1760355119; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MCdUfSq56tzjd9BJmamnogQpujr952D9LtJP/K+DvPM=;
        b=zAG6CrqgS4OiuLgLXswRZguPhEHjzkolP/sorfSZ6iXiSyoZjlhwhku8Y6UyfzRirn
         Rv7nGHm0hwgee+EjIH+E7sp9by/OsSuN937e7HKk0elO9iqKCJb2OFGtFo0lGKUt8kgG
         V0HXfjDke4tlibvb9JJ6WjMM5rgNHL0QgtPbJNNlaQEpiHZ4tyJ9sjxkVwJFAwTBw/3y
         Zy3CF0FXHZeFezRfztTUAKr6zV2wNEmd1OOMclFFjgab71pKd5jZgHu0x6CHpyq2yqjS
         Le4Av0MWzbawepUxb9vI8X0aJAHni6joSFWe8hO4e8OcYy+4XgcedlLmbzivgZju9ELA
         RUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750319; x=1760355119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCdUfSq56tzjd9BJmamnogQpujr952D9LtJP/K+DvPM=;
        b=wyQDM8m/h9lECfPStDY3o+qOkLEDIqloOvlNQ0tAa9pMOxO6DnUvjqd7tFmmByELoL
         cv3X5y0I6OwZPihkBlBpmvPOwX1BA5UsDAGW2l0kRoilZm+89ai1aQxmcV7p37X40pPB
         vHsEzzRoZ4Q6vL+KNdg8Wju4HuCaAW1yr08oE8J+3KZ7lUFSqgOpLJOZxED21Jm07bIs
         5E3uCNS5q16CS2NkMJ28Xh2fifSi6z9j9Mq4/FEPtl5f/KwiZWnodhrtg7uyEx4RcedU
         90xfhBZyefhrut3vLHUpXPEk5+L7Amrv/DodXn6gjgAM4bLR7QCuzmoOafgXd/hL01RV
         E6BA==
X-Forwarded-Encrypted: i=1; AJvYcCU4z0zbITxGR2Grq60EIuyau3wHTXfuJbNf/4CW5mqW3bAHFrfNOZuVFNUuyIrMIyIzbj29opV9ZiJVPTyV7nc9@lists.infradead.org
X-Gm-Message-State: AOJu0YwJcusxRqpIY48P+kHrdEkpnNod+FOPl2gf1Q3y3ygq2fz4CRre
	gdwyeOZTmOlowUL8L9iPQdcGdjRP6fTdGBlFzgXmIq6rl9G0mH9WXUEmN/MBUx+1g9SoUc34I2E
	EjMVK3nzJIx/0fVkcxTWaG8VQqGkKUJgd9w5NtanslA==
X-Gm-Gg: ASbGnctiI5qbYz1m8q+IiDH9Q5aRNbGtGE14CRUJcpJbpCloUrYEE+D5KRkTizEzH8c
	rFr0HSMVKIjI+o20x9qDAaUwOUY1mWU8etKVpirgS6H0B5MCp3RFrqoqgURLhK52x1zaL03eiy9
	T7bUN6SM3lsygBMHwQKm5hRWPZ0LKav2jaH1A+tBteBszpsEnjG1thY9kXO4PYRl580onDRFay4
	yuSZmaRJhewipun+KQWGsCNQakzy0HgQXpCmGECnUxE1bWyf+K1HlfzFEGQibTRclGncJJ0Rlvp
	36C0mU8MuE5zN+EiMJ2K8hbwGR52OcmjQQ==
X-Google-Smtp-Source: AGHT+IHk0BcyHGNjd8fw0KaD/j6uqPvdrOPp0sarkJmj00XawyQpO8GAec8OzHweFlDyK5jRXRrJR1iEX/aJ4XaNBSg=
X-Received: by 2002:a17:902:c94f:b0:267:b6f9:2ce with SMTP id
 d9443c01a7336-28e9a6dc5cbmr138177325ad.41.1759750318721; Mon, 06 Oct 2025
 04:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu-5gS0Z6+18qp1xdrYRtHXG_FeTV0hYEbhavuGe_jGQg@mail.gmail.com>
In-Reply-To: <CA+G9fYu-5gS0Z6+18qp1xdrYRtHXG_FeTV0hYEbhavuGe_jGQg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Oct 2025 17:01:47 +0530
X-Gm-Features: AS18NWB4sx-MUkILVHxbXiSvIkCbaL1n4-3C_QY4dTO4nEO29p1EMqNEWalh0DA
Message-ID: <CA+G9fYt+9QZ4TwEx7+m2S5Vtn7cq1N54oGceSR72upZJTrzkng@mail.gmail.com>
Subject: Re: next-20251002: arm64: gcc-8-defconfig: Assembler messages: Error:
 unknown architectural extension `simd;'
To: Netdev <netdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-rdma@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Patrisious Haddad <phaddad@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_043159_571196_3E92640E 
X-CRM114-Status: GOOD (  10.49  )
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

+ linux-rdma@vger.kernel.org

On Mon, 6 Oct 2025 at 17:00, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> [Resending with typo correction in the subject next tag]
>
> The arm64 defconfig builds failed on the Linux next-20251002 tag build due
> to following build warnings / errors with gcc-8 toolchain.
>
> * arm64, build
>   - gcc-8-defconfig
>
> First seen on next-20251002
> Good: next-20250929
> Bad: next-20251002..next-20251003
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: next-20251002: arm64: gcc-8-defconfig: Assembler
> messages: Error: unknown architectural extension `simd;'
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ### Build error log
> /tmp/cclfMnj9.s: Assembler messages:
> /tmp/cclfMnj9.s:656: Error: unknown architectural extension `simd;'
> make[8]: *** [scripts/Makefile.build:287:
> drivers/net/ethernet/mellanox/mlx5/core/wc.o] Error 1
>
> Suspecting commit,
> $ git blame -L 269 drivers/net/ethernet/mellanox/mlx5/core/wc.c
> fd8c8216648cd8 (Patrisious Haddad 2025-09-29 00:08:08 +0300 269)
>          (".arch_extension simd;\n\t"
> fd8c8216648cd net/mlx5: Improve write-combining test reliability for
> ARM64 Grace CPUs
>
> ## Source
> * Kernel version: 6.17.0
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
> * Architectures: arm64
> * Toolchains: gcc-8
> * Kconfigs: defconfig
>
> ## Build
> * Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/build.log
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20251003/build/gcc-8-defconfig/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/config
>
> ## Steps to reproduce
>   - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
> --kconfig defconfig
>
>
>
> --
> Linaro LKFT

