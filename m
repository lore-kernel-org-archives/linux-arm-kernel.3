Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4GXxI9Tj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CX5y9UzP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=; b=4GXxI9TjFVgjTQ
	1fGLMWYvFmGKdHSuwc5qIxwmPnxY9Y9fb39Y/xdLioe6SOe/6VL5NloVvHtARkq59dvYGEvK6uFOX
	DKGwfeOfXNpQCxXYkI5EAfZAhwVt/ZpLt2WVYbvS+js4cI6IKKNf4LT2tiOB55fmX4EMXhtRRsupg
	jIRb/al+lS2eFecNKDA4wz/902VV1iL+PNmcZKU6kReY6PrpmRJc6//6qKZfGJfA2pERE/uqS7+N1
	yBgSssl77WF192VJAwCjTs+/LMcHHWNg71Y3lsnspLgKE3yIuGTBuxv09Y3SdybpiM5nIJgyjQtFt
	QlFE3Ysiue6vwcRz5iLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPkL-00000009GTB-2vCu;
	Thu, 29 Oct 2026 13:00:45 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPkJ-00000009GSm-1ZDD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:00:44 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-34c522572bfso308673eec.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278842; cv=none;
        d=google.com; s=arc-20260327;
        b=VzvPg2/a8bvQcH0tyvnvF69Ix/c6H2YJbNShAhl6f8WouD/RzuJUsnajHD7n4q+JZw
         DWBaE82igfiFT2zUElj3VbOJBnJPGB66Yh4tus0Ov5ZmGtcGUKo2oSxSjKkylAJ3vNus
         TbVvXuITu9WAtUKqVtlkW+Upj5/mwTdsInI3gLF0tPJG/lY1IQqufUdqId+z34+RzaU9
         sEx8HPXda7b8oQErMaQJMLqbh1vKLnZzXlN816bxBBDbBuc8mP2kD8t4yAy8CZgQVByV
         sRVLfNRMZHeAmK/TeKFAxQNJ/j8tkha6itamMs26AwDqyO5aowDsOnT2GniC3t+mDBCR
         WVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        fh=mMwKyY+YEP+08fHpyF8jcdG7ZhWSuIkyHQ6UeRSV3bU=;
        b=p2FjZ5VFoulI41CkWmn7Kbs1/FrffFiHdNeQxoZoetjY+Q1pJcN2rpGQ5JGb98sqkO
         3IP++PxnhrPweg883wldJTL+JGsNrDdqPvOqBpZHpgzCeTqY1mFBrDW8n+gbt84OnCzI
         PHHAWn/Fcc2PVgPPz35r+4ilcmhqzeto1D5+dFSjUPtnowgZf95yZEOa3VLgeRVQHeOh
         ix5AmJ2+MWxrsM1lpBbpjyVMABIrojhpWIZL4zyFRcbOFjIyPlu+06v3CPn1eOGr1ONW
         q6qWjKlDOfpF3OYNt/3RST3Wamgnr15e8NpFDgyoSzZvTI1sNIx6UT2tJtLv29Jgcajz
         GZJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793278842; x=1793883642; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        b=CX5y9UzPJwgggVDL5va71/G07Bgb02NNaU1e0FvtJq6JXmOuez3Wxq0gpmpoeR0lDL
         o7BgmckUlzVzRLf9055bZ5ZwT2Q8wwz9EtoEXSEgughnrZLj2whxEV9Bx6wR+cxRi3T+
         GYXJe41gZt0IsJ3BR3QkvrVB0m1tBBKJCuXhRMoZFpcke5woDSddmfh8tQ8pqNeXr46i
         C8Zb2WLEvDpnNHENC+vpirOD54smdSRL5y+hEjoTCFY/i6suILedKqNc/LrC1F9RSsYJ
         yjsokkC/kWGmIg4zEfVFS5Kgw32YuhfrlMVBa3VS64+VhS+Y72pG/IQVetj+X6Vn/sq9
         BXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278842; x=1793883642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        b=mczGPkSmc/TUEN7Ps9jzGRhDfTGz9enTXjB2sJp+T9746xljsyet8/scP+ZfL5MeAL
         SvMSp2bFe3Vcl+Y9ULbyfJXbj7kjQabtLtS8UYtUJLwcfU/NFm0u4TvwGLlaaSLwxaai
         7TPQZPaSh3cyYMiZEuK2rYyVEk7+BWb1lEneI4ZV3sVxczUF4zVhywL9leJm9OlH5YGm
         kZPKQWDdatVLqyGMigub897Qs6O2RHrZVvuNs5aFmDVbCa+cb8qQL/qN2dZ5xGug/arE
         8+k+MDAcI/LPcMEh3gMDA3KAWBqAfHprEpE0P/nnmMkvRKfCkVYsSFYDG6IqMcwAW6SB
         6IPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS4aqCQKTmKHNQdvyBWveF9AG3XrCqMoH3rq1xyMH6fREWQ6Vm/syvY1ZnezadZbJAo3RcHqoZH4FXKsBGVdnq@lists.infradead.org
