Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5364BE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvtTNWTPc/MwJikfv9QFtUDvsT2fp5rcl3kz3CC/vKc=; b=xPC5/VkncnDJsk3q4X2rD/PLMi
	xJLow8pLv4L9Jj6F53CP042HTgZe8cEu1m+TnpKGqSMlj6FdwHaWMQOJnZ9e1/F7pZkysa0BddoD+
	DruQ9vVhLX+9WNIlzK61fllPj2zQaElGzddGrc72+SXhzkpNUXTdOXBJI7wupX1J17mC4jeGCqu/m
	RxK63hsGucPlEYJwzatiuTsVwoVVjGxFK/2eZYSTjpTzk0rQJaD/o0mlsqhiXXp97R9jIcy45irTA
	gvnylRaQBik3EtSMXvNsCMIDlm3oU13b+fif6ZFCLakhWIlzRpWLB1rVzbD/fdlBxvj8hzg3sTeA4
	pf6SIu5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlTw-0000000C0gB-3m3R;
	Wed, 04 Dec 2024 09:15:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlSv-0000000C0Kc-2rXZ;
	Wed, 04 Dec 2024 09:14:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434a2033562so53861035e9.1;
        Wed, 04 Dec 2024 01:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733303676; x=1733908476; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uvtTNWTPc/MwJikfv9QFtUDvsT2fp5rcl3kz3CC/vKc=;
        b=e1SUOoIGc9b53VYFbrbm9kut5DNAXcBm77wyjYDWOtSovd3VgzkJOqP3u75xAjPY+8
         0qj8OphPLM04rsOdBTpJI8pP0c1QPT7jbCw+ogHLJRvYW0sCYkjYT1eE3oeB4f/yqNog
         ckX6GpzGBpgtw4JC0EivJpdrHusrqMaH88ooRr6VwMSnziI88ychI9vy+OvoZ4UYR2Xr
         G6DOWrj7mUyKmUyz6yX5QRPtBJBmqxpXalRrUpr686OkRrr/mbvVVGCiWm8ZzfdzXRWo
         PYHFqGlK0LvNjDMRbzb6GJ9EmsqG90maaXHqRzrzLyiInYXopoPyYu28YCeQyR2rKcC6
         q70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733303676; x=1733908476;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvtTNWTPc/MwJikfv9QFtUDvsT2fp5rcl3kz3CC/vKc=;
        b=qvv/oSdeQiKO2Lq+QC7D19uyhHaGKj8KNQJmKedrdbjfWrErDFBZimPFPz8flbGApt
         QHTgQK+6SaSJaJRjEZ9F09iwtqpuhgoz47SdqvxXXeUt4OugcyyI8CxII6ZiwJOskOlS
         Dsgoy7NMXvKncdB1Z2bB01zQ77Jj6p/oupHEzAB1aRVMHx0GErigSy0JEEzkiFM37yqO
         2i5LSXs9P6XNmY4FpIsOpyDBGv7Xc/isrP+6MVdSndxFmWhlZ4LLPlPGazA8W5SPRCcT
         1l8KDxrYsSEaHBA+ZvPf3SwE8zrepz/3Bt/m5Ar/3SO0OI4jIc4mW1O87uMjYX8y8Q6v
         4eJw==
X-Forwarded-Encrypted: i=1; AJvYcCUKQPEYxAiz0+oBMKGFydUriBt9UMp9MIrC54qlVwueigLAyatecdmtqiJQF/npR9Ha4Crox510LmSIMiD8tgU=@lists.infradead.org, AJvYcCXQtqrFcVjXVhiMDVYyVIumE+kNQiko/c+FLlHbv4oObjWafOW9cHy1fH/3cg4IdBHw0DZEESqk0PIdDcb4KOUh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz272kom3gQ4R+GCneFgX5RYS1X2p9VdFuX1HfmJZD/w6mvwX6N
	aO1bWMKDlTyzppkgb2B4WenImyTzkP2maYTmmDrYfRYe4um9LUMp
X-Gm-Gg: ASbGnct7OuaRgkF9u2g4TSev9rAKKB8oBGOb+G7RZUB3iN38NKrMUpGjwu0gsf6SlOf
	Vn4i7PWvZsjvlEwsccC6REL0beffS850yX0rDhZfyQSSoy3NX6a8HX83HK+5U9TVKDh2R+qYyQy
	UorfIsfOdzrRUhYGJaMmQsOZXyRrECGDvlDNa/KASoYNagKrnWsEzNYWwVb9eyTMPLEI8fdXQDi
	zqekz5hK1PvpvDvEEKvE7c/G1J5gxLLaBGoIhveQ3+eVp5uRKGYQcrsUrSX3IA4k3T8a/I1gy3i
	9hbPkQ==
