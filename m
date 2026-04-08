Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB5910F9945
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EQsRJiGkX5iRTB/AZVv6hwVd/Kx+flU2pF6ssQXU+8=; b=zsAn+HzG9MpfyHPbhSrRwc1yfL
	bp/es5AEzOTJQRCl22PMhYvtyXtaW6WsWLRTuszkTIZpH9EZqSHaMjh+cSGKLXaHMkmAxj6xeTUyY
	k21MV4Pn6gjCYalGs/mp/ZECLxNxas/PiuT/+m3Bcq3HQXsplT+h6yTb3Vp6/J7FdFuzL4qayuX6C
	6I4zXRf4av+R5ugQffJaVV9Hs2/VsPWzZI7fN8spqeMh+WjnwjyGwvwGXp2ke8u/kFRkljU71JJCz
	Lcqy6IEnRzckzxgja321ln4VCR9dvJ29sNSHh2/XtZIi/7zu6lVAl31OpkJXOd3T5xyTDYA8k5Xmc
	JswyN3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAUDg-0000000911I-1DlQ;
	Wed, 08 Apr 2026 14:49:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAUDe-0000000910w-1M35
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 14:49:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43cf906b007so3353518f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775659764; x=1776264564; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EQsRJiGkX5iRTB/AZVv6hwVd/Kx+flU2pF6ssQXU+8=;
        b=ijaQc5jfoRZXzmEAYo64fyP+fNSFr2L31ggwpIs/5L9K1bxUuKJ/1y2VWh1yOVhvgP
         zT9F/8xuUw+64lGLLUIZbOWJaRtJ8/fHXtFRwcWzPlyBUJ1iNn+tBoD4Szgy8zGe8HPA
         rSqPZZWtw2AhDecDhR5FmhQzX7mQzB24dpWMxFjyx2JOUiqM4pmrkroZzo9M5JlN3WXd
         x9MfJzKcLbUQO/VJUsOzPQBavzruZzNspUT03jHDQjNdYnqF9tcW2geXNPCrJ4nK3h6s
         GCMx1ZvHpAkboMF9km0Vr3znUejZTnpcetMUy8U2ztmo0bAVx/OhhVlbdRW4ulrm3R0a
         9Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775659764; x=1776264564;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EQsRJiGkX5iRTB/AZVv6hwVd/Kx+flU2pF6ssQXU+8=;
        b=ItWJaOO0GMfb8+pYQ1tD1GyeV8B5JvtrZ+wNeN6hoWGrJNK0+MPX0Bax7k9jvtPF9s
         DkbibWijDH9WHWGCH17Kv2Gj1t8dXAnw+JX81d47oyM2uxsHsF+YTVCGyisOLp/ExrJp
         JtzWBV1wYt3IIOWUyRfOrvChTrgkoqOPz4FLiZXzjM9ZEh5glMpfX+tEmHJwsGi/vVLM
         OO4rXjtnaPv1nPt1QEJ7VTH/ZMbpe34GPPzf0L8rPaj38CXEqqMUkREToIUF9sZpfXso
         is2I3VkCexnBG9Mn9aP7/n+sWYf0Wy+umSu8EkN6qLZ1ju8ESUcoHnxCfclScvkz97lu
         DItA==
X-Forwarded-Encrypted: i=1; AJvYcCUEpy8rup2ZaDcp+sqMAYaomIyAPVPncPX81tWwWO4yM2Hoe30snUOMfd16QqOmNo7IF/9jpK3pnk0AyqTBRHsg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm4jOkJnpGMnFbGixFaVUNMlTPEZ2OXye88hChQ6zQQy9j1bOz
	mksNdaA2wWnlfzawyVcTh3uUP2x2nvy9jK9HRq2IAP1Qfy374vRZRKGHL7iIruAibWA=
X-Gm-Gg: AeBDiet22NCbQJSrMbWaep9vvkQCIYbPciAgQfzAc/9d8B09Kpf+p0rxkN3APmeTopZ
	AEERpOYiCO1wQuqQrPeY55TZn9PLN0l3WRRkJ+B5QJZbxxfkOeBmB71/W0q0cDT3RGEO90iPnFz
	r/0aFho9cN42ZTeg85I6yKnPane7Z6RRynUkq4q2Dl7izUZC0ol/h8T5+6Py+dpq7a3s4O0JY/M
	tsukpnoMRjUs4zvZdTFgMoabzIqzFL4HUHacepg8i1Ql4zA+Wf9aaHBL1/DGRq3rNOM9vtRRDNg
	9HSoJnPQ5gMhZBJdJvwUiRpVyfcOXHuI40C6Zz6zgMsIRZAGUvJ784v2Iot12rLkJzmsumjXcQk
	bbXKxeA+eAnmXCTOS48EOCf7oKhCl2L0eZGNY3aRiA6y/yPA5W+Q5JSD/9M2NPe+KnWTKgPufCW
	x4ZHmAAI+f4BGcMD0EiDd6Sf55wvcmV1pTpruUIhkDsm8BoWbGLnhfiMT3iyOvMl0Dfd3qFUDka
	A/Zz4meYLL3laMjYQ==
X-Received: by 2002:a05:6000:2885:b0:43d:1c21:ead4 with SMTP id ffacd0b85a97d-43d2927bc28mr30909918f8f.18.1775659764374;
        Wed, 08 Apr 2026 07:49:24 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e5890sm57988952f8f.31.2026.04.08.07.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:49:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 15:49:22 +0100
Message-Id: <DHNUUPQPD5DR.18P18VV0LNTI8@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel Lezcano"
 <daniel.lezcano@linaro.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz
 Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_074926_393989_44D73F09 
X-CRM114-Status: GOOD (  11.96  )
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

On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
> Add support for the Thermal Management Unit (TMU) on the Google GS101
> SoC.
>
> The GS101 TMU implementation utilizes a hybrid architecture where
> management is shared between the kernel and the Alive Clock and
> Power Manager (ACPM) firmware.

Do you plan to update or work on this series? If, by some reason,
this series is postphoned I can rebase it and re-send, for example.
IIRC it needs a clean rebase as a minimial change.

I am constructing some code on top of it, so it will be nice to have
newer version that can be (re-)tested for Exynos850.

Thanks,
Alexey

[...]

