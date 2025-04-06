Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2935DC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 20:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=; b=ZcbiBEHxBnKGKf1oiB4m63CCa2
	7yyVy1GXwscOZoLLJzyfMQik+4Ob4tFPs/WLc6PYnonomLfrMVbUshUX3iUuzYEacqj8FIk/c5PtS
	mEJam4KVfSCnbeqHkHPiwrmWG+l2VITA/vmXLzsCgswd6FI8/Rpywbb6cYOj2GEe36QsV7REWs/Lb
	IqmFEI/rh+KZeIy5J397S0ZSoJgVG6O1CxjtVz3xZ9ZbNvsQTR+eAAmIhc+UKiOIWyk854tCA5yuD
	9JjERCa2e3EKnz9GgNxuvqDwqK4TgArBpQu2itQFd3hvhxR8GizL0Cl21Fg5K8bi+GjBuNgbo5zz/
	clFH6aww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Wi7-0000000Fmg9-3k8g;
	Sun, 06 Apr 2025 20:35:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Wey-0000000FmOr-3VVc;
	Sun, 06 Apr 2025 20:32:06 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2255003f4c6so32207295ad.0;
        Sun, 06 Apr 2025 13:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743971524; x=1744576324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=;
        b=KOMk+QioPBVywTUVcrZNES15Ojt4PeAeo8QV1r/AaqkkwBOJfieu2GDh27HnZpI/aM
         YhD+4dFz+dm67DAsZQvKHD3nIB8T/wDijXWCaYiMm+hfneuPrUKeS+FO4Ayj7vRvk0wY
         dvbfHEVfuyKq69v1MiDWaqvzkyRM2tkPUbxxpa1+1qPI/VVNNDXZZM+cjbdj6nBAK5kn
         OAB1JZK/HYoMgs1YGZSsIb30UDoAhgT/sdWcti/IQvSNahKSHSIVy10q6xZMSz6JrA2U
         UM3PKyGgVD66tiEIZEECQZQ/IsikDvoC6+PUmsS6LYgm2oHRZVSZBG8qWaBBe+hFqUYJ
         KNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971524; x=1744576324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=;
        b=P7X1auXXEuvZmNk3vpxEQl3oox0CZwhHxAEvSUmPJoW3E0T4h0dHnyksuMIYU3khgk
         ST32U/hDA7sNRoaPBcIqghlBiPkkXBwoRkg+BeJVNxgnhiQjHq26UF+GJvoRHpq79Qaj
         dXYC5tYt+G7GcQM4msi1QPP1/dekZloo+ETbZkvFM04KWOaFUlnIUahLdKLewiQzUEOo
         0dahadQ0Q2Kc9pNtmviL3otp+sTkXagizcloGpRaER/YxUIGF6lEQLD6zTshK0EYLw2S
         MHypx2eSkyv1trKsKtkKwexIfdPbfLHVN4eUu3Ex0hfB7YvBrERHgr6XMfqSnt5hvEtI
         XipA==
X-Forwarded-Encrypted: i=1; AJvYcCVhBakuLnUinBRY15Y1yB7rMivuTa3anZpGQbqz2OZCRkBOrwnkHj40auB4W23U9nRlj3u/maANmbNYAbZhs8jQmg==@lists.infradead.org, AJvYcCWuUzIbB0mlz0iwRjp33h2ptAl3f0mitG5KJX1O1TxCmeT3qXWy6V76U31kYjMsIt+7saswVrILVfv/xzG8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9vNqVTo9N8M8yCpS64S1Udks6c3MkGUSiqhRHyzCKLYbihIK2
	UyFR8sumH+AY8GZpzKIda5Zchjny0jJWxwZF0Pi2E3UVqFUU9gBJ6AmG3I5zgSISG3/xEPeW0Xk
	w2PUTyWimssnL0j/nR8f+DHxOWt4=
X-Gm-Gg: ASbGncuEGrOuCcWeNKGRvdqp8v1Lc+g/MGjkn7HAuhTOg74c+LaapXG+3CnCnI+nNTt
	fPlYR9dEqOtcIImDX/fcnWbEz0hN/LdbZzmvauvdCls5Jj9DhVTiRJgrNxWZtEHcR1WR0dsvfi7
	l0BQDrf4JCWvQut1nTM401QLlQu7CpikIjIg4lh3p6
X-Google-Smtp-Source: AGHT+IHT9v90+iSAiZXg5CI9I2oqKoRX4lqsSVS1Jifp+TsFpnk0GJAUF4rHe1Z3iO76l1ihTjaQBPryFYN0akQAcDI=
X-Received: by 2002:a17:902:e546:b0:216:410d:4c53 with SMTP id
 d9443c01a7336-22a8a0a24f1mr155808815ad.41.1743971524234; Sun, 06 Apr 2025
 13:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Apr 2025 22:31:53 +0200
X-Gm-Features: ATxdqUGuzCGyUj4WFxWudQ3GalFFdus2VKUZdP35pUaLUbjhJd9NZclZR-cjauk
Message-ID: <CAFBinCB00HsScB6d4UboQkp8HPQ3pbDwbbwnzwgqJOvHwBDSdA@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: meson: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_133204_895385_CFEDC1D5 
X-CRM114-Status: UNSURE (   6.93  )
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

On Fri, Apr 4, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enabling the compile test should not cause automatic enabling of all
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

