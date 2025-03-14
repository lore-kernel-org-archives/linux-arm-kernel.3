Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416ECC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 21:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZ8er8q+qEVjGb0Lf/HTxRYIMaF4zb+ALRXEoQrhDn4=; b=KB3RfcoCuuAQ7oJJ6iYhB8cRfK
	xsVbjtrpIj5V9NClzDd/ayWCfomqEuJZCWyXfiwTITXOVffQ0wsxRFS/aRrPYBKic5VDI7BzbmnMK
	JmNzzLbM73f3ekzFDAByg8wkiRo2ZrScdDjMluEMHpF24dQ3cswZHuQAXpgTyOoC3rirUn9a7ymi3
	9i6B36fS/aRDYhalDhDwf4HGVaGOfU3sFhCP6SnYfjIoQezIj3xsOe6yyvxNHujomQvkL8uDHsFMP
	0W5Afhh9Og8EgC3EyckoKWGehZ+xLgLGifCGp8N4x8yaXE8VsbRmWPbv6+cv2/0TSLBbP9tXJ99fp
	gQUlWm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCT1-0000000FIrc-2WJw;
	Fri, 14 Mar 2025 21:21:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCRK-0000000FIer-3B2Z;
	Fri, 14 Mar 2025 21:19:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso1614475e9.3;
        Fri, 14 Mar 2025 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741987173; x=1742591973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HZ8er8q+qEVjGb0Lf/HTxRYIMaF4zb+ALRXEoQrhDn4=;
        b=UhOptwTNUFbzVuotFve36XgIeB/e3LODKePEWxBsjAP9Sj40Hz9Cc8jH0kqtZW5Mv+
         G0m+uIBjZFQ2LNXHe5AFPGftrR1azvdiGsIOf991LhXs1DRBLOnCctcSB6ffxACERRVL
         pdTKHfYYZ3GjMA2Esfr/e1LM1uKJ2hlKgDex/ixp2TNsdoyI7EmpEzvM89nVRKjVn/Mz
         6ojjQq1GRxnRw8UaHduV5VPJm7/MY0T61J4eKZkG9t7A/enEvkiRTwL26f/q1vohBNnn
         vMVip1PMdTQiRmxOk1AMloPHikcZK/D1sdBTa4e6soDB9f/xlQywIthjev2L7cmC6Xp/
         dAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741987173; x=1742591973;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZ8er8q+qEVjGb0Lf/HTxRYIMaF4zb+ALRXEoQrhDn4=;
        b=FkEWsIIrdl3MhG5lEQexjEfc4BO9/xmpYKgdCghwaDUCyq7FU2Kusn+SFUJc69UEzE
         5djk8veeuGXCb5ZASNod+APw+TaDfqiULaxLqPK+U3BEsX1KT/CYG7u5DNtKcsLXhhA9
         iq6fpa2dzQCoKIzR5fSgUkTvm2xgvSPfUs+kw0LvEfF1viZ28oLtWcSMd4y0AacCc1hi
         jpRSv2U6i/gZsoveUEHoC7exDZHbSEdAh3Lw9GHOg31fe2lgIXZpejKDe0kSzl0yX32h
         RzZPjIaI4hUMl/iZWo1tYBY3ffBuHDglwFhDCv4/J3NB8EMJ/T9pi/MmxtpRa+6cGaST
         RQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO1c4vLx/ekz8Rzr0htRRORZTWozYVenpGqrDqd3zyk2kIdKvzxqyBQ8rBaM3vZOb0xbWIsEsf3DOTJ18GRBw=@lists.infradead.org, AJvYcCXVae4tKHNN2cotjrdFtiDlQh/ZBPAhujuAUl2PWr7WjnRoiIHzEDRVaonWws3poUo/PQsjFP/YeEoVyo3ClWEd@lists.infradead.org
X-Gm-Message-State: AOJu0YxBFTyBoj7P/EYwxbvglp2ilhH21/DgYC06+vmd1aOV/B2RpjcD
	WEiSazamrvx1CM1OYpXd+1G7Zjqudaiaaz6aT9dh7eC7vdSTdbVe
X-Gm-Gg: ASbGncsy4O8/fGWlTIp8I7jvLLtV2CYOwtMBxM84OZ+oojdddv9MIXZv0MqgM3105Xy
	LBclkoKpYmzoYgh54mPMmDIJ8eGr742xjbBM0+Wx3Z2fyDB1Gal1vr1xwgF7y29VvtZxJj9fIV5
	7qOWixvHcsuC40LGrCXuprumOWAZiXNe7ISYPwZJ9AyXqyEr1S3DP/8657XgJ+n/vXRiuJ8GAEV
	HOBO8kRGiNUECvIy9X+FuooQjbyIVGmFFt1i38Ep9O6h0UJ22OHoE8k9nTieC9IimTfyR00911e
	ydALqtrmTuggzcu7pw05ZHYm/ckkMn4fMcOmNQx7XCLlWLmhKnwynk4of9GD7okTxZ9cpjUQG/W
	Kk5nI7tIc0tg=
