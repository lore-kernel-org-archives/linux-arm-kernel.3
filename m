Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2CBC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 06:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoGgzmJctq9P+9QAiHN/L1LeKNQp0xc/BnPX6tii5Pc=; b=Rwpi2xmbj3HekFX7cHFTVQ+RZv
	9xh0TLUvTTyoHPY115asWxAn2qW3WMV7CVWmGSLETD574nT31A0h4igsziPnpH6l4nqjFOJ7NxHI4
	hFurbe90wfmbIL5Od6pPy4Aa2dZATz1ZYDYBkCTteCNK0aLrYiXJ+SNCB2eC2Ss0NgoWJTRiiggNb
	UAxtPlAcCqGmqdyd0A9pPNzbnf/K9GlQUgiJ75QTlY2QcBEhROcXEdw1yMV5vCoMmvzPKVvj/4FTb
	m3LjAf0kKIIZTfWJYNN9WSW8+KR9hDmbac0CTEjUoBXiLRg04vlxeLxiSK/4IG7n3kQJDlDDHARcg
	oBGQtwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAi1t-0000000G35R-2Tkg;
	Sun, 27 Sep 2026 06:06:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAi1s-0000000G357-2o6c;
	Sun, 27 Sep 2026 06:06:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2471B436F5;
	Sun, 27 Sep 2026 06:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BAF1F00893;
	Sun, 27 Sep 2026 06:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790489188;
	bh=zoGgzmJctq9P+9QAiHN/L1LeKNQp0xc/BnPX6tii5Pc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=U+IRyGUouw8BTLcXpQ1zvfnmozfzVD+XuJQt9mUL+IM7CBtA8eh6XM4WaHhoc5Rt+
	 BC3BPEMTdKGc3LUopefLqhaxpTWVfEJgONjDiTwmfa1KYh1N2aFmV3d7/CHUFOzFzl
	 kvgK7M6anOb8lgTtb7fG2m89WwERimNcdLRXOr0tE1+foA1pnpJQOq2UzXirzZUkPo
	 C98XKK02jUpdOveJZUTO50ooRrg/HY9s/DBVHGDOBAn79OGKQDj7wnvEcZhw2An+yM
	 0+CXVPlAnCfZFaxUrpD36Y+taTykY30nSGAcm/shA9omSglIyGqZrGEGQBWlzdQNVE
	 FnpGjHzI/o6kg==
Subject: Re: [PATCH net v2 2/2] net: dsa: mt7530: trap frames to conduit in
 MFC on EN7581 and AN7583
From: netdev-bot+sashiko@kernel.org
To: gongtao0607@gmail.com
Cc: netdev@vger.kernel.org, chester.a.unal@arinc9.com, daniel@makrotopia.org,
 andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lorenzo@kernel.org,
 arinc.unal@arinc9.com, florian.fainelli@broadcom.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@oss.qualcomm.com
Date: Sun, 27 Sep 2026 06:06:26 +0000
Message-ID: <179048918667.2160803.15824370089117155993@kernel.org>
In-Reply-To: <20260923055103.949540-3-gongtao0607@gmail.com>
References: <20260923055103.949540-3-gongtao0607@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch fixes the same missing MFC CPU_EN/CPU_PORT programming
  on two switch variants, but the Fixes: tag names only the EN7581…
- [Low] After this patch, the comments no longer match the code for
  EN7581/AN7583.

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but port
  mirroring on AN7583 writes the wrong bit.

--

net: dsa: mt7530: trap frames to conduit in MFC on EN7581 and AN7583

On EN7581 and AN7583, setting the MT7531_CFC CPU_PMAP bitmap by itself
does not get trapped control frames to the CPU port. This patch adds
ID_EN7581 and ID_AN7583 to mt753x_conduit_state_change(). MT7530_CPU_EN
and MT7530_CPU_PORT in MT753X_MFC are then programmed when the conduit
becomes operational.

> Fixes: 2b0229f67932 ("net: dsa: mt7530: Add EN7581 support")

[Severity: Low]
Should there also be a Fixes tag for the AN7583 commit?

2b0229f67932 did not add ID_AN7583. It was added by d76556db10bf41
("net: dsa: mt7530: Add AN7583 support"), and that commit added AN7583
with the same missing MFC programming.

Stable trees that have 2b0229f67932 but not d76556db10bf41 have no
ID_AN7583. The AN7583 half of the check in mt753x_conduit_state_change()
can't be applied there as written.

Perhaps something like:

Fixes: d76556db10bf ("net: dsa: mt7530: Add AN7583 support")

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 20bb07fac0f7b..92b5e949ffab7 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3338,7 +3338,8 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
>  	 * interface is up.
>  	 */
>  	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
> -	    priv->id != ID_EN7528)
> +	    priv->id != ID_EN7528 &&
> +	    priv->id != ID_EN7581 && priv->id != ID_AN7583)
>  		return;

[Severity: Low]
This isn't a bug, but should the comments be updated now that this check
also covers EN7581 and AN7583?

The comment above this check still mentions only MT7530:

	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
	 * forwarded to the numerically smallest CPU port whose conduit
	 * interface is up.
	 */

The comment in mt753x_cpu_port_enable() says the CFC CPU_PMAP bitmap
chooses the trap destination. Its check also includes EN7581 and AN7583:

	/* Add the CPU port to the CPU port bitmap for MT7531 and the switch on
	 * the MT7988 SoC. Trapped frames will be forwarded to the CPU port that
	 * is affine to the inbound user port.
	 */
	if (priv->id == ID_MT7531 || priv->id == ID_MT7988 ||
	    priv->id == ID_EN7581 || priv->id == ID_AN7583)
		mt7530_set(priv, MT7531_CFC, MT7531_CPU_PMAP(BIT(port)));

The two comments now describe different forwarding rules for the same
chips. Neither one says that EN7581 and AN7583 need both registers, or
which register chooses the destination.

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch. Looking
at the AN7583 handling, MT753X_MIRROR_EN() in mt7530.h seems to be missing
ID_AN7583:

drivers/net/dsa/mt7530.h:
#define MT753X_MIRROR_EN(id)		((id == ID_MT7531 || \
					  id == ID_MT7988 || \
					  id == ID_EN7581) ? \
					 MT7531_MIRROR_EN : MT7530_MIRROR_EN)

MT753X_MIRROR_REG() and the MT753X_MIRROR_PORT_*() macros do include
ID_AN7583. On AN7583 the register is therefore MT7531_CFC, but the enable
bit is MT7530_MIRROR_EN (BIT(3)). That bit is inside MT7531_CPU_PMAP_MASK
(GENMASK(7, 0)).

Does mt753x_port_mirror_add() then add port 3 to the CPU port bitmap for
trapped frames, instead of enabling mirroring?

	val = mt7530_read(priv, MT753X_MIRROR_REG(priv->id));
	...
	val |= MT753X_MIRROR_EN(priv->id);
	...
	mt7530_write(priv, MT753X_MIRROR_REG(priv->id), val);

MT7531_MIRROR_EN (BIT(19)) is never set, so mirroring would not work on
AN7583. The -EEXIST check in mt753x_port_mirror_add() also tests the wrong
bit.

When the last mirror is removed, mt753x_port_mirror_del() does this:

	val &= ~MT753X_MIRROR_EN(priv->id);

That clears CPU_PMAP bit 3 in MT7531_CFC, not the mirror enable bit.

This seems to go back to d76556db10bf41 ("net: dsa: mt7530: Add AN7583
support"). Adding ID_AN7583 to MT753X_MIRROR_EN() would fix it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260923055103.949540-1-gongtao0607%40gmail.com

