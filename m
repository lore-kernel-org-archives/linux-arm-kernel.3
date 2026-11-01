Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF00606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PoYLOpGm;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hEN47vZu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:In-Reply-To:from:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=; b=PoYLOpGmU+QtNbFT7APOSznLEN
	dMZvaI6iYUetQAuIhT3dL6K7IDjG1oBm4ZyeObmDWZRs8EyNAP3E16OsltVSP1K46P+L7+jiZVpBe
	aTKGvpVlz9oDGfmVLYEoyIsra2pzXPWNQv4LZg/4nx4+KeJV0JXYAoOjVJy1HBmGcVsaVzlKfpl+r
	zP4plEJaVO8svfu7LT88R0WsZHMdINGnulxgQ+vOC6pN29bevBI53SSnmW8UhpjDqDVXL4bLyhAMH
	1dHwAsjC8Nrorbrt+2Sk3HCA3/FYU4CALFYWmz1FQwNhe+2AesaCLr2fL22Ncq2q+EKn5FR4q/uPQ
	mgdBg7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcZy-0000000EteH-3ZEg;
	Sun, 01 Nov 2026 20:55:02 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcZw-0000000Etdc-2Tfj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 20:55:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so3299156a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 12:54:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793566499; cv=none;
        d=google.com; s=arc-20260327;
        b=igljQ/5l79ZhEdcFejjsRBF7t5U8i5UN1Sx32HQuqt46HrkYprWaKbBg4RnvK2JfK0
         0VfEmkxxxKXUuITWEE3dHaRrsBv7gXelGFb8CwoLIOX+tzbYRpPq+QKgPY1zwxUTzpdU
         AKoimpKparQHLaMlnTjUNrsMWsM5CaT02BuiOrF0l5FT7pN8PNQfXF7LsuGXh/2Cmyzd
         7+VtORpt30HPWUGGpEzEG9+DfJugTfQSbZubF7wi6/A3zfmvUiHS7ROGuVLPe1uA2Jk9
         0EyT2iCiouS7WRYl65NdfEXKjuJ7JTg2MvSqTnPH3halNkAMP9ylNVrf+6lFEnJgIDlP
         NAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        fh=oPI218cPeqiItbvDiiovo9g55/0hEUHbTM4Bgt/wntA=;
        b=rwEy17JwgG+W3IT71HGCOmXDVV0OXNjWyAE/On1T9dcsFBy8a89ZPJ2nsCHhI+VM1t
         LR7a6GmvTwgepyTsPtzRBE1/hglvOuwNlEbRlXvFb9xldrHtKOokCIRfKBY4SfqBqIze
         qLtun4ECchZ6bejqo2S7DJqR/o6X90tT4LWk8g93v6LVOBUVacKaUd04w1VItoRtonUc
         tBdijmIQ0Pu27ksBNIUQasPrOCUBa2ozHbgNdQ5B7A53AU1Ghtsi+pC7Q0L+cU5eyFjL
         R4VQmmtPcLSLQkYDDeDayOKj2yZnvXt7H0YkVS2zMDrLI3kmpzDNwtzxkWNBlaue3JdH
         J9rg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793566499; x=1794171299; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=hEN47vZuKCeCxZgwKJ7YtBBAyFf6xPPNDft2RyL320oXAhFXrKhChqBHE9Gq2AvPtq
         ScUFrU94a4f8r7PfSuRLKe7Clau31nTjsDsz4LdJDXwfXiiH0TTeKlyUcdvRtDMNSsO8
         4Lj1XDbXDgzDrOc9HTM3+YQYuBpqOgBlICbP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793566499; x=1794171299;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=tKBMsAJp8DVQMgVTXFa/H2eRIsmmNqlQq/BA462StXx44GQ9G7iGwK4vd1heQaZZ4J
         MaFDCGingPLaNUymen86UhwalkLUbHnAv9eVd/POGA/hm6UImD6aJzTgcEzpB6EeQsmV
         3S5mZoR5rVC9GCdkBT38Cd67DoVBUypthV39Fq9LQn8lMZ/4OYeA+op/bdAFroxQ2CSw
         lOFVaxr43xQVjiLUA5/PRZLv4UPrgnL++KVGteClEwoOCf/OtLKpiuvQSz1nrqlOgnbm
         1doBqcyA0s5d0MPDg0hRTkvLP9RZd2jVLjZceT5bm3x42LqU5wINE14VMjzPEwy4G1JJ
         +FGg==
