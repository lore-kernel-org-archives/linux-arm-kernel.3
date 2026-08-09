Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86484C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 14:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FikuqY3b2pZlaNCLUbHPKWMhWQP0Tun7aZ9UkowPV+8=; b=zQyDjDqLvGoBXPQjK3TcJS0hfS
	nvd5OgsCWcAjHQdsiZXqClDyO6cuvRcvjjz+bSL5sk8PNubOD51aplLMp9apSaqTZk+kXnS2fbBv/
	J0AHtqzKQkuN5OZNRIHgRthBiw116hRQ0a2jGkvZ4YMtIuTzmKVwjSjQctKKchdvS3szEH9NuN4Cj
	/5v8Sl2UHbXPJJErYPFNPDKoEpw3LJqC4RMOqw8FNdvLhOm5NlpGLSNHlHYmfCsazX4EKcEFTtkDK
	3Zzxco5CRFgnvaoHL373GPqHNjdXzerELodDa73wcv401OMgn66TxpD2wV8uIRvVdS6sluYxW1Po0
	NChuk+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt4YN-0000000AO6S-3NND;
	Sun, 09 Aug 2026 14:31:07 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt4YK-0000000AO5w-2SRp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 14:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1786285861;
 bh=FikuqY3b2pZlaNCLUbHPKWMhWQP0Tun7aZ9UkowPV+8=;
 b=maN5hljmqBA/eWL3Cr9d5vh9X/mZqFD5GqYivB2m/kdpHR27URBfWJNipLQukzq8VRLnlaOoK
 kqJeK91L7BxUiL/3EzkXG6V1BUwPafQjRVLX01m6FNLuyGikALWMOVR+H7C/mZ7Q5UP3C7kZyjP
 18L7rvfgRqCOizdyD/ohrGUqqjDzlumHdsIO/ygBc9TWpVomrNtp3VRjKTzNdtGWwRNSx0nuglF
 Afe+oODD/juC6YYvWapCJSHKbh0hxywuzD4pL7Acfe4F1eXOM+8gCzKnLWslEfDrMZFy5F34eDv
 Z1O0G15zRBHC0Hx+0cQKrT7QMmoljyS+2jco9hI99fgA==
X-Forward-Email-ID: 6a788f1b2fa0fb6ccea01ae2
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.13.10
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 09 Aug 2026 10:30:49 -0400
Message-Id: <DKKHHITWR3F4.390HXQFLQR8X5@ubuntu.com>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] reset: Add Apple SoC CIO reset driver
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal
 Gompa" <neal@gompa.dev>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>
X-Mailer: aerc 0.21.0
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-2-4f33777d9b4b@kernel.org>
In-Reply-To: <20260809-b4-cio-reset-v1-2-4f33777d9b4b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_073104_899596_F1E4279B 
X-CRM114-Status: GOOD (  17.16  )
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

On Sun Aug 9, 2026 at 8:16 AM EDT, Sven Peter wrote:
> Add a driver for the reset of the CIO (USB4/Thunderbolt) blocks on
> Apple Silicon SoCs which has to be deasserted before their
> co-processor can be booted. On t8103 each port comes with a dedicated
> register page while t600x uses a single register with one request bit
> per port shared by all ports of a die inside the PMGR MMIO region.
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  MAINTAINERS                     |   1 +
>  drivers/reset/Kconfig           |  10 +++
>  drivers/reset/Makefile          |   1 +
>  drivers/reset/reset-apple-cio.c | 182 ++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 194 insertions(+)

> +
> +static int apple_cio_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct apple_cio_reset *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->variant =3D of_device_get_match_data(dev);

Might be a dumb question, but does priv->variant also need to be
checked? Because later priv->variant->pmgr_child is and I *think*
it could return NULL.

(Or is this not necessary since in theory the device should only run
this if detected... so this should never be an issue?)

> +
> +	ret =3D devm_mutex_init(dev, &priv->lock);
> +	if (ret)
> +		return ret;
> +
> +	if (priv->variant->pmgr_child) {
> +		priv->regmap =3D syscon_node_to_regmap(dev->of_node->parent);
> +		if (IS_ERR(priv->regmap))
> +			return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +					     "Failed to get parent regmap");
> +
> +		ret =3D of_property_read_u32(dev->of_node, "reg", &priv->offset);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to read reg offset");
> +	} else {
> +		void __iomem *base;
> +
> +		base =3D devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
> +
> +		priv->regmap =3D devm_regmap_init_mmio(dev, base,
> +						     &apple_cio_reset_regmap_config);
> +		if (IS_ERR(priv->regmap))
> +			return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +					     "Failed to init MMIO regmap");
> +	}
> +
> +	priv->rcdev.owner =3D THIS_MODULE;
> +	priv->rcdev.ops =3D &apple_cio_reset_ops;
> +	priv->rcdev.of_node =3D dev->of_node;
> +	priv->rcdev.nr_resets =3D priv->variant->nr_resets;
> +
> +	return devm_reset_controller_register(dev, &priv->rcdev);
> +}
> +
> +static const struct of_device_id apple_cio_reset_match[] =3D {
> +	{
> +		.compatible =3D "apple,t8103-cio-reset",
> +		.data =3D &apple_t8103_cio_reset,
> +	},
> +	{
> +		.compatible =3D "apple,t6000-cio-reset",
> +		.data =3D &apple_t6000_cio_reset,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, apple_cio_reset_match);
> +
> +static struct platform_driver apple_cio_reset_driver =3D {
> +	.driver =3D {
> +		.name =3D "apple-cio-reset",
> +		.of_match_table =3D apple_cio_reset_match,
> +	},
> +	.probe =3D apple_cio_reset_probe,
> +};
> +module_platform_driver(apple_cio_reset_driver);
> +
> +MODULE_AUTHOR("Sven Peter <sven@kernel.org>");
> +MODULE_DESCRIPTION("Apple SoC CIO block reset driver");
> +MODULE_LICENSE("Dual MIT/GPL");


