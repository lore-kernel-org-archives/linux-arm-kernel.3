Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022E2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXkjt9YB46wQ7fKSEspeGwCyc8yw9KfMpYOU1ApO+HU=; b=25GwyoZCtmNXcjBdessDqUz8jA
	lzJH8XjT2CNBhdzoY1uh1myxMLwwiRRLksDFQsePnW0rbkMvnHdrrWakNFNCGApSOwTt82nRYnPni
	zbUahKI56ubUKp2bXjWRYkNwUlQEFu0nnOWkwKpQ2WB854Vl2rGsiV7dOlQUPBUFnaIrExwZm7L9L
	z7jbk/Gpz2CiRbdYIhVw6cE6/wGf3nwAq8TfoEy3nxcpzkID7jBDanzAuxI99otgwBLesU7wSsw2D
	fFOn7OovY6bKfL22mou75AQzu9Z0EmSberuj0h8wIRhTa7IVjy6sfn9vcvU1LpzhJPvb8smkxVN0F
	52Iod9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uefO6-00000005qa4-315i;
	Wed, 23 Jul 2025 19:44:26 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uefLf-00000005qCY-0H0N;
	Wed, 23 Jul 2025 19:41:56 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b271f3ae786so244397a12.3;
        Wed, 23 Jul 2025 12:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1753299714; x=1753904514; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXkjt9YB46wQ7fKSEspeGwCyc8yw9KfMpYOU1ApO+HU=;
        b=UUv+9iEXMv/+93OfxfpvsMnZtFAAf4lkbEpUC9zGsCWPvUwmMdQxvQ8IknPOgTByir
         TsfCJw1Nc8O4W93Cp7G+HOUm/x7QmNsvyJiw9j174FCMQkkRyFtS9pbFMhhSSmhFgURq
         +Yuxw+pU3zm8BpQntE9zfDiR5gb5hdQ81vrwYejW+oXw/Vs+4jJUWlUm4mjmmRrkKwP0
         in093u+54d+Whdms2AoXYhHyTyrY3GAZZ6B/LjZffiSziwEtKHMfrON5SxbIKAP1HPAg
         dVnzpVnYDwf75xBIOTA4mlL2iLVhJRa/aOeE0oxNvrqRabLLN+fPIDyKXGy70nWSLtmn
         sPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753299714; x=1753904514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXkjt9YB46wQ7fKSEspeGwCyc8yw9KfMpYOU1ApO+HU=;
        b=xEvf8dEq/HhAW773bjcGgC56rpx+4CjgM6UfKJPBYcnG4dtYTQpJt33kd2WmeSozdr
         ZcGfrEsLBsVLMo/loBiicyZvzywbZHR298SOL6/vuGZT2TYksZOS2RyO+jO94sQ59Kv7
         2qMs2nQpJpRN9UXSWlQRCJwhm9u9U4vdgMs2PNJG8TjKreGo0nwMZKQlkWFsOcgyCmyS
         xBemSf0tx7JBQ+EP/o/M//Z2Lx8H6up/cG6zT4Ny4AFwxgiSltxVCvKoRevBkFIvJMf7
         GI0ZRxKKlm3Jrj+P1z5Ge6KGD0iHgJAgn/GA+1I5kcZcz9qaHUv3I7wYwtqK73Zqso0G
         eOkw==
X-Forwarded-Encrypted: i=1; AJvYcCVqUbOzGm1DzHW60/XYl5ImhvcPsrYTtq/fovB/dE6n5WxrKwgy+YoREqETcNY8ZBJel7jkSxYWzeV5GZF9GbpomQ==@lists.infradead.org, AJvYcCXjQ9W5fpFJMu6tyNU0c0v6rDqCwsmtrjrHAZEEKfdIRiXkjXh8Xbxw8SPc9VxnFH8RhEh6onfQRJ9Yewm9@lists.infradead.org
X-Gm-Message-State: AOJu0YyFcsHhBlNm+ugDNy9CG/tl1yzdmNyO/ck22+ocPqeqtWhgv53i
	7O5Fh6qiB3fWg/pY1ZFK0J9jlXKk5DyupXKBxD7ESMzpepbXA6+bUxAhVhPPo9Eu6hrwCCnO+HT
	Rl/jQVOgGwdYfkhBiyeha1DmEgvU9auY=
