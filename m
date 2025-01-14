Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAE1C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/wqUnPkHUfSZPeicafpwQOCEvjn5Jc9IONjzEWW1Kk=; b=X3oe5PgMa0LbSSBz08VA3vGBqR
	spQFjxPBHfnFj87WVKsZ4R20/lXgW0yTGZSfDHkQ8yZmwkqJhuFt0E7UVF6wS7W+2xMVMvEq5VHPC
	G/EGVJ2sne8LOBiTv3EuXijr26RixnJfBaXNmuUCGIDnm7RY9mGOetK9MXiui3nLVkwWW2drtfOoI
	blBDtApHND5DHWXTuQ0b3wpwm4nYBhV+f4LnEvL9NKJ7Y3Xw8acoPvHThYHXnqvVKoycYtaLG/zh3
	EWsXoHAR+xP/v70Chpdazf6EMyxJj7IR38H9pCFWtJHEGQdIMVVPuBxm970d1MJ6E4TuoXeb4kCjT
	1PwoaSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgVe-00000008Sdw-07CW;
	Tue, 14 Jan 2025 12:59:06 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgUM-00000008SU9-26er;
	Tue, 14 Jan 2025 12:57:50 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d9f842f237so132064a12.1;
        Tue, 14 Jan 2025 04:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736859464; x=1737464264; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/wqUnPkHUfSZPeicafpwQOCEvjn5Jc9IONjzEWW1Kk=;
        b=XzIx+4F7BX/nBPVt8JzCH/na5o9z1VKiJpuejw5KrBHKyrCo8k/shMrIodJGMVqtGg
         98Mbm2sc6mTeWJGM1myXiELf8iC4qvEILLHjY9oERfN5BWCdPZ/TD2rz+UXzng8hj8dY
         h+v3tR53dp9uEOdhGvuVTOR51Mtr5jpQKid6Pi4QKHwHDQON/XSzuq+gbQcHDrFqJgOo
         47Ph2BZkKtMA354XQxD6V6zE9gRBuypIUtsHfq4sHG9rahNUVrhgpjR/HYT3FOVmx9Ja
         LCZ9VgLaTcnScB4/0niKih8BdGgZS2GXX4G6orAfIylT66BeamAzOAkusH0IbiVfQBi4
         2KKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736859464; x=1737464264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/wqUnPkHUfSZPeicafpwQOCEvjn5Jc9IONjzEWW1Kk=;
        b=hODveoBVaaialvXhTOTGaYnw/3LsXweaqkUOGzTWP013T5ckkrdwYs3ckR1C8FukPt
         YkrnfSGN/pNTahAwHdVALhCEh1RRkQR+1TLmu5DThWC0KWO++tn/AUqHvJwtzweZHNFK
         1MM2MezPYkHhv5KefYTiR+jClkxyI162v1fjFBuaoGpSmkWrJPOCoSgaMs70m5tx0Tvq
         bAWpGPRWWmZCQvWID/chNQS821ugqgOzp9bvvGJitbhxFkHibTlErN4qPjm8GKetlVHw
         aMIUVN0Jdbq9dHRYG2SbYJH72gu58Fa/cuMMQlJ+jJeUPpHny1lFAb48sCOAKql7aRzh
         obqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+NEdiR61XQFA7TL9UWTIYnyTiArMsjvyQitoPygu1bm4ZghxGJbhp2un8xyErhtbrJDR61QV9dU5viqFJn/lj@lists.infradead.org, AJvYcCXt3n/Eu38wTuEq2bHbf0Zo/QPl5q0lOn8t6Lf99mEPjhrM+dsqMF7QanhMxFpdcTZB7AZrAL+EGzUwZNEGAKY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLGv6uaCAgS2J4YBhlSTG4hYpnjqy50xhajxoEyioZndUY+yo7
	qbM1CukQJ1h51Sf5izgASsExHP87TmVVhC+S+IdjOMMM4/jmj0WW
X-Gm-Gg: ASbGncvghSxOmdXPMK9FQ4ft+Vnp+2HhdKHFKSdHCmAUrnMErUXaVwkwPu+95alrOzn
	CObure0QN5utSFnOhkKahsfjBY09Otrnk5vgQ6L4hUNiT9vE5ks9/Ii6nHHf4pDTRZXQwu0BcJQ
	UiSgl3fS8jQDV7IHEUoVqvBj0vIJ746+MlryMkwO8OD/g/u5rb1v0GzwaAdrWhi7H0Ei+2d0obK
	G1CHO9DykG/mdxSQT5Z6P0TFnyPNzfqcKkBSiHJ7eHs
