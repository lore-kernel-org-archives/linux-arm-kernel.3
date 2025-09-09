Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5957CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRUpNDwLIvh2WOyXhRrF4YeiOcekU77uShvfMHahTds=; b=sxVdfhy/Y2zbtSFsfQGM3g55LZ
	5hjqIvem4rPTQTJofRG5bZTQHO37qUXZSc/hU1zYbtp1Wl4JHVnB09s7Jw8tos0zVe97Fh/PCqNds
	C542v30FVR6D+D/oSP7iJ/Cspfri36at8+3RiCuBeQko1XfAVfDl5qx1f0mkx1qRj7SFwc0dO0UhF
	BA3x+7fAfcuXdM3d2v7kiTwcm/0euxVzbaYnbSYczQnqJLo9QnEVr7egJMvAoaaFv5tW6R90sr2Zw
	MI+Gx0lbOo/wmeoqSzEZEuzHsRixOcfCOTKyyAa65DJZ8GXvL2ia2oxwPKaBZ0Wmbq3DIVFm5r11S
	fYAPo3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wH-00000008oHG-1Naz;
	Tue, 09 Sep 2025 17:15:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwPe-00000006gtm-3kRj;
	Tue, 09 Sep 2025 11:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lRUpNDwLIvh2WOyXhRrF4YeiOcekU77uShvfMHahTds=; b=LOzNG6RdZHlfqZAEZv3hmQ7sEG
	AtsEwtefXl6DebvqtJjZBdB1fQy0SoG12lquzPnrfy2ywv0GzLby7GG7PKBhX/4S1nshM8rrKQvB8
	meyoaA0qNiY2Esu8BTaDuu3kOIf4D9Vrh7PkD/LwsbGqTlLx24/ihCV0wRNjbCaBXXlr8pXiKjb1K
	cK3d77CLnmbfjfDOWtetjNSsHtvPWPnDTpM16nFttsAcwoSu/ixULSAH8d20kkqgceSKuyumIq9/w
	qbFggvA3mpxgMydal1tts4ug8isYPqSIK+ZaZqjVRbMu9xA+XtBuQWEZRzUjE/BIQz+Jy0KrdDu70
	re0WYGRg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwPc-00000005J2N-01zz;
	Tue, 09 Sep 2025 11:21:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45cb659e858so37835265e9.2;
        Tue, 09 Sep 2025 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757416882; x=1758021682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lRUpNDwLIvh2WOyXhRrF4YeiOcekU77uShvfMHahTds=;
        b=leLpGIZHSf4Ng7mjqdYBiS2/MfjfQZxtib/0isef1vXkn45DcdDKJeSfGca3NHPAvA
         cw06r4rsbYrsPwjJh5qNj4wwDklg4hDctH5yl7jbrZEHcFhyaOjtJDmfi/DyNFikdLNW
         TMHLMe7ewHYjDngA9k4z+EV24DEezyO0ek74rblfZzOTTFEBnGMFzLrxTyan7lNKRGW3
         fvQj4VLg2Wnqn0HDog8l6w+5ykuFNDem/dErmUDuTQOAuLYxYF4KIn/I5lfoYw3qnIiy
         Lo8eqfLcjitj6Cn2TUZxK6SSuQ8VtHLuwbB3sLgdqeNw36xXdJISx0wgqNk4fFDY0DaC
         nAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416882; x=1758021682;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRUpNDwLIvh2WOyXhRrF4YeiOcekU77uShvfMHahTds=;
        b=qFDLPF8/Mfn4Vrq/fAeN7bmsXReVsCJB/P5HdBW0EpLVIm6VX3FtG5M2Ya5vM/JF0z
         6HWIiEjafIJ2SF6x9lQ4HeGNl4z03ZNmlEXX+VEdFE5M/QD8mtyJXiJw0eJB+suzCMHl
         QWu4ConWPWBonh6PYQmdGX7cHbYVSMopN6IlVSa36du8w6ZU7M5gfk/vgkl/Wzc8/fpw
         kiiubJNmW4cIEsH0JgGak8bVUF3A+FN0zaSTb5xvvshciZNmM42VAxa19YirPH40D/wn
         yvOSF52PX1XxN7sZBniwUeusdIpifeQP0dEWk5jpK5hXmNKBjw9My+z2U8Syi4Sz7AVu
         gwuQ==
