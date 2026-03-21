Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AC71094471
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/Li37CFcYLgbFR87E87mIapIOdNvQUXUFLJiye1QzA=; b=p+U9dt68UWmKfiznppt2YKLk2K
	pUIQ3WjgFac+u4Vxzk4t71kh+EqbxzCtyO5sNs3yejArgnGkM2IDEKhFFC0qESPDDFeBBy0qPPA7u
	rBJsErl6v27eUvBt3HokJEbw6iSr0PyjH/lgqmYvzZgX4gpIDi8thN2ZRwvHtAl1PlP3RaXEIKiIW
	HOdCpnOL3wCefrreaOCS3VH28Rp+nqG14fCIqxGuhLlvV0q2nHYw4CcD+jFmbp4AeihoGsKMhcuDt
	e2sCj8uR4MsLSNd4yqfkiveEJVxeJQmcq7tmrs55G7WCEHYOK9e76Q1awTo3IlIgnOLFRnLhNrTnd
	jR6TfFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3wBu-0000000EURK-3dpj;
	Sat, 21 Mar 2026 13:16:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3wBr-0000000EUQE-0C4l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 13:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1E38600AE;
	Sat, 21 Mar 2026 13:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E63C2BC9E;
	Sat, 21 Mar 2026 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774098989;
	bh=XGJlUmcRlQlhuP5rPXLuUIt50ngnX4Bt2Gf5B+jT+QI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=fsadhLc/UJ1rYXEjHa8WYhh25IJ0d9IMkJiUVUKBiU4jJvbmR3jpoSM4XmeIviyWa
	 ZGawNOnLI75SzPcSp1aghNhmFsueguEJoaJioQKmTJW6/2/6wMflocPxpijRwGr+BG
	 vMorOi/rM5jQDHLaSCYqNoGQZwcd3JfIHSPxw9aUG/fh0Ywy8e7yMsk6F756PwZ/K+
	 KqAb4z0NlLh/ZVn3Zm+Sri9sVLJGQ7T1h3HnVSnLopmVk9BW+TBVAA2cqbGW/X0haJ
	 GMxziG0GYXVAhLnss8o7pUJp9mXihIrq2txTmgUiFb0Xv1XPKcRyiKHxQ/mZe1e0Aq
	 Yt/L9aoPWBG0w==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260318-gs101-pd-v8-5-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <20260318-gs101-pd-v8-5-241523460b10@linaro.org>
Date: Sat, 21 Mar 2026 14:16:13 +0100
Message-Id: <177409897341.266364.2957933304869869135.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=786; i=krzk@kernel.org;
 h=from:subject:message-id; bh=XGJlUmcRlQlhuP5rPXLuUIt50ngnX4Bt2Gf5B+jT+QI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpvpojuKYNxKTqSPmYkCXwPAMz7e4p7M984Rs8a
 h8L0Bd6kgWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCab6aIwAKCRDBN2bmhouD
 15O5D/9EFq647Yu08VaqtAFPQQcLGdcLidlcH9kBEYxcQaQXsIciPI6hNWeWjwAjRzCvm0y/F7H
 3zPp+X9XeKoe6jjHfMRRiRe7wLKxLBf9iAqdsdSn+5B46AND4VtTnluRsVlI8ecIQCqy+xNAFy7
 z8OfHUtr0f4d0nQduwX7JjOxG/e4jyeyrh6fws1hSKmXj6lEX0SsvYflT94W1AVnNQir5+1Cyx2
 Qo/LUre8Momr928vzgpsbhytmWBSSCBRgrxLgP1t+aLI7md/VA5Gy6XLZxMBQ0ZfUEmfAkOXI6A
 ckiKYLaNPhnp0LLbJojffAcm8bewU3CDKdxFKY55U8WucuYp85gl59PYafFXEMXMLjb8UOrfpKm
 SCChEC9fSMUMIETcBqQBotJLqCM0UAegJs4BZmFDPxZDTMpaBZLRTWAfPqK8vOlkq7eCyLWfPZX
 BSbdXHPz/DGrHBUCCGLz1lSDKSYPyvfbbG8UIn1xTjc4l+yGq22piOik6jIk9jL/7tP2AyBxBRG
 /DDOO3YNPp0DDI26a0BBJkdiYIg60TkMFiCkSpHxvpr/T32hgEjvvblgXNGBKPtiBhn5MAv4/xS
 UIRvsp72mXyRvFN7N1QmhvL41QU/QIfmQFJ85qdr7Xu//VYX3Cy88nhs0WfmJAlSPwYdDg/E5ql
 F1mcKOPEcsVM38Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

On Wed, 18 Mar 2026 15:27:50 +0000, André Draszik <andre.draszik@linaro.org> wrote:
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
> index 5c3aa8983087..68b1e7ba8729 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -120,9 +140,26 @@ static int exynos_pd_probe(struct platform_device *pdev)
> [ ... skip 20 lines ... ]
> +
> +	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
> +	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
> +	if (IS_ERR(pd->regmap))
> +		return dev_err_probe(dev, PTR_ERR(base),
> +				     "failed to init regmap\n");

PTR_ERR(pd->regmap)

-- 
Krzysztof Kozlowski <krzk@kernel.org>

