Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B825606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zWNG1Pg+;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QQ3U0Dtv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=; b=zWNG1Pg+gGBrXUbBfX1A5I5Bfp
	jTshiQ8FwzxO3fTjbdv2on7rC2c5umnxNehFxdmz+HsPXRtPCXb9hAeYcYJ5eE7bF0InIr4ksMnyh
	vowauFxrIQIISXbnpTZwbZCM7CO5+dTqmi3Ool7dIWTTVGhaZJ+WeflcuaYRkGg1iyQd+jieivFEK
	rL4DJXO57LYv8vugeNMAF/fXSOGnNhq8RbiXB1jMUi2HcFZUl8VV5K+Tuf2u//FjfgFOMjkXS1TPP
	6AY6cT4AMWX9ceHMrE2cE0efQIUHz9alL4duE3TpFjgRAHsxW6+E2O+XQQGCdiiu7rYC2w/3l0Sb8
	xzrx7m9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWwQ-0000000HaT1-1Fs6;
	Sat, 24 Oct 2026 08:17:26 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWwJ-0000000HaPP-3yMh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 08:17:22 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cd633ef819bso650053a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 01:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829839; cv=none;
        d=google.com; s=arc-20260327;
        b=LnF/tkwT6I94CQxnZLKTl0bFLsberUBkDHgQSMCn0pi3t8F2XL4tX/T2frKe33l6ck
         +mygWKnjQ4M0N168enybWtD/T1IDZvCNhS6VN/RWO8+WXzPqLeL8FMkveq/juN2Y21Gn
         cIB7TOthGzcES1HxBhpIucIJlTCpRzX5qUV5RsDDguBFPTM1gf5fo8RO9Qh1VavN95S6
         9jCvl/+LsyjT62ok581wprPPZo00XhK2yR7UwGEF9JF0mvyGqaeG2J9TBCs0I2O5QwxW
         kec5zHgxQ6D0bB5qmB2C+HH5vFCMaq8K7QGOU/8fqATh8WQ7Svm/6M6jaBQd+5L0KB52
         cr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        fh=qycqL2CItCAJogMk3xxDp1JtslCB1cTGZV6pDFwGXcs=;
        b=RlYDyHSuqOj6CWq01mmrMxjlBj0JSQ9R8Z2AnwrFgg/EAqs/0y6guq9ivbZ2fr/8sd
         rq4gkrW+ZFQy+y2vt88aXSM0+O8XHYqOLoymWxMCvgPlVRUcrX3VlW9j2zjcv2/F6nNz
         pJXIC2x2j3ovX/JAa03H+Q35+3zbQOvObqOMl+rZDxY+WI/O2dcd4OLKOeU9b3v/v2SM
         lHrqGOiSSh2iWg2ASf1f63vWUSD3Z69EIGamlU2BNpPOfsy1+xzAUnhKXGJYu5UpO5eh
         Wx/sunOBn+QgUwVm6wRWs8aM57B4dvMrM3zPTv1PiyDHro0t08E4tC8sO96i0sOfwRLt
         eCFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829839; x=1793434639; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=QQ3U0DtvMLY9c6gv9W3I1jhpGSwH+xqqfQlS4Tq1MCRlRjEhei7lGw5bwFDkxr31GB
         6a/qcUHV1sWUHH9whjGHgJfIS12nuElkVnjFlvM2CCbmhkJYrV+0idcq63rtFETd1Em5
         kz50PwY7qHl2hsN8ntncMAEbrk4Thpgxu571c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829839; x=1793434639;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=sUUV3iIsI+zLjkHCIfYhKVTqGMTQT+qCwBPOIpiRNa1v51Nxzb2rd1rbvLPSyE/zEO
         xHNQWxLav/0kEubRahY4j3W79BZcXTv/+aGluXiHblCMQH4N6pZfTHOoS+dCRHkp/aY2
         MJM6VLVctKG32c39Qy89kUfYVCk4b+Ju131MwqhynrDA+A6pqfUUVVkesg/Ik3mCGmD6
         sfCHZK9kxuxYrXczxEYQueDwa9TQubdhYuC1lg7R4aCSXQ3IM5IZjr0JTpbD5iTB81n7
         jfJqqNKsiFmpl063c5e2doNrzFn/SJdwiaIVtSs1e+NncGv8eTsW9kurU6Pvb1hnBwps
         7tpg==
X-Forwarded-Encrypted: i=1; AKwUvByDqMiJnjVKIm+4kojbwT2Bkd91Z0wZgMBOBh03ozdMYxtmPHDsvQEJDO7uEhhQlw/msrr7fcvqsTNhz4acuhFp@lists.infradead.org
X-Gm-Message-State: AFq9FYI9Ep343wdcGlwR6hzHNeREGpWqsjeSVJH83XBfICFK7L9nax0G
	4c/pggx9OaVRrNIncwy4UMv27TLPVQJ8ImwF57h0R1Ggi7Vm3ulSSvg4nEZuWfC5TAnGYxbDmXu
	SsuKgGFKDsG+opGHekRzoiWMLRYoppCriTdO01wNn
