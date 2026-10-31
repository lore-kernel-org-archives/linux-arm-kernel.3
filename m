Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBAC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 01:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jacRNTB7;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X5hj6GYc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=; b=jacRNTB7ech2SA
	1Muer76aJ8S28fZL37PyiXYiHDz0JvJ2re/t9gDvde2rYgAhQGPiTLoSX2p2S5mF7WAqT4vtsdHnt
	O0/Ms+6bT2WLKEgkv1506gSizd46MKp8pMG7hy1Vpm++dnjuQLC5noPJFhu0iW8SG0K1oKw4/wAME
	ix0zVYKZ64/Q6mKgc7TbVAbxDNwfWs1s/6Nnvh3/o3VB3uIUk/diFki82buj2Mqp7YwCGkCbYjiun
	BOK9r2/oQLmUxaXwNaqGfE4qYjcxV5AaAI9sJSM5wxXj+nfh2n5s/nLxqLcM1mhidyDqWwRReBSvV
	/ZNkqCUTUOTNmmp1r7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxjV-0000000Cp13-04U5;
	Sat, 31 Oct 2026 01:18:09 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxjS-0000000Cp0g-3Rsc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 01:18:08 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3ab01c46697so13827961fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 18:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793409484; x=1794014284; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=X5hj6GYcaEnihxltjhlk1Cfy5QFD/DMm9vP5d/4Cvkc+0i0FsVMlyZ4wlNt1hbtyt3
         7Y43s4rxM5Oc0ELSK9RJN+3iI7ozXHQaHygKA6faFrMPK7uyX2Dm0OOt7WTbA2l7wr7s
         YvuVz/ITHnMFmTkIDdVX/WWgGP1CH9pdUM+gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793409484; x=1794014284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=M1yeoVnzuSgfi2B6jSsuFk7Rt39i5J6Z2bNKF8351vWWwbmIbUQ6MbTu3kw2PMnU1+
         jmo+P/zMkkM4nDPpv8NbMHVn2xalT1joeAG+tGEpjcHbzm+DQbvxZjLgJa16Zaph6UmL
         7BQeo5RHFzD1nHjsP0umE143HJA8CAAQx4kBQJHwcL8BVeYWbmHtdugd31kGJaF7+clN
         FpK/gjx5VdBErBmBN4r98mwffPgcAFRo6r+BVnz5Q8aQuuCP/UnBkauDU/O2LY+OYYn6
         jEZtIxcQVlQJqGHLG5QBDV+7wbY2cW9xZtxZH4e2gBJj2cd2WgwmsWHSmXjsLR4gnLO9
         F0Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwtAbP7a8MGDVGcp0rjHckdkSk9A/iUCPkk0lNc9mtmxs9gA2kEacjBW5hibSy+6/7rI2D24T+4XYpXNNAPCiG1@lists.infradead.org
X-Gm-Message-State: AFq9FYJv+NDqmqAntF87p+JZMRPBIS13Q0KWKXuFhhgutTZ3oCoybaEX
	Ir2sMox3mvUrMWta6+3u8P7s1jA9KnXTJ6khp3pN9mgkY+FqkFji239oBVIbdAiETt3eQgZYg2F
	Oo1J3b7IO
X-Gm-Gg: AYBFou2EO90YlFO7OoVQBJYZvuSz0wenVz215GC2+KA5RgzVs0epPmtlm4DF4lJIuFY
	Zas4TXPfsFHyhTF4SfhOb3qImntGQ8RPZCnpIpyQepJlQAsI+fogDctJcwUBgG7/YSCg2tyonPh
	eT8+mMi3pJbnsWo9s9QMNoprSuCHcx9iSZSbAcGA+rU2bh7yD4xRsMcTrVArmEZSKMzAphmFzLK
	kGho+3AzoFS728+lJoU9Z3oMA7lPiGLA0CwNpNmyFkzuJlmw8LVeaTspDtx27wPPgbZHsPYyw8c
	6gIR7rtSXNSSWgkMiWOdQeUEs21VbGDpAtLSAPYL6FfIhp3jp26f05brymkRBy8faO0vPOi3h9q
	HOn2ZPhrd5FnSt8a2wPcCQSDwqqXtHizrPd2NDzXFc+hXaSjMCVRpxlunq9FoI8cvwUWXk2XCf4
	c/2eyhfU7HypGi9KdQUbymROnlfIY49uXFhyHkyxBi6k2ZUJVQObvAp2hUTPuK5YN5qAPd2l8UD
	VPodva7gnDjNHSlEAxMWO0fXFKx8nqtAm+hTuRpMCTPW9wL8YXaJjMy4M7FDVhd0BYNvVtD7h01
	RaOJ3GsGep1Yi4s1xwvY0L2BoEzSB/3jcg0rM8MwrN8ZnI1rpcdjAVKAaScVj03DSrQSO4dy