X-Google-Smtp-Source: AGHT+IEk4Q2Qy9esekPW46VIQ2OVa8vfFbzQhwNMR6Rub6oKpS1Vg6LBdV5PE4QojPqnPxXQyMt1YA==
X-Received: by 2002:a05:600c:314a:b0:434:9be8:6cb5 with SMTP id 5b1f17b1804b1-434d09c1ebbmr56644225e9.17.1733303675675;
        Wed, 04 Dec 2024 01:14:35 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbf57sm17195825e9.39.2024.12.04.01.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 01:14:35 -0800 (PST)
Message-ID: <67501d7b.050a0220.3390ac.353c@mx.google.com>
X-Google-Original-Message-ID: <Z1Add9YzgDcV4uvF@Ansuel-XPS.>
Date: Wed, 4 Dec 2024 10:14:31 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
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
Subject: Re: [net-next PATCH v8 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241204072427.17778-1-ansuelsmth@gmail.com>
 <20241204072427.17778-4-ansuelsmth@gmail.com>
 <20241204100922.0af25d7e@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204100922.0af25d7e@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_011437_723855_A3E1BEB8 
X-CRM114-Status: GOOD (  28.33  )
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

On Wed, Dec 04, 2024 at 10:09:22AM +0100, Maxime Chevallier wrote:
> Hello Christian,
> 
> On Wed,  4 Dec 2024 08:24:10 +0100
> Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > Add Airoha AN8855 5-Port Gigabit DSA switch.
> > 
> > The switch is also a nvmem-provider as it does have EFUSE to calibrate
> > the internal PHYs.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> [...]
> 
> My two-cents review below :)
> 
> > +static void
> > +an8855_phylink_mac_config(struct phylink_config *config, unsigned int mode,
> > +			  const struct phylink_link_state *state)
> > +{
> > +	struct dsa_port *dp = dsa_phylink_to_port(config);
> > +	struct dsa_switch *ds = dp->ds;
> > +	struct an8855_priv *priv;
> > +	int port = dp->index;
> > +
> > +	priv = ds->priv;
> > +
> > +	if (port != 5) {
> > +		if (port > 5)
> > +			dev_err(ds->dev, "unsupported port: %d", port);
> > +		return;
> > +	}
> 
> Looks like the above condition can be simplified to :
> 
> 	if (port > 5)
> 		dev_err(...);
> 
>

Well.... yep AHHAHA.

> > +
> > +	regmap_update_bits(priv->regmap, AN8855_PMCR_P(port),
> > +			   AN8855_PMCR_IFG_XMIT | AN8855_PMCR_MAC_MODE |
> > +			   AN8855_PMCR_BACKOFF_EN | AN8855_PMCR_BACKPR_EN,
> > +			   FIELD_PREP(AN8855_PMCR_IFG_XMIT, 0x1) |
> > +			   AN8855_PMCR_MAC_MODE | AN8855_PMCR_BACKOFF_EN |
> > +			   AN8855_PMCR_BACKPR_EN);
> > +}
> > +
> > +static void an8855_phylink_get_caps(struct dsa_switch *ds, int port,
> > +				    struct phylink_config *config)
> > +{
> > +	switch (port) {
> > +	case 0:
> > +	case 1:
> > +	case 2:
> > +	case 3:
> > +	case 4:
> > +		__set_bit(PHY_INTERFACE_MODE_GMII,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> > +			  config->supported_interfaces);
> > +		break;
> > +	case 5:
> > +		phy_interface_set_rgmii(config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > +			  config->supported_interfaces);
> > +		break;
> > +	}
> > +
> > +	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +				   MAC_10 | MAC_100 | MAC_1000FD;
> 
> For port 5, you may also add the MAC_2500FD capability as it supports
> 2500BASEX ?
> 

I didn't account for the CPU port that runs at 2.5. The LAN port are
only 1g. Will add or maybe add the 2500FD only for cpu port?

Maybe Russel can help in this?

> > +}
> > +
> 
> [...]
> 
> > +
> > +static void
> > +an8855_phylink_mac_link_up(struct phylink_config *config,
> > +			   struct phy_device *phydev, unsigned int mode,
> > +			   phy_interface_t interface, int speed, int duplex,
> > +			   bool tx_pause, bool rx_pause)
> > +{
> > +	struct dsa_port *dp = dsa_phylink_to_port(config);
> > +	struct an8855_priv *priv = dp->ds->priv;
> > +	int port = dp->index;
> > +	u32 reg;
> > +
> > +	reg = regmap_read(priv->regmap, AN8855_PMCR_P(port), &reg);
> > +	if (phylink_autoneg_inband(mode)) {
> > +		reg &= ~AN8855_PMCR_FORCE_MODE;
> > +	} else {
> > +		reg |= AN8855_PMCR_FORCE_MODE | AN8855_PMCR_FORCE_LNK;
> > +
> > +		reg &= ~AN8855_PMCR_FORCE_SPEED;
> > +		switch (speed) {
> > +		case SPEED_10:
> > +			reg |= AN8855_PMCR_FORCE_SPEED_10;
> > +			break;
> > +		case SPEED_100:
> > +			reg |= AN8855_PMCR_FORCE_SPEED_100;
> > +			break;
> > +		case SPEED_1000:
> > +			reg |= AN8855_PMCR_FORCE_SPEED_1000;
> > +			break;
> > +		case SPEED_2500:
> > +			reg |= AN8855_PMCR_FORCE_SPEED_2500;
> > +			break;
> > +		case SPEED_5000:
> > +			reg |= AN8855_PMCR_FORCE_SPEED_5000;
> > +			break;
> 
> There's no mention of any mode that can give support for the 5000Mbps
> speed, is it a leftover from previous work on the driver ?
> 

Added 5000 as this is present in documentation bits but CPU can only go
up to 2.5. Should I drop it? Idea was to futureproof it since it really
seems they added these bits with the intention of having a newer switch
with more advanced ports.

> > +		}
> > +
> > +		reg &= ~AN8855_PMCR_FORCE_FDX;
> > +		if (duplex == DUPLEX_FULL)
> > +			reg |= AN8855_PMCR_FORCE_FDX;
> > +
> > +		reg &= ~AN8855_PMCR_RX_FC_EN;
> > +		if (rx_pause || dsa_port_is_cpu(dp))
> > +			reg |= AN8855_PMCR_RX_FC_EN;
> > +
> > +		reg &= ~AN8855_PMCR_TX_FC_EN;
> > +		if (rx_pause || dsa_port_is_cpu(dp))
> > +			reg |= AN8855_PMCR_TX_FC_EN;
> > +
> > +		/* Disable any EEE options */
> > +		reg &= ~(AN8855_PMCR_FORCE_EEE5G | AN8855_PMCR_FORCE_EEE2P5G |
> > +			 AN8855_PMCR_FORCE_EEE1G | AN8855_PMCR_FORCE_EEE100);
> > +	}
> > +
> > +	reg |= AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN;
> > +
> > +	regmap_write(priv->regmap, AN8855_PMCR_P(port), reg);
> > +}
> > +
> > +static void an8855_pcs_get_state(struct phylink_pcs *pcs,
> > +				 struct phylink_link_state *state)
> > +{
> > +	struct an8855_priv *priv = container_of(pcs, struct an8855_priv, pcs);
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = regmap_read(priv->regmap, AN8855_PMSR_P(AN8855_CPU_PORT), &val);
> > +	if (ret < 0) {
> > +		state->link = false;
> > +		return;
> > +	}
> > +
> > +	state->link = !!(val & AN8855_PMSR_LNK);
> > +	state->an_complete = state->link;
> > +	state->duplex = (val & AN8855_PMSR_DPX) ? DUPLEX_FULL :
> > +						  DUPLEX_HALF;
> > +
> > +	switch (val & AN8855_PMSR_SPEED) {
> > +	case AN8855_PMSR_SPEED_10:
> > +		state->speed = SPEED_10;
> > +		break;
> > +	case AN8855_PMSR_SPEED_100:
> > +		state->speed = SPEED_100;
> > +		break;
> > +	case AN8855_PMSR_SPEED_1000:
> > +		state->speed = SPEED_1000;
> > +		break;
> > +	case AN8855_PMSR_SPEED_2500:
> > +		state->speed = SPEED_2500;
> > +		break;
> > +	case AN8855_PMSR_SPEED_5000:
> > +		state->speed = SPEED_5000;
> 
> Same here for the SPEED_5000, unless i'm missing something :)
>

Ditto same explaination above.

-- 
	Ansuel