X-Gm-Message-State: AFq9FYKtWbu1KBY/WNjJvNhBgIklPmlSORxKrGfafAsP5LPOoi1bnSI2
	4E1sKqOKUUmgE8Cy7zb49j7hlzGkdNPudo2ZPXSMO4LBTMTjuSW6YiLNC8nRoTCL3XxmyrfQ1Pj
	7Fc+vuoWTYa+E7QuKlENu6/1ywrNBqXw=
X-Gm-Gg: AYBFou0uXZyQ6gRKTpBIHqljGvVlPCh7HSnfrJddEcEkTrw64+Hsu41cpD0laWhSAG6
	QrRDWLOyMUzHBm+Q3RPkShY9JWkK38kNAc5BdSEGf+nAmLKcRsESLbZwpzYllHrf3R+Bmbp7fuK
	V4MwkjhqlaTJaNUTGEiU7ErhuC2zOC6dCDFgWXCrH7U2Uqpt6Jqdd1JRPId9kGFNo/+LGAltJZc
	G32wf6ZAQyXMrf3+tfIpvvntckiZVpSky/lY9T6xPCg4Zyb4UuKbVaT7J/baAHWbatJbOFm7b6J
	X74ips8gEypm9YJiee1wRS7rgnbrhaTbTnDxZHtvQNpBOKSKlPbKMRI84dDI456crXJq/9XRekG
	bWlwbFZKWN7bzOmtz7HVw6x1cQqR3CslTzMl63vzQej6bk2rwINuP7vzZsNkZvjbivF4TnHNLVU
	ExwyaObgf8kbQw1pvq+OhxcZ7RU3kPGvNyOyK1Xqx2IQOfu3YA8RVJyeKodzJlUiBoRpVZGmpJv
	7p8HMeSAr5Vd+3ThZsdoPh2Q2MAaykd7LQacQ==
X-Received: by 2002:a05:693c:4196:20b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-36a202cb0e4mr12034617eec.2.1793278841146; Thu, 29 Oct 2026
 06:00:41 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <5bfdc1491d297b5e98cf42322c790f06481c28c7.1793027261.git.d@ilvokhin.com>
 <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
In-Reply-To: <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 14:00:28 +0100
X-Gm-Features: AclHuK_VOCF7u599iESvOsHhN0DoC1VeK-LagvEMwpUC6WNOUUTl411X-macJoc
Message-ID: <CANiq72mMm75svCqevd8fHtVoczDpvpo4NwL0SC8=bWy030vQuQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/gem: Switch to __nonnull_args() macro
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Ilvokhin <d@ilvokhin.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_060043_413092_739DD5F1 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 8:32=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Should gem.h now include <linux/compiler_attributes.h> ?

No, it should be included for you (unless you are doing something
custom with the compiler flags etc.).

I hope that helps!

Cheers,
Miguel

