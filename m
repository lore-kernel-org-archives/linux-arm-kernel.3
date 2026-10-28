Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7EF606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qr2flji5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+BAK7MY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=; b=Qr2flji5A8mNf6
	x/qLt7+8qHe35TQ2iiIzJs7isi5/v9DhWJoWl3ZmV14Dt6KDcdy4ViA/F9MC4naH+z5C5Z9qL/fmb
	x9Gl377mwQoAPtkjK7ibRFl6fTiokTKhqIJOi/o71j/x86nnt8tS7x3kh8q16RF+v06hLSiNMBQFw
	RtqnH7MCKqqQeVIsArkRgEcyBwhKhfYjO1BoR91Omu+DZRjHKJKMLusC6qIO+TvIFbdyQBYWl1ftU
	B3ub581Sr3DSdpACNllYk3DvaD0InOhYNbbQ0mMdvpEfKYedVsV172swom62LaliRQzAP6mdTfGBD
	Je4K+436WaB15ljgYg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Hx-00000006ht8-0cU2;
	Wed, 28 Oct 2026 09:49:45 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Hv-00000006hsN-0JLH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:49:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c43373ae89aso99469466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180981; cv=none;
        d=google.com; s=arc-20260327;
        b=A8G9QNEl1gxUzHTwpxUe1ROMusjlxZaR/wAS24+Bb3YJdLxIUEoT8lOvf9srqIX2A4
         2dnvfZAAGby/yVWrfvAFp7SjpSVuH1iyq9Wk9oiR9wChUde6R+l1xZj595u/OZRKA2Kj
         qZwgF9XtVsYxIPR3yXLNQUlps9VkeIHn92gdeIzrHsn2g8C5bYbYfp+f8wYEyL+36sFc
         aIbnUxDO9lLjgHoCvMKoAcJI3p25EtLsqqZkGegvS74kPwdauj7OIkDo6uacAeKxuZdo
         gAIU8YDogHJoO4pdNlBT/vAdiycjFuOq7F6YH3LskIyPG0SdGRs8JaHpC1HjUntOVT+p
         477g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        fh=qNzXsQvajXMv1Yq62ab8t/tYo9mEOqoSbFF5yStLCbQ=;
        b=sR6ZVRPFu+dv0QuhN9Jn3cFrZXCVANPgp75jCbmZhrdWHAghMF5jTMXQui3I/u7Q1K
         G1E3sDObVae52dlQQFOqoKMAth6aU0SWPUoFPBye8JqH8EwJdYVvnDptEIudojiizwAV
         4/5MFQXrdLsTKSdsko7oOgHgvaaMiQUl2u6HsZD1POz4/xKPjxhXLv0mbVFitt8UAXZi
         83PujHgUwaqBLLBYng2TilXNnxrB1Ig0bO8vYin8V8dQXoMwM4AWZh9bY8h3pId5RlTt
         06cLE4U2ygF/JWVuLfqQcl0d5yMHhZrBxrm0FVTw6tuqCsFD8323TH3cCbABfEu+4Tge
         rsfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180981; x=1793785781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=v+BAK7MYhv2jDiuxUbvW85OJO3RypIUkeX6usIHJTlIBe9YgnQOwHzfQHfc49c0uLo
         9xQIAB6BduSETvXlSiigpbGLFSW3yVs92/gayNX+IotFw39Hy+QRgZVJkTz7pBNesBXH
         8/+ZBa6xJWmih5O9/fFPWpo/1ugTjXCS2xueQ7gPxbCuqhFPWW+WECvCtUmJLStpxNYi
         eeNx8Q6FSYEukT5mRlPlG9NilGg8QSutD8Sdr/NENejtTy5m3qZAVibepZ1cY/8//8Ty
         5xuoFpan2Snq+bdwwGISRqiUFw2VVZPmK+uO+Pr6mSWQP0Q6eFslIL93VpwDGrlE9mCh
         cJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180981; x=1793785781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=fm3NGzf0kF48t9T5Eb/cbYGloCPRaLcdUYDXVlv8jMj2OyTXx9rh9CjLdkT9sHir1M
         2FkwdCRz+jmLxiYmWPAiyviYgMfFFaofx4NDKauGl9bj1lyMoc8ddpMbd0IGM7mBkI0F
         p355CDAPC0PlEKEoT+YiYxrbEiRv6i8sm+hzmnZ8JlGf2MG1vqt5fdGsABfFGzd7z88Y
         pv1Bwm8Jf+2RvMTh4SZzdeohHmw8ELt9U86WUgnn0UbtGXV9n5Xc9eioIGkOYoWPe1yy
         w3fCIZekSKlkk5CSoPMTAMeuGUV7zbQq6NnUDCrBCk+X/+bpc7TYomJ/1D6F4p+azwZ6
         Hvbw==
