Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DF5E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zfr8DpirdvoEOXQrS6T/lr3MXojk0w/N00w0cv96f+I=; b=2DhIV/jbsLWf1Z30TFxUfzCfhG
	yxeFE9q4rgUHEz0Rq5PTFHykHAocoBgE65PvKHXqzXiwZITP7gpddvdTeLu7S3JOuSwmHo1HtbyH/
	nIDJlwEqKy7Sgsa4iB9dRFUmvnWDRg2yCV3mcfpDCH33DyQDXmobEwe6cs6DuJsmsqDY20RA/JwSE
	KcsbuZAF1jH5Z8m0EFJk1C2WIedSImXQ1xnbDiVfzclz2Tnx+UrCeUcWnOAdSTMgOgXiBT2LcfAHC
	lwtvv2O4UgtrlLNgg9vhDxLw9JJ7PTQyqrc2r8bbdxm6orN7WvvinDmJH2u5ljAS1ZkYvQhG5ax/U
	uIpigcfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGIO-00000004VPK-1DBy;
	Mon, 13 Jan 2025 08:59:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGAK-00000004TVR-35aQ;
	Mon, 13 Jan 2025 08:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736758277;
	bh=2c6gS4kFlKAOPXXqleMPKWgxpbhFP75goYF7wGfdGW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xjl0ttwNlFVoiyfB0MsOpGJKkRVp3tPZeg0MKaXIDxJrQNpuRWv9uYfk3lZlHRwtH
	 EB8z+ja8vB//UcMZWIqSVavPvx+UhQYB0HL/oYGRv6xfD1Q8lFdl9ovv9jXkcQMWNT
	 A0tGvBYIE4pCn3r9G1ZJhVVp0f2ETZ6BwCjMj6W5Au01UjAnhEApX3SJogUbg8ZUOI
	 rxOxrTV7/5UxwB+7uiSRxd5oEJKQ/0XWndbHRs+8zS6ikKOIrPCy0pQ7Ru1cmvnRXD
	 c3J7TindwDlwzlJ1Pp/R/xrjS6k3hfQvqqNlt8kh8JuyjBBgkWFQDCNamgEnkl3XuJ
	 sYmIooGFiE4Hw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CB4117E0CD5;
	Mon, 13 Jan 2025 09:51:17 +0100 (CET)
Message-ID: <99526d14-7c54-44a0-8549-832077d1b418@collabora.com>
Date: Mon, 13 Jan 2025 09:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm/mtk-disp: change mm clock as optional
To: Bincai Liu <bincai.liu@mediatek.com>, thierry.reding@gmail.com,
 ukleinek@kernel.org, u.kleine-koenig@pengutronix.de, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
References: <20250113061506.23456-1-bincai.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250113061506.23456-1-bincai.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_005120_981162_D049C818 
X-CRM114-Status: GOOD (  14.17  )
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

Il 13/01/25 07:15, Bincai Liu ha scritto:
> mt8196 doesn't have mm clock. Make this clock optional for mt8196.
> 

This commit is okay, but you have to reflect that change in the bindings as well,
otherwise you get validation errors in devicetrees.

Cheers,
Angelo

> Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
> ---
>   drivers/pwm/pwm-mtk-disp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index bafd6b6195f6..ad7928cd607f 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -250,7 +250,7 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
>   		return dev_err_probe(&pdev->dev, PTR_ERR(mdp->clk_main),
>   				     "Failed to get main clock\n");
>   
> -	mdp->clk_mm = devm_clk_get(&pdev->dev, "mm");
> +	mdp->clk_mm = devm_clk_get_optional(&pdev->dev, "mm");
>   	if (IS_ERR(mdp->clk_mm))
>   		return dev_err_probe(&pdev->dev, PTR_ERR(mdp->clk_mm),
>   				     "Failed to get mm clock\n");



