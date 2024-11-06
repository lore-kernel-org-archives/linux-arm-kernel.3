Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD74D59F56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAgIf4p6278/YchMAjPlcn7XsnhPqNv2eFyDqelI99w=; b=nZQphKWck4DUj+0XlhsOf4aXZ+
	jw5A0ljaHXaoCv7o8yoGa7oqsyOPsklR0H9vSu2j3mKvRhPgnzQnezdlplmq3RtZO4/7Gxesft9yJ
	ETZeongtlQDiidiIt7oCOjETguraxtFs/UU9WLTjI+znvINhHvQyTZiNeRxL8gs3JWUtKXZF+pZ6i
	dUOu0aENMJRT1ziJGdef2M8TgskYsIk2J5AcOYk6i9Gn1XgBK4VppNWw3O0jqrlecBwoeMseIqj8h
	RdsS+eDU4BCWJao5/VNncsbMFuHvKEY5Ay0RjRlR7TIEnjrvbga0l8gvKhXb3nZrQhnj6d4M4C6Oy
	6qeP+gJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kPr-00000004HSu-0JIQ;
	Wed, 06 Nov 2024 18:06:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kO7-00000004HBd-38hF;
	Wed, 06 Nov 2024 18:04:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4315baec69eso770115e9.2;
        Wed, 06 Nov 2024 10:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730916254; x=1731521054; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jAgIf4p6278/YchMAjPlcn7XsnhPqNv2eFyDqelI99w=;
        b=HS+DqjS7fli2R9j9nbnJLY831Wbnsq3v9Zo6CfSurXKgr080KKvimL9TRgzwG51kfH
         6v1rOn+ean9QMBRIQtGWLAyxJON6MWV4uP1F53uvUm4RgiSyMj44qZEV4QhkL0pbjtGq
         9mdWxUiS/R+eQWND32w+RyMpkcLdDtZ8snagJKBs5EwO3x+5bjfTaQsetqLkhMJubSz3
         gjx70UPwuZq7Q6y+njiqPn4NJyAiTJDuXxxVQ3rs76u6P5mzpVXwHpl+s/ZG7V3pND4K
         n0fOlohkJSEo1ZVIA2/J5MVUUZSVYuRuxfStgW+z635untk5aqiUvY+g2WkdvuXEP8ij
         e3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730916254; x=1731521054;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAgIf4p6278/YchMAjPlcn7XsnhPqNv2eFyDqelI99w=;
        b=GfjaJPSE4OGWq9fuMbBHYb6gTudBYQqemm2ZiRy50mqCZMtUebxMuGS6lmSLevCaOa
         O7cUceGJ5LkXC6nq2SyxjCijw8o4pk9Uf/zaEbez+0EGerfyu2pArggVTiQEKCqidq3H
         j4j9kQrKUafDdgHtAy23ozXiqkZ4X11VN8eLAMAN+XNN/IRaNCPHgU+g0kyD+SPOzw4g
         DfsWnzB9cVOom+ErCiWjcCt2yWjc/obi2H9iM8n9tRnfvoBzfLKLX/I3Gxyuuu6+hdTW
         iQ5iI5xb8ujc7D22sYdQKawF/BpjdhT+MvWS+Kff18vctswOSv8SuHtaPGQ6vp3osdXf
         fDNg==
X-Forwarded-Encrypted: i=1; AJvYcCWYdXAkB5B/yfpst2pITSnha05m/l322zcL32X1BoHaXvlDkEIC950MpROC3Enspi4idXlz7hsb1hCWHFt8UUA=@lists.infradead.org, AJvYcCXnsU/S+EPQvAQN9I6I2M3fY2xBQDJEQW6GY2GCq4SdEjPtqmnTd0AUf74Ec2iL8IPcAqlyE1eV7bSyOP7oPmyf@lists.infradead.org
X-Gm-Message-State: AOJu0YztD89M4oA6Vho5rKmAceJ1ob2rvDEcMsbt9Yw/l271dUYMpKEc
	F0x+3+E6GFkeubItKWToE7ggXEKbYM3lkGxt0atKvUoqbnUDxt0RtN+xtQ==
X-Google-Smtp-Source: AGHT+IHWPx8gOIteq17zsIZ6IuYs4C2NhdtTeClqoAZ0Tqb/e3ajHoC9WAVLlhvh/OK0YcC6B4Ee6g==
X-Received: by 2002:a05:6000:400d:b0:37c:fdc9:fc17 with SMTP id ffacd0b85a97d-381c7a4cea7mr16193774f8f.23.1730916253935;
        Wed, 06 Nov 2024 10:04:13 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa523a0esm31344865e9.0.2024.11.06.10.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:04:13 -0800 (PST)
Message-ID: <672baf9d.050a0220.3c71f4.9bb6@mx.google.com>
X-Google-Original-Message-ID: <ZyuvmSyxag6aJ34H@Ansuel-XPS.>
Date: Wed, 6 Nov 2024 19:04:09 +0100
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
Subject: Re: [net-next PATCH v3 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
References: <20241106122254.13228-1-ansuelsmth@gmail.com>
 <20241106122254.13228-4-ansuelsmth@gmail.com>
 <20241106155458.3552cdda@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106155458.3552cdda@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_100415_809412_5C655A6E 
X-CRM114-Status: GOOD (  19.83  )
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

On Wed, Nov 06, 2024 at 03:54:58PM +0100, Maxime Chevallier wrote:
> Hello Christian,
> 
> On Wed,  6 Nov 2024 13:22:38 +0100
> Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > Add support for Airoha AN8855 Internal Switch Gigabit PHY.
> > 
> > This is a simple PHY driver to configure and calibrate the PHY for the
> > AN8855 Switch with the use of NVMEM cells.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> [...]
> 
> > +static int an8855_get_downshift(struct phy_device *phydev, u8 *data)
> > +{
> > +	int saved_page;
> > +	int val;
> > +	int ret;
> > +
> > +	saved_page = phy_select_page(phydev, AN8855_PHY_PAGE_EXTENDED_1);
> > +	if (saved_page >= 0)
> > +		val = __phy_read(phydev, AN8855_PHY_EXT_REG_14);
> > +	ret = phy_restore_page(phydev, saved_page, val);
> 
> I think this can be replaced with phy_read_paged()
> 
> [...]
> 
> > +static int an8855_set_downshift(struct phy_device *phydev, u8 cnt)
> > +{
> > +	int saved_page;
> > +	int ret;
> > +
> > +	saved_page = phy_select_page(phydev, AN8855_PHY_PAGE_EXTENDED_1);
> > +	if (saved_page >= 0) {
> > +		if (cnt != DOWNSHIFT_DEV_DISABLE)
> > +			ret = __phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
> > +					     AN8855_PHY_EN_DOWN_SHFIT);
> > +		else
> > +			ret = __phy_clear_bits(phydev, AN8855_PHY_EXT_REG_14,
> > +					       AN8855_PHY_EN_DOWN_SHFIT);
> > +	}
> > +
> > +	return phy_restore_page(phydev, saved_page, ret);
> 
> And this by phy_modify_paged() :)
>

Didn't notice those, even better! Thanks!

-- 
	Ansuel

