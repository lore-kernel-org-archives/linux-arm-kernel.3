Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4CD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rc5pRJLX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irPFdmuJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=; b=rc5pRJLXzLryLd
	ELseNQizKwB48kihLJQnwwJQe8bUvgq7XynWc2yxSlPZ4NC12jtfX+NMsC79UDAyAZmL67OrMnGHZ
	r2lFyjYs4G2FvD6S7KFNSudVxEukExKOmmP/3PjgKYvKY9neI0ChDm26jfOCd+KYBncUmMVtm/9tW
	yQnKkV00mSM43bt0v8ZAXsVHt7guJ+ELgXx1oOxyRROYxf/Of99NDAfNd+PQggHaSi7ayQxezDeAx
	105118RadOleccmTfCZwBKXQTg1QHiervWM1ejQ5c/ZXysWKyQ6rnYCxgcL+VXrB3yh8zARC1x4c+
	H08h8j+XiJI69Z+SSoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiB3-0000000B94i-30Ck;
	Fri, 30 Oct 2026 08:41:33 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiB0-0000000B94F-03nj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:41:31 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1329585137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 01:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793349687; cv=none;
        d=google.com; s=arc-20260327;
        b=Cdc8deotGUmh9oio3M3b3b7+04NgqAtgaBbS0sh8gOa3B8fUcJAOBGKPW+s/Cfwcg8
         uyBTvVbAYzOonjPUZa/7iWTFv183Md6odYdg8XegezKND6Bqc2xoyPbdnQbpHThWJCs1
         XjDe4HlWqOkTXeQ5KVNIlM+nhK8u/QAtU2kaPUFi0+Q1vN2uUFHHVYcU2Pww2WHkeDa0
         1k+SNOUNdEpeHYf9uQG5qtmocEkT/o42zNGSp/hYikkUU+ySFaujqAQa/kJDDIBa8d23
         T5myvux0His0qvMBEYQhkHC5VVYctD+VlX3qqrhA8d93L1fiPm8baTPJ555xcsmKuqwJ
         yDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
        fh=/0tXVECvIUb8HtxXFs2/kwIDCnXl3YxMnDB/AP9Zzxo=;
        b=acHES+rczuZhwlhaX6vF11THT3E4jSnGgkEBbptDwxBykhonQqbdthbqCBPVPxeJGD
         vAIu5HwcOqof/7/E/mKlXXBrgQL65rPSzKWuv2eFvIjVIausSNhKOH2Trb9R6Aal2uRh
         qPq+hpcB/HkqQosd9mpUbCFiO+N3XA6SZuLPum0/FbY/Dpiq003Q3aTR9apWG+JyZXn0
         r/KQNJOPI1htbthihbxwnzAK72Xw6IAOOSszfZuGY5pB4f4mDYFDzkk+nLw2XR4tN2Ll
         +NBqI9mWSa04/6zop6Llorr7cGoA3G086O2M3dbTNmIAzYyzs++T7n/K1ylkbIwFM3Yw
         oreA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793349687; x=1793954487; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
        b=irPFdmuJwx5Ei1mxeX5BKCTIEaM3yQviqr/JHa5+nDmbILq70xu97eC+veB6ceB4Eg
         76FKGlxEVTnlw756GOXijee1f2kje39g69xSjQp6JrZ0zXo31Mu5v2bi3yBB3NszzKQB
         2GQHPsQvVo0PpNUb7Y2uaCK/wlJMhX/BCgxYP8h8q7xK+RDoHJDMCSpG3FIPXCVWY8dp
         Yicx0i9coXOSzJq/E88F9ru3GNQwrtd07hFVgWgXI1KxaIpmngbHVX9vLQEDOXKRTPDQ
         CU5+ZWPtEnNgQAXNm7JpH+qmrErhHHD+fnNw90i/FgyNEPBzEnbPEFL38qc9R7yCgICa
         r/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349687; x=1793954487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
        b=DYmPFpA6FmYcVjx5IBDwt5Ey+CRlj/BoKHhtBGSuai/KYaBfI2NDG9e0ts1tulC+XU
         a47p43/Rl6SeBOMCkdjLB/1Z3Jw4iHgKiKV548CLFso/NwzqiZVAkvfy/c7ySjUytta2
         GKex7qJDKo0D35nFM44Fko9Do1tmOjhexF3CjbjUXgUbC2y8IoqG7Zx3I1gJGonRT3Qr
         lyTaGOOsvuBBmlD8ia0aYbwGmKijP7cwrKF3tvPB+nUZt17Nnqm1YbY6qv2NWa/0H9p1
         WFmsL5hK9SEmPBEcoz+KCWjLOuGvGypXvY2RnWkQNTfMcAO13fPemUawMRsx+aewLlED
         9ALQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWWxd1+eb6O87F0iz8UKMm3Q5+XzdloM76iuVazeAoin0wUzeug4i0ImX769Wj+nuYEVvlTq9IDXlWAlk1lHLl@lists.infradead.org