X-Google-Smtp-Source: AGHT+IEeoXDgl4L3Whp5n/U9RhVAoq8DWplfRB8ruTR8XM2o+ta6PkqlFr15CRmR/MehlW4P+BPIAA==
X-Received: by 2002:a05:6402:2347:b0:5cf:cc32:82f2 with SMTP id 4fb4d7f45d1cf-5d972e1b96dmr8686421a12.5.1736859464073;
        Tue, 14 Jan 2025 04:57:44 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4598sm6028256a12.53.2025.01.14.04.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:57:43 -0800 (PST)
Date: Tue, 14 Jan 2025 14:57:39 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH net-next v2 5/5] net: phylink: provide fixed state for
 1000base-X and 2500base-X
Message-ID: <20250114125739.sgegfxibbzpc2uor@skbuf>
References: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
 <E1tXGei-000EtL-Fn@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tXGei-000EtL-Fn@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_045746_542384_051B5E79 
X-CRM114-Status: GOOD (  22.93  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Chester A. Unal" <chester.a.unal@arinc9.com>, netdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Woudstra <ericwouds@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2025 at 09:22:44AM +0000, Russell King (Oracle) wrote:
> When decoding clause 22 state, if in-band is disabled and using either
> 1000base-X or 2500base-X, rather than reporting link-down, we know the
> speed, and we only support full duplex. Pause modes taken from XPCS.
> 
> This fixes a problem reported by Eric Woudstra.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index b79f975bc164..ff0efb52189f 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -3882,27 +3882,36 @@ void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
>  	if (!state->link)
>  		return;
>  
> -	/* If in-band is disabled, then the advertisement data is not
> -	 * meaningful.
> -	 */
> -	if (neg_mode != PHYLINK_PCS_NEG_INBAND_ENABLED)
> -		return;
> -
>  	switch (state->interface) {
>  	case PHY_INTERFACE_MODE_1000BASEX:
> -		phylink_decode_c37_word(state, lpa, SPEED_1000);
> +		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
> +			phylink_decode_c37_word(state, lpa, SPEED_1000);
> +		} else {
> +			state->speed = SPEED_1000;
> +			state->duplex = DUPLEX_FULL;
> +			state->pause |= MLO_PAUSE_TX | MLO_PAUSE_RX;
> +		}
>  		break;
>  
>  	case PHY_INTERFACE_MODE_2500BASEX:
> -		phylink_decode_c37_word(state, lpa, SPEED_2500);
> +		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
> +			phylink_decode_c37_word(state, lpa, SPEED_2500);
> +		} else {
> +			state->speed = SPEED_2500;
> +			state->duplex = DUPLEX_FULL;
> +			state->pause |= MLO_PAUSE_TX | MLO_PAUSE_RX;
> +		}
>  		break;

Are the "else" branches necessary, given the "else" branch from
phylink_mac_pcs_get_state?

static void phylink_mac_pcs_get_state(struct phylink *pl,
				      struct phylink_link_state *state)
{
	struct phylink_pcs *pcs;
	bool autoneg;

	linkmode_copy(state->advertising, pl->link_config.advertising);
	linkmode_zero(state->lp_advertising);
	state->interface = pl->link_config.interface;
	state->rate_matching = pl->link_config.rate_matching;
	state->an_complete = 0;
	state->link = 1;

	pcs = pl->pcs;
	if (!pcs || pcs->neg_mode)
		autoneg = pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
	else
		autoneg = linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
					    state->advertising);

	if (autoneg) {
		state->speed = SPEED_UNKNOWN;
		state->duplex = DUPLEX_UNKNOWN;
		state->pause = MLO_PAUSE_NONE;
	} else {						|
		state->speed =  pl->link_config.speed;		|
		state->duplex = pl->link_config.duplex;		| this
		state->pause = pl->link_config.pause;		|
	}							|

	if (pcs)
		pcs->ops->pcs_get_state(pcs, pl->pcs_neg_mode, state);
	else
		state->link = 0;
}

