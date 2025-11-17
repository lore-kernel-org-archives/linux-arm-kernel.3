Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FC3CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 08:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bDYLyxefIAgKxrJNARxxGvbDosLQ3gHMkGDOSNcCak=; b=PM5iPgsW0RmsWTzH/yHmINSKUZ
	wSpM1r5ODTb99l6Ip1K4h2dvSOqDKUmiaJLUtIk6OWTSbyHXkt+xgTVuPo7j49vVDzhcVHDGON6Do
	9Gki8tW5NLOZ9+Yb3AvaBaGOofTkGWADyKEZ5uYL8CSHWLNfm2SWMppRmCwqUAta4Q1OlHYxdPUei
	H/oYh2D6aLPdp9jVXLd9LftFB8nKM81WzROQ2eh+Y4/Q/hQWZ3PLFTM/YUkgORr5aNPdZafOm4M/D
	tb5Ii59j2ipY/bh6Ecj85OVqBQut0Cx0L0fVeevKDGXweJCwf8qby/jvn0t86HpH/f6DGRjfP2f07
	zrwnB/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuLA-0000000FfZ7-3Qg2;
	Mon, 17 Nov 2025 08:12:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuLA-0000000FfYn-1Gwi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 08:12:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAB03601AD;
	Mon, 17 Nov 2025 08:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B75BC4CEFB;
	Mon, 17 Nov 2025 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763367119;
	bh=QMolonPvm96jL6+i1Kcb1a/cDsrx5r/l/mv6KCVHyq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p9uV+LUQ1stpek2GpVe8cnFcKFunP/M008q/76VUL53JuDB2RydnD0yIlU8VQdDod
	 ziycqKEbmP46rDF5MClHt+JWb0ANjP8tDM4us4oTuktpneCWaRXrxonXXCR8yfVqJI
	 kVKPiqBHf4k6HJWQaVUKW7rgtr+uCtAuk81u21cJCs1m7Cz9KeIg79ZXjknZRIePTx
	 qaTsBive77MvEB7yVwH3Kuu5bGQyxBhiNzaJjXnU9lUKklIgiVYP9fC1tybULnLvPM
	 JrNRh/TAk2XurkTq+j19kPn+YmCKEZARZp1wUORNJzaYy4yBCC/mIedggTC1ZQ3j0v
	 qhaJuXN9a7ogA==
Message-ID: <3ddf1b76-8376-4d56-837f-c9b06d04af94@kernel.org>
Date: Mon, 17 Nov 2025 09:11:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Juan Yescas
 <jyescas@google.com>, Douglas Anderson <dianders@chromium.org>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251113-s2mpg1x-regulators-dts-v1-1-80a70ef42be1@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251113-s2mpg1x-regulators-dts-v1-1-80a70ef42be1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 13/11/2025 14:31, André Draszik wrote:
> +			ldo12m {
> +				regulator-name = "vdd_cpucl0_m";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-always-on;
> +				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN>;
> +			};
> +
> +			ldo13m {
> +				regulator-name = "vdd_tpu_m";
> +				regulator-min-microvolt = <450000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +				samsung,ext-control = <S2MPG10_EXTCTRL_TPU_EN>;
> +			};

Please add here brief comment that ldo14m is to be defined per-board.
Same for all other cases which are missing from common DTSI.

> +
> +			ldo15m {
> +				regulator-name = "vdd_slc_m";
> +				regulator-min-microvolt = <450000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +			};
> +
> +			ldo16m {
> +				regulator-name = "vdd085_pcie0";
> +				regulator-min-microvolt = <725000>;
> +				regulator-max-microvolt = <1300000>;
> +			};
> +

...

> ---
> base-commit: edf57d8dafc63f9298a209e518ea6a2e0df78ed0
> change-id: 20250603-s2mpg1x-regulators-dts-aea4bde3dff9
> prerequisite-change-id: 20250603-s2mpg1x-regulators-7a41c8399abf:v4
> prerequisite-patch-id: 9d4a1e0afe6eb45dcd35a9537b7d5b4e35e801c3
> prerequisite-patch-id: 928fd84e5f6207a2fd98dd8372a91df0776ecfde
> prerequisite-patch-id: b87abb6b9a8fc104f0f752bca0e9347d17de72e0
> prerequisite-patch-id: e053834e5bec411f5c512b63a3528e49aad11ee2
> prerequisite-patch-id: 4fdd195c0b3fea537144ac8d82bb40a38cbde117
> prerequisite-patch-id: cc716fef97d6c25c0589d7269b8f34e04ea96216
> prerequisite-patch-id: 20ff503abaf2fcaef4328e1f8009ed3df242bad3
> prerequisite-patch-id: a0d80e8f49401dd79a7e4dda2517e00228aa3087
> prerequisite-patch-id: 2368af876ec7c643d9765d3fb1e9bc4991023a18
> prerequisite-patch-id: b70d5648790458e72db82e26b180bbd7301469b3
> prerequisite-patch-id: 92be1aa6f95b2a5795df84e11a602e97a41b2938
> prerequisite-patch-id: 86625bb109da618cbb8aef07fa717257918077b8
> prerequisite-patch-id: 2016c6cd5e0d51daddada37232e3b99c8f4ad77b
> prerequisite-patch-id: d323362e84d3991bd949745579aec34897620321
> prerequisite-patch-id: b1571de42ac7dcf0fe8ddb77650a656244ff751b
> prerequisite-patch-id: 44ea2393bc4df716427cbac9b7f080a683ba1c0b
> prerequisite-patch-id: c968c5b557897767bfc2629de79b1ede8ab48767
> prerequisite-patch-id: 221800199a94e12e928dc9606c82b6eb33cffa3a
> prerequisite-patch-id: c76d8055f620e0b5fa81101a31db08fd5a60e773
> prerequisite-patch-id: be0027a934451be02b1c4653bac8b6bc2ae2bd85

This would block this from merging, so then please add RFC prefix. But
probably these are not actual dependencies, so they should not be here.

Best regards,
Krzysztof

