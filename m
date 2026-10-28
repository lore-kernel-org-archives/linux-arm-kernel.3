Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ofpaRj8T;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gWEZ9y1P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=; b=ofpaRj8TNTk+xQ
	1tioIrvyHuQy/uLMHbk/W2EtFtA5UencVFgjiWUP3lr09qOayFZHF/aRJPlFHO07y0h04zpqvOcG7
	OBitX6uNBnLxd0c7BTRG7TQVE+kWv2PCJJ5Y55wf57aPkxOyFjWG80hqCasfNCJyYIKbuTkNC6bu8
	Em8h+8/BLdbEINhtBPA4zGfXnyizsG2mUUFzlRYj1BXoChMYbQZaldS9HeBaNfV0+pZlQYJ3IfQoG
	PTQksqx0xlcSPVEmu56sRsd3oJRBbgQxPsLjPYZPwxL4m3arubmMtChMuZPG7kidEKf/j6p2SFeyg
	vIS6TqwsQPhLGC/iRKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Ic-00000006i6I-2Pc0;
	Wed, 28 Oct 2026 09:50:26 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0IX-00000006i31-0hyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:50:25 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c169ae1cb26so286992766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793181019; cv=none;
        d=google.com; s=arc-20260327;
        b=O5VNChSrRAcZyeyvaEmMM6AQIV/6eciNJ5ZqncysgXTu3yAfccZd9DKcgeeF68LUDb
         wXo3ETncyyf6Y/hf/9UaOID0qQPcvWPAMYB2J2A6s7T5XA1xUFkiy7iPELkmwYU2nMiZ
         zURwS2laYJldcGnG2tGtMoqgOWdUNmVHNuQuRST6IwtIM2zJE0QjmprStZBTY+lKUgzK
         lFTXf/x9B5hMFWrDV0zKlloC8geNzxjUw6q4wtT0tspZV3AYjTgwjm8Lv9cYA7p/BENF
         PzHnJ4HOfQxMj8oz6H9uRSbndVbnfnzmUv5ei6xxzvk4793n+gYinFDFtDF7jCnueoTf
         imvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        fh=G65q6FlBMaZLUf/jvhkUtcipOCDt+U0IQyu7NGL1aKE=;
        b=O0nCVugawd0d+KEuax8BIvsoze3tEjNLw5FB5ZEiVT8xhrLyThcKoNc8hKFqWm/ptq
         rP3fYT/pkMF0H11iP76sADR5Z7flwQ94U64Cl5APOpfA4UAdIDkHMpiwrY8aekQoSxrD
         7Tx0eZgzyaO0ZMJPW8uHUaEj5j4DSGo7HHi9uF8Eca2PuUbJqF7MteF3HNy4mDRKDXLH
         f8srEaoZt8WhLjSZea1jRDLr0DbtCLKjrrBqdFb7sHQSA1+rxtbDKk6e1R3GZPk1d9nA
         rCMFnp2lWuH4K/FC5x/t6w0jJmD2CEtZ2aPCSSD7YytNaXUeWuhxG9ro/2TrQkNHz8UG
         at6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793181019; x=1793785819; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=gWEZ9y1P2zVzCCDzTR21FUzz1owIAcxCN4dW2Y3TKbpaO2jbIZ9+0CqEppcBByU43d
         WeIIhUsr65+42aY0G7F8UH0H16WAlwsJaL3ro1wLAWgUsDi/IGUKvPaGi0hqh+W2SOky
         xRdupUbVGxKS3CdNqQuo1tDqqKHCePvJy24QeamhyN48XKz0h5lV1XzBWJJby9TJvBfo
         4QwIjSPjLGyMSgXQgl9A7zfCsrxgtUW2RnlkZwnbs+QUQJ5nwlwRJcpoM3O3vCEhc2Be
         dIKi3JLeflXItoSd5pdgiqOcsilLDxj4XgW8l0I9SnjDFiky75iRM9V46G16y+QYXjpy
         MDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181019; x=1793785819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=Jc/mYJFblDO16Tkc9glFlv6mndFhHOHHTAJ9T6Ex/iL8ib4O1Uet3wdVIrvfbXV4QN
         artnUqTDdeQMLntGsxxymN5fDNukLkR9y3kF6LrASLB43fNAiX0m0aSFpsW7A7k4sqEt
         VvWqDSujk5zf9+Tblnrlj+D2d+0JUUWsNxn8axxbHChbmy56YRKXuwcPihRNkV2yGM5P
         nzNqfz06qeqeK+JrWQkx9PlR4Wbx7B/jkttEqVRKRjwEyJD5OBRGGCQPBIGj0qVV63z3
         MDGvET1ELT3Zcs7NyO6FjCbla0tkbfMoatU45tSNl/tNUlEuDTDNueaPWZrFkzN181JK
         yu+g==
