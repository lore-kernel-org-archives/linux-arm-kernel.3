Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696EEFCC065
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX70eqTPldRVlnp6TbQSbemdGWZN5RJN1ptIeYYKtG8=; b=2xYnUT745RbMXShtTFRKzt7Zwq
	5Es+UhMDIIvJslIjxkWvqOBtmzL6acnSlmjQ+1b9lR24raQp+WRMXzQgCp+7bkrstcCazVitO3mmn
	873kDzjWEd3t3LGkkTRAzy9knQXzEyTzl+azX6cPs+6wKcTro2GXrVg3Gue0LU8jjU7uQjyOpy8fd
	6C17Y18iIsoWFL8A2IKfYueidoDndGREDUrCTljbcuumNO5bfkWIpI/suFYdgICNryvyASaCMkLHI
	0VbdqxpV2+tcmsVJvyqgrwN3Gv9hM3yRncuz8S60Yub05B+NbkxYyVxhxHChfUIkUaAC+jFr/uVuW
	A7u9V+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyacu-00000004Njx-1f0E;
	Fri, 06 Mar 2026 19:14:20 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyacr-00000004Nil-3gn3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:14:18 +0000
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id yY3QvBxHtKXDJyacqvpEI9; Fri, 06 Mar 2026 19:14:16 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id yacovGV2l2l0kyacovIce6; Fri, 06 Mar 2026 19:14:14 +0000
X-Authority-Analysis: v=2.4 cv=UfRRSLSN c=1 sm=1 tr=0 ts=69ab2788
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=4KyMBbRfhRQTWuXm2KoA:9 a=QEXdDO2ut3YA:10
 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UX70eqTPldRVlnp6TbQSbemdGWZN5RJN1ptIeYYKtG8=; b=tscGF14g6RrBEKmnC12nH+q23r
	Saqh4tVvRYVfYwGG4W9VhMRiHBWi0hqEEUGmgZC8Ukq0nxhBVO+eQTUWRCYyOkOkzBY86UKY7JmcT
	xeYajce0NP1LNBRReeW4AOK+oU5cHpOHowWYex2w0ckcKWT7blQZrrp2Sd7VuTPXM6/TKUcqvzsXG
	9GT/bFcd2K8QFTC86ivNaAq+YrQrK2bZxAuXgqZQx+r/iSx35D+TU2Wur7+pnN99AWbYsBnUN9E8j
	71MyrgfhpLgiq+QMZaG8wU73aJmO8mSCyREaynLGLrekKMTE6Ce01pPEMXZxukz7m4imiwkcpTuio
	Y5vRmDcA==;
Received: from [177.238.16.13] (port=46342 helo=[192.168.0.21])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vyacn-000000018a0-0TQQ;
	Fri, 06 Mar 2026 13:14:13 -0600
Message-ID: <1b50b40e-6682-4156-a60a-c2725527d648@embeddedor.com>
Date: Fri, 6 Mar 2026 13:13:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: mediatek: xsphy: reduce main allocation
To: Rosen Penev <rosenp@gmail.com>, linux-phy@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-mediatek@lists.infradead.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260304043420.14151-1-rosenp@gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260304043420.14151-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1vyacn-000000018a0-0TQQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.21]) [177.238.16.13]:46342
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 14
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDgzM/zufDQjJMxLGsqArwjO9qdAOl4p9Qyp9Hqrc4FXh/k8KLJD8TxJB6pfrnaAWajy1BKd0jld01aOg2gQcHiRD2fB9xECBvDZybL0pjdEtxFWUOfi
 r8qT4+CnM2LqCcfxB1guu3scZTrTEPNzOA5ETpuxnwfskCICV3oyXNO7QrUdt7UfF8riQ/lu0ZqtQ3aC7QgEeCTG6Um9EyDMRkg0rYdJquRNyOLoFcWJb9h3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_111417_978819_5D693F62 
X-CRM114-Status: GOOD (  12.62  )
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



On 3/4/26 13:34, Rosen Penev wrote:
> Instead of kzalloc and kcalloc, we can use a flex array to reduce to a
> single allocation.
> 
> Also added __counted_by() for extra possible analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-Gustavo

> ---
>   drivers/phy/mediatek/phy-mtk-xsphy.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
> index c0ddb9273cc3..cc1d66954212 100644
> --- a/drivers/phy/mediatek/phy-mtk-xsphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
> @@ -112,10 +112,10 @@ struct xsphy_instance {
>   struct mtk_xsphy {
>   	struct device *dev;
>   	void __iomem *glb_base;	/* only shared u3 sif */
> -	struct xsphy_instance **phys;
> -	int nphys;
>   	int src_ref_clk; /* MHZ, reference clock for slew rate calibrate */
>   	int src_coef;    /* coefficient for slew rate calibrate */
> +	int nphys;
> +	struct xsphy_instance *phys[] __counted_by(nphys);
>   };
>   
>   static void u2_phy_slew_rate_calibrate(struct mtk_xsphy *xsphy,
> @@ -515,18 +515,15 @@ static int mtk_xsphy_probe(struct platform_device *pdev)
>   	struct resource *glb_res;
>   	struct mtk_xsphy *xsphy;
>   	struct resource res;
> +	size_t nphys;
>   	int port;
>   
> -	xsphy = devm_kzalloc(dev, sizeof(*xsphy), GFP_KERNEL);
> +	nphys = of_get_child_count(np);
> +	xsphy = devm_kzalloc(dev, struct_size(xsphy, phys, nphys), GFP_KERNEL);
>   	if (!xsphy)
>   		return -ENOMEM;
>   
> -	xsphy->nphys = of_get_child_count(np);
> -	xsphy->phys = devm_kcalloc(dev, xsphy->nphys,
> -				       sizeof(*xsphy->phys), GFP_KERNEL);
> -	if (!xsphy->phys)
> -		return -ENOMEM;
> -
> +	xsphy->nphys = nphys;
>   	xsphy->dev = dev;
>   	platform_set_drvdata(pdev, xsphy);
>   