X-Forwarded-Encrypted: i=1; AKwUvBzxuzC4UYsQL5ZDPRU6CXyFanm5QafRhpN2ZjJSSkUCCLKsR+nocpY94YDX3BzN7tYdma+m+r8jBhgmegU3fW82@lists.infradead.org
X-Gm-Message-State: APuU4Z9fR8Qy94zDiVubOBV0EB2ggwMbHZMD8z7I+fvjaJKyd8S9IoQd
	e/sEIJo1f2TwmYYLqM5KaWT6RE29yGzPPIGRe5fRBksglqZR6odzKAelBnEC5JRphDXEH9ZBCH9
	OPW17T/zM6QSi0MzhG1G5BAt2aa91nKQ7boSAmNlD
X-Gm-Gg: AYBFou0q3V2UdEdZ2b/Wr+oU8PXF8AXR6aK78iog1Ua8FKOEHYmQ7qgUeSJKrqab8oH
	gYmBg2+2Hyf8JBGpg/Af8mH735yDv2lMTEkNVkVKg4EBl7bp1HvFWXGz3aaheLYibS02OX7tGAy
	5po9kE4cPLJ2vRRbQ8a43Ar9tMmwCHwBdTsXUxltGCw6NwaMdoevFZEaJ6T2a+SdA77szT6oeKV
	DI2RrwsuHDeBpI1AqoS0otD3Slg3A5aoSRsuj5Iiylv/z/tvrwQ14e1RHed2JyoH4pBHyO0TWCg
	XzAq+0MfCZ/a90hda2wsgyIJKOlOtBgB3t6BxFL1uAwsDPGHI5T5cUr4PfTD4SO4KtPkdPAhQxj
	goeGhe9aL7dq4A+lohf2H1HZtzKnZqRNUJ0vHagZLUlfarDC3sCBIFGLQFVDPq+3ImNbOm+0=
X-Received: by 2002:aa7:c1cc:0:b0:6b1:bb19:deb3 with SMTP id
 4fb4d7f45d1cf-6b4d4d6f96amr4159175a12.25.1793566498639; Sun, 01 Nov 2026
 12:54:58 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:57 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:24 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com> <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
Date: Sun, 1 Nov 2026 12:54:57 -0800
X-Gm-Features: AclHuK_IoQTHoKBTaMx-KZNiIPIi7_TIlou2gkeHseuy-klQIv193ZXwZZvOcw4
Message-ID: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Doug Anderson <dianders@chromium.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_125500_690790_58E0B292 
X-CRM114-Status: GOOD (  18.86  )
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

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:
> I think that was in the the "after the cut" part, where I said:
>
> You can see the fdtfactor post at:
>  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

OK, that covers where the tool comes from, and the question goes away
once fdtfactor is imported. Text below the cut doesn't reach the git
log, though, so a sentence or two in the commit message on why this is
wanted would still help.

> The goal was to make sure that we could fully reconstruct
> __local_fixups__ after applying the overlay to the base. v2 of the
> fdtfactor series handled this more properly, and I'm planning to see
> this through and land it unless there are major objections.
>
> By default here, I'm running fdtfactor with "-S" to strip the
> __local_fixups__ out with the assumption that today people don't
> really need them. However, someone could easily override that locally.
>
> I'm a little unclear how things would silently produce a bad overlay, though.

Sorry, I should have been clearer. This is about overlays which kbuild
applies at build time, not runtime ones like Beaglebone capes. An
entry such as:

    lemans-evk-camera-dtbs := lemans-evk.dtb lemans-evk-camera.dtbo

is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
make_fit.py path then puts in the FIT like any other DTB. There are
several hundred of these on arm64.

My concern is the input to fdtfactor, not its output. In the in-tree
libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
__fixups__ to resolve its phandles, then overlay_merge() copies only
the __overlay__ contents into the base. Only __symbols__ is merged, so
the __local_fixups__ in lemans-evk-camera.dtb cover just the
lemans-evk.dtb part. Cells from the .dtso such as:

    avdd-supply = <&vreg_cam1_1p8>;
    remote-endpoint = <&imx577_ep1>;

end up as plain numbers, with nothing marking them as phandles. If
fdtfactor needs to renumber them, or puts those nodes in a per-board
overlay, it cannot tell they are phandles, so the overlay applies
cleanly but the links are wrong. Stripping the fixups from the output
with -S doesn't change that, since the information is already gone
from the input.

Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
If so, composite DTBs would be fine once that is synced into
scripts/dtc, and my concern goes away. If not, one option is for
FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
the original .dtb and .dtbo files in the FIT separately and the .dtbo
keeps its own fixups. Leaving composite DTBs out would be a simpler
fallback. What do you think?

Regards,
Simon

