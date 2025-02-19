Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872D1C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 07:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0ZVQ1Yg5DGbJ5wB18BjpWZFp5JxkdPvBDEOYEmNAZQ=; b=FZGPXJ6Kq7qR13trAudW1+Sg3h
	jbjQwK5hGeXCsu35stHjgQWh1y09mFf3j1Nn4VcZPbF1yoSsCMaYFHHhG/hw8V2w226o09GxhcRH0
	lX4vj/2M2Y/qSEo6dAXi89U2xU1sFVBJ2UJjw6pCaub3720Z84cK5KjCR4KTNgj6xbAUJ3QWyQWfm
	pze3Po4d+sNLLchx+eAlBk/OkwqbwIRtfUIf8G+w94XasqE4I7C7b7jlFNFO4SbukufYWm2VV0dVt
	i6Dca0mrceWLKhjT1CMp4/PGYpVwFk1+Xh+f19IqLsGoCLDiXiwfkLZcKMGk8r0Nt7AMxvOymmwLz
	DerFdkeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkev1-0000000BMA1-2spc;
	Wed, 19 Feb 2025 07:54:55 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tketY-0000000BLsP-1l53
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 07:53:25 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5452ed5b5b2so4576728e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 23:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739951602; x=1740556402; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0ZVQ1Yg5DGbJ5wB18BjpWZFp5JxkdPvBDEOYEmNAZQ=;
        b=aKiCyXZB3boqzet5czld5K7N7Ij+IX3PVD0vciadIB5AKcOUV3R33HHzuliUlJ6pDS
         omrW7na2gpJZKQEtlflVl4d2w4jRAeI2tq7T0Ojz6pgVPtLKcVpwhVyqIlX3Ljlmq6xx
         WqgyGVPKWliOnAT+GGIlHE2bKNOl0NakjZLDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739951602; x=1740556402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0ZVQ1Yg5DGbJ5wB18BjpWZFp5JxkdPvBDEOYEmNAZQ=;
        b=kh8mDVUDM8k8eYlyGxTkK+GS4doK/gcWNZhoURc4NLtowXJsfv1pDNBeiKtelrDZTO
         1tJWP48OwREFuuSOQxaNpuxVfyfTnuT8YCLqaWozxJmSABi1tiVQRo/4emUqmzXTPntB
         aFcwg3UMjJ26aOn/qW01Gvf+GqzO3fLvziRe7DSONbJwe4snJTT5WIgf6M+h8eVb6uwv
         AB/uJh3Y5htKlEeQ4K71ph69/Bwj7P+Bz7PRy6LvGPv5C8ICDsvVnJ7PqhpCZf3Dskjh
         UAhYNM6FG8K2T4wNL3up1lYdobgVSjGAoRs18jkGCggVWgY/MGYxgSvOB+Qexm+MnwbT
         /Row==
X-Forwarded-Encrypted: i=1; AJvYcCVPx4czFVEKllwPruDJtplh54Dsew3eApCj2a0SaA656iP2E0Zw3leJRYVVUXf5ohrP5ZvPgmjTqrrop7fyDQdA@lists.infradead.org
X-Gm-Message-State: AOJu0YwN4VpE69Pgzy1aFglEBvKvPcCF0CIW6k/Gn0hbTglPFnM6ygd/
	P0EgLvTTNfN1QO0NEMh3EKfKVZFXcZYra6VpKjAlZzwB9jn7ZAtOWELCyB54SgHqAX8sFebR8uk
	YVr7HVk/A+XVrRTiF847pgIriLWAlYPGQsu7c
X-Gm-Gg: ASbGncvvObm1ymnNX2r3WcekW0y7RWEfqcJ3YrHKiIAogafb+eyF7PNR6gsWPUr1jfx
	ZoHJxsy8QYDSFIyXU1oL4E7jb4DJBqMFF2ig1oB2b4H7lZJPgQbqcTdpR+hSN6NRiAbkH3Vv1bI
	WuH7xWjuhzFFRH3cXh9jmny7jI
X-Google-Smtp-Source: AGHT+IGy4VRhutR0vRN13zFXFDojHsEJuy46LrrJBV/lkfpvoUaq2PR47QMvQ2pB0zIzS5cf5qZ8oAPqBxANqsj6Ktk=
X-Received: by 2002:a05:6512:ba6:b0:545:22fe:616f with SMTP id
 2adb3069b0e04-5452fe45d87mr6468841e87.24.1739951602616; Tue, 18 Feb 2025
 23:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20250125025145.14405-1-ot_chhao.chang@mediatek.com> <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Feb 2025 15:53:11 +0800
X-Gm-Features: AWEUYZlvGLuYzddD01vTxGm9KhUE8PoFe7dSks8I_T3Q6YOVZu9GJJUxvzhxQB4
Message-ID: <CAGXv+5HLmmNV9WZFjOoJdLQNvEW6-FVdgCDrgv2LCoYUrd2Bsw@mail.gmail.com>
Subject: Re: [RESEND v3 2/2] pinctrl: mediatek: adapt to multi-base design
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <seann.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_235324_473243_84DE0EB8 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Jan 25, 2025 at 10:55=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek=
.com> wrote:
>
> The eint num will obtain the operation address through pins.
> Change the traversal method of irq handle from traversing a set of
> registers to traversing one by one.

The change only covers "eint", so please adjust the patch subject prefix
to "pinctrl: mediatek: eint: ...".

> Change-Id: I3962b78042d32501a73153201cddf52c6b62a695

Please remove the Change-Id when posting the patch.

ChenYu