X-Gm-Gg: ASbGncstm4xQueRgGBNVDP1TMC7g4YnlA8HA+udUMxXbxtK42MExGjjSIsfUES6wTkj
	B2+EBwEfEC/bb42YY1jxeZaV/hFw++wqdi0LrWnW2Q1oNF/ZeOswG6vjjEGYnmlYKuUlE0RMobH
	L70DEiWNTuR0MY6t3R//s41uQ9OSw3oqEhIPm51Cny994Wly8Hkk26OfcuPdndyHBsRpYYedKrA
	7TptpIKBRjUgYB77mJyjx3SqmaAkmH2ZUH0aoTc
X-Google-Smtp-Source: AGHT+IGWeJEGKh+77TLxgOqUFZ6T7wS6eJlh3839BVCy1uQyeIhZdVq4g4jKDXGiGQwgtBSfZKGUpxHiJcD0En+3NEg=
X-Received: by 2002:a17:902:e349:b0:23f:9a4d:2762 with SMTP id
 d9443c01a7336-23f9a4d291fmr33727935ad.31.1753299713947; Wed, 23 Jul 2025
 12:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
 <CAFBinCCmsw=XGPtrk1XbphOu=OwhxmAiZ+2h4x_M-_f64Vo-7A@mail.gmail.com> <8e5e1d09-0706-42b3-8ae1-00a0e2f5139a@gmail.com>
In-Reply-To: <8e5e1d09-0706-42b3-8ae1-00a0e2f5139a@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 23 Jul 2025 21:41:43 +0200
X-Gm-Features: Ac12FXxIbHkGKJlc4jEtw4fHm14nx983sxWIVJ-SRO-9-6MULnML1Fz74CS-trI
Message-ID: <CAFBinCBu4Z_HZuhPChsyraStK=RSAKH4vtNLCoFWAWUjm5n6ig@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML docs
To: Sanjay Suthar <sanjaysuthar661996@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-iio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	ribalda@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_124155_108024_A3A4542C 
X-CRM114-Status: GOOD (  23.29  )
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

On Wed, Jul 23, 2025 at 6:30=E2=80=AFPM Sanjay Suthar
<sanjaysuthar661996@gmail.com> wrote:
>
> On 23/07/25 01:08, Martin Blumenstingl wrote:
>
> > On Tue, Jul 22, 2025 at 7:06=E2=80=AFPM Sanjay Suthar
> > <sanjaysuthar661996@gmail.com> wrote:
> >> Fix minor grammatical issues by removing duplicated "is" in two device=
tree
> >> binding documents:
> >>
> >> - net/amlogic,meson-dwmac.yaml
> >> - iio/dac/ti,dac7612.yaml
> >>
> >> Signed-off-by: Sanjay Suthar <sanjaysuthar661996@gmail.com>
> > Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >
> > Thank you for spotting and fixing this!
> >
> > To my knowledge nobody else is currently working on amlogic,meson-dwmac=
 changes.
> > Meaning: with an ACK from the netdev or iio maintainers this patch can
> > go through any tree (iio, netdev, devicetree).
> >
> >
> > Best regards,
> > Martin
>
> Thanks for reviewing the patch. So you mentioned, now the patch can go
> through any of above mentioned tree, Is there any Action item left on my
> end related to this patch? Also will I be notified about when the patch
> will be approved and merged by the respective owner?
Apart from waiting a few days there's nothing to be done on your end.
Both the netdev and iio maintainers are fairly quick to review
patches, but they have to review a large volume. So give them some
time.

A little bit of background in case it helps understand things better.
In my opinion this patch can go through three trees, since these areas
are involved (in no particular order):
- netdev
- iio
- devicetree

If one maintainer takes a patch that somehow touches another
maintainer's area what typically happens is that the maintainers give
their Acked-by and agree on the tree through which the patch will land
in mainline (=3D Linux Torvalds' tree).
When the patch is picked up there's typically a mail, informing you
about the tree that it has been applied to.

In case you don't hear anything after a few days (my rule of thumb is
a week, during the merge window it can take longer though - but we're
not there yet) then please send a short gentle reminder that you're
still waiting for a reply.


Best regards,
Martin

