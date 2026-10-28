Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7346606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KCZF3ruD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfMfXScM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=; b=KCZF3ruDHgg66r
	U1aC2WC0f/IuYmkpe4jZQk1FLQ/I4fp6dYJRJm73U/rRbmKpEcZGbVPke8jhYwTCfEYn/0ckdGchV
	6hNHBq86+XsMDQOVIKG828i20Muh6WN9nkCAXXbzWkuYt2+zl1KcSQw4O51aq2i0r2xrNb/WTJaFs
	TWWkLqwTE/o0m0zgQtdLMz1VcgHm0Hp4WJ5QTw2GIb4opV06NQSWv+gBHj2OMemEcdRan65CE4tl6
	YnS+D2vrQmSnj6jjjFJvhi1iugJfU+QVMyQfqQfM6fz/S3wwA+8qaZKNS/l0Muwhx88f4AwjafKWc
	HY9ugpeNMxybzNFCYMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0GL-00000006hOD-1teI;
	Wed, 28 Oct 2026 09:48:05 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0GJ-00000006hNO-1tRu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:48:04 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso3102729a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180881; cv=none;
        d=google.com; s=arc-20260327;
        b=iD7gLhU0zxpeCIFhqVu77Orb95T/QAXn2kjf3Zk/xrvUueOnsLmMd7Tro8JljiSHdp
         VeMvGvwVSd2tAYgLoWP0ZCi720DREV/Jvbbw8TkBVTVFTuer+wD0w7zX6hhgyzO0gkAe
         oqrah6jSvQRMxj2B5ATpwjL21S2tJvIEHnTnYUXni/HHICmbpxjy2Cl+L1JO7Tl5HlYY
         sP9M4Opdy7mrRlCA2TN8/X/lY5H5+R0msGQ0qg6+8pwL2ti1icsbhrSazdsLnCiB6lYS
         8bYUDrbHX2TWqsNp1MXJ54WNDWPHqZxEULztscgmkBKw5/9NsVI8htuk7+N9lQm8YAqw
         PKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        fh=pzOi/HmYK85VGH6eXKiGgtd5Pj4Pk/TVuz5bf7z0zH8=;
        b=YwuTZDNsW+kjkdjtboyGIe0nIM4qfZ9NlVAzO13PENyiyFG4FUViOz+M0rrnECVW5F
         xWVrjR3dtQIzQZeKtVbAiKS87iTok9O87okT4xFKvvvaMzdG0eb1pUmu/XT6Ljurtl8O
         05EYn/i20w7H+AKoHtYuxr21PZNWSjCfDUgSlgN0c47FNDMnt2LnoXtjywyAPi2Umu1o
         g3e815/Wihzxk4/EzqXWCiKiOOBiyibCTMrViYsTU2inHwiRiQM4C97bpom7FDLrIGJ1
         VI89SZAXRswLsr3dFFtMpfv1XGQwi8bDp6Rre92aflc3lHubKoBRN+15s6fDGMdXdJCH
         3b/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180881; x=1793785681; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        b=FfMfXScM88nYrMdnUuJM4Ob6XorhOBLzt3Vrn57Rzvd1Q5thmR1vj/F8dg4Vpo7cQ4
         N7/ZfIMMdeAlF9eUJ65ZMyAnE42jtJ8/5/Smu+c37FdAX+Lwv6DF8Er5rqv50HzbXouF
         yCjJ0uY1YnHlMdcftTgT4hFzmmot0UAI+wAeAiKXoXg9mhDvH08//s5/gljG0WSklg74
         5AMPr1Foyuhi8bP4qap7FryOAdYGn0csqCOedgd97bS2Po02S7lv9Vf/UUMeYqnjvZFB
         KDWBGjjZbwH5I2MeLZ9yChe5LIf+zWEdemuczPKEpYBKtc5tiSWAIPi5n6bgesi8rrN5
         Ob5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180881; x=1793785681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        b=KR4BI9Sa59hZUSh54agsYiXXRjUG/rtVd/HMShbuoADG0zcRNSheyYqpbDat5Hhnuk
         n2gs6uy0OA1u9TpJ8GZMET7iVXeOBqZ8ebdBNkaDaUotcsjm5tAaNTckc6jJxAbS7621
         XkoJ+gp6hrog4uPHQISPVoqSou50fYpoIqP19XgMbIzvE16MpGdM8Lx2bPv2iBM0S4GX
         bZNDvwBm4u7yzN2SUL/DYfEERgAmplGketZUlrwONOPXCnQf9uykKr4ffLnxn6WyXmGa
         /4RunG0KZIcgi9h3L7avWO7CCmrI3bHdWghujzE/E9S338fTZQT8b4GSWCMetKgq61zr
         5ldA==