X-Received: by 2002:a2e:be9f:0:b0:3a6:692d:b7ed with SMTP id 38308e7fff4ca-3acb7aa01e4mr9434671fa.20.1793409483964;
        Fri, 30 Oct 2026 18:18:03 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf31c35sm6567561fa.36.2026.10.30.18.18.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:18:03 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3aca0bf7fd0so11209051fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 18:18:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByNjHHiSC8wyH84XOTAsfJofhcfUzKoJo3z9j43pkx1imVjGHow4n/EXdOezHzLYo2hcYdMAjmpUZzuSQ0/uHOJ@lists.infradead.org
X-Received: by 2002:a05:600c:609a:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4ac1709aa77mr83103245e9.16.1793408992269; Fri, 30 Oct 2026
 18:09:52 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org> <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
In-Reply-To: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 18:09:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
X-Gm-Features: AclHuK9Km6WTJvvTvOnJ9g5USO9Th2gdTGYh9-cjnPaFh3hhpAF88g-93yWA4Zk
Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
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
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_181807_011797_07BA18E5 
X-CRM114-Status: GOOD (  34.38  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Simon,

On Fri, Oct 23, 2026 at 5:26=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > 1. It uses a checked-in .its script to associate metadata with each
> >    board's devicetree. Other tools can parse this metadata in order to
> >    craft a package that the Pixel bootloader can understand.
>
> One thing I'd like to check before this goes further. In lga.its the
> metadata is a string packed into the configuration description
> (board_id=3D...,board_rev=3D...,soc_id=3D...,soc_rev=3D...). The FIT spec
> treats 'description' as human-readable text, so this turns a
> free-form, undocumented string into an ABI that bootloaders and
> packaging tools must parse. I'd much prefer proper properties in the
> configuration node, defined in the FIT spec [1], so that every tool
> can rely on the same names and types. I'm happy to help get that into
> the spec. What do you think?

Putting the metadata in the configuration's `description` property came
out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
already uses configuration descriptions for similar board matching).

You can actually find one of Michal's files here in U-Boot:
* arch/arm/dts/zynqmp-binman-som.dts

Then parsing happens in:
* board/xilinx/common/board.c

I honestly still think this information would be better to live
directly in a board's devicetree itself and then extracted to put
in the FIT, but I've decided that fight is lost. Honestly, the
allure of using `description` for me was that, since it as
free-form / non-standardized, my hope was that nobody would really
care what I put there.

If you want to help get something more structured into the spec
then I'd be happy to use that instead. It's my opinion, though,
that the metadata that we need will be different depending on
the loader. For instance, on Pixel phones the loader has this
information to help pick devicetrees:
* board ID (number)
* board rev (number)
* SoC ID (number)
* SoC rev (number)

On trogdor Chromebooks, the bootloader instead had this information
to help pick a device tree:
* Board name (string)
* Board revision (numbrer)
* SKU ID (number, though actually made up of a number of bitfields)

Michal's loader obviously has a whole different set of information
that it uses to figure out which configuration to pick.

The proposal I've tried to push a few times is that it's OK that
different loaders have different types of information available
to them, but people don't like that. They want a universal standard,
which nobody can come up with. Thus we end up with no solution and
everyone does something different / downstream...

In any case, assuming we keep this as 'description', I'll document
the exact format in v2.


> > How does this series help us?
>
> The FIT_ITS path is a second way to build image.fit alongside
> make_fit.py, and much of it repeats what make_fit.py already does: it
> puts the root compatible from each DTB into the configuration and
> compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> hand-written .its file, and the .its files repeat the DTB lists from
> the Makefiles.
>
> Have you thought about extending make_fit.py to take the per-board
> metadata (e.g. from a small file next to the DTs, or via
> FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> logic, and trogdor would come almost for free.

I certainly can do that if that's what people want. ...and, yes, I
think it would simplify some stuff in this patch series. The
question is: what does it look like? Is it a file that is a list
of devicetrees along with descriptions? The list of devicetrees
would be to limit which devicetrees are built into the FIT
and then each would have a description. ...and yes, that would mean
it would need to be updated in parallel with the Makefile, but I
don't see a significantly better way to do it. Yeah, I guess that
could work OK.

If so, I think a bunch of the patches in this series will be
dropped or look very different. I probably won't directly reply
to your comments on patch 2, 4, 6, and 7 if we go this way.

Should I give it a shot for v2?


> The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
> documented anywhere, including the image.fit entry in the arm64 'make
> help' output. Please can you add something, perhaps alongside wherever
> FIT_DECOMPOSE_DTBS ends up being described.

Sure, I will make sure that any newly-introduced variables are
documented in v2.

