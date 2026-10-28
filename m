Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF27606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MppCQ7EJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iEwVsv0+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=; b=MppCQ7EJrymfe4
	TqEjw2+rcMje2XXPQqKgGBIgbjd6E1u7LBPpKo5Yj9h7r6kHxG6oK5xypEw7J2gCINt2R3zA+mvM/
	rThSzH+rVCG1tUgyKU5rvrgBcjI4XnFAJ9p+QsTFBLky4E9krBP14tF0beV7KR+M31+BQH2DpjaRA
	MbwXLMHtROoB4BmYR0RABuhgAEYswcShbb77SI6kxN5g7eHbN4AsoMLO2EPfd7UKzfcGCG2rAbK1b
	fhgZ6zCKJNAEty+uj9ttgXnVUUW+F6OQyoxIAXaf6NfbIIQCAZbdF6YWFFEXy9a81CmwdNeyk+R8L
	bJmxrGmbimpPyQZ4JbqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0HG-00000006hfk-01zQ;
	Wed, 28 Oct 2026 09:49:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0H9-00000006hbY-0cgD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:48:56 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c450ab1483cso108225566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180933; cv=none;
        d=google.com; s=arc-20260327;
        b=X+Vja2/1SW6PfxG0ABPOgEaHMfvHxFGEqrIu0NElBqbGKYsCNoRB5tKcB7/jcyqvMJ
         7HnTiEBwCr7jdhyauOD42n+KsW3DDdtEZVlxJ6Y50TXhLl4LgkoSppSIaeD927YGuLzX
         KUwJ0U1RkYuoyHT+yzJl6x0+sf1lcBWM/tlbJ57pPo9V67qBkNPloVVjCtZvuksvFdig
         1iT6imt77ZOm1592Zz7qH4DFMnBbzfwwVaKnZzTFmF9/4ZZ3MEOgEIVEY5sq+8OcDNeY
         kRJ1mYWr2CGEU2Atbnq+qQLgk4MYke4MnFYxo5kQj8VvbRUEBLGQbZFa+UKvVSZ6wqpE
         bDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        fh=Ipq58UDIUuY8tpC+FzciRhDSXuLaYuYMm1na1dWVkVc=;
        b=qLqFJ2QbCfHYSwUZZnXj1D29d9ptvxaJvQt86JAl/dhKVZ0bzP50nhDppZwXj6aT91
         bGF9fpcmn7L1mNS6wxccQkuDdEeVPqoH+zumBXPzEL+O/OvjHdb7ig27qZj00J9GyfiC
         2diUWsK2d4TslDN5fdreYrEzm6g24NMzjgrLUrGAD0BEL8RUKv4KXoJgRzaZpmFo28n5
         0/eZlB16hzf9C36c+pS2MsbSKO4tEAPKj1EFNAthtPTts0I5M6YSJmqd8InpTP/8f1GP
         ltTQVC67T9HHsr3zz8CeATXC8IICStNcfJooGSN43sgP8WCBl6cFJN4r5S3l36KrQgtw
         Q42w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180933; x=1793785733; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        b=iEwVsv0+LF48m1rGro8fOty3Bp55E2D6W/lIr3044YsZ+Y1HFL9KO2q6JYLzZmDtjY
         jJ9kNPIMXQoXxZFvBzT0MenD7CHzuzWi+BcCNO1nkFNFtCaGoV9IX55DiTxJjr3csHNx
         XFdxolsiqsgqBpzNnGWyuvJOhmHSV8G012QeqyPNOdoJh9A4aAKo3Gbkw7vsQ7HtqI0V
         A2kCHWWk/xZm9fh4RiEtZ7E8qXlEi3F+n6fJlBzs2WMWpNyzQkkah7wEm1J9DOMDjldU
         uUOwMPjdOEJDtozC3RcneUftA/2Ufw5g7rR9qtcZYJSAb9zo2SBB2twrJPgpoLGKITg3
         oKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180933; x=1793785733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        b=tOaJ17xhyNLXZjTs2+DJKFK3QgL70nGbzSa/K9uO45MRHjBtOoTNIIR3kiLmizlz10
         HimIzP1v+aJOvXlU8GVJY01AaZdpgwyYJ9FD0rVQtdUUzUItNXdW2RMaI38Su+NJVdwc
         V4u1FUSmNPOb25i4jtuKPHo/WjYvt1svJ47S+J51mHhDJ+L7fCUsBI4/W4cGFARwfbGu
         eGmUBi69j3lQT9X0ZFRsKQ5TvaOvQt8DNQcQquxXJxDPTiERJwM3DIa8a6vYO5NQDEIV
         qfnIeKdxJZ+WU2S+TznlZy6JuA2M0ZLAd85cJFCBK799VHCMeZ/r+cZhwtV1mBGSN60x
         bNCA==
