Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14036606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qzAAlMFW;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c70sqghV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=; b=qzAAlMFWYo5UWc/yAZAHZv6C4F
	ZN3Oeg4MV4a4gP5jlShi+mF+j8twUaw6i33HCfCCNZIxED5uxt2HKzP2fct6mmLChyHVQXuV+XEhJ
	ImIZjbQ4s2P4DTKXsXYM8bw6pHCiuPaqX3XCXmbnGKSuSuFDEviu13rn7H2khMmEuIN9QUL/PnsdX
	5BkwfD1LyqafYzWpc6TRIGIa0L3BZMHrEcgALen19tCdm2PMG1xMEUNuSOao0mSpknEns2E8CmX+Y
	NgJ001zCTaBOa8WIxB0lHrqG8UEvVK/1+O3koVPqThBBhPzlTkZH0BkHIN4zBpdghgubI2UBPH7/F
	8dRQSAQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWwH-0000000HaN0-0FUi;
	Sat, 24 Oct 2026 08:17:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWw9-0000000HaIt-0UsD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 08:17:10 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso2118410a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 01:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829827; cv=none;
        d=google.com; s=arc-20260327;
        b=iRBCFD2PXPue+M/yJIbfF7XSQ+1/vh8CDdK8TAf4+LQ8vNg9im/6cSEfdLck786nVo
         xmpJJJmxXT2gPedgxIbNm+EQjoZ9T2qauOcntu64jSs93t44vY35xcFmkwLKNidveVlo
         3niYMo34NGwFwZNDPvkzu+XLAXi/UhoHS3ic3hjvkJBoR/gc7Nfi5JNT2u/N/EDu5RzV
         ZovW8F0SJVICtfjz/SIy+4vwhWFgvFAHWH5lWRoS+HiU3Fr8WY2xF/DCdpm4WLYpW+dB
         FgThiEvVJoRaXSv0SagrN+9Y5d0gDHo5iepjM18mWqRSnjWJtudpNF91xMv66N6sIRRT
         O0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        fh=1Txx2S16dD8YJsKJLwnp31K6hhNZHpGfq6hj1TNrGDM=;
        b=F3tyI7rArdcKda7ooeipX5y5QPTnin63Fbb9tZUdsCqaUIpmJEzNSeJ+dwzZxU81BT
         KVGW/pFVhkQeuVvhU2JUp+VJU1KI0NObHOEfD61gfI8FwsenzRsNDbPg82RaF3Rgi2DD
         0KnLkMa8y9iHw1POhGRvvYwjQDxogoD5D4qbWJK/NYX//rbhOYZWPAKOGzxlLZst5PZo
         CajZ+WfFZvKC5DWhol2RcR+JpTlJtc8bTzN9fFuKyVD5mGmoUUjhQ2iTf3q6DvWsBgsw
         zsP5ovknmhsed1uhdstBe2Htv8Qrad9TyyB40xK2xUsb8ogSUyEP2TezQEIAAFMnvzQU
         bcVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829827; x=1793434627; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=c70sqghVBbCuwbeJdp5hG3up42kj+30GQMol97eAflHsSePUCyh5d/13sfqBPqPRxB
         eal/6SPzj4jOfwMCfpj/bza9zdmzyq04qE0XhdQWK4nUanjRAyldPRNUM0Dtg6ozUtW7
         HiQ5f0jPqml1My2FOwbrrG0fZzC19yML0z3BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829827; x=1793434627;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=XznHfWmI7f9Kd8OJaMpN8bKJfG512/3Q5DZpX2QGH0MpfOmIZK8yF+vP43hvF2JKpa
         362sWchGfRXxiFxcNF9l+ChWzpOnFgg7CjCAQMTOlYAqJOiejZMmkiSH8z4KgIizU4iL
         /fCNWvz47Ez/f6YrV8Ff8K4riRTUhbbtxscHZAXnkJewL3GU/amh5ZmG8BB3s+1nPwk8
         cD8M2X7+/SnT6z5DKiKpgvI9dsuswrBLq/BnYQkbgh2MiDQBJe5yoctz/w+j2VfN/xs7
         cPTkS6SsinvhL+x84zDXc2z3n1ST9Dp3ks00juW0GiIZ/DG/WEgnxOH5HIBMe5ze2KJQ
         9umA==
X-Forwarded-Encrypted: i=1; AKwUvBy5pG6R4g1wPBgm/LbTR/GIG9rwa72Rp/t4JXDnT6nuDlGOI9D+ISL4Xr4Lf0/uHLR5S3zNazOpU4z1tdWcWXIz@lists.infradead.org
X-Gm-Message-State: AFq9FYICnnaWNYuWLAJjsMUMiMPzC/Uu3+D6HNoWTvovHSNhsSlwcbDb
	3UzhOO+3P3BKgPPKLEqQj7zf6CGDDQ5Oc1cZ4mytnG8CqoCOseLkjzrv+9Jg9Wt97epHUz5fAT6
	DGEKiX0nZwzFZS/Gl6dNgQdbR9whfGrO7cxgNmIjk
