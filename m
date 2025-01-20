Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50277C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 22:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F8wu2BkrTWsrVM/jC7rXUdRwtSDgmdRo69fIzQbnk08=; b=wNboyB+8LgcaKS
	2oCAQPI6WyCc/AhjO5ZsXKzV92UyaFsEmUAk+ej5SJmy0o1oL3jEGKL9QReFB81Tp2KPCLd/e8NE3
	jRqJ+908MOurfKf++/jyYZyT1KY+C+Qr+Nk8WdVzDvEe2HXPJm4w2kDu7NICfYKzaX8REfFg9TP3c
	wvHVuD40qHo5rPF1xeC0dWl+jPe8wA345u3PlsL1FR8VM0FmjFhlIHIHJ6p8bRlK/r2XUVHvB/7oL
	HG7ZZsMraGwwE3vrdukAzjp1MyKvc1P++kewMS8wjpyV1C/Dvsalj9YxQtoHn/N0YBtwYAl8eMn2P
	nKmJuqExD+91Rq9hA1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta0Nr-00000006XQG-206v;
	Mon, 20 Jan 2025 22:36:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta0MZ-00000006XFU-1pLl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 22:35:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4363ae65100so54871305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 14:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737412518; x=1738017318; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8wu2BkrTWsrVM/jC7rXUdRwtSDgmdRo69fIzQbnk08=;
        b=IrQPsliLF1oc7wensv+HIpMb4NnVD9eq9Uqrx2Dqzubexu4Sl2ksX/Trcmi4Ag1yPV
         MP4/yOA5r0FyWouFa6sefNLzxyVvKj1Hpkr9xn15VeUvu2YzbxXZMVy3tnCeoQfFP1jK
         LEOe0MMnLynj10U/RXGyv5aYXkuYOxDpHN+4LguVkqx5QmlgMboeHDYN8msuDvut2sMl
         +8XuHMUgIPaa2FX8L3BHMV3WKOLzYq60oHIhPmmVvicMn69jc78CAPsbqJoFT/TjtrT+
         St2HTNxk38ByE7oqqvoWOD73+9z1Dmokup4ee5p24ArlISprcYMAaO0CrYwBPA/M2xWY
         ho1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737412518; x=1738017318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8wu2BkrTWsrVM/jC7rXUdRwtSDgmdRo69fIzQbnk08=;
        b=WCKGbRF2iMZN4VHR9oY6+a8uzcy9cWp2wh3yn1tnoc79rgsPFhCkwjdA27aSiTyA/r
         j3D+w6/b1D3GK3gcs13uAL39W2Z9FBk3zdwMA3yPJmjBFH3pUqzBZzyxAZO0KiAlE90p
         onjGouW431V7dM54YIrzh1Ty6/2yhV6C8k+XACHaWmk8G/zB3X3ld6VCVPPEvWQcpRNS
         FvO9dxszXAosAkLOvrbbN97zfIjA8h6RA/+Y52PPEpAqAfsjrW05wSMu864FGTv+86so
         SQgkATXQxtnVuOi/5jBtSpenEUuyQbteoBPl4cgnipVmHhr6FiK+NflSh459Y7HUJgAX
         dDwA==
X-Gm-Message-State: AOJu0YzFvNgFS4qw2wFEmTRrddcticcMPhZoHy3zG1eru0OuK6JngUSJ
	mt6vEHGbbIoRM57CooY7mpordYbcVphlZSPxqiXHKYkrfHm6hCT0sWrs8csflOY=
X-Gm-Gg: ASbGncsJHav1xr01FooT6I6zMDVQN13x0DYfBj6WYwi/Lp9+1wiqMFFYh41V2oeo6/V
	2VJHKtOi29mHprQflu06UWT9pq0dkc2ekv9cs+8Gx1MyP49BM4D634/DglQNAmhCHSA3Cgt/ZuQ
	pcjlOoom3h7EGvjq8Pdm/a42ijXWqPDYkHO4DVpU/hcePFReK9gxBHVIceogTPoYTUnXH3u1fEr
	7FCg+mezlgcZ1IXQuZ07RjBVoS2BwsSPtpAVpbh4nQbgar1VN/pd94rELZSe9uF4yBku/yeZ6Ko
	jeOS4A0OEL1EomaoP3f9u+8=