X-Forwarded-Encrypted: i=1; AKwUvBxjRhmCN9vkX100zrT7ctJDqV6G4OPvafRGLod11D+a3cQV8h4JtpY/QXtRUUqPfeumAuGuRH2DrqPRWtbi1qq5@lists.infradead.org
X-Gm-Message-State: AFq9FYKm4vdip/X7dcVWjdJed45Xutin+O3fw8Cf/l+F8WULWHghszf2
	0Dtkyyk7k49bcPpepQNlKc2ZVfikyWwh1yrefCS8+FxF99khUU07vgmwfIIuQPSeL/XvJG+YhIs
	tqE627jHHT1Vc9JKGNwFiZRdULxQMbvw=
X-Gm-Gg: AYBFou1qopndAew1Gaz4zVTeN+waOePjZPWIODR0IjIhqPBXBneJD99Q9npTFbU45Cv
	xICwNKfZAU9a1+zrsN9iUE4G6WUUxQy3JHonxfrVnIzxgq4YbvenHqoK9/l7HBUkdID/Ie4XF4e
	g93IoZKRJCBhYnTqz0ObTSmx5cTUGo9pAa9jq+d46OUT2ENNnYNKRP8wGqqRDwYTHs+NCwF+0CH
	s7O+8cPMatgEmYCA+COo1yjf1hbWXUeaGZY0wLVmQU8ioJSaRHa5d7K/HDwJYOXBoEQ72O2n3Va
	O/P2loBFNYdgUZBfcyFjDP9Y5oguWQgZobyqo0OKU7UIArSgg4KGoP72DwSHSTuws0Q80TtB0Lw
	BjQ09j/vMyVfAZBmunWY/tqoVRIzOwAbLTAOqJCOr37s50yzSuXMPOr3CV93+Houx7c5lM+q4gv
	BTY9/FlqKOscs11efUZI49KpPn39pG4D58juVN+PO5zxSEP/EBKyScRUjjlwzmqEWBXPLDtgpxJ
	XPhvIdhgcIgmkqp21RaL05dXGY=
X-Received: by 2002:a17:907:d48d:b0:c42:82ac:b6a9 with SMTP id
 a640c23a62f3a-c49bdf7de97mr167322666b.29.1793180980909; Wed, 28 Oct 2026
 02:49:40 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
In-Reply-To: <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:49:04 +0200
X-Gm-Features: AclHuK-kwXGKz5n7QFXQ4iO49tQbUX582-rj9xJLuSYR3NDY9XFvg2hsu7UGHjc
Message-ID: <CAHp75Ve71BfcWr++PfQPiOc=OURNn1-cdJey=M1xBVCb0HhHQw@mail.gmail.com>
Subject: Re: [PATCH 08/10] leds: pwm: Switch to __nonnull_args() macro
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
X-CRM114-CacheID: sfid-20261028_024943_128817_DFE558DD 
X-CRM114-Status: GOOD (  11.28  )
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

