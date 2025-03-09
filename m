Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5C2C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHea8PmPDTeNeLkkCyL7fF90d0PRsdlWXm0yd05eBrY=; b=vMLqeA45k7ThGYnAkbRU6QROlK
	gihBEhcV+upB7Z8Ezvy4qM77emqYhx1sro3HJXfzL7tS/YDEsVK9MQDx8W/MKkgiP7kvqI3iNaXPf
	GBWJBZcvE3JwSJS6qOJ0nEUvG1Cc7ZPx01aYBauv0u0KH/n8xGuyQV1bKH26/Qtjk8KdjftZXuvN/
	cJQoU5qvvFw/MIIDfxJ9IaqCQk5F5cK3z6UTqRZm3O/tk3W1W0eVByhPeLBsawcaX+o2f6hLPRunH
	5MojZefj/0vapEAQUw0yaqng9XWy2xcGe2YadG+N0i7SgTt0WDDSZDRCDELHCgMlPeBeKXUC9OMzf
	3UdnsilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAYb-000000004wi-1eDk;
	Sun, 09 Mar 2025 06:54:41 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAWi-000000004me-1IQa;
	Sun, 09 Mar 2025 06:52:46 +0000
X-QQ-mid: bizesmtpip2t1741503090t8sbs1w
X-QQ-Originating-IP: XwhKMfl3zf720/W1DEA9jiyONxzExdR32tccPWBx8ps=
Received: from [IPV6:240f:10b:7440:1:893e:bed3 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 09 Mar 2025 14:51:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12559739766669339929
Message-ID: <4F8F58DC9699ED12+95e301f9-a9f1-4f6b-8b8f-21c6c1df5cc2@radxa.com>
Date: Sun, 9 Mar 2025 15:51:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/bridge: synopsys: Add DW DPTX Controller support
 library
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Cc: neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
 devicetree@vger.kernel.org, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-3-andyshrk@163.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250223113036.74252-3-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N4WhQbLQyIqS188IzcypNGG75bD7D7grAHlZbfB5iQ737s2ShidHPf3W
	D24PZj6r/6fo1zR2GVFe7nBZap1F332I3LLeXM28iN/kWjEoyUfqulM4bH9FWFsl5S0T6ww
	qNyPAr6p9XGHZJFvYmDKzwYG/htRkFuieVUWJbHyXGS5WC+EwowByO9PyG0cNPd9LJlyMh2
	PuxPJWcIq+1FvoeOQsbwGr7tRrp3sMHL/ScmimrdwU0WheNOQ3fLL4pnuOl9I8rQwPhNadZ
	1hPmlBtpS1L4xzD7k8wg7SQ4gd6IktVan1U5PFxv0pMWdJXwVnWJyOCS5fhPVPs9zR9l5we
	fCDkk2XQvQTM08CQ6v6RaceEyHnm0sLXfODMJx2VO9U1mToOiEYJCRZXkkSPfYr2kih3M+Z
	MbzGu2cvQZ6iEe2jmvFpy2gPQBK8vij/LYnb1NrHRtvF6LyUJIsjv0/ibQMRB2uARsDwBZh
	mX/IYyt/lY/uHnPquQvDyKrWB8FD/d8K5D9Y6SQXrkLmAEw16mTKoivN13ejc+YKVi3hdFQ
	m2TOSrPI5klyA9RJB6vuR6db4gwtrCL48YhX/KxXMdKlqw2+SENy90n0HWQm0L7wqA9jbVN
	Nc3/JElAHGMkqWWMLX7NoXshqNEnM9lFs2d/TA6CfoTB9G6hIkKo2h4cnECT/ByTLfUOVIl
	P6CXFU2iK34H3di42fvDo2RJjUzZ5BI+ZezGZgdZAFn/QBQ7d3RqeuKSzy7RoOvDgcWSCPs
	uSHWV7LbrW4AzkW9k9Gg4ETOvtI5WVRPGvaX0zvLqS+0zvIzuHK3Ry41RKpO6zDgo+9QFwq
	GfOIA4JUks/+t+lanrl1b+VH2odcLYnqYzUV6qYTWiS6Uk51kO+NGQAl0LQVUvtGrGn5YVd
	K4UF1MK7y/H6OOVnAzbdkGtEU8+orOekqPwsNjujZyMP86lPYx0FZg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_225244_870264_DA52F232 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

Hi Andy,

On 2/23/25 20:30, Andy Yan wrote:
(snip)
> +struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
> +			 const struct dw_dp_plat_data *plat_data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dw_dp *dp;
> +	struct drm_bridge *bridge;
> +	void __iomem *res;
> +	int ret;
> +
> +	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
> +	if (!dp)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dp->dev = dev;
> +	dp->video.pixel_mode = DW_DP_MP_QUAD_PIXEL;
> +
> +	dp->plat_data = plat_data;
> +	bridge = &dp->bridge;
> +	mutex_init(&dp->irq_lock);
> +	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);
> +	init_completion(&dp->complete);
> +
> +	res = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(res))
> +		return ERR_CAST(res);
> +
> +	dp->regmap = devm_regmap_init_mmio(dev, res, &dw_dp_regmap_config);
> +	if (IS_ERR(dp->regmap)) {
> +		dev_err_probe(dev, PTR_ERR(dp->regmap), "failed to create regmap\n");
> +		return ERR_CAST(dp->regmap);
> +	}
> +
> +	dp->phy = devm_of_phy_get(dev, dev->of_node, NULL);
> +	if (IS_ERR(dp->phy)) {
> +		dev_err_probe(dev, PTR_ERR(dp->phy), "failed to get phy\n");
> +		return ERR_CAST(dp->phy);
> +	}
> +
> +	dp->apb_clk = devm_clk_get_enabled(dev, "apb");
> +	if (IS_ERR(dp->apb_clk)) {
> +		dev_err_probe(dev, PTR_ERR(dp->apb_clk), "failed to get apb clock\n");
> +		return ERR_CAST(dp->apb_clk);
> +	}
> +
> +	dp->aux_clk = devm_clk_get_enabled(dev, "aux");
> +	if (IS_ERR(dp->aux_clk)) {
> +		dev_err_probe(dev, PTR_ERR(dp->aux_clk), "failed to get aux clock\n");
> +		return ERR_CAST(dp->aux_clk);
> +	}
> +
> +	dp->i2s_clk = devm_clk_get(dev, "i2s");
> +	if (IS_ERR(dp->i2s_clk)) {
> +		dev_err_probe(dev, PTR_ERR(dp->i2s_clk), "failed to get i2s clock\n");
> +		return ERR_CAST(dp->i2s_clk);
> +	}
> +
> +	dp->spdif_clk = devm_clk_get(dev, "spdif");
> +	if (IS_ERR(dp->spdif_clk)) {
> +		dev_err_probe(dev, PTR_ERR(dp->spdif_clk), "failed to get spdif clock\n");
> +		return ERR_CAST(dp->spdif_clk);
> +	}
> +
> +	dp->hdcp_clk = devm_clk_get(dev, "hdcp");
> +	if (IS_ERR(dp->hdcp_clk)) {
> +		dev_err_probe(dev, PTR_ERR(dp->hdcp_clk), "failed to get hdcp clock\n");
> +		return ERR_CAST(dp->hdcp_clk);
> +	}
> +
> +	dp->rstc = devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(dp->rstc)) {
> +		dev_err_probe(dev, PTR_ERR(dp->rstc), "failed to get reset control\n");
> +		return ERR_CAST(dp->rstc);
> +	}
> +
> +	dp->irq = platform_get_irq(pdev, 0);
> +	if (dp->irq < 0)
> +		return ERR_PTR(ret);
> +
> +	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
> +					IRQF_ONESHOT, dev_name(dev), dp);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to request irq\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	bridge->of_node = dev->of_node;
> +	bridge->funcs = &dw_dp_bridge_funcs;
> +	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> +	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
> +	bridge->ycbcr_420_allowed = true;
> +	bridge->vendor = "Synopsys";
> +	bridge->product = "DW DP TX";
> +
> +	platform_set_drvdata(pdev, dp);
> +
> +	dp->aux.dev = dev;
> +	dp->aux.drm_dev = encoder->dev;
> +	dp->aux.name = dev_name(dev);
> +	dp->aux.transfer = dw_dp_aux_transfer;
> +	ret = drm_dp_aux_register(&dp->aux);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Aux register failed\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		dev_err_probe(dev, ret, "Failed to attach bridge\n");
> +
> +	dw_dp_init_hw(dp);
> +
> +	return dp;
> +}

EXPORT_SYMBOL_GPL(dw_dp_bind);

is required to build it as a module.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

