Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD04606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 01:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BehUyxFr;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DGf/CvL4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Nzihp1P/HgfQSWtejVyE9BkuDNhZgLetHLW5DYDxxQs=; b=BehUyxFrRQZcI0
	mmhlfB/dHs22l9hr9OEJijF/WBmg8GTwNyJqSWoyzJryRCk70op6Oo98xyOVyIq8wWl1/dAre1X/J
	p4k+k77r7XL9riewJ42iHIUQ426V63C8zNOb56a52dklVIA4+AwRqDOpyoKRLnv/0rXGdkmvJCH0k
	KcxHuAtjIlaAUd9ugkclbMW0wq8X9MejH0PcFzjBNIjrI0fZQA3XHc7WofgPKZLWGDiv2l5PlSFLj
	imfeKpmISoTjQ6qNc3/rG3SkruHBzL2I2u9kT5WsVAMVQJev72SIEOIHggxA4NWrz9aAcKrecLxz0
	WLQUB4/DKNA0GHmf8Umw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxc6-0000000Cof8-0IZ7;
	Sat, 31 Oct 2026 01:10:30 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxc2-0000000Coee-3Gpg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 01:10:28 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so1294968a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 18:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793409024; x=1794013824; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nzihp1P/HgfQSWtejVyE9BkuDNhZgLetHLW5DYDxxQs=;
        b=DGf/CvL4ffJj0VfCaz2UltOftwfAsAeSXkhxWprux+fk/53y3MXsuBMZ9CIKkL8bwW
         iXue3868dNvCoJDYiVXfqvI+RbQHxm+N3HZoAtaTdK5ll5ojvtF3/efrpz1+8OUr2K9A
         ArORTLfshMfsRi++0S7mKowqI+gFFm0S2GSmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793409024; x=1794013824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nzihp1P/HgfQSWtejVyE9BkuDNhZgLetHLW5DYDxxQs=;
        b=YNXPQtqGWUZm0wER6ZYBDH8N+ht+DTHk4hLduwjYJ/0iLGATrNvuiX1hjs/JHq4EOy
         2ZOKElVNi34I51DmFT90428hewl7vohWGgkgEhNckgkeAZF3jh9Tu7gKbDSpOxK7ZEUW
         tA0aAvILDvPhz2hGmf8n05KmOrfw2UODifw4RzYATbkM+yhUXmp29fDpvAqM0fck9JKP
         2f6AhFFqRYWap49lXhJbQCStuYPiJqxEh4JE2x/FcjupSxbppgUwtQURT3c2ynUJNFgT
         UsVlFTe+4ok5JmTorSNyy82Lghs9x7FKIr9YKFo2cB8c6pkf64N9i7f//C4FoXnppzDi
         nWZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeBleMVQjc3K+drps+LY4Oi59IQoxR+hdH8ZLa1u6R9FaRapPDIZN71yj/m2dArRN4DMQkFGbQbgNt7BRY58Ty@lists.infradead.org
X-Gm-Message-State: AFq9FYLzMqiCUwUWKb1Ekjx8/rZGu3NsxD8v9FhxEWYNichpLbVB8tHL
	O7Thjcrz5dYLs+C41LDv9Bf0WHEiui/1kB4vsmbv/2CtujG5Yxgyg7BmV2YKNaUjr23gc45Wm2J
	iyzZh9g==
X-Gm-Gg: AYBFou3bmPpJA5pp/ovL/Jb0HDkrjtLkYXKJIWI40aEKjDN8gx4qsOjeMwHjAiI2rX6
	6CAvGJKGnJbUAeH71UC4kwkBmxGwPClOWK9zuQ+/70TJ6uvRry5LvdXEVQ/5EgXqXRzve4aa+Hh
	Mk82h7ahb4vOO6IBeJXLoLJzq8wM5y3OKYkwwyUH+zhgQ6KJ1+xgTTsOA5S/G5nG/IllxBuuLGn
	lS5l4zcECiqq4IXtbJNNSEbIP0gWIr8j2QJG88iNbIXDZnMUu2QrOpXko8z1pXm5Xct+vzI6LDn
	FRwFA9BSAHfaGbVhTRAXsZHkHp8gzkgS/FtzxOx9EjpfIW6VVsN7S2K/L1MMSY92ItUflc2s5Tu
	rRRb621RvjWdrrehesAuolNazO7ETDoXZtXCeMtY2U/oEApxdLaWd3o1J/vCcv1W1HooyFufjo0
	oKBoL8FLapl1l3qMyAaKa5B6yzVLgRzJWI1kQddE4sS/F3guBNEbRgmTZVHZ61N7xLxt7Pac96Q
	cqzwEY0shcrC0TU2IXDu82H7aVB5kxIEGjC3gn5IuNnZiFYpcC6IDncL3jIAHEdEGjmm4HA8Xc/
	9i3lyKD3Cxr51I5HUbJ1F2OLQbZ62Ab52AN9bYK/HdGnX2GaDZnFmIATuOyFcFsgaXbL
X-Received: by 2002:a05:6402:52d9:b0:6b3:c320:8858 with SMTP id 4fb4d7f45d1cf-6b4d497418bmr3204111a12.24.1793409024545;
        Fri, 30 Oct 2026 18:10:24 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec91e2f2sm506764a12.0.2026.10.30.18.10.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:10:23 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so12684025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 18:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAR7YO4if+/fKQRcUlLwz6JGWolACGfnxbiSCdzUrQK4EgXwEp7fZJuYrRNMz3huiEa5GOjs+n9Hpi8qFXVRzZ@lists.infradead.org
