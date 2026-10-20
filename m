Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6FA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gdTo0YOe;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZLIU0Za0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpM6GPeESPabKUQaWW8tFYuJ38izk0ir4GCg0/h/pgc=; b=gdTo0YOeikOvN6tuZCAXmpx6HF
	IXtWA8qkz07iwYL7zhMgzkBpYia3fhirCOrbbeICmkMMFZacZBP2lqECfps6Vr8FqKu+5nOmYtj7G
	w5uJdAUK9A8FXrfEPhJRiXUg98pMcoW6XW6LVjFZsx5y6VO8hjejnoDFGzJw14jIqV/4YjxU4BK8o
	7113Cpj980hEgcSMclFrNKNDIGWUqDqexAxJiC2BkWdiXN1Gj+PvyhZ9EZS3YtMNrYE4r+Djb1oXV
	o5OplE+v1RGVPqlD6YtHNb8mMOawbB6jEq+O7aZo7uITXCCkuv7ff8kT5MQhN2fkO7Obooh29kUFv
	6/C6xu8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAOI-00000009rVy-2xkS;
	Tue, 20 Oct 2026 14:00:36 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAOE-00000009rUs-39XF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:00:33 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2727077f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504829; x=1793109629; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VpM6GPeESPabKUQaWW8tFYuJ38izk0ir4GCg0/h/pgc=;
        b=ZLIU0Za0jCKU+sfUB7+SlMu+sin9HWO+NfpoMJfz6WRd4XBHL0CRaFfldA4+9LUZbA
         TyxacILGkqw75AE4asbuXPsJ96u9vRD+XERACao8Q45p9A3d5C68WKq92yvGt5UHtvux
         KbGWwlchpE58XPZJdtKrh3JWYZLhlLk4rx6woFkI76ROuPaVzJPZzBRKyvZqxuKACT3t
         mYslu9z87xE50ySB3m8DSpxH3TWSNFw2Z7/qHacC6kcKOiFgoZVy+svrAqY+Mt41BVkH
         ZGX5R2rWh1w2M90JVxOjHLeEmW8/g3SthzAPWmk6XtNsOLnokQ8lpuG5hq8Uw5eie+Of
         TOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504829; x=1793109629;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpM6GPeESPabKUQaWW8tFYuJ38izk0ir4GCg0/h/pgc=;
        b=fYeh5cb330YjWwS+T8Lilo8Mq2cMHd4Q+iQGGCEBT7r2nOkX4itki9w0l2+UQbClqA
         ZfoLrBQIduVn+Yxho6nrraMrIoCIHcEIRR6SXfnv2k8O0Bjkq37eqTtEex1blSt81N6d
         QJsJjx3eBOJFUxrCPm/qqI02mwD4XJjmExdzWn8gJ64cdlB7qtE5X+YQhBVpY2uIZBU+
         N5kZcKLDxLE8oqv3+DtuXDg7fXsGwzags95ijjYoR96JZixyolYynjLTI/2b/RryErJL
         sqb4e5r9Vv9WHW2f3w8GeFclM4fMRgUOaYA2TbgtLKEiSl/WtEMFkc8WyHiaHlxVJ/0y
         Armg==
X-Forwarded-Encrypted: i=1; AKwUvBxbaxtbd1M7ntlSMSQd1FW0vyeLUL14CGr/pfcA8e48CFmB2vLmG1Bx4okmWSZ9UZ2cGHhFqKIEvgqpMcsQxe2h@lists.infradead.org
X-Gm-Message-State: AFq9FYJOD4+91hd8otFbJn8fo5WQcbVxBAGg8CLdhUDHt1APo1pTX15c
	QEL2BSeHN9x8RRFL3dNdrunK0Vs8uabFZ8Cs8O+rI/M/exgLNNITqg32
X-Gm-Gg: AYBFou0bxcr4XT9nPiuZlIb7BDjd4vOipQTdXJUU0ewy4LZFnLZOoECq4IFaBncQTwh
	ahVYT/SdND/eQV2WJJYQQ9EX/WXCmI42BS2/XqKbYn+1kASzcbO67qQQycYeuUTuf8i9n/28gTP
	aEuQ2FYrnDAW3ks+SEWy4IyLBaW72WJMaQgBZFQ/bBbpiffOTL9oxDzfubVw65m07SxYHnQaxNw
	COo1Orv9EIcfbnvNlW5hActHBRB05lfOPa9sYlGLhnZbltvihyPIUvuCVOXRsejikZsnGYoVNuw
	r2KUv+3aTS1EC0xB3cv21s+N/nHj+prdakVhYrb7eK9QKXHX1MLfn6etGMXYvvGCFrHcsNdsFXG
	AXCECCvVtP+ByOF9FnkuSomQpkwYONIVac7Xw3t2Soi2OkiI8iKLgF02917E5cvpenQZ/ZWhboB
	fqLZoLwiDZN9lYoqa6hZQA9vrpHXBFeO4iqQL+GjT8F8CSct++5zWc9ck0Rbtx8zqvo1b/mSq/E
	udAE68ftUTEPpV52exoNsrZCXXhkhZa7EUfvc41Wi+H2A==
