Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3438E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSxXgL0V1UHwaghXfPnwj6ZyebGhbcff5eVA8hQElAg=; b=c1y5DOk9z7SU7wD+iGMj7h5UyV
	oDI5mI085455WrTt0m7z0phJHiypkisqJ9B+mhtLG69WVGHzBlQgRonQ8jEUD5mUkpnDrc9EjHYp+
	EeDxJ2+vYjukyuAxbFOkoQ13qfcdM9tD/AnsAi91C2zGehHt9PKdBNXmbzttAXqfrrXQ9JFf1b+P5
	+oic2RAaFVPQaKB/74P5x/zXRKzgSFAZeSkAkq6NHVkDDT433EBeTfIFTe4JqtVNvCofkWLojuDTz
	CpTY8qTS1XMvFzMgEaHu5336eFyG8wsO0W/AmwtT9hORs2dAn5oGFz+OFEXFXYHgdlYzVTge88372
	Q43LvQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTpS-00000006XE2-2ErP;
	Sat, 14 Dec 2024 15:13:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMToK-00000006X4f-234B;
	Sat, 14 Dec 2024 15:12:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38634c35129so2111441f8f.3;
        Sat, 14 Dec 2024 07:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734189122; x=1734793922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kSxXgL0V1UHwaghXfPnwj6ZyebGhbcff5eVA8hQElAg=;
        b=kI1LYX1qz1OdlFYu+LFqrAVtML5kllJMTkVC2iXMDPkm/VtmzLHHwiJZ8hVbbl8btu
         Mm6NSyjkI2VyIhzDUmC11YHNA6XNuo5kNsTpSDYVWfpn3woPK9yULWSbVJCYc5n32KYd
         l77wDssV+hnbM4NEcL4Dl1USYx4aX4Ghmf89Oo2c43+HNUVTMTJegtuW9T+s2TRpcIkH
         JH7cmNnAM7xr6Fx8hEl/+x2J6RpwWIAsVtNNBbvYMXrNYdcbdUiI7HRqxKkhiDWjs91i
         VzvDI06AA4lzXUhXYi8EB40kMVUiU+QZzRkNdCVHJmN0RIjTThUDXNJeKXPTWGEecoOX
         1T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734189122; x=1734793922;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSxXgL0V1UHwaghXfPnwj6ZyebGhbcff5eVA8hQElAg=;
        b=NJK6b78pew82/5kqjQ2xQQy+iC9BklDUih0F7eZjvPO/ii1UOplcSBvKeKJQjsWL5u
         +3DIfeUHketvmTuX7irtJp8qgI64rp4EHwhrVbn1ON8lDH8rUcD4mVfRNDb4u0dXmulV
         M+qqELwSKimKy4LICgXXIhTZhN5AJxljTDEFx3XUN05FHJie7GIjouBxwtPq9FS9iI+z
         UDS+nhlK4L+f8MRaEZi4GP8sU2Z0khj/qwB4zf8OwqU3I3NMDHToukYwRjM/RwUIKHJo
         CC/oZfoFFT9Vyco6mcgZ+s+TLoT4pjHRFcD3ZQLB1CFK0QJ3gmlbeBFy3aMrx2vaVZaV
         /H2g==
X-Forwarded-Encrypted: i=1; AJvYcCW3xXfvG9GaE0HFU5utFLMpuMx2DzUMzk303EjHxiK2vyrAHvaYjlTNqOTnZ+My+2mK9hk9UvOyOUCwXV5eP3o=@lists.infradead.org, AJvYcCWEvkLfuiTYCRO1c5gxqoptYqlEf/2IFJwrlfIkhTGyPdQOCEQk7mWjiViY3UslHp29suyu54375XAwJ0EeKWbQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyS2Kp3QW71VKZyLJmXAly0kNJ3piw2E06H+QlJ5UmQaNhJ2vLn
	B0CjeP9E/l9zgQu84e3LCBxIAm3pfge0KOgr4PL4+BlHSE43gviG
X-Gm-Gg: ASbGncuRa2ZnYZLV8DVVRZ63oQnUQrgGiLxNkhfQDB5JHGWPSdEtoZdoehQ7nMbE3z8
	VAuGlaI++Qux26LBJ9narHwc7iOv5TKsVKi6MGYMJay1BMca1uZZ9lvo3dYp5Yc+VSkfwZX8A0w
	jb3pjJTD5X8q4BwFJcVk90AZZ9AjeatHVNoMs+gMW1c55ZZ+Oski6FyLRIoVTdQ7O7zXX+iZcM5
	2wxOqTAgV/z+oesx7Z50w+nHO9HhDUb/lZiePrb5y0lZzUb+GDcmxGXd0jogAvmGV4bn2t9CQxf
	6AB0swsFi8aH
