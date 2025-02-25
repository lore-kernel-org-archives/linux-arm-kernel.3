Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C6C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1TWnKYSjWgGvb3cyxt3TX5DamTHuovBzjkuSknBSeU=; b=tgJcVHSf5Hptf7YyGnivjy+3vm
	DrCridhwYIPzAZ/WlXnTk+XoDHEclsYGl3G+UyMpkO+yQ3bZB1eui1+VAEQg5ekpJ0Yqna90N4KnP
	Ogt4898HCHcQICfIUEymTLaChFNoaiPvaEE6XHN2TDAu9Oljn/j9klH3O/8Vwe4j0rMfdJZw3D2VQ
	Ih3QzBm8ZttCftFgd2xCVm37gSFfLH4gAiU0viMlrZT/25hVFtrmyxNPX0miBpFv0Dvq2GkzQVKo0
	12wqe8CmUrJ9Ip9QzYO7TNrZV2BenQ9YonVRbJDonKaPbF1FHGiSIG8FZVHr8MtKiF7Xg+LMek54G
	5t4tPRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtwB-0000000HC0D-32SC;
	Tue, 25 Feb 2025 12:21:23 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtG9-0000000H3e3-3Wp0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 11:37:59 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e461015fbd4so4028010276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 03:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740483476; x=1741088276; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n1TWnKYSjWgGvb3cyxt3TX5DamTHuovBzjkuSknBSeU=;
        b=mibUaqxObFwfb29swpgTuHOS3uIPOvosJncq8fQkSfBwt9zv6MS72q62vjRwkJmFqH
         zlFkoL5yvaZuBkwiAc+joKeMKJ5yFmv9LMMjxzrdALT42qruEAWtNby8Hu5ox4/lQjBT
         f/in2lEvIg4OgHRUcEbwRDEKfKZSVPutllkXCOjaYZw6bu+9YMR+e8IVHp1id9H61b1O
         ePsl3BY2+I+CVv7/D+ODtPOrF0mGD753GltJjcHVpc4JNRyuUxqX3F/7cvuXL3HtScVI
         1MVUBFNjKzFFxKGq5XoKq53qC654zd1UCAGdkuC2n0KRT29MygOqp8pdkLFK0ogrUirN
         wEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483476; x=1741088276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1TWnKYSjWgGvb3cyxt3TX5DamTHuovBzjkuSknBSeU=;
        b=AfB+ljQGgin/tHZ3Qftlok/xqdAaWdE5muhJZmVDjcd0V+WBoQaO9Z/sz9hk2okawc
         fXqMT3YrzviJuXYfCr0GgOxadz18tT8O6h12QdzplppzaF/VHtEUHCEc8AtTgcOffpsj
         qG/msDkt/K+0tiOqr7tZJzmwdKPXuMAU4uVU8lhvpIR0g78aOV46wMEdRf8zrbtcccVn
         TV3xaXs4XtZzToyjt8kFOJijHsRzJxnVd1eIFO7LAnRq/BbFCfwOt4neC46KXvsXiqMC
         Hg1O3Psx8RblYGoTw8YwxlES+VOLdjoFE1vwWGfxvVoFn0NEyHedOPFPOB8qj2Hd12/B
         5Peg==
X-Forwarded-Encrypted: i=1; AJvYcCXpoi47HCkXfQ5E9XSThA6QLNcRuEAmXtI4e6Xrw/ewVOTx3ISaGXelfqZSO/vDypRi1RS1sZ5Vo9Ih7eihMbbV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4OP+rs/YkLZQcHEX/tA8JLYmt6g3VE5kjwkTujhJw4DTcVb4s
	B/phh1mRpedQ2xs/8xohCLy1urj7y9JihzrW66sIwWIliD9iUoVB0HlWcrO1uOeTzOqqplWf155
	0/Qp+0DvZxk/v42L+MxvK/I5rDpQ22aBhGwObQg==
X-Gm-Gg: ASbGncsWImZoVOTOccob9tfNI9yj/QAol5PIUxXrWhdS4esK2gtukiKLmWCnW4yT2rg
	tAA2HAmvT5LwzCEkc9WJpVdJC2WOOFLqtVERNWkbRX80tgJtm1aTpMAhQ7O/8zXrx8qeAs58zjg
	U42n86sXnfQw8sBnD2dbKklfEn40KNJaq/KZNMKxo=
X-Google-Smtp-Source: AGHT+IFoRV0tABvVleGcPGFjITHVSAozbUIV7vt/JXOPnNAtmYOOQYQ8LJ70dKpeCX04ppbU+mmusjSHjBwHx6qf6uI=
X-Received: by 2002:a05:6902:18cd:b0:e5d:fccc:7907 with SMTP id
 3f1490d57ef6-e607a4e3c9bmr1939202276.14.1740483476663; Tue, 25 Feb 2025
 03:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com> <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
In-Reply-To: <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Feb 2025 13:37:45 +0200
X-Gm-Features: AQ5f1Jq_8vz2X92aaDmmCRK3QuSACEM5CmHNBFF9CumkaBecyk4PuPviBAdIWp0
Message-ID: <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display controller.
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alyssa Ross <hi@alyssa.is>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_033757_880237_ACD94897 
X-CRM114-Status: GOOD (  14.09  )
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

On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> > This patch series adds support for a secondary display controller
> > present on Apple M1/M2 chips and used to drive the display of the
> > "touchbar" touch panel present on those.
> >
> >
>
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
>
> [3/5] drm: panel: Add a panel driver for the Summit display
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4

Without the bindings?!

-- 
With best wishes
Dmitry

