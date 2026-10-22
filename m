Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACCC606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 15:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YBPWW3A+;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RFn9IC9z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=; b=YBPWW3A+EQW3m+
	ZnM3sr1rO3hy1SuMTFs4axt0GdV2ZungNhhBbstC+XsznHySEsed7qU7vlRFZ/rL/asr1Gojua4Ms
	NS+hX7wPQwJASJ3/jVeb0KdI9buu3PCCDWfpDTsJt23jL1gh/w+wIlSmsSLik7fSSGOpNXahYyptc
	l0D1DM8loCg2+FHGNc+rMEtiVS9Imw7M8hnzjsBQJsgWd9m5/WQwvclEre99GLtLSFLQHZwwqxfEV
	E1TCd60uc1E6EbBMheqorligCrGsqV9xl/OiK5PdeFmuBCOMjjUJSZNtyz4Js/G+iYpL3myLHU7lu
	1wVIROfuDcTz+0xexShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJujY-0000000EPYj-04Ax;
	Thu, 22 Oct 2026 15:29:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJujU-0000000EPXs-3omN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 15:29:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a209a7fd1bso3945255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792682970; x=1793287770; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
        b=RFn9IC9zHBAc8GF3xDiEN1QgZGqhzlDyiWf2o46N9t8ERaHRzK+zjNksM5iu5PU2Lr
         9SvaPL3ReDl6fzpN3HDFjBLySuKHyUVrJ993ESVRJflFYyZsbfxShdoI0U0xOScXqtj9
         x95qq57ax5v6+couLoo+hOTlrDjgz1im16YrODrW2ShJek65lcZtlPZZVHD5vUFSHOsF
         QLgc5WSyGulunoBjL7vyJffvS0mu35lSD2TYh/JYcZd6k7vZmUdugy19H8YGdGO5ldzX
         F3iRMRBGo96H/KI38RJZ4B+c/p6oXuQEXm4SmTP+1rS61a3yCrIVwXAXSr9mPzs1mClO
         o+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682970; x=1793287770;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
        b=YyO61OrswrMLJbyQKB33RDgrY7SS2bTKDcREjEWOBO1l7mDz46Vv5QChoTEfJwLn6O
         zlXv9+HynmkEVCGVT0YG/K21id0jBw3CaFxxHByX7CGSizRMal+w7WBEmz/ytluu3IBn
         Tst8vEciJ8JRl6v8Koztz8yuMkBntff1jECCQzNvGfghsKK27YMIOdD0Vi+raYdHjf8U
         nT9KAE5S2tEdgyENHkeFpnaw72Gq4tK8Hz4fJyB9hTZeOe6k3X8IMBb2vkXNuC9B1lnM
         SpvSjBeKcBkJGjSRNIRfHRUnpMDP24fdRj4+3bz3p494uKbsvloymfbCcQwq7yuNT5x4
         062Q==
X-Forwarded-Encrypted: i=1; AKwUvBwXZDaSJIFX9w6AaAaHYJVpwHYrGSfwsuYv8TUgxpeFrtvodQtkNsYTpAd/ZoCq1PiSeWwlPW6tz8ZK2LdMSH+X@lists.infradead.org
X-Gm-Message-State: AFq9FYKfzAQctZ8poIrVj4/XL53g4RiUZK1tXag+F9J1TuTWTt4h074f
	pq7hsShQ42Z9WtS2tJRVVfZ9GJcRarJSeOHUKaBTuMClOemCLAAso7lNfis4aCsqOsI=
X-Gm-Gg: AYBFou1qWqrC+UmYhzDAgOJygrdp0aEsze3X4Es09BCA/mWOdqydvHNr+Y8QoNkVj1g
	E0bkSF+gBaTJMJxN/B/bwGA7QV+qWteMBuQLZASXdvfo3zEYjcQv2M4xvnqcM8LguokzDW3pHTs
	HSJHIzsaopHAxXG3VDkWAVBPpyHMoxFKBQdTQODMoN/84NLvrswjk9H3yhqbD8pgMUw14eUJGNo
	Opb4bxCGQ4r+xDTf0eakae64doTJWFeVVq+M/CTQ0+21rryGKu+R4x3X3lAut7tXy7GVcsR3S7y
	l3hllIRDSvAhWH7SyzD52hMO4rpenBBhXgBw3gNh4bWAqkhSOj1qgthGJeMUKUpJjuyDovzmpBC
	Wk2pmRH5BoMQdCCbZPU4Ph4THSOeZ4wp97gOeHfi9jlMCw7Na0sUEX1bqjd/M6/founZZVUh0ln
	EHtQz0FE2QstbrlWeQm2b9Amdc6gJNDdOV+DiSgY9spPbg+ESWhuuVdDQk9O57xMnDTn3WJORQq
	M6MM7ejbT8hYuvoDdt3YS0pLlaxvZHrBW2REcMON9ho+vhpGPIUahEJ9FZbZ9Zz8vMAd9JIackO
	Ob8wi3ordJjWX82MphJYbr4Zkfx9+QIlE6YJQPGJQIvL3Q==
X-Received: by 2002:a05:600c:1d0e:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a1fdd44ff6mr114656205e9.24.1792682970343;
        Thu, 22 Oct 2026 08:29:30 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:41d2:e95a:b320:711e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210361ad6sm3270335e9.7.2026.10.22.08.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 08:29:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 16:29:27 +0100
Message-Id: <DMBH2Q4ZU6KI.18MV6V6TMVBNN@linaro.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Drop deprecated regmap from reboot
 node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.20.0
References: <20261015040601.30049-1-semen.protsenko@linaro.org>
In-Reply-To: <20261015040601.30049-1-semen.protsenko@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_082932_963705_F32B8F2B 
X-CRM114-Status: GOOD (  14.62  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Oct 15, 2026 at 5:06 AM BST, Sam Protsenko wrote:
> The 'regmap' property was deprecated in "syscon-reboot" compatible and
> not needed. Remove it to keep the device tree clean.
>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f..30ae952083cc 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -236,7 +236,6 @@ poweroff: syscon-poweroff {
> =20
>  			reboot: syscon-reboot {
>  				compatible =3D "syscon-reboot";
> -				regmap =3D <&pmu_system_controller>;

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

BR,
Alexey

