Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED70606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0zXyU8jP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nWxd1vM0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfF9xjfE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=; b=0zXyU8jPtP4ER1Zv1A9QQgjHY2
	Nrn1HTA9wqFtGmxp4xWUmhxqdvwM2BYRnDlMwIyWrPW42yCc7OGXsvfy8ATt1EU7IYiTQB8xDQ07A
	OIxb9Zs1usBWd5vhj/8Aq5rtOyAvr6hQR2/EpkXdBzS8XD5Lx+sgjRLKlj/x4eUpwqLNFtHdKgmka
	KgUjD2F4S+N/w31gApEFVjeEGw1ZuQ2iZvFZiUDFyMGbyAAftWbAoagSzDtgEYIuy9fYlbmeCmWVQ
	vme4IOjnNVSmw/YBH7eZLwA/YABTCYxNLeSLlKi3gf3ESq0wTNjTp/f2NRqrn2v9giPe0F01IzbvA
	QVnmSyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtzg-00000008LdL-3pzw;
	Thu, 05 Nov 2026 09:42:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtzf-00000008LcT-1iyl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 09:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=; b=nWxd1vM0xP+3QjHOHDvaScLrGs
	diSvFrldx8usC+XDyBrolUfLWIjATwhbbkNTRrUt4O3n6htLLzAfIgQdpVBxs1LRnOgiAGUA6GXXq
	BfHoXLqN4RpFuxMwhsG2yIejnIZQRRQed7bt9Up9/tJsmKqol/pr9zDHk7T6GsZ9/uP1psPDJqZzv
	mqUdlVy2EjL9NVEx/Yb6DJDxvTcUf0zuEoAfCbrI0UAMhfiC9AMyU7cG6FOwT3lXamaR6fa6xdUVo
	4vU7N+47MoHM9RISGMZRufIWZ26NuHcp00byKLP3UiCc3h89INXJewF0l4PKPpQcjcFmfdgbn/taP
	WusiKkVw==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtzc-00000002lq3-3Frq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:42:50 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so1346922a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793871766; cv=none;
        d=google.com; s=arc-20260327;
        b=jTOaqYp20aQlTT7abVpdk4zM/wPnwzk50uZmyRMfACUjLimHEr1lJLWpEn8PSqsWEc
         fUiq1/1nsxeoTToVxaU15tZqt0sgmTwFSD3VGe9kBK1L/3NURLYbyZGm6bGKkhi5Vb/z
         laJVx4qOdrNvST9w/gSpSrB7Q40UnJgnPECZnkHhMGfJfs9hfU/Dp/yktA3Oujgd3dQR
         GdtkJ+sCyf2vu1H2yqq3fID96ND8JMfYj7pN86GI6OaULOETV8ULbhQO4FdrmIOmZLhG
         a8w9DOOrF6kmQ2AlE3GE1GO3RsvM2p8xj/lhNem0FB+DvqXajWxfEDWH+gsKDYWU0hjy
         ptHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        fh=RJrR7JWwoksCQeiRDCNgsXSHsGqb1eAXDIvIMel9cHw=;
        b=rP4cBWG57OugEaqZ7w9mtwI/VAHFn0yc8EEGHgJqEKdrUBtlJvaekNinlgkoAUi64x
         g9bWiZhRWza8HvhxmCv1wX5Jenc8nXMF3COXarQlZUazXnOwhkJ3d1KwmkQLPBgdteei
         FyF4f8QzrDEunL0Ab6AqudSdXJBFosMJ/R2XNvU7h0UBtSgcw3A+SRAICBju9pdR0Pb2
         9vHfxks8x73K3mBIgrzuqSGW8bHBmyfwP+ZhwhgmGqmJbg+1W+drCFE3zRsUXI603OZk
         rSnrxkGPQoCP09hRTXTNbwjJqLlA4GuHQ+QESqsEwE6ynI3dlciZe2TGWUop8H0QW8a6
         8zYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871766; x=1794476566; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=wfF9xjfEjVR/PBstarnxcLN7CZWuhgCKaMyzRwTSNnjduNGaAh+8S/dk1H3EkTaDpO
         cbfKGRJ+Pt6YFbf0EGwGwWy4v/Beb0ySuGW4j7Ntlol5NMI5+g3h/FT6ia9xJnR7iWFP
         ttaYCtGuElmIOwF880pBXvyuvjK9eR+8BR0p+Sz/d4QaMSdyhg3Bbm73rjmJP8hOky+i
         2yAp52NnZL5GQeu35WeO7MYQg+pi840B7ILjaBb5JGtJoBrl6velQdH5oOGPT4QY1CFl
         N34o4/aQUtPeby4Mn4vtxILKyKv+Hbj4qZSuHmZMcBhzk76zLTVdLJkgGR9cii6AOSZ2
         9etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871766; x=1794476566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=DrEdVrC2pbII8r+gDd4YZIB3sI5PCb1KOBga0ej77sBanTMZKu2Ra1ppmRJ9qnJ591
         ls3iGC4sPxFPvjWHXmToepij/3uyjYqwKxTdz1sCYyDu6ykYEBbTodrnNd+8pHpecFTi
         w3uAF4P7AAjxHW9W8ybOwW+cXLH6EYjHfWQAtzAFQZo0MH+39d6dxij4x0voN3+VHR8T
         yQTFUHIwlhwHSKJOg8OEBP3BiAn4qBMKBrk8jjYYsU+RfKol7lwyBvYMFs48QmiLUcwG
         +o7WM9R+Am8ISHb4eaLHV9viLD4x7YCzM/oYPn72gD0lG2JHy7TLKImy16pSdZcMh0yH
         0nrw==