X-Received: by 2002:a5d:588d:0:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-48e0fdd445amr17267515f8f.31.1792504828441;
        Tue, 20 Oct 2026 07:00:28 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8244e1sm6134450f8f.44.2026.10.20.07.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:00:27 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:00:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, Stefan Kerkmann <s.kerkmann@pengutronix.de>, Marc
 Kleine-Budde <mkl@pengutronix.de>, Christophe Leroy <chleroy@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Eric Biggers <ebiggers@google.com>, Al Viro
 <viro@zeniv.linux.org.uk>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option
 for ARMv5
Message-ID: <20261020150025.17a0339b@pumpkin>
In-Reply-To: <20261019201257.3805356-1-irogers@google.com>
References: <20261019201257.3805356-1-irogers@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_070032_322516_2C8002B0 
X-CRM114-Status: GOOD (  26.68  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 13:12:56 -0700
Ian Rogers <irogers@google.com> wrote:

> Commit a339671db64b ("vdso: Switch get/put_unaligned() from packed struct
> to memcpy()") switched __get_unaligned_t() and __put_unaligned_t() from
> using a __packed struct to __builtin_memcpy() to avoid strict aliasing
> undefined behavior.

Looking at it the vdso only uses it in the getrandom code for copy+zero.
Even then it only actually uses when misaligned transfers are supported
and the buffer itself is u8[] - so no strict aliasing issues.
So that code could very easily do something else and then the horrid defines
in vdso/unaligned.h could probably go away.

Then the kernel could go back to using packed structs (or something else
since that itself is possibly dubious).

David

> 
> On ARMv5 with GCC, __builtin_memcpy() may not be inlined and instead emit
> a much slower out-of-line memcpy() call. Add CONFIG_VDSO_UNALIGNED_PACKED,
> enabled on ARMv5 (CPU_32v5), to use the __packed struct implementation on
> ARMv5 while keeping __builtin_memcpy() elsewhere.
> 
> Fixes: a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to memcpy()")
> Reported-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
> Closes: https://lore.kernel.org/lkml/47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de/
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  include/vdso/unaligned.h | 16 ++++++++++++++++
>  lib/vdso/Kconfig         |  8 ++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/include/vdso/unaligned.h b/include/vdso/unaligned.h
> index 9076483c9fbb..726fd15efc82 100644
> --- a/include/vdso/unaligned.h
> +++ b/include/vdso/unaligned.h
> @@ -4,6 +4,20 @@
>  
>  #include <linux/compiler_types.h>
>  
> +#ifdef CONFIG_VDSO_UNALIGNED_PACKED
> +
> +#define __get_unaligned_t(type, ptr) ({							\
> +	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
> +	__get_pptr->x;									\
> +})
> +
> +#define __put_unaligned_t(type, val, ptr) do {						\
> +	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
> +	__put_pptr->x = (val);								\
> +} while (0)
> +
> +#else /* !CONFIG_VDSO_UNALIGNED_PACKED */
> +
>  /**
>   * __get_unaligned_t - read an unaligned value from memory.
>   * @type:	the type to load from the pointer.
> @@ -41,4 +55,6 @@
>  			 sizeof(__put_unaligned_val));			\
>  } while (0)
>  
> +#endif /* CONFIG_VDSO_UNALIGNED_PACKED */
> +
>  #endif /* __VDSO_UNALIGNED_H */
> diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
> index 597f5f0f9681..709eb193999f 100644
> --- a/lib/vdso/Kconfig
> +++ b/lib/vdso/Kconfig
> @@ -23,3 +23,11 @@ config VDSO_GETRANDOM
>  	select VDSO_DATASTORE
>  	help
>  	  Selected by architectures that support vDSO getrandom().
> +
> +config VDSO_UNALIGNED_PACKED
> +	bool
> +	default CPU_32v5
> +	help
> +	  Use packed structs rather than memcpy() in include/vdso/unaligned.h
> +	  for unaligned memory accesses. Enabled on ARMv5 where GCC may emit
> +	  out-of-line memcpy() calls instead of inlining byte accesses.


