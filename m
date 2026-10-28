Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04142606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 14:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0I+Q2H0O;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PrNxJIoI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+vj3JXaH73DAc9DdU35ASSRyg7WAvYyKv+vce4COULM=; b=0I+Q2H0OSLUwD4
	VbXKdYrzc1waK/9X9sjqVjwru7ZOIh3hTeiDIvjH05OFhjNyezM86ylMV+xSsV/CzprWt4s3X3HMA
	LxT2GJ9mB3P9q/f9bRVhkCsPW6yeijoa+W6IrUoCYafvw/CDBfW5D4G6Ae4kmzfSqUomeNjXowVNs
	HjXioAbg8EJjmVbJhlQzJ1UwS7Ek/H9OcRXKrGSLr0InxR+3mm5M1nnWQ2IyVIOLRdtVXYAOvNjhJ
	z9hbgQEjJLD3zNU7WDB+F/ktewH9YAGrX/bmNXKdmXmTDpBOF3B0oavCsiLuY1aVoJxS6DDGaK8Vu
	kO8Bhk272v0/yWlBZUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4hk-00000007Cw8-3kTT;
	Wed, 28 Oct 2026 14:32:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4hh-00000007CvI-12Pj;
	Wed, 28 Oct 2026 14:32:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7601CC4FED2;
	Wed, 28 Oct 2026 14:33:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F5B860769;
	Wed, 28 Oct 2026 14:32:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3E6B103290D1;
	Wed, 28 Oct 2026 15:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793197945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+vj3JXaH73DAc9DdU35ASSRyg7WAvYyKv+vce4COULM=;
	b=PrNxJIoIaUyhY8Zqt4SrJf4ec9/mtkg2tiyqW/XNHd1snpJ3Ho9quFY5u9M6HNrg3pe4DJ
	rEoBT0F3Mq7YaJMxOzPhZiJ4KGmGoe9sjxvUOuV2n6qPLG2XzN05gBCubNZ1sHNqWnQBXl
	LRmFcPNn37UP3qhOdV3tjyLwibLn8KorGjx5y5VWBzsoxMT0/oVLBKudz/EmG0A7o/PPWW
	NCdUf//rOnMSiE3qewS9q2nksK0+jikBkQsq+OemhIk3kyGwTEiL22QBuFxNfXE8gQEKmN
	rA5dGwbBYGMHOdRe/O2j379Co6IiS+ImdN4CA5Dgx96FKJwh3EawJv7Nihzgsw==
Message-ID: <880e67e2-3f29-4dfd-84ee-09006dc86574@bootlin.com>
Date: Wed, 28 Oct 2026 15:32:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/20] pinctrl: berlin: add optional pinconf support
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Andi Shyti
 <andi.shyti@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-13-jszhang@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20260929061417.20733-13-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_073237_468187_09723823 
