Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70874D5C0C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9iLMWxrxAZ1l6R46sN9fOYiE6mHClhuivBfFEnygig=; b=G/eTga28JSAaQvmp/t/r1Mu5Uy
	ntX0hJ4oGTYlV33Jb+qQTQ1L5mubaKd3l8ClbMZTYW3sZctQ79v3H/7m27HOt/K/J027RhfSHn982
	01FWPzZhcbfyrZCn2j+S94lWc4nKZYIUirBFenYsCxiP689p1zWq6b8EBWNBSYLpzOST37aUXsdLL
	dGHtrFDk5VK7AS4V6waqBY13mw7tJiCGtdpqY1YD1/7YM0gWyqWKm0OPGt3rr4JHvOZfEjvYl0xoW
	5KePXl28vk+r57Rt679lMOlFCI9z58w8dCFxvZcAgWUJsdBYnLbaalvd2OTKVfz30NtHd5/lS969x
	z/bwDkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9On4-0000000AdOy-3Gne;
	Fri, 08 Nov 2024 13:12:42 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ojx-0000000AcrN-2U5z;
	Fri, 08 Nov 2024 13:09:31 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso1234445f8f.3;
        Fri, 08 Nov 2024 05:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731071367; x=1731676167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F9iLMWxrxAZ1l6R46sN9fOYiE6mHClhuivBfFEnygig=;
        b=iFdnn5skcx6E5mUlKoJz0ravX9mLwcZYOnKkr/Ux3HZc8JaP834tiHLUueKnTjsW1R
         obtadBBKp5YdVMjXyIyDPi6f/coOjX3Sf5IAx0q3EDCMRNyXxE0vXbFW95USo8tX0t+g
         laS9W6Gw+/WnHONdZiwDSjvxfufqsICa5wDb4kPQtJdMenQhD6C0ZJ6GGRvySp/czeIS
         Bcpm2sJzgHB9CiiWCUm6y17CmuTyzd1wbE1+DDdkPEV59XrY0+6gu220nrLtZPRR6R9h
         T8uJUNpkwL4y/E0ZUIYC9WdPpa06Dj/EFgpf5rRR83InRyQhtp9Jxvw0G6fYrq+7M6Et
         0mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731071368; x=1731676168;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9iLMWxrxAZ1l6R46sN9fOYiE6mHClhuivBfFEnygig=;
        b=csjKBZrweHE7RNQHT0m1QJNiUAUNSWwGqnfVb8q5OvdUu9E16kD1U5EcpKzssY9BKz
         cBZmllMO0JpM/Plm4kec8IZ5b6AwgxukKe94uUeMcdrONAuFMYXHopIPfs1ovfhze3BH
         dy4z9eQCzyDGjW1/Ch8/qicFKuD97SwcmvYbKcooSo3nkJF3nMhryVpPooIvbxB5lcaM
         /KbAR7KAvKMHikUNrGWDgC10yZzUrdFGeTd4XbZzphSkVeb++8HJBpl+8oK29TFEMvHY
         CkLdPuzdcnyoP55N274KLKkfun31PDwKItwuetJQ977kBf3fE1tX0txqNyRMqnrf+bUG
         F5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSWinN2aEHoMa7RhLzG3n603KH2c0ngVquqHNOa+eGa+8ILPSgtqiYSppizA69wql6ob1BUEaGchQ/CsZ9L8e7@lists.infradead.org, AJvYcCX1NrspZQhcixFuOywdk3redc0Jm+pYPp9Hrs1vGtqKiZfjxhPrfofRGwVS2bUxDgP3Obxmgf8NPUQ78yerRZo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPwZpF6wk7a12+zVP3L5YPoE7snt9dy0sTQf6jq0zjUzRVROuu
	im+j6C84B1h20uhAyrXfUB2q7Rl7E2VWm5cgf6yt30iWgxuUFAaX
X-Google-Smtp-Source: AGHT+IGn8e7+hz9DFcsUdMnK7TZj6vrjAuQ+ZZHeOp4IPyI4ISngIYwwvEId7eCxCw595dz7+N8oSA==
X-Received: by 2002:a05:6000:18a7:b0:37d:52d0:a59d with SMTP id ffacd0b85a97d-381f18672fdmr2224309f8f.10.1731071367308;
        Fri, 08 Nov 2024 05:09:27 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda0517csm4724320f8f.96.2024.11.08.05.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:09:26 -0800 (PST)
Message-ID: <672e0d86.050a0220.9eb0d.c3e1@mx.google.com>
X-Google-Original-Message-ID: <Zy4Ngmvg2sE1SOJK@Ansuel-XPS.>
Date: Fri, 8 Nov 2024 14:09:22 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
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
 <Zy3xaviqqT6X8Ows@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy3xaviqqT6X8Ows@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_050929_654763_DFE1F64B 
X-CRM114-Status: GOOD (  26.04  )
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

On Fri, Nov 08, 2024 at 11:09:30AM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 06, 2024 at 01:22:38PM +0100, Christian Marangi wrote:
> > +/* MII Registers Page 1 */
> > +#define AN8855_PHY_EXT_REG_14			0x14
> > +#define   AN8855_PHY_EN_DOWN_SHFIT		BIT(4)
> 
> Shouldn't "AN8855_PHY_EN_DOWN_SHFIT" be "AN8855_PHY_EN_DOWN_SHIFT"
> (notice the I and F are swapped) ?
>

Typo from SDK that I didn't notice fun.

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
> > +	if (ret)
> > +		return ret;
> 
> This function is entirely broken.
> 
> phy_restore_page() will return "val" if everything went successfully,
> so here you end up returning "val" via this very return statement
> without executing any further code in the function. The only time
> further code will be executed is if "val" was successfully read as
> zero.
> 
> Please use the helpers provided:
> 
> 	ret = phy_read_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1,
> 			     AN8855_PHY_EXT_REG_14);
> 	if (ret < 0)
> 		return ret;
> 
> ret now contains what you're using as "val" below. No need to open code
> phy_read_paged().

Thanks for the explaination, totally got confused by reading the
restore_page code. Anyway yes I will use the helper.

> 
> > +
> > +	*data = val & AN8855_PHY_EXT_REG_14 ? DOWNSHIFT_DEV_DEFAULT_COUNT :
> > +					      DOWNSHIFT_DEV_DISABLE;
> 
> Here, the test is against the register number rather than the bit that
> controls downshift. Shouldn't AN8855_PHY_EXT_REG_14 be
> AN8855_PHY_EN_DOWN_SH(F)I(F)T ?

Copy paste error, was already staged to fix, thanks for extra eye on
this.

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
> This entire thing can be simplified to:
> 
> 	u16 ds = cnt != DOWNSHIFT_DEV_DISABLE ? AN8855_PHY_EN_DOWN_SHFIT: 0;
> 
> 	return phy_modify_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1,
> 				AN8855_PHY_EXT_REG_14, AN8855_PHY_EN_DOWN_SHFIT,
> 				ds);

Funnly in rechecking I produced the same exact change.

> 
> Thanks.

Thanks to you for the review.

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

-- 
	Ansuel