X-Forwarded-Encrypted: i=1; AJvYcCURSu4MclrC6vLDZShGVQSEvuxphIJqWhOAhaJeItQ7J2EGB8JGJDyOwrqsgGEu8qi4n2hVQAo0Fw+8wPtwwVf3@lists.infradead.org, AJvYcCWEYnXMHmaM2ljBWEfuZ3C08vbQXyQADbFQCsTrpWPg0LafxcWnoXjPgibayTWyYN7LZld0n4rILkXUp3/fec4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8tGjBtUDRm+swg2JwWHWOPufxX9iytWzJt+sdrkedjqDEoBRG
	YSTEf8PySaUvjPzjs6v0+0wp96x8/XYfyD0IqupznrV6ydVXiloRJHzk
X-Gm-Gg: ASbGncvOOhpJBO3WeNh21IiSBnlsvw+YwZGH2ut28Y5rlEXPwjhIEMgIVHOy3raJavH
	A5QGcvv+jphNQdcKq4167tEcje6+F2/pQgVr2CP+fKfKtn38iHp/7p2TErlCHV+xE8p1TnzwYNf
	N8o+vnLPZdVkSKxM52rSsrI5j9apSLfsgWLDS4jmczxDsGqxG3zCfNJ2rcsRfFT9oHFrT6wPt8h
	uUQdRwlvPy/yH4oUPmbw4feJlT595WuDG2QR8fdE0Uduoj0kOHi7GkIPAr5sKRcGBRKGHpgQhb5
	0gjZXCWhWa8hckdJ8Qx2i2oQSgv/1UUHlfkK0ImAY7G+xYjZI9nOQ2Pfxs6e0RyfwNQA6FaGD+J
	kndH80507bTvoG3PFKwCunbOIoXSwR80WpgmKjqO+FW/9D1EgLOflsrfAjVstXeZJtgcbjIjddA
	fl0ekp
X-Google-Smtp-Source: AGHT+IGw+CAsxSqqDDZ/FQQyvb/2SG9TMRuD7Xnj3H8EyLSvjgZxnQG3oLScOKpM5QtJRUCbg4+2rA==
X-Received: by 2002:a05:600c:4751:b0:45b:7b54:881 with SMTP id 5b1f17b1804b1-45dddea644cmr95621485e9.1.1757416881472;
        Tue, 09 Sep 2025 04:21:21 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd2304e16sm232791575e9.7.2025.09.09.04.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:21:21 -0700 (PDT)
Message-ID: <68c00db1.050a0220.7d5a6.50b8@mx.google.com>
X-Google-Original-Message-ID: <aMANrtmXgWoM_ZdE@Ansuel-XPS.>
Date: Tue, 9 Sep 2025 13:21:18 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v16 06/10] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-7-ansuelsmth@gmail.com>
 <aL_uqX90oP_3hbK6@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL_uqX90oP_3hbK6@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_122124_138712_8DD89A27 
X-CRM114-Status: GOOD (  16.75  )
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

On Tue, Sep 09, 2025 at 10:08:57AM +0100, Russell King (Oracle) wrote:
> On Tue, Sep 09, 2025 at 02:43:37AM +0200, Christian Marangi wrote:
> > +static void an8855_phylink_get_caps(struct dsa_switch *ds, int port,
> > +				    struct phylink_config *config)
> > +{
> > +	struct an8855_priv *priv = ds->priv;
> > +	u32 reg;
> > +	int ret;
> > +
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
> > +				   MAC_10 | MAC_100 | MAC_1000FD | MAC_2500FD;
> > +
> > +	ret = regmap_read(priv->regmap, AN8855_CKGCR, &reg);
> > +	if (ret)
> > +		dev_err(ds->dev, "failed to read EEE LPI timer\n");
> > +
> > +	config->lpi_capabilities = MAC_100FD | MAC_1000FD;
> > +	/* Global LPI TXIDLE Threshold, default 60ms (unit 2us) */
> > +	config->lpi_timer_default = FIELD_GET(AN8855_LPI_TXIDLE_THD_MASK, reg) *
> > +				    AN8855_TX_LPI_UNIT;
> 
> You're not filling in config->lpi_interfaces, which means phylink won't
> LPI won't be functional.
> 

Thanks for pointing this out, I notice lpi_interfaces is also not set on
other DSA driver that were converted to the new EEE handling, for
example mt7530.

I assume EEE is also half broken there and the required change wasn't
notice at times?

-- 
	Ansuel