X-Gm-Gg: AYBFou2yTIEb7uLAMtViDglAz0p+yNXQcTc2jm6hDPE7Qj8so2e3Cb8mSUzYZbDyDt6
	36OGnvIu0CnfgIZDTJLxzVC/mdVBMm6miDG+icSQvUebQhmEP+cfiTFkDVRp0cm6skBdWl/bvfh
	RiITGCqDV0lVIiqjmbBhcK2UdaWu9Hd51Uo8vLxPQYftkZ/PGIPIHuIbn0zXf1yhPVSBW3l5xbG
	C4Fnp/O7ciHnRzjOle+fk56HLr+tIQJ4SrpZ4iD39KUOX1t62/xTekx1TqKcOyjIIkBrpLsN+Vo
	1SPX0XS08ObOjWubYONcEjPB1Uz8ygM3HqaF7lN5hSCL3goKS5sKjEZcklCaJpYflpvPddrIjn0
	/qkGTHSuyTP14Th7NN7QN1M5GEsp3k19bbwmL
X-Received: by 2002:a17:90b:2891:b0:3ad:4a8b:c6e1 with SMTP id
 98e67ed59e1d1-3adea9dca56mr1447422a91.19.1792829839011; Sat, 24 Oct 2026
 01:17:19 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:14 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:13:02 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:14 -0700
X-Gm-Features: AclHuK-tg0PdtuvuCVecn4H2MwI1d9lfukkzfH1KNqgDlJ_Y2JdAvjK8N50Iivk
Message-ID: <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
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
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_011720_004737_C8400D99 
X-CRM114-Status: GOOD (  22.06  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
>
> Add opt-in support for factoring the DTBs inside a compiled FIT image
> into shared base DTBs and per-board overlays using `fdtfactor` when
> `FIT_FACTOR_DTBS=1` is passed to make:

Please can you add a short paragraph at the start saying why this is
wanted (the bootloader needs a base DTB plus a per-board DTBO) and
where fdtfactor comes from? It is not in scripts/dtc, so someone
reading the git log won't know where the tool lives or which version
is needed. A link to the dtc series would help.

>
> - When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
>   included in the FIT image so they retain `/__symbols__` and
>   `/__local_fixups__` metadata needed for factoring.
> - Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
>   defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
>   `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/Makefile.dtbs |  8 ++++++++
>  scripts/Makefile.lib  | 18 ++++++++++++------
>  2 files changed, 20 insertions(+), 6 deletions(-)

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -425,6 +425,8 @@ quiet_cmd_uimage = UIMAGE  $@
>  MAKE_FIT := $(srctree)/scripts/make_fit.py
> +FDTFACTOR ?= fdtfactor
> +FDTFACTOR_ARGS ?= --strip-local-fixups

Patches 1-3 go to some trouble to build fdtget and fdtput in-tree, and
cmd_fit_its puts scripts/dtc on the PATH, but fdtfactor comes from the
host. So FIT_FACTOR_DTBS=1 uses whatever fdtfactor happens to be on
the PATH, and the build does not depend on it. Is the plan to sync
fdtfactor.c into scripts/dtc once it lands upstream? If so, it would
be worth saying so under the --- line.

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -137,6 +137,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
> +# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
> +# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
> +ifneq ($(FIT_FACTOR_DTBS),)
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +DTC_FLAGS += -@ -L
> +endif
> +endif

One thing I'd like to check is composite DTBs (the foo-dtbs :=
base.dtb bar.dtbo entries built by cmd_fdtoverlay). My understanding
is that fdt_overlay_apply() merges the overlay's __symbols__ into the
base but drops its __local_fixups__ after using them to renumber
phandles inside the overlay. So the __local_fixups__ in a composite
DTB only cover the base part, even though both inputs were built with
-L

This doesn't affect lga or trogdor, but the make_fit.py path packs
every DTB in dtbs-list, and qcom has lots of composite entries
(lemans-evk-camera.dtb, etc). If fdtfactor relies on __local_fixups__
to find phandle properties, it may silently produce a bad overlay for
these. Please can you check this? It might be enough to detect such
DTBs and skip or refuse them.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -486,7 +490,9 @@ quiet_cmd_fit_its = FIT     $@
> -		done
> +		done \
> +		$(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) \
> +			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)

Just to check, does fdtfactor handle compressed DTBs in the FIT, i.e.
nodes with compression = 'lz4' as in sc7180-trogdor.its from patch 7?
If not, FIT_FACTOR_DTBS=1 with that .its will either fail or silently
skip the DTBs. Either way, it would be worth mentioning in the commit
message.

Regards,
Simon

