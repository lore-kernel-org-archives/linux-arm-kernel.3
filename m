Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4606606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v1sN0+Sn;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ipSPlTtH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=; b=v1sN0+Sn1RLKvo
	KpCWfZ49efxLFZ1ijxG73vg1W41vdZRHKOXjamHB1LKIyLTW2FDolDQO3rynenixiIePB8mUuvEK4
	NcJGVQ5MI+9uywcIZ7oPkSRyIxUB0uD4pLzBw6AwfEefe56kq0n5OmzcFVhTDVkxImfY5YKVKdVua
	qgdoq8DQQDDo0YQnmBIuOVbPVZZAcCaI8n6dAUGLVi7qBxs9obPrZFYPDLgXl4pvsmKJnOqr/znR6
	44efRu4jX01QaGit/J+qujViY523HZrfKQekoQ2QPpUJwgTuffBQZ3JVbZUtCfnv7EJLbeBdNBGs9
	yZobdfOwunUs8z/26RnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNd4h-0000000EuoP-3j0J;
	Sun, 01 Nov 2026 21:26:47 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNd4f-0000000Euo3-0Ilp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 21:26:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso5539863a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 13:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793568402; x=1794173202; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=ipSPlTtHghFKzWRyp+vMft3hfKhMN7KuMBYKrt0jDRgZPGOUKtWx0186r7IMpsv62y
         fXFqvkKyHi3fGVwKA1zgcQGgekd2JGWZ7BHK6/5nUpS5uPAxzFFBB/xc/FOB6L+d/J4L
         BqD5/yxqDo/2tNYKgvBCI/InlTdiHBn1B/a+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793568402; x=1794173202;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=D/pkqD56j001+BdwdufLjWG0xEK7MoTiwkbXx7DOppY2vXqyg6i66G6WSWxRZXZmoY
         4gtRUCOMUDKi7DkIof8rsjeF1xQObXSHHACzm9dgwOysDIKo5mczEUDT9I3Tn/xICcxf
         pOqi0ewLVUxeYUsnC55ZKOZfKFvc99f8KtZ8hw1jrC25mnxDv5paGfPU5ICLQtu8l+XS
         WuYUt5WGo2nyEF+iRW1jGMOXLpKU5qWJ1nfqO5wR0t0JmvEOGJKrszqG5B5qvcs28Tda
         4zAoorUaZuk5YiN3nmUb603n6YxeB+bLWVTb2qQwkyWe+SrAjO3WlwhfI/Zlg64AwO1W
         8+Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwe7XarafJXandwb127tD8QKKDhwPm5hSUxB1MiJElC/lAAWynaY9Z5R/DHSrzif3eY1lXG51Tr58+iILQmTpaJ@lists.infradead.org
X-Gm-Message-State: APuU4Z89uMoAs9itBGeiFdTwAdHcowZSF9NMEPFG4BgdqCyvcD/RtBM3
	RWt0INrnI4OWVQRCEfvJribb3GF7Z6/ynfHoR29tYCWdnZE+4zuOWAGLc4MpIguBv3aA1OQfijq
	HzRyGbw==
X-Gm-Gg: AYBFou1fxjAmRaHIQ8z8tJXL3m8CW/fVNGkB6XaP4RxXmFOxVhkc1ryYvFpoSPlJavW
	R8j3aEfsRil/pAeKxIr6Wz76la4NqdWIcCLhQLnDpa2D2WI1vlL3366HgfycTRtn25fT+u9YZxL
	a7Q1sF/hUqnrVzAyDIX0gNy4B19aVunavgj1C3m7llT3KaeKKbqEpNYNYxpFfHS7KfC6ZZvRwGy
	g028iGM23tNnJ47NpjBBxyCN/e00y27PtsW0YqduqgN8baQWnlLnhOMbv+ZoXzSXm+BJjx0KsE0
	ngL52fZO+pOYEcmcuLPzLpfB+7USkcBSZRULqRXx44TqWz7DCQSIUOXbjXl734THD5BtteQizC2
	NYTK/ZmAnRQz8esoqxEzUbeQfHfC/RVndIE1HH3acAZT8XpquPQjqxAWu0mp/0licNUsdjkgSYb
	Qn5TnBzRyLjvNbzQpGEB0h2eGe6sOYXtPF1oYDYlrQ3EnFfD7ejB9QttPfZBR/8OZNy33Nl0RkC
	BzrFRq01RA3TrewBXqhOP1I9Rhk8mg6YgBTAkq22fMimiAbH5N9v+5XVfjloFWlsjKZj87xn07T
	LO84EVzQVEtUYyenesxswHhLuDp3ps2BzSRJJAdRtINc8jBLo0RZiX8gGcebMaaNXTk=