X-Forwarded-Encrypted: i=1; AKwUvBydH9Mglio87GcWgfzcvjF6DufbHi/GTW7W92GRG7C6keHjWowJnwYFYHnMuywMCejXWp/h8QLWURskppQNV8c9@lists.infradead.org
X-Gm-Message-State: APuU4Z+RPB66xN9DdPiOxyoRhUmW579Use0eX4HrAzHo2tmdrYMB8NQs
	eUQRoPXkyCiPUdJxLnRv37Z1AQLet7nAtP7ARbjAEDCHCYtoI8J61IqxZlvvR9Q0zG/HddEbZjP
	w5w7iAtiSBpglxp1Kk+lHW1ajnrvj8dQ=
X-Gm-Gg: AYBFou3lySDandlyyXaLvZKABoTWDFy/dLoWiq8d/HKXrZ1ohW1Cr+g94eIRh9ivVhS
	BmiENfSq/+SAezrOBR0Xy2Z9+8eqhzoTMUvLjOh0p5+RuoEmPRoXqFCS9PIEYGO72SmNH0QUWIV
	VcITRRIYujDQFunSs8YhsahukFpL5HfZlG9OrsZOqXpYMD1pYweQxh6+qwwO4+pIYfVPTGdxyCa
	jSZj+wzXpUOvYhVafDC1/zs3IC8nK5mZnEv0UZV4+HHQ7RdMUXJFvQXhkOSCjxnJduvsVQrqVC4
	OQZQJmJgtgK52PSK3Zf3/N0sFu2zhewRZtDYdT47IRF6aJONK5D54Tz1/fOSYmRegH5tzvi5nf+
	+MXJYD3eOdBp7HkyfWShADYW2iy3/M1kVQ8c=
X-Received: by 2002:aa7:c2c9:0:b0:6aa:a33a:2762 with SMTP id
 4fb4d7f45d1cf-6b4d3377817mr10254827a12.2.1793871766289; Thu, 05 Nov 2026
 01:42:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261021105109.199886-5-l.scorcia@gmail.com>
 <179310028255.2808517.13933580516140278450@kernel.org>
In-Reply-To: <179310028255.2808517.13933580516140278450@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 5 Nov 2026 10:42:35 +0100
X-Gm-Features: AclHuK8keS0URREeVHi2bDcMrIMTrg9GDE11ruNkJWdKZdjkdmjRgehGKxzojT4
Message-ID: <CAORyz2Lv9fBrKZOQ7kFBE+u-nJ-dFpRm_3G0JTS=bHtEL6n_GQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/9] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_094248_735477_E0AAAD81 
X-CRM114-Status: GOOD (  10.65  )
X-Spam-Score: 0.8 (/)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > +     MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0,
>
> Nit: This is non-blocking, but if you have to respin, please use the
> 100-char limit to keep these on single lines where possible. Same for
> all the others below.

Ack. I will rebase this patch over current 7.4-rc1, adjust the line
width and send it independently of the addition of mt6392.
Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

