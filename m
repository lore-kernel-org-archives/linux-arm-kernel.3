Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F889C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 22:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uS+RCfKyjG2UtT4+awjQRyRPyTMRZoUZeNGtWmbYJPA=; b=Gppm0Tx/m/ZIDmX++mfIjBmh34
	q5GXdbYNTm14RciY8OtLH64MggkRKd7oc3/a7dZoSIk66Xw5LVFlDAony+CKnVQsadM1hMov+2KVh
	KmOcHCA7up6Y2zzYGQKcSXpLRAORMNiHwwKLG8P+e4Ym2VMfT8xltO7oxGzMfOp+0mh5x0pSN7MYe
	4ZHc716RwVmg2kwn0lFj1vthq4t1saKU61WIyIh64EuVERd1RiC14AznslUhOxmRKlOC1INJb+dFM
	1qVZH0iRyHOi51WhS5ttKTGWMJ1CSq5tqH4et/3H9MJDnCHK0UfRjzX0q4F4Sn78A78MKHVV6MTWW
	OGfCsr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkGK-00000004cJR-0Ad3;
	Wed, 05 Aug 2026 22:39:00 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkGH-00000004cJ3-2amv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 22:38:58 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hFlgx2py8zMlH2;
	Thu, 06 Aug 2026 00:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785969533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uS+RCfKyjG2UtT4+awjQRyRPyTMRZoUZeNGtWmbYJPA=;
	b=Csf9NuPUw00gLrfyzQpMvzedX0iF5woxs6AsivUK3fODBr/XLypjdeQgDq8UMF1Dw3DMHD
	QdWCzMYs/AXDgbmp6veIJWmlwG6QzhimzwxZPPEL4qwtLzMdDMut47kb180pVf2WAY3HhA
	G7l0lspMaE/nrnKj1Mwr46i+vKiy/worVbkZCCo/8L7UARVc1mfRXr8UZzb70vNN4R0xow
	m1vnQZHcQ/91YoSRewdVdBQRCK8IX6sYjNA788Sxh856Xk7Zs+3Msm27FXAFGdQfOz1Y4Q
	YI/QyD9et2mr5rQcu5tvxm2CubXt2BwFtcAu2/cj2ffCA+AeWKeN8LPDAX0DJw==
Message-ID: <0124d3a3-81dc-44ce-88a2-9426c65ac46c@mailbox.org>
Date: Thu, 6 Aug 2026 00:38:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1785941595.git.geert+renesas@glider.be>
 <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a370a64fff6b4dfe338
X-MBO-RS-META: 355w3c5a4crihgw76irh7wwwrs3zhmwk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_153857_808992_29BBB1B6 
X-CRM114-Status: GOOD (  15.58  )
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

On 8/5/26 5:20 PM, Geert Uytterhoeven wrote:

Hello Geert,

[...]

> +DEFINE_MDLC_RESET_WRAPPER(reset)
> +DEFINE_MDLC_RESET_WRAPPER(assert)
> +DEFINE_MDLC_RESET_WRAPPER(deassert)
> +DEFINE_MDLC_RESET_WRAPPER(status)
> +
> +static const struct reset_control_ops r8a78000_mdlc_reset_ops = {
> +	.reset = r8a78000_mdlc_reset,
> +	.assert = r8a78000_mdlc_assert,
> +	.deassert = r8a78000_mdlc_deassert,
> +	.status = r8a78000_mdlc_status,
> +};

Please keep the list sorted alphabetically.

> +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> +				    struct device *dev)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct r8a78000_mdlc_priv *priv;
> +	struct of_phandle_args pd_spec;
> +	const struct mod_map *map;
> +	unsigned int id;
> +	int ret;
> +
> +	ret = of_parse_phandle_with_args(np, "power-domains",
> +					 "#power-domain-cells", 0, &pd_spec);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (pd_spec.args_count != 2) {
> +		of_node_put(pd_spec.np);

Maybe some "goto error" fail path which does of_node_put() wouldn't hurt 
here, since the of_node_put() is duplicated in here multiple times.

> +		return -EINVAL;
> +	}
> +
> +	scoped_guard(mutex, &r8a78000_mdlc_lock) {
> +		hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> +			if (priv->np == pd_spec.np)
> +				break;
> +		}
> +	}
> +
> +	if (!priv) {
> +		dev_err(dev, "%s: MDLC %pOF not found\n", __func__, pd_spec.np);
> +		of_node_put(pd_spec.np);
> +		return -ENODEV;
> +	}
> +
> +	id = pd_spec.args[1];
> +	of_node_put(pd_spec.np);
> +
> +	map = mod_map_find(priv->mod_map, id);
> +	if (!map) {
> +		dev_err(dev, "Unknown module 0x%x\n", id);
> +		return -ENOENT;
> +	}
> +
> +	dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> +	return 0;
> +}

[...]

> +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct r8a78000_mdlc_priv *priv;
> +	const struct mdlc_info *info;
> +	struct resource *res;
> +	int ret;
> +
> +	ret = r8a78000_genpd_always_on_singleton(dev);
> +	if (ret)
> +		return ret;
> +
> +	info = of_device_get_match_data(dev);
> +	if (!info)
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->np = np;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	for (; info->base; info++) {
> +		if (info->base == res->start)
> +			break;
> +	}
> +
> +	if (!info->base) {
> +		dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res->start);

return dev_err_probe() might be more appropriate here, even if that 
would be more chatty until the support for various MDLC nodes lands.

Some dev_info_probe() would be even better, but we don't have that.

[...]