X-CRM114-Status: GOOD (  26.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Le 29/09/2026 à 08:14, Jisheng Zhang a écrit :
> Add pinconf support for newer Synaptics SoCs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/pinctrl/berlin/berlin.c | 232 +++++++++++++++++++++++++++++++-
>   1 file changed, 228 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
> index 0c2179b98629..06c67f00c527 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
> @@ -13,6 +13,8 @@
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/of_device.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinconf.h>
>   #include <linux/pinctrl/pinctrl.h>
>   #include <linux/pinctrl/pinmux.h>
>   #include <linux/platform_device.h>
> @@ -20,9 +22,24 @@
>   #include <linux/slab.h>
>   
>   #include "../core.h"
> +#include "../pinconf.h"
>   #include "../pinctrl-utils.h"
>   #include "berlin.h"
>   
> +#define PINCFG_DS_10BIT		GENMASK(3, 0)
> +#define PINCFG_IE_10BIT		BIT(4)
> +#define PINCFG_PE_10BIT		BIT(5)
> +#define PINCFG_PS_10BIT		BIT(6)
> +#define PINCFG_SL_10BIT		BIT(7)
> +#define PINCFG_SPU_10BIT	BIT(8)
> +#define PINCFG_ST_10BIT		BIT(9)
> +#define PINCFG_DS_8BIT		GENMASK(2, 0)
> +#define PINCFG_IE_8BIT		BIT(3)
> +#define PINCFG_PD_8BIT		BIT(4)
> +#define PINCFG_PU_8BIT		BIT(5)
> +#define PINCFG_SL_8BIT		BIT(6)
> +#define PINCFG_ST_8BIT		BIT(7)
> +
>   struct berlin_pinctrl {
>   	struct regmap *regmap;
>   	struct device *dev;
> @@ -56,6 +73,8 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
>   	struct property *prop;
>   	const char *function_name, *group_name;
>   	unsigned reserved_maps = 0;
> +	unsigned long *configs = NULL;
> +	unsigned int num_configs = 0;
>   	int ret, ngroups;
>   
>   	*map = NULL;
> @@ -75,11 +94,19 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
>   		return -EINVAL;
>   	}
>   
> +	ret = pinconf_generic_parse_dt_config(node, pctrl_dev, &configs,
> +					      &num_configs);
> +	if (ret < 0) {
> +		dev_err(pctrl->dev, "%s: could not parse node property\n",
> +			node->name);
> +		return ret;
> +	}
> +
>   	ret = pinctrl_utils_reserve_map(pctrl_dev, map, &reserved_maps,
> -					num_maps, ngroups);
> +					num_maps, ngroups * (num_configs + 1));
>   	if (ret) {
>   		dev_err(pctrl->dev, "can't reserve map: %d\n", ret);
> -		return ret;
> +		goto exit;
>   	}
>   
>   	of_property_for_each_string(node, "groups", prop, group_name) {
> @@ -88,11 +115,22 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
>   						function_name);
>   		if (ret) {
>   			dev_err(pctrl->dev, "can't add map: %d\n", ret);
> -			return ret;
> +			goto exit;
> +		}
> +
> +		if (num_configs) {
> +			ret = pinctrl_utils_add_map_configs(pctrl_dev, map,
> +					&reserved_maps, num_maps, group_name,
> +					configs, num_configs,
> +					PIN_MAP_TYPE_CONFIGS_GROUP);
> +			if (ret < 0)
> +				goto exit;
>   		}
>   	}
>   
> -	return 0;
> +exit:
> +	kfree(configs);
> +	return ret;
>   }
>   
>   static const struct pinctrl_ops berlin_pinctrl_ops = {
> @@ -177,6 +215,191 @@ static const struct pinmux_ops berlin_pinmux_ops = {
>   	.set_mux		= &berlin_pinmux_set,
>   };
>   
> +static int berlin_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
> +				    unsigned int group, unsigned long *configs)
> +{
> +	enum pin_config_param param = pinconf_to_config_param(*configs);
> +	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
> +	const struct berlin_desc_group *group_desc = pctrl->desc->groups + group;
> +	bool enabled;
> +	u32 val;
> +	int ret;
> +	u8 conf_bits = group_desc->conf_bits;
> +
> +	if (!conf_bits)
> +		return -EOPNOTSUPP;
> +
> +	ret = regmap_read(pctrl->regmap, group_desc->conf_offset, &val);
> +	if (ret)
> +		return ret;
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		if (conf_bits == 10)
> +			enabled = !(val & PINCFG_PE_10BIT);
> +		else
> +			enabled = !(val & (PINCFG_PD_8BIT | PINCFG_PU_8BIT));
> +		val = 0;
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		if (conf_bits == 10)
> +			enabled = (val & (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) == PINCFG_PE_10BIT;
> +		else
> +			enabled = val & PINCFG_PD_8BIT;
> +		val = enabled ? 1 : 0;
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		if (conf_bits == 10) {
> +			if ((val & (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) == (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) {
> +				enabled = true;
> +				if (val & PINCFG_SPU_10BIT)
> +					val = 2;
> +				else
> +					val = 1;
> +			} else {
> +				enabled = false;
> +				val = 0;
> +			}
> +		} else {
> +			enabled = val & PINCFG_PU_8BIT;
> +			val = enabled ? 1 : 0;
> +		}
> +		break;
> +	case PIN_CONFIG_DRIVE_STRENGTH:
> +		enabled = true;
> +		if (conf_bits == 10)
> +			val = FIELD_GET(PINCFG_DS_10BIT, val);
> +		else
> +			val = FIELD_GET(PINCFG_DS_8BIT, val);
> +		break;
> +	case PIN_CONFIG_INPUT_ENABLE:
> +		if (conf_bits == 10)
> +			enabled = val & PINCFG_IE_10BIT;
> +		else
> +			enabled = val & PINCFG_IE_8BIT;
> +		val = enabled ? 1 : 0;
> +		break;
> +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +		if (conf_bits == 10)
> +			enabled = val & PINCFG_ST_10BIT;
> +		else
> +			enabled = val & PINCFG_ST_8BIT;
> +		val = enabled ? 1 : 0;
> +		break;
> +	case PIN_CONFIG_SLEW_RATE:
> +		if (conf_bits == 10)
> +			enabled = val & PINCFG_SL_10BIT;
> +		else
> +			enabled = val & PINCFG_SL_8BIT;
> +		val = enabled ? 1 : 0;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	*configs = pinconf_to_config_packed(param, val);
> +	return enabled ? 0 : -EINVAL;
> +}
> +
> +static int berlin_pinconf_group_set(struct pinctrl_dev *pctrl_dev,
> +				    unsigned int group, unsigned long *configs,
> +				    unsigned int nconfigs)
> +{
> +	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
> +	const struct berlin_desc_group *group_desc = pctrl->desc->groups + group;
> +	u8 conf_bits = group_desc->conf_bits;
> +	u32 mask = 0, val = 0;
> +	int i;
> +
> +	if (!conf_bits)
> +		return -EOPNOTSUPP;
> +
> +	for (i = 0; i < nconfigs; i++) {
> +		enum pin_config_param param =
> +					pinconf_to_config_param(configs[i]);
> +		u32 arg = pinconf_to_config_argument(configs[i]);
> +
> +		switch (param) {
> +		case PIN_CONFIG_BIAS_DISABLE:
> +			if (conf_bits == 10)
> +				mask |= (PINCFG_PE_10BIT | PINCFG_PS_10BIT | PINCFG_SPU_10BIT);
> +			else
> +				mask |= (PINCFG_PU_8BIT | PINCFG_PD_8BIT);
> +			break;
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +			if (conf_bits == 10) {
> +				mask |= (PINCFG_PE_10BIT | PINCFG_PS_10BIT | PINCFG_SPU_10BIT);
> +				val |= PINCFG_PE_10BIT;
> +			} else {
> +				mask |= (PINCFG_PU_8BIT | PINCFG_PD_8BIT);
> +				val |= PINCFG_PD_8BIT;
> +			}
> +			break;
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +			if (conf_bits == 10) {
> +				mask |= (PINCFG_PE_10BIT | PINCFG_PS_10BIT | PINCFG_SPU_10BIT);
> +				val |= (PINCFG_PE_10BIT | PINCFG_PS_10BIT);
> +				if (arg == 2)
> +					val |= PINCFG_SPU_10BIT;
The value 2 Ohms is hijacked to be used as strong pull up.
The more I look at that, the more it feels hacky.

> +			} else {
> +				mask |= (PINCFG_PU_8BIT | PINCFG_PD_8BIT);
> +				val |= PINCFG_PU_8BIT;
> +			}
> +			break;
> +		case PIN_CONFIG_DRIVE_STRENGTH:
> +			if (conf_bits == 10)
> +				mask |= PINCFG_DS_10BIT;
> +			else
> +				mask |= PINCFG_DS_8BIT;
> +			val |= arg;
The drive strength is assumed to be lsb (which is the case), but maybe 
something like:
	if (arg > FIELD_MAX(mask))
		return -EINVAL;
	val |= FIELD_PREP(mask, arg);
would be more generic.

> +			break;
> +		case PIN_CONFIG_INPUT_ENABLE:
> +			if (conf_bits == 10) {
> +				mask |= PINCFG_IE_10BIT;
> +				if (arg)
> +					val |= PINCFG_IE_10BIT;
> +			} else {
> +				mask |= PINCFG_IE_8BIT;
> +				if (arg)
> +					val |= PINCFG_IE_8BIT;
> +			}
> +			break;
> +		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +			if (conf_bits == 10) {
> +				mask |= PINCFG_ST_10BIT;
> +				if (arg)
> +					val |= PINCFG_ST_10BIT;
> +			} else {
> +				mask |= PINCFG_ST_8BIT;
> +				if (arg)
> +					val |= PINCFG_ST_8BIT;
> +			}
> +			break;
> +		case PIN_CONFIG_SLEW_RATE:
> +			if (conf_bits == 10) {
> +				mask |= PINCFG_SL_10BIT;
> +				if (arg)
> +					val |= PINCFG_SL_10BIT;
> +			} else {
> +				mask |= PINCFG_SL_8BIT;
> +				if (arg)
> +					val |= PINCFG_SL_8BIT;
> +			}
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	return regmap_update_bits(pctrl->regmap, group_desc->conf_offset, mask, val);
> +}
> +
> +static const struct pinconf_ops berlin_confops = {
> +	.is_generic = true,
> +	.pin_config_group_get = berlin_pinconf_group_get,
> +	.pin_config_group_set = berlin_pinconf_group_set,
> +};
> +
>   static int berlin_pinctrl_add_function(struct berlin_pinctrl *pctrl,
>   				       const char *name)
>   {
> @@ -287,6 +510,7 @@ static const struct pinctrl_desc berlin_pctrl_desc = {
>   	.name		= "berlin-pinctrl",
>   	.pctlops	= &berlin_pinctrl_ops,
>   	.pmxops		= &berlin_pinmux_ops,
> +	.confops	= &berlin_confops,
>   	.owner		= THIS_MODULE,
>   };
>   
Regards,
Richard