X-Forwarded-Encrypted: i=1; AKwUvBwh6IbNRmUFYOz1RdN54GkHDNEA9fmMzfKZNqtVbSZxlYZb6TqG37N+MWqL2U0aFyLM5ouMBrU3ADRpilmHZhtU@lists.infradead.org
X-Gm-Message-State: AFq9FYJRdyth88/6mvwkBo+ozPy56mrnjG0+IOCaH5C4DLMCCmW+hzGN
	YYLlGukfHza2ZWO43ZrJu4G4/b11quMmVskCGpV4DHwruN0g05WGsVyUF4BfNqIbrZ2Cm+ZGZMM
	fTkBnZTpm+yMLNy0fe0/oDBY5Ajvnof4=
X-Gm-Gg: AYBFou1J6pzwk/coGkBfAvrxFjTZ1MIHHcIwcXooaS9pxrtPhS03K48Cyg3hWo0Ahd2
	PYtFwHDOoOSlv7+ty9xO9txyDyDKprs+XbJ2J3y0OOvd3FMNzbIIIqlO+0uyazbK6oOAPU/ArpJ
	8UhF4KOqEDlj909i+whrkmtoK/L2ZQazbdwGhvM3LqFS0QGXwn+Ctd6yG0Rijn/kTP3yp0BUV38
	oRHO7KyXleylV67vTHq5wxyNxHJMO1Q/5et22LPNgLSKHVlaIDAZD1QhwYbRDuaHhOLIa5AJLhX
	w7aRQg4GgjpyPzjgjBqng+PM1SY1wbjMZ+fUmq4cAhGOr6bzjMKoijAxHHjw1a1LZO25b99+C8B
	7OwZ1pY4LPAmAemVMpg67ZQjeCZSE1uAd74Sqtpq2vCxihfbzy0+eTk6v6rnoAxZeo7hdw0L71B
	gqUlWiHHUTTsK1HMdV37YjEAkqJGWt2esswGfi4o/GYJyYXRA14WhKbLA/4Qo+O3yrMKLY6vjaV
	nTF39eQu6cs9m99cbaRYoI9CAWXdV40o+zka3nkNFYtklY=
X-Received: by 2002:a17:907:86a9:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c49a739f8dfmr484567766b.14.1793181019107; Wed, 28 Oct 2026
 02:50:19 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
In-Reply-To: <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:49:43 +0200
X-Gm-Features: AclHuK92we6zl1A1tCfKfYVeuXltUG4Bsfa-fRzr4orRkDVhJuYkTUAxt0MOtcM
Message-ID: <CAHp75VfR2i_PPZwSG2UPaxShU5L=FsSdEAT+0iUMDKAfugbRsQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/i915: switch to __nonnull_args() macro
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_025021_216663_972E0EA4 
X-CRM114-Status: GOOD (  11.41  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 10:20=E2=80=AFAM Dmitry Ilvokhin <d@ilvokhin.com> w=
rote:
>
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

