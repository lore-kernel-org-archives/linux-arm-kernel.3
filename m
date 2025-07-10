Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93997C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aGuiShCQ8/3+HSwG6flwZdYZTdME/r9v/r2gR6K+Kw=; b=Ui3F5hMvOOEHsWGtwLSkpTM8jO
	0khFd9V15kjFCu9cy7stGcdENrTry9nJPTgzdTZ4E4bZsYkeI2H8ovCqi6esNaKv99ILDyTmdTdty
	RZucXzXWNPSlOiStGBozhdzJbBDHbURF/hJNOIJRkzFku1xJCPpG1rETUZcfqi5ccCxQ9rBDWD4EL
	xIKVWClrgcl2Wspap640Ql7wK6SkRQlAE8yC0B0GY8TXjrXdYxArTrRKRAXCNNtjJxiR0rAaYIS3m
	s3dfcFtU2amxiCjP/soknRp26UaIdqoyGIWRSf7hAJikyqERqidpyPox3dqOugweTDmyzItFiNhFs
	k9u7j3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmZg-0000000B9u7-19rU;
	Thu, 10 Jul 2025 08:24:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlLC-0000000Awko-0JT9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08E185C668A;
	Thu, 10 Jul 2025 07:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1667DC4CEE3;
	Thu, 10 Jul 2025 07:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752131106;
	bh=czf6X1CxihTK1hqGwGS3UzT3zM4lUajgZkl5Q90ncTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nhm0/EVBgw+2I1wBxv8nzhQKyhZQ5Aw/AovbreGefUzt9L/gjNnP0EZp3OA+n3dHX
	 vBPRrtnCkYu3KGT5MHW2OHAXyeqgetrd7bRSJmmR+xhTDQ1Eb6BJ6YIOLWf5SUQZu+
	 YDrEa43xpVj7hm2pnyjGPrggKySpxQLSjIykdwWXzfsJpn9md62+vYuCJQKNAmp1aw
	 QDqYVeURz8sevbt5tDCaYyy9doJs0Px9+M7zZy4YDfRp2eGsjVrve6avDuZR7xKy/m
	 nAMzpgVXWhYDKj2ZihbZ7tJRUg6geFSBKaJXVSdk2ik2FbRHmeuXkPuJEUrHOOz5WN
	 /wtpTlRfaXtIA==
Message-ID: <78d46ee0-d53f-4980-aa90-c9111043ae90@kernel.org>
Date: Thu, 10 Jul 2025 09:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] arm64: dts: axis: Add initial pinctrl support
To: ksk4725@coasia.com, Jesper Nilsson <jesper.nilsson@axis.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Ravi Patel <ravi.patel@samsung.com>, SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>,
 GunWoo Kim <gwk1013@coasia.com>, HaGyeong Kim <hgkim05@coasia.com>,
 GyoungBo Min <mingyoungbo@coasia.com>,
 Pankaj Dubey <pankaj.dubey@samsung.com>, Shradha Todi
 <shradha.t@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>,
 Swathi K S <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>,
 Dongjin Yang <dj76.yang@samsung.com>, Sang Min Kim
 <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250710002047.1573841-16-ksk4725@coasia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250710002047.1573841-16-ksk4725@coasia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_000510_198427_168844C5 
X-CRM114-Status: GOOD (  16.27  )
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

On 10/07/2025 02:20, ksk4725@coasia.com wrote:
> From: SeonGu Kang <ksk4725@coasia.com>
> 
> Add initial pin configuration nodes for the Axis ARTPEC-8 SoC.
> 
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> ---
>  arch/arm64/boot/dts/axis/artpec-pinctrl.h     |  36 ++
>  arch/arm64/boot/dts/axis/artpec8-grizzly.dts  |   1 +
>  arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi | 373 ++++++++++++++++++
>  arch/arm64/boot/dts/axis/artpec8.dtsi         |  17 +

This belongs to the previous patch rather. You can split board DTS, though.

>  4 files changed, 427 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/axis/artpec-pinctrl.h
>  create mode 100644 arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi
> 
> diff --git a/arch/arm64/boot/dts/axis/artpec-pinctrl.h b/arch/arm64/boot/dts/axis/artpec-pinctrl.h
> new file mode 100644
> index 000000000000..c2c1e25b7f6a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axis/artpec-pinctrl.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Axis ARTPEC-8 SoC device tree pinctrl constants
> + *
> + * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.

First publish date was 2025, not 2022, so all these copyrights feel wrong.

> + *             https://www.samsung.com
> + * Copyright (c) 2022-2025  Axis Communications AB.
> + *             https://www.axis.com
> + */
> +


...

> +	i2s0_idle: i2s0-idle-pins {
> +		samsung,pins = "gpa1-4", "gpa1-5", "gpa1-6", "gpa1-7";
> +		samsung,pin-function = <ARTPEC_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
> +		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
> +	};
> +
> +	i2s1_bus: i2s1-bus-pins {
> +		samsung,pins = "gpa1-0", "gpa1-1", "gpa1-2", "gpa1-3";
> +		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
> +		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
> +		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
> +	};
> +
> +	i2s1_idle: i2s1-idle-pins {
> +		samsung,pins = "gpa1-0", "gpa1-1", "gpa1-2", "gpa1-3";
> +		samsung,pin-function = <ARTPEC_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
> +		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
> +	};
> +
> +	hsi2c2_bus: hsi2c2-bus-pins {
> +		samsung,pins = "gpa0-6", "gpa0-7";

We sort nodes by pin names, usually. What sorting rule you applied here?



Best regards,
Krzysztof