X-Google-Smtp-Source: AGHT+IGjA+UZ6VbJB1NhP66f0b8U22Yqxx053HN3nMFKIp59HvosUtcTmoxMU8ZEOp2wVF7sdQd2BQ==
X-Received: by 2002:a05:6000:1786:b0:385:d7f9:f16c with SMTP id ffacd0b85a97d-38bf57be11bmr14588226f8f.46.1737412517766;
        Mon, 20 Jan 2025 14:35:17 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e19fsm11889267f8f.93.2025.01.20.14.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 14:35:17 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/3] samsung: pinctrl: Add support for eint_fltcon_offset
 and filter selection on gs101
Date: Mon, 20 Jan 2025 22:34:52 +0000
Message-Id: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzPjmcC/x3MSwqAMAwA0atI1gb6UQSvIi6kjRqQWBoVQby7x
 eVbzDyglJkU+uqBTBcr71Jg6wrCOslCyLEYnHGtsc5gYglH3nDejrAL6qmJJKLz3k/Wd6GJDZQ
 4ZZr5/sfD+L4fR8B8wmgAAAA=
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2136;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=p6ultcYuOGIaS+90ZuOgp1U3g3GGKtVgVLTtyGNHkb4=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnjs+jPcUF/omEh0iZxoatiVZ0QBh0tMxpn8fEx
 eli4RojWgOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ47PowAKCRDO6LjWAjRy
 unZjEACM3Q+inY9K8M9Tp0UGpnFBDb1Om5fcxGoH+8e6ZyTY9OUcbJULx8z+0WQEqcV44nvO5nA
 NcQ+v5P7NnT9OvnmDkuok7mlCiAFw9P9A2QGi63McQQPUN5dodeY4/rQFoGqNH/zn+fBS9dvuOC
 NVvk6vSAkIRdPWUq96jTKLLDwAVXcDAAZ2s8oQj/A8sSsdSnpfkhHSkexTP+wuB1sFwEEN3t/q5
 6uOfQaissUXDtii0hyAA2g6sGKk7WW5HeRBmUy9rRBMA81lsfhQwTEC9klChIDLVwhP1AX+5rut
 6EB4XL9wQY9Gjqa1rtLB3GKbBiJoWFLGiNzOVtKR/XQyd0vFD6LlMluik5tEhyuk0IeW9Gac9rp
 3Qt783KtavMg9+IREI1/khN1oiLcT3bmBzijk999FRtRo9jbJwoZ6dVWffWdXLDI0Svt2IPIE+8
 NATM0IqvlZzmuDKiiNoE73fr8rhgHiWe4GgDr71gqrPP5Pk0r2ENbK0wixJ8ekz2f4c45PsH9mz
 8eMICLF5JvZ/vMVwylujyX6d2m0/PveI9UvACrS93lSRjiDk8JB877w3NGe7TVzAWAQsto1zB+T
 qTfKe1JxShfo5PZ8t0X0eDhtmf58NxffPA0TZRrPyjDrwb1EtMDVQxYcvoOePmZtwMhkcMuvCRe
 zseNbj++u5vbapQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_143519_504185_A49B8EAA 
X-CRM114-Status: GOOD (  11.81  )
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

Hi folks,

This series fixes support for correctly saving and restoring fltcon0
and fltcon1 registers on gs101 for non-alive banks where the fltcon
register offset is not at a fixed offset (unlike previous SoCs).
This is done by adding a eint_fltcon_offset and providing GS101
specific pin macros that take an additional parameter (similar to
how exynosautov920 handles it's eint_con_offset).

Additionally the SoC specific suspend and resume callbacks are
re-factored so that each SoC variant has it's own callback containing
the peculiarities for that SoC.

Finally support for filter selection on alive banks is added, this is
currently only enabled for gs101. The code path can be excercised using
`echo mem > /sys/power/state`

regards,

Peter

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: andre.draszik@linaro.org
Cc: tudor.ambarus@linaro.org
Cc: willmcvicker@google.com
Cc: semen.protsenko@linaro.org
Cc: kernel-team@android.com
Cc: jaewon02.kim@samsung.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (3):
      pinctrl: samsung: add support for eint_fltcon_offset
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 150 ++++++------
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 318 ++++++++++++++++---------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  39 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  13 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  16 +-
 5 files changed, 338 insertions(+), 198 deletions(-)
---
base-commit: b3f72f6c7d65a8953fd80ce0b376b47fa263e34b
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