X-Google-Smtp-Source: AGHT+IHviim7NbVtUOIT+HnieV8oHcaBrBqk3Euy0/kRPqRbIEFM5mW2+1jwbLENz44EIQcBecLugg==
X-Received: by 2002:a05:6000:2a3:b0:385:e4a7:df07 with SMTP id ffacd0b85a97d-3888e0b9ea9mr4497177f8f.42.1734189122114;
        Sat, 14 Dec 2024 07:12:02 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362571776asm80794525e9.40.2024.12.14.07.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 07:12:01 -0800 (PST)
Message-ID: <675da041.050a0220.a8e65.af0e@mx.google.com>
X-Google-Original-Message-ID: <Z12gOtM4EWWMgLnI@Ansuel-XPS.>
Date: Sat, 14 Dec 2024 16:11:54 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241210211529.osgzd54flq646bcr@skbuf>
 <6758c174.050a0220.52a35.06bc@mx.google.com>
 <20241210234803.pzm7fxrve4dastth@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210234803.pzm7fxrve4dastth@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_071204_605039_411E6AA9 
X-CRM114-Status: GOOD (  25.21  )
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

On Wed, Dec 11, 2024 at 01:48:03AM +0200, Vladimir Oltean wrote:
> On Tue, Dec 10, 2024 at 11:32:17PM +0100, Christian Marangi wrote:
> > Doesn't regmap add lots of overhead tho? Maybe I should really change
> > the switch regmap to apply a save/restore logic?
> > 
> > With an implementation like that current_page is not needed anymore.
> > And I feel additional read/write are ok for switch OP.
> > 
> > On mdio I can use the parent-mdio-bus property to get the bus directly
> > without using MFD priv.
> > 
> > What do you think?
> 
> If performance is a relevant factor at all, it will be hard to measure it, other
> than with synthetic tests (various mixes of switch and PHY register access).
> Though since you mention it, it would be interesting to see a comparison of the
> 3 arbitration methods. This could probably be all done from the an8855_mfd_probe()
> calling context: read a switch register and a PHY register 100K times and see how
> long it took, then read 2 switch registers and a PHY register 100K times, then
> 3 switch registers.... At some point, we should start seeing the penalty of the
> page restoration in Andrew's proposal, because that will be done after each switch
> register read. Just curious to put it into perspective and see how soon it starts
> to make a difference. And this test will also answer the regmap overhead issue.

Ok sorry for the delay as I had to tackle an annoying crypto driver...

I was also curious about this and I hope I tested this correctly...

The testing code is this. Following Vladimir testing and simple time
comparision before and after. I used 100 times as 100k was very big.
From the results we can derive our conclusions.

static void test(struct an8855_mfd_priv *priv, struct regmap *regmap, struct regmap *regmap_phy)
{
	ktime_t start_time, end_time;
	// struct mii_bus *bus = priv->bus;
    	s64 elapsed_ns;
	u32 val;
	int times = 1;
	int i, j;

	start_time = ktime_get();
	for (i = 0; i < 100; i++) {
		for (j = 0; j < times; j++) {
			regmap_read(regmap, 0x10005000, &val);
		}
		// mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
		// // an8855_mii_set_page(priv, priv->switch_addr, 0);
		// __mdiobus_read(bus, priv->switch_addr, 0x1);
		// mutex_unlock(&bus->mdio_lock);
		regmap_read(regmap_phy,
			   FIELD_PREP(GENMASK(20, 16), priv->switch_addr) |
			   FIELD_PREP(GENMASK(15, 0), 0x1),
			   &val);
		times++;
	}

	end_time = ktime_get();

	elapsed_ns = ktime_to_ns(ktime_sub(end_time, start_time));

	pr_info("Time spent in the code block: %lld ns\n", elapsed_ns);
}

With the code changed accordingly.

switch regmap + page (proposed implementation)
Time spent in the code block:  866179846 ns

switch regmap + phy regmap (proposed implementation + PHY regmap)
Time spent in the code block:  861326846 ns

switch regmap restore (switch regmap read/set/restore page)
Time spent in the code block: 1151011308 ns

switch regmap restore + phy regmap (switch regmap read/set/restore pgae
+ PHY regmap)
Time spent in the code block: 1147400462 ns

We can see that:
- as suggested regmap doesn't cause any performance penality. It does
  even produce better result.
- the read/set/restore implementation gives worse performance.

So I guess I will follow the path of regmap + cache page. What do you
think?

-- 
	Ansuel

