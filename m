Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEC7C369B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkKnU5A/U7u3KgcdHnsgsllco8Z2H8MX4iAV2Z12d/k=; b=HDoqUBge+/+73hVR1SgF9zSuBc
	sbUc2zpcfJkFGLoOoEkj4HO/IGFIS/D9HQuB7mbxjv0lwwHMmqNGFLq4NuWDptJhv2biIzcIUGYKo
	kPHWThp+A5+xnfAD1LBqVM56Cyn2xxcgIaczoTcMkjhMsoV5C7O+0qRkcy6c58j9n8YEYiImvFgKR
	7p6ksbC6bOqJL6xKmobq7EoPYva9DdvAxJhxHxoHvvi99wUJl6vYbneA8AfCFaoV0GiujqkN0W5uS
	kOPTv5iQLp7upm/mdx9yswDTC/pCy6wpgBrh4LuQ+2pCIpTqeTE5OFSLW8LZX/8/jNEW5UaYP1cQo
	anmVPofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HUf-00000001d0c-3JXJ;
	Mon, 14 Apr 2025 10:56:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4H5n-00000001Xse-0xVN;
	Mon, 14 Apr 2025 10:31:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c14016868so3799750f8f.1;
        Mon, 14 Apr 2025 03:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744626665; x=1745231465; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RkKnU5A/U7u3KgcdHnsgsllco8Z2H8MX4iAV2Z12d/k=;
        b=bQxI+5vCC5PTKK6bonXIeCKVgIRSgo1cp8rHqUStQZjsIaqt+7io4P7OD6eSz83Yc3
         Zu8P/9hOg1uGDHUnq+juXfZsh3KgeyITA8WesHYKqrkPb2UhdOZ3WVeMTwWP8+0r2ktP
         vVORKSkgq+jbTwsZVK53tsIhIxBko2amwEO7A72J0Qhgkf2IXUHkxF6hnyJGuQzP1MzR
         HGKdJjkayDWf8nKOmoAnFAxmSUGGhvwx+gAc135Lmpx1HBMQwYelQBxb+mpiXbF9RBR9
         qRgmkAOXk1I8/UvRDvu6iMp0ffpV+3jm6X7AT25u+ckS0XxlRMw9be41GlElsJ8Z7RwT
         /maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626665; x=1745231465;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkKnU5A/U7u3KgcdHnsgsllco8Z2H8MX4iAV2Z12d/k=;
        b=TNmixoaGHLgz9SooBZm7pwNoC+UZmOyZI47UfkUC8/P95vhlx2oVYN20JeGTMdHRLB
         nuhkvaik0sfFRDawgcNtLs9G3zZdXsleTfueW7geubYk+/D7/B7TjhTLQ27cmVIWdxuk
         z6SoQkK1lafSeZN3CqtfoWB+XLBqNyArza37pJFWIJGCDUJ62ERhLKFjWo+dnyiw8VK2
         Qlvk9ZDEBP/u0eWuhiHRgDbpirTgchdzRl2zkKCy/r6k3R5Rfb8on+jMSaPCiMckvdw1
         dkSWASKC4o39reIitXB0zU/o/YGW2WbFXaNFbjphcMUONGqF/wGiHb8pAcfRrCNaG5Aj
         H8fA==
X-Forwarded-Encrypted: i=1; AJvYcCWYAYsUH6rL/ryMDf1XOGIwTcKmplIZio/ZupOz9NX4zaQQVvg2OO8yG9vVSx41BR4OnSbL4c8plPyE7lJFA0Y=@lists.infradead.org, AJvYcCWtA99GLPu8/lp3ag18ejN6TOCVBR8U0/PfputEATC3qW/GEmIalcS/fz3mKORPAIoQ3q92aQf3K91/ajAJEGh/@lists.infradead.org
X-Gm-Message-State: AOJu0YznsXtujXrsIqm76Rj5Nqzwnpo7burVv3vWJXJM2m13llf5jbOi
	kfN6ccT2Rc3tJRwQmEY6+gyf3ppHo9E7l8rr0pZ0wg6+eyxD6Rl4
