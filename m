Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABD8CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DxKQ091HwOaGLA1waaDj5T5yX7qs4j5b4spJIWwBpc=; b=argAkNByc6GJqsaQb6LokVhwqI
	Zu4oj9uwDi/IRGMC0UcXN7lrO1N6siT1cYz5S5TASZpWAE+jkVwrzdpG8ECXQI2MnLVEfciWCqJkp
	jGrgW1dTSDQbgMiKuwBiVyMMdf8ajt9wOFqafDbLoFdm5DaKExjs7Wjip5qTOMzfMHC1gcsAiUUtH
	TcqOk9+OuJ6HScGdQc3GRoBGAFs4KDJnC5TCJx+gddtTES9ICS8LwORoEFMvYYhhiy5M6xcU1ELKF
	R6eqSfDbwY1xN/0VQB0O1blqQURq1ynKYX5Ln15Y6fpej6F1Mp6oveFqHD/noP1GMDAVLWEqJYsJ9
	GZqaVwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMMf-0000000E3sO-1kHW;
	Sat, 13 Sep 2025 09:16:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMMe-0000000E3rv-110Z;
	Sat, 13 Sep 2025 09:16:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B94D60219;
	Sat, 13 Sep 2025 09:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF665C4CEEB;
	Sat, 13 Sep 2025 09:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757754971;
	bh=tIdpl+E9qiPpRky8s9y/LrALOp3p9zK9giky241MagU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ApP3lpejWn30G2bgA2ehbS3Ka26Z+JAlbpL80GW1VdmC2SuBpe5XIFWE5tUIpa8cX
	 gRiD3eRMAft2Sq7jzXSv4PkzkeiR86yhl5bdPiyfMgr1Ae4bwZT09VTSKACagMfQe7
	 6J4NIRmMVmzy321QEzvJL5fDRu0hT32gg/b8UzhQsdd9Nl8mz8XOkEVM2jsJGMMMXR
	 om24bPxkm8kyhvA0xOVZKVXWt9cAjdLG1MuCQzuS+e6liSRuDfY47w9+TH2x4WC1f6
	 KTkHCbGGsUVodAb4BM9hmGSX2osedxVL9d/CQksXy0aRBsP114fd7B1mDU7ALv8JDY
	 fjolwuRHLU8cw==
Date: Sat, 13 Sep 2025 10:16:04 +0100
From: Simon Horman <horms@kernel.org>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Qiqi Wang <qiqi.wang@mediatek.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	netdev@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH v2 4/4] pmdomain: mediatek: Add power domain driver for
 MT8189 SoC
Message-ID: <20250913091604.GK224143@horms.kernel.org>
References: <20250912120508.3180067-1-irving-ch.lin@mediatek.com>
 <20250912120508.3180067-5-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120508.3180067-5-irving-ch.lin@mediatek.com>
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

On Fri, Sep 12, 2025 at 08:04:53PM +0800, irving.ch.lin wrote:
> From: Irving-ch Lin <irving-ch.lin@mediatek.com>
> 
> Introduce a new power domain (pmd) driver for the MediaTek mt8189 SoC.
> This driver ports and refines the power domain framework, dividing
> hardware blocks (CPU, GPU, peripherals, etc.) into independent power
> domains for precise and energy-efficient power management.
> 
> Signed-off-by: Irving-ch Lin <irving-ch.lin@mediatek.com>

...

> diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c

...

> @@ -419,54 +848,145 @@ static void init_clks(struct platform_device *pdev, struct clk **clk)
>  		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
>  }
>  
> +static int init_subsys_clks(struct platform_device *pdev,
> +			    const char *prefix, struct clk **clk)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	u32 prefix_len, sub_clk_cnt = 0;
> +	struct property *prop;
> +	const char *clk_name;
> +
> +	if (!node) {
> +		dev_err(&pdev->dev, "Cannot find scpsys node: %ld\n",
> +			PTR_ERR(node));
> +		return PTR_ERR(node);

Hi Irving-ch,

Here node is NULL. So PTR_ERR(node) will be zero.
This is probably not what you are after here.

Flagged by Smatch

> +	}
> +
> +	prefix_len = strlen(prefix);
> +
> +	of_property_for_each_string(node, "clock-names", prop, clk_name) {
> +		if (!strncmp(clk_name, prefix, prefix_len) &&
> +		    (strlen(clk_name) > prefix_len + 1) &&
> +		    (clk_name[prefix_len] == '-')) {
> +			if (sub_clk_cnt >= MAX_SUBSYS_CLKS) {
> +				dev_err(&pdev->dev,
> +					"subsys clk out of range %d\n",
> +					sub_clk_cnt);
> +				return -EINVAL;
> +			}
> +
> +			clk[sub_clk_cnt] = devm_clk_get(&pdev->dev, clk_name);
> +
> +			if (IS_ERR(clk[sub_clk_cnt])) {
> +				dev_err(&pdev->dev,
> +					"Subsys clk get fail %ld\n",
> +					PTR_ERR(clk[sub_clk_cnt]));
> +				return PTR_ERR(clk[sub_clk_cnt]);
> +			}
> +			sub_clk_cnt++;
> +		}
> +	}
> +
> +	return sub_clk_cnt;
> +}

...

