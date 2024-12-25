Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ADCE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 23:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqXPLEvnb2gnAcGBvz0IEA5e/jzle4AEgI3HE3guUBo=; b=w8vA1YaOztFYvVKuSGZLAxeXae
	/oDTXUvJ0hV8sdKdEH+Xus/qmZ1uQILfshnnG9kinN1cx4gYmSSuSMxUEldRAsptX6DFIM1+i0gIb
	km1XmNtGZ92Fg877VY3asY46arVIYMS0s7Qg51gyOt9aq1cbpR6wR2g7lVixLyz323YqrPs4rkAtf
	Uz90Ii5k45uyXKRxhedfAR3GOz7B9FXv5MpofEgcg8NynrIzbmmOoF65bWSn/VzVrVjCCEvbHyqPC
	//mxLynscWTCTz5zEM1Rgqrxa6kcs5e9rBz8AI8n3woU8VNoVZ9v89ONrw4Ghfw8ZKLkTIBRZ1g9x
	rkjS7Pjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQaMp-0000000ERC3-3oBk;
	Wed, 25 Dec 2024 23:00:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQaLd-0000000ER5r-3omB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 22:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81D635C5E3E;
	Wed, 25 Dec 2024 22:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D30C4CECD;
	Wed, 25 Dec 2024 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735167564;
	bh=1wNj/IVbA4Di3bccZAqMUVRlHal4Sy0QkfLVEqVzyew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XahO4jNIq/4cyWj9bfxRnwgWOpJoYWtmJ2EwJYJa1czF1QzSPC81zo+/xMgMjH84S
	 P2S2z7ZIxMbJcXYaVUGQRcgr64SzQb/Pv554A9pKU9f7aJIGSjXjRzuc1MW2Sf8Kem
	 zaSFplJFo3RPdZ2mTNvtojwfZSqaEASp/luHU/ZhtVP+86XrQUb/j5omCMPjB8jtbx
	 UGpsU46m4Tyf1F/7gQyXcX2EfV/ruLWnTf/8e6c0rN0rNahTR0qp0oMBK9v47EEHn4
	 uj7+Eeevbvj5iqPXdElR+WM4D8ESsXn/Nq5WtoduX4A5Ifi5x5kPwqtG71YvgNh63X
	 jVmiyN2HzlXaw==
Date: Wed, 25 Dec 2024 23:59:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: exynos5: Add support for Exynos8895 SoC
Message-ID: <djpcvn7von4rizjucplqwxlmpuaemrl7x3jsbqmojgzhybfu6o@n6l3dmtjy7jy>
References: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
 <20241221151937.1659139-3-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221151937.1659139-3-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_145926_001876_38D731DC 
X-CRM114-Status: GOOD (  12.07  )
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

Hi Ivaylo,

On Sat, Dec 21, 2024 at 05:19:37PM +0200, Ivaylo Ivanov wrote:
> Exynos8895 functioning logic mostly follows I2C_TYPE_EXYNOS7, but timing
> and temp calculations are slightly changed according to the following

/changed/different/

> logic:
> 
> FPCLK / FI2C = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 2 *
> ((FLT_CYCLE + 3) - (FLT_CYCLE + 3) % (CLK_DIV + 1))
> 
> temp := (FPCLK / FI2C) - (FLT_CYCLE + 3) * 2
> 

...

> @@ -352,11 +369,19 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>  	 *
>  	 */
>  	t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
> -	temp = clkin / op_clk - 8 - t_ftl_cycle;
> +	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
> +		temp = clkin / op_clk - (t_ftl_cycle + 3) * 2;
> +	else
> +		temp = clkin / op_clk - 8 - t_ftl_cycle;
>  	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
>  		temp -= t_ftl_cycle;

Could you please make this:

	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
		...
	else if (i2c->variant->hw == I2C_TYPE_EXYNOS7)
		...
	else
		...

For a better clarity.

Thanks,
Andi