X-Gm-Gg: AYBFou0EAh9V4SuEshPmnA0TR2c+QINGVPyty7elAW/MbBW0w+LaSdc+JU/TV2jjGdn
	mHZsK/lGdTagrCf3DT0xGjXzTO3It5kjijSfQDlcs/vh0L6sq8zgWy597vehl+Zp+zVkR6BQDWU
	I9O7uDYm2ShAFAio8PwzgGOoHK/gHxg0+b9mq1+YxwZOiVMGqCK0u/L2aUU3UrxKO0iwJcbcain
	pnYIUoUQCmHn4nHfsvlbrvISga/9PXu3CZE464SafXgndMIS2c2CeyT8X1gIqAKSqEzK2sHenEY
	p5agIxWI7NAiptriQQSfLtfwS5b/ZY2xusRqoFyokK64RUF0bveq21o+Syd4HNrTDIl/gbBwHuJ
	lKJoOVIKmqzFNIhMr3MgHvyiHjpdbqpCcQDky40ThH6sgTyFvpVnfuNxp
X-Received: by 2002:a05:6402:e0d:b0:6b4:20bc:f94 with SMTP id
 4fb4d7f45d1cf-6b442fd5c0emr1861005a12.19.1792829827097; Sat, 24 Oct 2026
 01:17:07 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:03 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:35 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:03 -0700
X-Gm-Features: AclHuK9YCJ7Mk4mSQDTbJDAZNMre28fNrdZjyMOx5ekb1ShhYgH8OFHnaV7iO1Y
Message-ID: <CAFLszTg6B2p30-RcmO6fk+2mdHwSdghU6PXotz0m=gqdk5dRNg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] arm64: boot: Support building image.fit from a
 specified FIT_ITS script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_011709_192737_7B23407A 
X-CRM114-Status: GOOD (  20.50  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: boot: Support building image.fit from a specified FIT_ITS script

Most of this patch is generic kbuild rather than arm64: the top-level
Makefile clean pattern, cmd_lz4_frame, the compressed .dtb rules, the
dtb-y filtering in Makefile.dtbs and the FIT_ITS handling in
Makefile.lib. Please can you split the lz4-frame and compressed-DTB
rules into their own 'kbuild:' patch, with the kbuild maintainers on
Cc?

>
> Allow passing `FIT_ITS=<path>` on the make command line (relative to
> either `$(srctree)` or `arch/arm64/boot/dts/`) when building `image.fit`
> to assemble the FIT image from a checked-in `.its` script via `mkimage`
> instead of auto-generating a FIT image with `scripts/make_fit.py`. When
> `FIT_ITS` is not specified, `image.fit` continues to be built using
> `scripts/make_fit.py` as before.
>
> Supporting a checked-in `.its` script includes:
> - Adding `cmd_lz4_frame` (`Image-framed.lz4` and `%.dtb.lz4`) for
>   standard LZ4 frame compression (magic `0x184d2204`) expected by FIT
>   bootloaders such as U-Boot and depthcharge, plus generic compressed
>   DTB rules (`bz2`, `gz`, `lz4`, `lzma`, `lzo`, `zst`, `xz`) in
>   `scripts/Makefile.dtbs`.
> - Restricting `$(dtb-y)` to the DTBs referenced via `/incbin/(...)` in
>   `$(FIT_ITS)` and automatically building the referenced kernel image
>   target (e.g. `Image-framed.lz4`) and any compressed `.dtb.<ext>`
>   blobs.
> - Populating any omitted `compatible` property on
> [...]
>
>  Makefile                 |  2 +-
>  arch/arm64/Makefile      |  3 +++
>  arch/arm64/boot/Makefile |  9 +++++---
>  scripts/Makefile.dtbs    | 43 ++++++++++++++++++++++++++++++++++-
>  scripts/Makefile.lib     | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 111 insertions(+), 5 deletions(-)

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -5,6 +5,26 @@ all-dtb := $(dtb-y) $(dtb-)
> +ifdef FIT_ITS_FILE
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +its-dtb-files := $(notdir $(shell $(call fit_its_incbin,\.dtb)))

Just to check, is it intended that this also restricts 'make dtbs' and
'make dtbs_install' whenever FIT_ITS is set, not just image.fit? If
so, please say so in the commit message. Also, matching on notdir
means a DTB with the same name in another vendor directory would be
built too. There are no such duplicates today, but comparing the
directory with $(obj) would be more robust.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -429,6 +436,58 @@ quiet_cmd_fit = FIT     $@
> +			fdt=$$(fdtget $@ $$conf fdt); \
> +			inc=$$($(call fit_its_incbin,\.dtb,$$fdt)); \
> +			dtb="$(objtree)/$${inc%.dtb*}.dtb"; \
> +			compat=$$(fdtget -ts "$$dtb" / compatible); \

A FIT configuration can list more than one fdt (a base followed by
overlays, e.g. fdt = 'fdt-1', 'fdt-2'). Then $$fdt is 'fdt-1 fdt-2',
the sed range never matches, $$inc is empty and fdtget fails on
'$(objtree)/.dtb', breaking the build. Please can you use only the
first word here, since the base DTB carries the root compatible?

> +		configs=$$(fdtget -l $@ /configurations); \
> +		for c in $$configs; do \

BTW, adding 'compatible' to the configuration nodes after mkimage runs
would break any configuration signature, since the properties of a
signed config node are hashed. mkimage isn't given -k here, so signing
isn't supported anyway, but a comment would stop someone adding
signing later without noticing.

Regards,
Simon

