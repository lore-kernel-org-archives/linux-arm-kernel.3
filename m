Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3870BC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 20:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7stzLVndc/b9y6vJvGeTTcJyYaISRRTWNly5Dkcffs=; b=tSy59mLAFKu97ik6WL28DKbJBy
	Tc/dd71pdGruSLc16uFhf00G8qVWk+syOBY48l4NG3Ivsp6xCX2wlSm/hEzlw1kLswBa5uW07Iq8g
	4EkDSmt5nePn4/+nKxr0p408cJBFfZwrylu94go8x2r91/tfYAHh0bUtUvMK3eSF5H1UDCylJ7FZH
	XLg57sMqxEWSDob/QoGbx/NJNgfQXbKQf4UEiWjsnGjglcZkQtVvzllA6zZXz4erxGfJsNHz59R4q
	YgHfv/UwfRiRstDM/jXBwA403/jQ/sNxD4/YoBItdvxklzXTZVCogNlUu31g3q8lCAKsDa7b9Tgy9
	3sZuwh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub3UV-00000000c18-0g0N;
	Sun, 13 Jul 2025 20:40:07 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub3RR-00000000bqY-3V7H;
	Sun, 13 Jul 2025 20:36:58 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ub3R7-000000002gs-20cO;
	Sun, 13 Jul 2025 20:36:37 +0000
Date: Sun, 13 Jul 2025 21:36:34 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: Constify struct regmap_config
Message-ID: <aHQY0hVsua5pP0QC@makrotopia.org>
References: <1b20b2e717e9ff15aa0d1e73442dde613174cfef.1752419299.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b20b2e717e9ff15aa0d1e73442dde613174cfef.1752419299.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_133657_873434_BAE020A9 
X-CRM114-Status: GOOD (  18.04  )
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

On Sun, Jul 13, 2025 at 05:09:24PM +0200, Christophe JAILLET wrote:
> 'struct regmap_config' are not modified in these drivers. They be
> statically defined instead of allocated and populated at run-time.
> 
> The main benefits are:
>   - it saves some memory at runtime
>   - the structures can be declared as 'const', which is always better for
>     structures that hold some function pointers
>   - the code is less verbose
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/net/dsa/mt7530-mdio.c | 21 +++++++++------------
>  drivers/net/dsa/mt7530-mmio.c | 21 ++++++++++-----------
>  2 files changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
> index 51df42ccdbe6..0286a6cecb6f 100644
> --- a/drivers/net/dsa/mt7530-mdio.c
> +++ b/drivers/net/dsa/mt7530-mdio.c
> @@ -136,10 +136,17 @@ static const struct of_device_id mt7530_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mt7530_of_match);
>  
> +static const struct regmap_config regmap_config = {

Maybe calling this one 'regmap_config_mdio'...


> +	.reg_bits = 16,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = MT7530_CREV,
> +	.disable_locking = true,
> +};
> +
> ...

> diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
> index 842d74268e77..1dc8b93fb51a 100644
> --- a/drivers/net/dsa/mt7530-mmio.c
> +++ b/drivers/net/dsa/mt7530-mmio.c
> @@ -18,10 +18,17 @@ static const struct of_device_id mt7988_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mt7988_of_match);
>  
> +static const struct regmap_config sw_regmap_config = {

... and this one 'regmap_config_mmio' would be a bit nicer.

> +	.name = "switch",
> +	.reg_bits = 16,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = MT7530_CREV,
> +};
> +

Other than that:

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