X-Forwarded-Encrypted: i=1; AKwUvByi2RzPnhBB4LCUgzbnBqnTrAxfx8eQBwyEEaCV0dvmx8FwircS2cwxRnJSl+2Q9ncx+R+dTY+HeRByFavZACFa@lists.infradead.org
X-Gm-Message-State: AFq9FYIDYvvbvs8SQk2Z/xgGBoGZq3c4m/e7nlDPiEKae7UP0So+iF+5
	M6PSgLNaWBPcuwVsukfxbfXMqzwFGEDwKrBfl6eph6a12/dLttvstEaeXmhEOKvcMsVfNkYzu/M
	waDSHarkQJzjL87GEp6tFuHk/iEift7o=
X-Gm-Gg: AYBFou22/nmxBx49JM+PwCGRGoDNvxOB5qycNaNTf9t2ONwcQbWeCxgvPdtHW0uLtpt
	WKxz7g1EchralMcfqZlPdkIdPmfMdIGWlR6MMIUfhR+a+oyOOChVpOJOPJmw+1hl5TD3CvT4x+j
	BPHIfSwMgZ8wckmpzoCbQ1batpreiKOvCqNyA1qzdNutO85+Z1jIIeQH8zc4j3BVYP3kGg9xuay
	vHqffWv+vNwTe6YrZ70rCQ8YgwEWVhWxeDsSziEhpLduOvCNqBJwDOYKEEfa9IYeCz22NPj0Lon
	zye0mQ3Y4JsTSKA6/JGQb2WO6oQ/XHg+eSvMuxTpu7rF675YD18rl3HgIiSJsKOxRfPnd3xDrbn
	UgmTqRaShlZMlLTDcXB2Z57zZ8uVUaIgydtw8VZqbS2RX0BQsacfd6g6uQa7kMQjfbyJ8CQK4TM
	wjKyAMVyHl63VLUi5+KKtUkprmEH+vMeRyBHj1ErlhUjtua4DgbxXB67JjYF55zQGTfbqeUlzfP
	ELeoCWRG4U/ZBgCoDu9382RIw==
X-Received: by 2002:a17:907:86a5:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c49c6357d34mr69949566b.18.1793180881026; Wed, 28 Oct 2026
 02:48:01 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
In-Reply-To: <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:47:24 +0200
X-Gm-Features: AclHuK-8N84O0Y9k-BLOPVpeywTja7886uZe3ugxN4eM-96m__IvC7bzZgS0MkU
Message-ID: <CAHp75Vedr5J1WJMrAkBjRSLKA_zf1kt3GD6UhjzLcy9vowxnaA@mail.gmail.com>
Subject: Re: [PATCH 03/10] lib/list_sort: Switch to __nonnull_args() macro
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
X-CRM114-CacheID: sfid-20261028_024803_503586_592C34E5 
X-CRM114-Status: GOOD (  12.82  )
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
>
> Add spaces after the commas in the __nonnull_args() argument list to
> follow the usual coding style (according to checkpatch).

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