X-Received: by 2002:a05:600c:a41:b0:4a1:ac66:6ac6 with SMTP id
 5b1f17b1804b1-4ac18c73d85mr83192945e9.26.1793409021466; Fri, 30 Oct 2026
 18:10:21 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid> <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
In-Reply-To: <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 18:10:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
X-Gm-Features: AclHuK8jubqKMZtp2zZmgL9M6Iv-P5KmHBzgb2f1Y0xcGERjxzkWO1A9oKK2NzE
Message-ID: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_181026_879535_FA70D40F 
X-CRM114-Status: GOOD (  39.93  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sat, Oct 24, 2026 at 1:17=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> > kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
> >
> > Add opt-in support for factoring the DTBs inside a compiled FIT image
> > into shared base DTBs and per-board overlays using `fdtfactor` when
> > `FIT_FACTOR_DTBS=3D1` is passed to make:
>
> Please can you add a short paragraph at the start saying why this is
> wanted (the bootloader needs a base DTB plus a per-board DTBO) and
> where fdtfactor comes from? It is not in scripts/dtc, so someone
> reading the git log won't know where the tool lives or which version
> is needed. A link to the dtc series would help.

I think that was in the the "after the cut" part, where I said:

You can see the fdtfactor post at:
 http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

This patch obviously could only land if some form of that series
lands. Presumably we'd also want to import fdtfactor into the local
kernel copy of the devicetree compiler before this patch.

My plan was for this series to be RFC until `fdtfactor` lands, after
which it would include an import of `fdtfactor` as one of the earlier
patches. ;-)


> > - When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
> >   included in the FIT image so they retain `/__symbols__` and
> >   `/__local_fixups__` metadata needed for factoring.
> > - Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
> >   defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
> >   `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.
> >
> > Assisted-by: Gemini:gemini-pro-prerelease
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> >  scripts/Makefile.dtbs |  8 ++++++++
> >  scripts/Makefile.lib  | 18 ++++++++++++------
> >  2 files changed, 20 insertions(+), 6 deletions(-)
>
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > @@ -425,6 +425,8 @@ quiet_cmd_uimage =3D UIMAGE  $@
> >  MAKE_FIT :=3D $(srctree)/scripts/make_fit.py
> > +FDTFACTOR ?=3D fdtfactor
> > +FDTFACTOR_ARGS ?=3D --strip-local-fixups
>
> Patches 1-3 go to some trouble to build fdtget and fdtput in-tree, and
> cmd_fit_its puts scripts/dtc on the PATH, but fdtfactor comes from the
> host. So FIT_FACTOR_DTBS=3D1 uses whatever fdtfactor happens to be on
> the PATH, and the build does not depend on it. Is the plan to sync
> fdtfactor.c into scripts/dtc once it lands upstream? If so, it would
> be worth saying so under the --- line.

Yup, that's the plan.


> > diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> > @@ -137,6 +137,14 @@ DTC_FLAGS +=3D -Wnode_name_chars_strict \
> > +# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs ret=
ain the
> > +# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
> > +ifneq ($(FIT_FACTOR_DTBS),)
> > +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> > +DTC_FLAGS +=3D -@ -L
> > +endif
> > +endif
>
> One thing I'd like to check is composite DTBs (the foo-dtbs :=3D
> base.dtb bar.dtbo entries built by cmd_fdtoverlay). My understanding
> is that fdt_overlay_apply() merges the overlay's __symbols__ into the
> base but drops its __local_fixups__ after using them to renumber
> phandles inside the overlay. So the __local_fixups__ in a composite
> DTB only cover the base part, even though both inputs were built with
> -L
>
> This doesn't affect lga or trogdor, but the make_fit.py path packs
> every DTB in dtbs-list, and qcom has lots of composite entries
> (lemans-evk-camera.dtb, etc). If fdtfactor relies on __local_fixups__
> to find phandle properties, it may silently produce a bad overlay for
> these. Please can you check this? It might be enough to detect such
> DTBs and skip or refuse them.

I'm not sure I 100% understand, but let me try to respond and you can
tell me if I got it right.

The goal was to make sure that we could fully reconstruct
__local_fixups__ after applying the overlay to the base. v2 of the
fdtfactor series handled this more properly, and I'm planning to see
this through and land it unless there are major objections.

By default here, I'm running fdtfactor with "-S" to strip the
__local_fixups__ out with the assumption that today people don't
really need them. However, someone could easily override that locally.

I'm a little unclear how things would silently produce a bad overlay, thoug=
h.


> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > @@ -486,7 +490,9 @@ quiet_cmd_fit_its =3D FIT     $@
> > -             done
> > +             done \
> > +             $(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) =
\
> > +                     $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)
>
> Just to check, does fdtfactor handle compressed DTBs in the FIT, i.e.
> nodes with compression =3D 'lz4' as in sc7180-trogdor.its from patch 7?
> If not, FIT_FACTOR_DTBS=3D1 with that .its will either fail or silently
> skip the DTBs. Either way, it would be worth mentioning in the commit
> message.

Yes, `fdtfactor` transparently decompresses compressed FDT image nodes
inside the FIT (including `lz4` in `sc7180-trogdor.its`), factors them,
and re-compresses the resulting base DTB and overlays. I'l update the
commit message to mention this explicitly.