X-Forwarded-Encrypted: i=1; AKwUvBzJ2lAxP9pDCRVZ+TEsKraPsQTNqsVb9Fq0vC2WiiUt6D41od9KYVjfxDB4WfMQyGfvfRBdCZjvk2CrdsyzoiDx@lists.infradead.org
X-Gm-Message-State: AFq9FYKBcQjc0gRwUYRC1JkhNufTC+0ocoMoLge1d8Oihx9GjtdaHHIt
	ZvOElcdHNdaAx1p53EMHP//zHXtU1BJdOBeEJudFgmYPxDdPkQ8muJJQB2bLRZ8CMq9E61qHIdu
	L6WVN0rCPcYqdMOnxL071YYrDBXkOU5A=
X-Gm-Gg: AYBFou137mkDuYgMs7iE+ZO2X4Mz47lkiUNo03Ix4PXZCUNjg3JTd33YLywaavl1jwu
	GJXXTx0gdaxRJhBX09aWenQKh7Mg/b0cFZAC0+CicUGcDWHXyWF8cULA5+aRhHbpjkVfBjDQZgp
	oTvkECqtpfG8HeyNMb49ouTO779o7WTRSVD6DprVu6NFIYIJbtwSNjqY1/xMpPlgDvY/JN1IDea
	bJXWGqEQqW121M71juJRc5uW5I4fDQkb1CDznrIkoHIPb3UJoDbcx9CrQjklLXIrMJUKg93DkbZ
	vfOJLJBwCOE8c/KSF2Xv9GDT3R/M10PmvLDe2u8ztuwprj64bpc7fXcP0KjXpS6I0Rb7Hh1buCC
	fnE0+Jui/i0pdFkWa5yRSM/+D2isCnOPzEnEA4LEL6KW6RQ8MprV353lcMCBuVtEaGvBC325joM
	HoEvcgkOLBkxhfEGtHT8hLcj1IZHJ+72muaglv5u5/zLvjrMU3xwumhi8NQ78fNJWA7R6aTzRnd
	O8mwEYTMzdW30vgtBqIfGCVxg==
X-Received: by 2002:a17:907:a893:b0:c46:8b51:c17c with SMTP id
 a640c23a62f3a-c49bdf394e6mr156034066b.17.1793180933042; Wed, 28 Oct 2026
 02:48:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
In-Reply-To: <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:48:16 +0200
X-Gm-Features: AclHuK9bqVSr5ebQZT2ja4gGk1wmv0GUJ0T7y7aJfJNVsg1OI_1bv2lVUKDS3Hk
Message-ID: <CAHp75VfJ-L5ELAttN+Fz_Co2E1KHumwLZAEMXFMhRubzgVLqug@mail.gmail.com>
Subject: Re: [PATCH 02/10] string: Switch to __nonnull_args() macro
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
X-CRM114-CacheID: sfid-20261028_024855_457790_F620B42C 
X-CRM114-Status: GOOD (  11.56  )
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
> Replace __attribute__((nonnull)) with __nonnull_args() to
> standardize nonnull attribute usage across the tree and keep the
> attribute's quirks in one place rather than open-coded at every call
> site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

