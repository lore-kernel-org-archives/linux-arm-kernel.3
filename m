Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC97606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lDt5YVLo;
	dkim=pass (2048-bit key, unprotected) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=IbTbANt4;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=IbTbANt4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QLyO54zaOTxAKKhIPvxsoMq4fEquUUXaIdWfMQwsWvU=; b=lDt5YVLo9a8wyB
	oc47+ywMRBX3nMdYk749/wt0VppVgg9fVk4UTWX2FaE/3gzaFlPYOPHy2XgjG05zzocWyb8evImo/
	ZicyfynEe0buvLu1Q7zRf2020qJzsdPIIxVW4sU9FDO47TWmWdp7kG3OveU2rRDxpN3GHrmB6dPdm
	1pJ/wMRcDnkbCoxiuXsi9c3QY2jXmDjOnJVat+d/oDsM5qnfQIAI7lLnZoqpmtkJHjghNaw2mIlvD
	QHNU/vP7nBd/YBCFz64Yu6cnAnrc12vQ/VUNzdZiJXMo4DwzVJRZKi2w+vtd5CnTUfj95qCwOOWPP
	KNkZBdcTToOQAiyfo0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZQX-00000005DRD-11MQ;
	Wed, 04 Nov 2026 11:45:13 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZQU-00000005DQo-1ODa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1793792706; bh=ebwSH394zYPUGs4q/CaA+jIBZjAqW6ZboyOen2iOpmM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IbTbANt4V6mlhK1BXX5P+KA5FMS/4s9QpWEhFm3QbYFxDyV4eikpkxD2ht/VwYC+V
	 txGjhk0AN0fQLNMCy7tz+jAO0NLJvZIDEZU206DyTwVbG2P6rzZjXhVE1aBmNw/Kbh
	 7JDCWnUdfh5gbRQ9aXiqFs8OHx5Mr9OkHDKjdtFUYC/z0rZAnrNBFkvOFt9xkmp/vc
	 kCGIhxJ+aVj/+S/kRtE8BVF4eBSGP5QXQwJW+WDjTX6E6f1gnez9EiSTlQDM78Nnh8
	 cEWqc3GhUO9xvg2yLm2jj9hDYFfWA8eZOI0rBa+pohDffaPLWl9tFat1CFYQVNLEIx
	 ygw2LwV0pp30Q==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id BA62E40A6E6;
	Wed,  4 Nov 2026 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1793792706; bh=ebwSH394zYPUGs4q/CaA+jIBZjAqW6ZboyOen2iOpmM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IbTbANt4V6mlhK1BXX5P+KA5FMS/4s9QpWEhFm3QbYFxDyV4eikpkxD2ht/VwYC+V
	 txGjhk0AN0fQLNMCy7tz+jAO0NLJvZIDEZU206DyTwVbG2P6rzZjXhVE1aBmNw/Kbh
	 7JDCWnUdfh5gbRQ9aXiqFs8OHx5Mr9OkHDKjdtFUYC/z0rZAnrNBFkvOFt9xkmp/vc
	 kCGIhxJ+aVj/+S/kRtE8BVF4eBSGP5QXQwJW+WDjTX6E6f1gnez9EiSTlQDM78Nnh8
	 cEWqc3GhUO9xvg2yLm2jj9hDYFfWA8eZOI0rBa+pohDffaPLWl9tFat1CFYQVNLEIx
	 ygw2LwV0pp30Q==
Message-ID: <5334e00c-67b6-4fbc-9090-17ff1c9d7494@mleia.com>
Date: Wed, 4 Nov 2026 13:45:00 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Linus Walleij <linusw@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20261104113316.1634141-1-peng.fan@oss.nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20261104113316.1634141-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20261104_114506_797044_64DF58E1 
X-CRM114-Status: UNSURE (   5.92  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_114506_797044_64DF58E1 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 13:33, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com> # I2C PNX