X-Google-Smtp-Source: AGHT+IHGEcaq+mQYLJLVzszVdST1b7J2O2oqDQ6zwCkCBz8ussqbnvLf9ZC6tI+1i/QCVFDqFROb8g==
X-Received: by 2002:a05:600c:4f0c:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43d1ec8cac8mr53968935e9.17.1741987172437;
        Fri, 14 Mar 2025 14:19:32 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fd6b2acsm29215905e9.0.2025.03.14.14.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:19:32 -0700 (PDT)
Message-ID: <67d49d64.050a0220.35694d.b7ab@mx.google.com>
X-Google-Original-Message-ID: <Z9SdYeD-Gb1l77AG@Ansuel-XPS.>
Date: Fri, 14 Mar 2025 22:19:29 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 07/13] net: mdio: regmap: add support for
 multiple valid addr
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-8-ansuelsmth@gmail.com>
 <Z83RsW1_bzoEWheo@shell.armlinux.org.uk>
 <67cdd3c9.df0a0220.1c827e.b244@mx.google.com>
 <0c6cb801-5592-4449-b776-a337161b3326@lunn.ch>
 <Z9SZRDykbTwvGW6S@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9SZRDykbTwvGW6S@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_141934_796710_4D8997F2 
X-CRM114-Status: GOOD (  28.19  )
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

On Fri, Mar 14, 2025 at 09:01:56PM +0000, Russell King (Oracle) wrote:
> On Fri, Mar 14, 2025 at 08:41:33PM +0100, Andrew Lunn wrote:
> > On Sun, Mar 09, 2025 at 06:45:43PM +0100, Christian Marangi wrote:
> > > On Sun, Mar 09, 2025 at 05:36:49PM +0000, Russell King (Oracle) wrote:
> > > > On Sun, Mar 09, 2025 at 06:26:52PM +0100, Christian Marangi wrote:
> > > > > +/* If a non empty valid_addr_mask is passed, PHY address and
> > > > > + * read/write register are encoded in the regmap register
> > > > > + * by placing the register in the first 16 bits and the PHY address
> > > > > + * right after.
> > > > > + */
> > > > > +#define MDIO_REGMAP_PHY_ADDR		GENMASK(20, 16)
> > > > > +#define MDIO_REGMAP_PHY_REG		GENMASK(15, 0)
> > > > 
> > > > Clause 45 PHYs have 5 bits of PHY address, then 5 bits of mmd address,
> > > > and then 16 bits of register address - significant in that order. Can
> > > > we adjust the mask for the PHY address later to add the MMD between
> > > > the PHY address and register number?
> > > >
> > > 
> > > Honestly to future proof this, I think a good idea might be to add
> > > helper to encode these info and use Clause 45 format even for C22.
> > > Maybe we can use an extra bit to signal if the format is C22 or C45.
> > > 
> > > BIT(26) 0: C22 1:C45
> > > GENMASK(25, 21) PHY ADDR
> > > GENMASK(20, 16) MMD ADDR
> > > GENMASK(15, 0) REG
> > 
> > If you look back at older kernels, there was some helpers to do
> > something like this, but the C22/C45 was in bit 31. When i cleaned up
> > MDIO drivers to have separate C22 and C45 read/write functions, they
> > become redundant and they were removed. You might want to bring them
> > back again.
> 
> I'd prefer we didn't bring that abomination back. The detail about how
> things are stored in regmap should be internal within regmap, and I
> think it would be better to have an API presented that takes sensible
> parameters, rather than something that's been encoded.
>

Well problem is that regmap_write and regmap_read will take max 2 value
at the very end (reg and value) so it's really a matter of making the
encoding part internal but encoding it can't be skipped.

You are suggesting to introduce additional API like

mdio_regmap_write(regmap, phy, addr, val);
mdio_mmd_regmap_write(regmap, phy, mmd, addr, val);

And the encoding is done internally?

My concern is the decoding part from the .write/read_bits regmap OPs.
I guess for that also some helper should be exposed (to keep the
decoding/encoding internal to the driver and not expose the
_abomination_)

What do you think?

-- 
	Ansuel