X-Gm-Message-State: AFq9FYKTiDzzRqtPcENv1dDlftc68mONa40m1t1NDyLtGpvO1XKpXfzb
	yJ4Yh1K5eaM3N3NtgdA/ykH7nqXRCd/NZLIaoCEY66dErDzOOFqK9A8rzwJz+yij1LEVPuigr5t
	S98xHUcNvg6IHIo+of87zPc3LrYoGsQo=
X-Gm-Gg: AYBFou0TJo6msXwnFYEswOO7xLiYvBaw5CkqcpTE3Qox8KedXtikILGXv8+ImcdqBtW
	q2dBuBbQPlfs9NOILDGbVDBhAp/AQYMD+m1qg38o/rRjEeTkDDBDU8NnORxFC6Ro71socfzQ83l
	KkKNJgxP273wQ+EnF2I/JwYY8LY102Twp1RfmBmjxpuKucl1H3eJLuSvcy/d3FRZddtFbnd7pz0
	M3VeU0X8mYBXC6PW0Tuzpkoy7XT50IXfh/kTMVpnXkvJe8jkato43bD7U+VJMXv/PgMhX6h2LvM
	ZLbQa2gX9WKVMI44mBOpvyo7nLMFvR6TE3cmIR+LBcfLybhpNvc9D9JvSsB09QIWpmrD/nj4Z62
	1l5pVK68Vi8AkBYtYhhtQ/0OPcoFMTkUatZAZDZXXAEx+cCl4wQ7YghFGAFhFX4bNrMwYskY=
X-Received: by 2002:a05:6102:370d:b0:7cb:cfcf:3d01 with SMTP id
 ada2fe7eead31-7d05432ac0amr1782183137.33.1793349687565; Fri, 30 Oct 2026
 01:41:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
 <20261029-anacapa-devlop-phase-devicetree-v10-5-26ee3cf9d9d0@gmail.com> <c78efbed-e91b-484c-b2a8-4e44383bbc30@kernel.org>
In-Reply-To: <c78efbed-e91b-484c-b2a8-4e44383bbc30@kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 30 Oct 2026 16:41:16 +0800
X-Gm-Features: AclHuK9XCUvHE6twaUxwd5Nq_zSeUGonn6zfgdlBk1GcUoScVQ6GTN_l7KvPN_Y
Message-ID: <CAPBH0A96nFFqv4a0--OD=67w=uNkiX5qWb1aQFF9=kGVsUijRQ@mail.gmail.com>
Subject: Re: [PATCH v10 05/16] ARM: dts: aspeed: anacapa: Add eeprom device
 node for NFC adaptor board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com, 
	Carl Lee <carl.lee@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_014130_065930_0B79B4B8 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8829=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:43=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 29/10/2026 14:38, Colin Huang wrote:
> > From: Carl Lee <carl.lee@amd.com>
> >
> > Add eeprom device node for NFC adaptor board FRU.
> >
> > Signed-off-by: Carl Lee <carl.lee@amd.com>
>
> DCO mismatch / missing SoB. Please read submitting patches document for
> further explanation.
>

https://github.com/torvalds/linux/blob/master/Documentation/process/submitt=
ing-patches.rst#sign-your-work---the-developers-certificate-of-origin

Thanks. Krzysztof
This means I need to add my Signed-off-by to each patch, right ?

Best regards,
Colin

> Best regards,
> Krzysztof

