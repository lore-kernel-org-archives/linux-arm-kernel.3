Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B9DD59F53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRksn2dUlyxiQY8SsSzJ+k2N22EHq4iZeBjynZBsjnQ=; b=ExpQY5OvXeIQmm/uaKvyU6oZpV
	CmQcMp8DaPDNOnN9lHF5fmETI7kUlo0tkeJO3Ggvs19dcMcLg/dMYVZw/nQ+ZEh5E8YicWi9dafd4
	vNYcFcb8aJwm3VM56USBpKoV1JQ9ombA3uGhC6iZyFgp4MddbinBslHaAMwC3l+yv9S39OTdbKqfM
	yzQu/J2KM39N0k0sSg+DqNskv5nPe1ZYvzKdLEYoYf87eEdhLMf5Ig0y7k+hhaa7HQ3/jaBlfcOkT
	VQatzf0wBKY0ii9wyhxp40QT0vIvxLCS9tndrGUrvdF2nW+JDTL5ew9JwpbOH4/tUQinLOXq4vqnN
	X3fs286A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ina-000000040uv-3oTz;
	Wed, 06 Nov 2024 16:22:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ikY-000000040OM-3lB3;
	Wed, 06 Nov 2024 16:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iRksn2dUlyxiQY8SsSzJ+k2N22EHq4iZeBjynZBsjnQ=; b=XN9UEv20YjYFCljP87EAFs6m7W
	IHXMmKKdxArReUb359DJLKSM4vEoyXzl7VtO0bRnoCDrG+6VZ/h9acwsCFwrncYruVE3q+p8Gthna
	6cuOCIJA5v+S8QPUvRpIyuIwBsDH551uD2D8CFqR8QDFEo3M1aMwkFbyw8CBLw7jvUHM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t8ikJ-00CMAP-55; Wed, 06 Nov 2024 17:19:03 +0100
Date: Wed, 6 Nov 2024 17:19:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v3 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Message-ID: <8e5fd144-2325-43ff-b2b8-92d7f5910392@lunn.ch>
References: <20241106122254.13228-1-ansuelsmth@gmail.com>
 <20241106122254.13228-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106122254.13228-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_081918_954184_F8A779FE 
X-CRM114-Status: GOOD (  15.02  )
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

> +static const u8 dsa_r50ohm_table[] = {
> +	127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
> +	127, 127, 127, 127, 127, 127, 127, 126, 122, 117,
> +	112, 109, 104, 101,  97,  94,  90,  88,  84,  80,
> +	78,  74,  72,  68,  66,  64,  61,  58,  56,  53,
> +	51,  48,  47,  44,  42,  40,  38,  36,  34,  32,
> +	31,  28,  27,  24,  24,  22,  20,  18,  16,  16,
> +	14,  12,  11,   9
> +};
> +
> +static int en8855_get_r50ohm_val(struct device *dev, const char *calib_name,
> +				 u8 *dest)
> +{
> +	u32 shift_sel, val;
> +	int ret;
> +	int i;
> +
> +	ret = nvmem_cell_read_u32(dev, calib_name, &val);
> +	if (ret)
> +		return ret;
> +
> +	shift_sel = FIELD_GET(AN8855_SWITCH_EFUSE_R50O, val);
> +	for (i = 0; i < ARRAY_SIZE(dsa_r50ohm_table); i++)
> +		if (dsa_r50ohm_table[i] == shift_sel)
> +			break;

Is an exact match expected? Should this be >= so the nearest match is
found?

> +
> +	if (i < 8 || i >= ARRAY_SIZE(dsa_r50ohm_table))
> +		*dest = dsa_r50ohm_table[25];
> +	else
> +		*dest = dsa_r50ohm_table[i - 8];
> +
> +	return 0;
> +}
> +
> +static int an8855_probe(struct phy_device *phydev)
> +{
> +	struct device *dev = &phydev->mdio.dev;
> +	struct device_node *node = dev->of_node;
> +	struct air_an8855_priv *priv;
> +	int ret;
> +
> +	/* If we don't have a node, skip get calib */
> +	if (!node)
> +		return 0;

phydev->priv will be a NULL pointer, causing problems in
an8855_config_init()

	Andrew