X-Received: by 2002:a17:906:478a:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c4ca7ac1e12mr680040266b.18.1793568402381;
        Sun, 01 Nov 2026 13:26:42 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cd291a96csm79251066b.13.2026.11.01.13.26.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:26:42 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c434376dbebso487295666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 13:26:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzvtSa+X5gbIJC+kC+24aKw79uUPXsRTjfsA+0rqT8+tShH0H0L6tP25C/c5luUZSCdXWiuy4gkl0p0OwMyYBJc@lists.infradead.org
X-Received: by 2002:a5d:64c9:0:b0:48c:585b:8825 with SMTP id
 ffacd0b85a97d-48e6e2db4a1mr23331343f8f.18.1793568064814; Sun, 01 Nov 2026
 13:21:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com> <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
In-Reply-To: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:20:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
X-Gm-Features: AclHuK8iDQf3Hi4FgB3rVtlO2TSTt5l2todvm4T0h7_4dZ5xTXqg7HY4PS9Cbco
Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261101_132645_172861_DFC03493 
X-CRM114-Status: GOOD (  34.09  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, Nov 1, 2026 at 12:55=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
> > I think that was in the the "after the cut" part, where I said:
> >
> > You can see the fdtfactor post at:
> >  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.or=
g
>
> OK, that covers where the tool comes from, and the question goes away
> once fdtfactor is imported. Text below the cut doesn't reach the git
> log, though, so a sentence or two in the commit message on why this is
> wanted would still help.

Sounds good. I'll plan this for v2.



> > The goal was to make sure that we could fully reconstruct
> > __local_fixups__ after applying the overlay to the base. v2 of the
> > fdtfactor series handled this more properly, and I'm planning to see
> > this through and land it unless there are major objections.
> >
> > By default here, I'm running fdtfactor with "-S" to strip the
> > __local_fixups__ out with the assumption that today people don't
> > really need them. However, someone could easily override that locally.
> >
> > I'm a little unclear how things would silently produce a bad overlay, t=
hough.
>
> Sorry, I should have been clearer. This is about overlays which kbuild
> applies at build time, not runtime ones like Beaglebone capes. An
> entry such as:
>
>     lemans-evk-camera-dtbs :=3D lemans-evk.dtb lemans-evk-camera.dtbo
>
> is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
> make_fit.py path then puts in the FIT like any other DTB. There are
> several hundred of these on arm64.
>
> My concern is the input to fdtfactor, not its output. In the in-tree
> libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
> __fixups__ to resolve its phandles, then overlay_merge() copies only
> the __overlay__ contents into the base. Only __symbols__ is merged, so
> the __local_fixups__ in lemans-evk-camera.dtb cover just the
> lemans-evk.dtb part. Cells from the .dtso such as:
>
>     avdd-supply =3D <&vreg_cam1_1p8>;
>     remote-endpoint =3D <&imx577_ep1>;
>
> end up as plain numbers, with nothing marking them as phandles. If
> fdtfactor needs to renumber them, or puts those nodes in a per-board
> overlay, it cannot tell they are phandles, so the overlay applies
> cleanly but the links are wrong. Stripping the fixups from the output
> with -S doesn't change that, since the information is already gone
> from the input.
>
> Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
> If so, composite DTBs would be fine once that is synced into
> scripts/dtc, and my concern goes away. If not, one option is for
> FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
> the original .dtb and .dtbo files in the FIT separately and the .dtbo
> keeps its own fixups. Leaving composite DTBs out would be a simpler
> fallback. What do you think?

I think your concern just goes away. ;-) The fdtfactor v2 series (and
soon to be sent v3 series) includes a bunch of patches to the overlay
code, and this code produces a fully valid __local_fixups__ in the
final dtb after an overlay is merged in (assuming the original dtb
already had a valid __local_fixups__).

The idea is that fdtfactor and the overlay fixes will all land in the
upstream dtc project. Then as part of this series we will bring both
in, so we should be all good.

-Doug

