Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74075606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nleFa/ci;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RitVc+tS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=; b=nleFa/cilVEP2jE0UlpcnDgSus
	D884Je/y7mNUnZQx8LHEEOQpwDLkdcgPYlhpSvlrjmAkPWkvY2u2wMomgl44os4t+fR8nWn8z5Ppf
	ekCo2znkDB1f8eJypaQaMDeaA1q1EHFdA3sN1DUNoCGC1RIILxWJ2wnodJH3ZW4sIcDuweFKADaLQ
	XR7pvVU4AnCuGYSTGo5P3r4/FxUjq+WYwR6rm61Qs23rcTyIIeoXCVwdnYg+kJBoFUzVuOqPlA0P/
	ClcMySGSz5l5kHZgNbHF5YBG/V8L1UHlehg5e0qcjWq7J2D4TEPqTSUnhYy2TnsB33Lq0DnHzeT/p
	jaZohFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWwG-0000000HaMY-3lyZ;
	Sat, 24 Oct 2026 08:17:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWw5-0000000HaIV-2anr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 08:17:09 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2209355a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 01:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829824; cv=none;
        d=google.com; s=arc-20260327;
        b=DL5ttLDVrfB2s22d8GkpKKhsGYONpFcby2xW9DZm7j/0qnxf5OMHu9DC2awdbGdFlr
         Val6FVAbaT4c0NsjOU4UvjYOsux1poRv4Wp1cxfO92v/4WmiIjgqFJLnUoCAliNrjySG
         +aeD9/dX3xj9tTF1px7uryglJj8/bKkFPuHoknDwNiEPdT7XYtgMu0gjNJEeE5hKQxCw
         nCmUsrPRLoGq/yOJQF1IkXv4G4fywWqZgyOJFTWTby0yaUkqg6C/716Dk2UvCu+I0Y1c
         U4rBNeUroznPDhLA5CtcVZv3JMNfgIJxIpH81TzBL3gBaaiYs+ajU3fRZaS1RJik1+e+
         c1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        fh=jFPmRY2rAec+fm0aBEy6DrvToaSGoGLhxom8yJuEqxw=;
        b=XLS+A9KBhEnx/nfWiy2ZkDF66rxEpPyN1RrPugttOWbj/uzOtur0jHwk51oIvRMi+W
         f5AFHF2gKjTbX3ZdiN5kV0uwVbBO6RiHhPH5s2BWtyxg9HZln+NzQ4BsxCZdwbJ2k+a1
         z9ekQzNFM6jQHPid/H+0AbWiwP9LY1SPsEDSaLEiw/1dH2O7Y3E9CopKcJlPq/OtOfFv
         g0pmR9Eo952VhvqED6Elzk28E0ysGC4mXYHbKjQBGB7CSyC8oxwyomHV6jqoZXzM+0u2
         vFQzeWlDMyttUtyPi/84H5QX6Nqr9ZLsyMdM/2+CnmSny2dowaevIhhBvfug6UWHAwzq
         MErQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829824; x=1793434624; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=RitVc+tSTzZxW/AzqzRVXS5LJ51nEYy8FeXbUj45ZqY7WHwjiNXMbrcbT96+yu+DSy
         TJzJXng8ix0P/VTAdrnwJx/Yiz84AaHIL37glNhALnYnyNMYD6VB22JTERgX+imxekz5
         2Fsq+k0Iu7CMYtRY+bGefwDReHiYZBGDXqZKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829824; x=1793434624;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=QgWDEQk4x6pEv+WDxClmGT/h6QBgtq8xDQ4FGWyFN88iXSWzbKKpN8V8JJi0iwQuhG
         ApTj3D72X79k7rBVhqve2nGzOYXdhr/Z5Zyp5L99bezcQRjxREmcL8XUYxZG/jrLOSc2
         rdSjyghFIz/QAeDbZlfvtcqLw+A7rxfoVVI6iinBKvIRHVYAvU7n63jh62nZNocfi3mE
         NbW2kRByEVWLsbrTswJsvDk4HR+HzXHKf2qKe8ouBy/aSDkHJmm/f214HVrSnq8GSW58
         Zh7+fpjlVQiOh/+R8s/uriFVOmDQ/n4Czj+L5GNMf9f5KCZtdwqrxmjZGnkzhkXSAVCd
         RuoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQHc4S5cfTNmUmeG4GGPfwbNLIKqDbY4AMOUtJ/q2/SCKlOd3uzAzFra/GdUxVLuO6fGWNirj1uO+Vkgcdiiri@lists.infradead.org
X-Gm-Message-State: AFq9FYK5TZxEqAnS+ubTZjLTS2oWLsTeWUxxoFeYSSmFi0bGjCllaHGX
	4xTzPOqsFHI843+Ps3SjI+VPqOnSToMQsXKwBA8WtOTmn1rC5dco00ATunCc9M6erOU68WRKiEr
	YOcWt5EfHQnhYf5FEMJK579XT3qUXa83eybCMbvpH
X-Gm-Gg: AYBFou0wb1ZtAhLZG9l+Wf3RrK7YEJpmpP5dP3ECYHuD7C3eHR1uFCvgPDRJBYyim6M
	PexAJrdrp+ul/1sGN+v97zY2r3QLq/xuGxZ1mgThDh+Cpd37eCXwQz/5VwTbvduvcbZNLC9vOp6
	R6ivrkclAd929yX4zpF614JqoMuXJPnEmZNC9df5YmjkJj9QLIXU2VFm7U+fbQko0cgh/6Zscru
	7Cf65RtI428HFsO0ylC8pLniBZC1ttk63uMxaDy7WVMC4FCFuwrBu7DIp4w5ZgLPL/zeJTF73KR
	sU/Z8Y2672FbdKN+ji28cxNMcYycznJGZkkgNDJZ4755xCF1QLJnsgiFt5rUjRa9pd5yWULgX/i
	Tey7kOY2pEKfvUs4ZsbBGL8AA5/cP9RsMTXg=
X-Received: by 2002:a05:6402:1344:b0:6b1:d9fe:88e3 with SMTP id
 4fb4d7f45d1cf-6b442fe4a1dmr1113081a12.25.1792829823688; Sat, 24 Oct 2026
 01:17:03 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:02 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:32 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:02 -0700
X-Gm-Features: AclHuK-hmUOppF09H1eQU74y6c4oDjFc2inDxQbdayDVgWED5bCCmINGnHLl7Qo
Message-ID: <CAFLszTjATXFecK3ryfO=yVY=C9yt9nc52acFZvxfdu5kqGNvZg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
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
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_011705_704006_219A0FC5 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Build fdtget and fdtput host tools
>
> Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
> `CONFIG_DTC` is enabled so Kbuild rules can query and update properties
> in compiled device tree / FIT blobs.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/.gitignore | 2 ++
>  scripts/dtc/Makefile   | 6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

