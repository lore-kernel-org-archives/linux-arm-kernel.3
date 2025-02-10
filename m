Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8548EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dzyKtWqZnepXYQlMsqs3T0zFLasKzwLYo+Yn/dRQyU=; b=EA+JVPT/oui29Axkh/k/ZYT6Dh
	Mnd9YuIGbFj5QFT1Y9Ey1Obrkgj+PbcaJzyZVi3dBJ+ogH0Aszhnmu7L/ZjjSDMlc9FWauobnT+Oi
	bKAOHt2wRL7INkBrwc+LfwfMOKmhWTSlGYFDwLwquOr9jmCq0UEZobsLAa4m8spwMdf+6XMsb3nGv
	tuu6ZmSv+EItkGiK8owJ+4dmMnfLy301hhcBv4uEV7Mok21spD0maLbGGk80EkthgQwLXOTOs37TE
	jG+z6dJKuS1pLJoR/x06qWRFf9kLADGhJ6ygL5XmyME1Z92j2k2rhIPQCOyMzwSJ9D1t81IBkkXIO
	LwM1RUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQrc-0000000Gxus-08nh;
	Mon, 10 Feb 2025 10:18:04 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQj4-0000000GwLb-1mub;
	Mon, 10 Feb 2025 10:09:15 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5de7519e5a7so1144254a12.2;
        Mon, 10 Feb 2025 02:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739182152; x=1739786952; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5dzyKtWqZnepXYQlMsqs3T0zFLasKzwLYo+Yn/dRQyU=;
        b=LElqI0OCCrI6U3Hvz/Xx3T1YR2PJDjyxAmpxq0E0hdOnkpmXz+4DR6FmJ9EsmGaNSA
         3zXP5npZYICRYBrYDrXakhCse+LmlijGPcf01fICe+YqWPtwAhQkyfjDhlWHb6vG+Bj1
         pc224A50FhGA8UbVajAu5E3XR80QUUyQkXhTpGUHxJYbB9a3H3Jm70nvC+p+V7Try8YY
         /Xko8ni+UqPTOozjmqSe65Ep/XQOwA+f6qJdQC2aP4/3MWkECcVvD5IzqAchzy3oM5m3
         HbE2QxGhiXzB+Coe8BWokseOfE/3n7FeVfhsyA5cnj5xi2d5IlGlgF73kqx2YA3l62On
         n5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182152; x=1739786952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dzyKtWqZnepXYQlMsqs3T0zFLasKzwLYo+Yn/dRQyU=;
        b=FYuzUr/SINF5lLuS/X9HsLtU1bd+3fnjk3YmjjG95ct2RsxU3UEmBHPFKoATgmq3Ql
         iaPqsS59/im5YHUH/gKAIxPaeFUsVAp0zc5YX0wuQBfYky6FLsZTT9+stB5Wm79cSwC1
         xbJjZCZAnCSw34GFQWMR7L1JeEG80XIaItbUvRCualUq0IPB11EtSJQHBq2kgGpfgp8G
         asLYgr1hrtEP8mbeFi9jSv7JQzo6r+Lc+RYH56idHPhSA6/zsNy4HaNcQr9kC6XbcLGV
         pshDOqDPbpk99blo+BxjPaO6YYJdq7Oqo49qCwb5vIbi3cDVdGVwevuA327gEHL01lhy
         03mw==
X-Forwarded-Encrypted: i=1; AJvYcCVNhi44FB0UthzsDEuZzTubgS/CDD6NITvKeJhjLkwGrgFJkzwRgb+Z8LACGwYLW1sqDqMX8TlzPk5u@lists.infradead.org, AJvYcCXY6UdVHo9oRwRtxC2IHY0Ql9jlADYVsjdPKYcdqGsKP573T5/n9Q6KKmlnGqY2VrU02mgTRT24qjygtT0B2lBq@lists.infradead.org
X-Gm-Message-State: AOJu0YwHrVdiXTe5iM343jpdN48dLPisfgH8WYe84aPqc6mBzh+ON9sg
	vmYAIxXCMyWnuVx/SxHMK6GLUu7lXMnTwS4QfysKsSlYEZ/l6Juqd2q+S6l9VHvUMbv7yBdoVm/
	4fWJdsI7Sjd/Lpd2hPTdXfJdkdHc=
X-Gm-Gg: ASbGncut4RzJVkUxgZLnbjPRavvLTT2lCrSKb9PMJK1G1Vv06zh/pcZNglrJfBGVZpk
	Yhy6CLiJQvHy/G2/y0RguMc0ql4c12XmZ2nCdirRrFHP8aZvXoal7xg93APzK7HZBz467RINk
X-Google-Smtp-Source: AGHT+IH05m3EGDv37NgCHa7r72kurcQ8bsVSV4tB6ZTwaZHVAXVKJd9j8KrWy0sZ6Kd7oDJwTcHKTTZ7neMq4xpHZUE=
X-Received: by 2002:a05:6402:42ce:b0:5dc:73fc:2693 with SMTP id
 4fb4d7f45d1cf-5de45023654mr16526726a12.18.1739182152139; Mon, 10 Feb 2025
 02:09:12 -0800 (PST)
MIME-Version: 1.0
References: <20250209-exynos5-usbdrd-masks-v1-1-4f7f83f323d7@disroot.org>
In-Reply-To: <20250209-exynos5-usbdrd-masks-v1-1-4f7f83f323d7@disroot.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 10 Feb 2025 15:38:57 +0530
X-Gm-Features: AWEUYZl-ymjB7hMb8tRQlI4jusE7F1xxvFV_L9geMxys9qNgTR3hdyKQc5pas2k
Message-ID: <CANAwSgQAfwq2tmqB=+896YGhFFa1hJ18W-cAes2o2bseJiLUsQ@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix MPLL_MULTIPLIER and
 SSC_REFCLKSEL masks in refclk
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Vivek Gautam <gautam.vivek@samsung.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_020914_461241_E45467B6 
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

Hi Kaustabh,

On Sun, 9 Feb 2025 at 00:30, Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:
>
> In exynos5_usbdrd_{pipe3,utmi}_set_refclk(), the masks
> PHYCLKRST_MPLL_MULTIPLIER_MASK and PHYCLKRST_SSC_REFCLKSEL_MASK are not
> inverted when applied to the register values. Fix it.
>
> Cc: stable@vger.kernel.org
> Fixes: 59025887fb08 ("phy: Add new Exynos5 USB 3.0 PHY driver")
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks

-Anand

