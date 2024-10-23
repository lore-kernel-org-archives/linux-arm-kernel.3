Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BAED2E02A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bhlavEV6bEoUmwtwh+KoBaPWNoPVJdtNPzK7rWBZUw=; b=P8pnT89WDg2aZj5pFGs5Gi6a+N
	jvcBbHbUSsPW3T/pdnUJ9qKEpBjR2whcbhPh8biWygAJdfwo8ULsz7Xesg4iZ15wVSm5iL5W1tcmV
	pztWwee9xvBoJke5X1yl+aSQAIzC/+vGdM46SChXLLOYGm+5IJ+mS+BTEw8FLedMVXN3H+CvsdOr0
	YTk2uvzq88tWVU5Yrz7++8ZEWSP96IjrEjJOSECADOXVewECZrPjU1ynSslvildJ8r1ceWt2+7Hqr
	B0MUHfTt3l36hnZH/R3diWiFYG5jWuVd5cTWmDq+fWa2deByfI7mSOxPhwCJ8wHrAu6WWRbrkg745
	m/l+CwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XIV-0000000Dhbf-00c2;
	Wed, 23 Oct 2024 09:04:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X5t-0000000DdqE-07fr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E20CE5C5EE1;
	Wed, 23 Oct 2024 08:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2D1C4CEC6;
	Wed, 23 Oct 2024 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673512;
	bh=HgvIm+497Hmdq2R0Wn5snLjGoTlA1hQo19CTjG70174=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+vIG12jWtj69d2TdKEb+dkCv8jMcz0EKHpltNBDS1/400GbeSIBlOjBfIXifOSao
	 7lVwe2DOdbLkI4ynU6aWPCyBeZxpxNEIcWTRjMCNfAShdZU9wo+G3x1C5rxg8eOTz+
	 7knWRBkXcPbr0cU4fWLfeEvpL210+BtxZhI2DF8+3Ehm7MJE3Wbh/31v+P34652Hzh
	 OSOGLh9C2YSVW6Brd2I8ce7rdwt/QowMBuh7OFAvrn85lWHrXF9gCl+iZtIX1LWEPS
	 ku7mqABnrIxLKHV9pPti3C1e8uXKFOnIUiL7oszjv+3WU3QTUrcRf/cBW1SExRfbzm
	 TM3BCIrikeLFw==
Date: Wed, 23 Oct 2024 10:51:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Cheick Traore <cheick.traore@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 11/14] dt-bindings: pinctrl: stm32: support for
 stm32mp215 and additional packages
Message-ID: <2g65375shtjq4udjfarfspqtpg5q27oeerqskt2uzwj44pvnbb@rderpevnrzxs>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-12-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-12-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_015153_179286_4D77E509 
X-CRM114-Status: GOOD (  17.08  )
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

On Tue, Oct 22, 2024 at 05:56:55PM +0200, Antonio Borneo wrote:
> From: Amelie Delaunay <amelie.delaunay@foss.st.com>
> 
> Add support for st,stm32mp215-pinctrl and st,stm32mp215-z-pinctrl.

So all previous patches are for this? Then they are supposed to be here.

> Add packages AM, AN and AO (values : 0x1000, 0x2000 and 0x8000)
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 +++-
>  include/dt-bindings/pinctrl/stm32-pinfunc.h                   | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 9a7ecfea6eb5b..0a2d644dbece3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -27,6 +27,8 @@ properties:
>        - st,stm32mp135-pinctrl
>        - st,stm32mp157-pinctrl
>        - st,stm32mp157-z-pinctrl
> +      - st,stm32mp215-pinctrl
> +      - st,stm32mp215-z-pinctrl
>        - st,stm32mp257-pinctrl
>        - st,stm32mp257-z-pinctrl
>  
> @@ -59,7 +61,7 @@ properties:
>        Indicates the SOC package used.
>        More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
> +    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800, 0x1000, 0x2000, 0x4000]
>  
>  patternProperties:
>    '^gpio@[0-9a-f]*$':
> diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> index af3fd388329a0..01bc8be78ef72 100644
> --- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
> +++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> @@ -41,6 +41,9 @@
>  #define STM32MP_PKG_AI	0x100
>  #define STM32MP_PKG_AK	0x400
>  #define STM32MP_PKG_AL	0x800
> +#define STM32MP_PKG_AM	0x1000
> +#define STM32MP_PKG_AN	0x2000
> +#define STM32MP_PKG_AO	0x4000

Why these are some random hex values but not for example 0x801, 0x802
and 0x803? That's an enum, so bitmask does not make sense here.

Best regards,
Krzysztof