X-Gm-Gg: ASbGncvsYZVqNb/yec/hfJ/VPUjQOpRaZGpqKRmNcrHo1owBIpdhRmHT5Ixk8M/zG5W
	CjqVQw9+1eB8nGpXFGMj2SsGFQ4/hciYU2RiH5uS2NVAFxZ6y0EAQ5B4kbIWFXifMyLRWwS9zId
	baxu/Ey+5MTsv11y3+vm8T+4q7wOHD1zgRIYAAoZL5nmlV6Z9yljGANCW0PG84xrkfBMndx14PJ
	v9HtESmGwRAmRbuT3oDXXTd3CsWbSYzbwshkg05QNe+tR/ZPN0351E2FryIUCCa7SY1Gzc1X/xr
	7EeSPcpwfB4z/ul9p1ykOTy7QIlyxAZy8zZwIqkVOovnGyWwb/CKsXlfD/LvV67pnN3kdZpQ4cM
	+JGKVVvs=
X-Google-Smtp-Source: AGHT+IG6w0yoGulXXdUDH1dXp2zNY0ALTwTAcgDO9WvKsGR4WC17K1oIrFY9U+K+ID9KIggoFL2PMg==
X-Received: by 2002:a5d:6d82:0:b0:39c:141a:6c67 with SMTP id ffacd0b85a97d-39eaaed2101mr10246874f8f.45.1744626663402;
        Mon, 14 Apr 2025 03:31:03 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-248-72.retail.telecomitalia.it. [87.1.248.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cce3sm10716010f8f.74.2025.04.14.03.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:31:02 -0700 (PDT)
Message-ID: <67fce3e6.df0a0220.12e377.7a1f@mx.google.com>
X-Google-Original-Message-ID: <Z_zj40O2FPE8MxZX@Ansuel-XPS.>
Date: Mon, 14 Apr 2025 12:30:59 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH v2 2/2] net: phy: mediatek: add Airoha PHY ID to
 SoC driver
References: <20250410100410.348-1-ansuelsmth@gmail.com>
 <20250410100410.348-2-ansuelsmth@gmail.com>
 <20250410190733.GV395307@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410190733.GV395307@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_033107_274178_6B0535E4 
X-CRM114-Status: GOOD (  21.87  )
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

On Thu, Apr 10, 2025 at 08:07:33PM +0100, Simon Horman wrote:
> On Thu, Apr 10, 2025 at 12:04:04PM +0200, Christian Marangi wrote:
> > Airoha AN7581 SoC ship with a Switch based on the MT753x Switch embedded
> > in other SoC like the MT7581 and the MT7988. Similar to these they
> > require configuring some pin to enable LED PHYs.
> > 
> > Add support for the PHY ID for the Airoha embedded Switch and define a
> > simple probe function to toggle these pins. Also fill the LED functions
> > and add dedicated function to define LED polarity.
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> ...
> 
> > diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
> 
> ...
> 
> > +static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
> > +				       unsigned long modes)
> > +{
> > +	u32 mode;
> > +	u16 val;
> > +
> > +	if (index >= MTK_PHY_MAX_LEDS)
> > +		return -EINVAL;
> > +
> > +	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
> > +		switch (mode) {
> > +		case PHY_LED_ACTIVE_LOW:
> > +			val = MTK_PHY_LED_ON_POLARITY;
> > +			break;
> > +		case PHY_LED_ACTIVE_HIGH:
> > +			val = 0;
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	return phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
> > +			      MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
> > +			      MTK_PHY_LED_ON_POLARITY, val);
> 
> Hi Christian,
> 
> Perhaps this cannot occur in practice, but if the for_each_set_bit
> loop iterates zero times then val will be used uninitialised here.
> 
> Flagged by Smatch.
> 
> > +}
> 
> ...

Almost impossible but yes I will post a follow-up patch fixing this!

-- 
	Ansuel

