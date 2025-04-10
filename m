Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC00C369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZ//pMPETAg42dcoPkby3wAxyfGZ1IdNRs3h3LBFxtE=; b=D0Jpk3V1WMJlZ2GMWvYZgInyM3
	oPrHhN8UmhpG1KmKoWf/PDzYv3xiQVjZ1hW7BV+3eByBRi3W03KQcubdEKgrM+JIB3KqJSLabCv0j
	5LOVEZOvCbUjx4NXQuftv5FCP2uL8wm8coZGz8LHtqR7Bb1/WhfVpWw5kqgy4+j+j0JeZBArVMg5+
	ELnwWQXb8Hh4AF4ymK67Zgfe7H0RCMdAKbrEYWwLI7PNqGCqba+8bzxCBlZPpWBNFoUKpPOaxRbnA
	phBE+LgumWjE2w2F8ZetuETkqHm6eUG+7jOzt0Yl0xbpztSM0UcDr5Fhwoz2DazavvKwBtlSNj9U8
	ocSQeBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pyO-0000000AHbi-1p6q;
	Thu, 10 Apr 2025 11:21:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pOl-0000000A82M-45WF;
	Thu, 10 Apr 2025 10:44:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so5301035e9.2;
        Thu, 10 Apr 2025 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744281882; x=1744886682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wZ//pMPETAg42dcoPkby3wAxyfGZ1IdNRs3h3LBFxtE=;
        b=Cv/602ETDkdHOnfgpdxrPrPz5F6ZREFTESUO86jILSaBy1VyHRMMbTZnMh4cftUDZn
         0uFrQ0+8EG3CDrp3itEEp5Ah/dbK+gDFoTGlRKqfebSu0goP4j+F1xDmD4LziTxb8U/+
         W5njIoKOCFf0wjuZU696QjvAcC7ZJrZQt7za9BBgQ4Kgjs/Hu8jTvRU/WdwHcqDXdFlQ
         bb1GoWQcu+vPefiuksqdBcndXPc8faqCmoMuEniGyIEUguK3eZxnUGzJNgXiE+iNwM9E
         hY30U3CEv7qgVUbfAto3KXeld9R5cWU34RrEfJ+9xKQ433+X/+57VTXPMhbrpg7aEp7d
         d+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281882; x=1744886682;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZ//pMPETAg42dcoPkby3wAxyfGZ1IdNRs3h3LBFxtE=;
        b=C3H5NqeVlj2rp5yxQnAadOYO7wiLYwAZulUV6ygrM5aE6q2MKdMEQuOnitk3usUBdb
         H5uaOnUlTrWM9sdbV93pTJFqWNJj9siWipW658MUBsS0uxL4NY6W1cWZkHvUD8Vwt5B7
         AzSvuDHR5N+MHVW1nJXObn+XdVxp1QlUEQvHNSnSpiVRB8guQukrI7YD4HbXZsVBdGa5
         QGacIn8gJaunUqBripa/ovfa4P/lNO5YF7Im06YCJ/mLNqkPQwGMf0Dd60eIRZzx65RM
         3LkOuUYjQigYLtXZXW09tARQ1O/ZDdJ/PhFQnVCUieBpaCrBdzuFzRq0UIYueMfwFHrw
         Mniw==
X-Forwarded-Encrypted: i=1; AJvYcCUJZsfwzgjm3gGuyS6WoH976vj64MSW4TxX7Ar/4evehIUO/LAo4YWu2Hoz8A4zsrzjBBxWZjlZ05v+iHboDT4=@lists.infradead.org, AJvYcCXUHYbAIb5kUuPtv7/PQaTIl8nAVrDApXxvzHT3K6WgSClEJFBSCAQTtaaJDDyIvvhiC3KLXjKDUKcQonE9j0g4@lists.infradead.org
X-Gm-Message-State: AOJu0YxYbvoMasZt5pt4rIjTRUTjREWmWMNZymK5Lu97d+XqOcYEi47r
	0ZwRf8gRtNrg7EXibT7Ezv1VkcDFiRcqeDS210Jsp2g7tIpm0quxBWSSZw==
X-Gm-Gg: ASbGnctEhvfmA2b/P7x+YGaYMtCdebxyoCkEER9pWwyf84UcuIScJPF1g5SZoSalnUb
	sy5m0pcr7aQnnft8LMzGc8mOH9A9QJxBmOROELr7v8XDG6lXYVz3h6+JPplWO4jGHIAYjWna2Xs
	6LYkDZvJXGy5VzwMpEl9jQY5v5odButHtT+xl+PKJoffJNb6XVud9U83d/1HLV6P30Uvb2aXK3g
	quFJN/lhw0pkBDStWMEC15LGi9CkNZH4I/SvDMUDmQa1dWScU/0X6fUuKYftn9lpiXKlALad60c
	2GF3h3R1dsrXy9CjJvJyWt3nAKeGqA55FaDVRveTRZ7FLtI9reg3pVm69FzzOFlAYXTVPOvD
X-Google-Smtp-Source: AGHT+IFpFXLEJ+sOfYOonC+1hRzn/Ph2PLZMKSNMJUMAryBjgbH/PZKYKQFKTofpYWUTnxZfWrW3yA==
X-Received: by 2002:a05:600c:1e89:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-43f2ff9a01cmr14904835e9.25.1744281882275;
        Thu, 10 Apr 2025 03:44:42 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0b2asm4376280f8f.72.2025.04.10.03.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:44:41 -0700 (PDT)
Message-ID: <67f7a119.050a0220.b15d0.3df3@mx.google.com>
X-Google-Original-Message-ID: <Z_ehFF-osk3iMrMw@Ansuel-XPS.>
Date: Thu, 10 Apr 2025 12:44:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, Netdev <netdev@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH v2 1/2] net: phy: mediatek: permit to compile
 test GE SOC PHY driver
References: <20250410100410.348-1-ansuelsmth@gmail.com>
 <c108aee9-f668-4cd7-b276-d5e0a266eaa4@app.fastmail.com>
 <67f7a015.df0a0220.287b40.53b2@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f7a015.df0a0220.287b40.53b2@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_034444_010898_6F28CA23 
X-CRM114-Status: GOOD (  33.47  )
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

On Thu, Apr 10, 2025 at 12:40:15PM +0200, Christian Marangi wrote:
> On Thu, Apr 10, 2025 at 12:31:05PM +0200, Arnd Bergmann wrote:
> > On Thu, Apr 10, 2025, at 12:04, Christian Marangi wrote:
> > > When commit 462a3daad679 ("net: phy: mediatek: fix compile-test
> > > dependencies") fixed the dependency, it should have also introduced
> > > an or on COMPILE_TEST to permit this driver to be compile-tested even if
> > > NVMEM_MTK_EFUSE wasn't selected
> > 
> > Why does this matter? NVMEM_MTK_EFUSE can be enabled for both
> > allmodconfig and randconfig builds on any architecture, so you
> > get build coverage either way, it's just a little less likely
> > to be enabled in randconfig I guess?
> >
> 
> If we base stuff on the fact that everything is selected or that a
> random config by luck selects it, then COMPILE_TEST doesn't make sense
> at all.
> 
> For my personal test, I wanted to test the driver on a simple x86 build
> without having to depend on ARCH or having to cross compile. Won't
> happen on real world scenario? Totally. I should be able to compile it?
> Yes.
> 
> > > diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
> > > index 2a8ac5aed0f8..6a4c2b328c41 100644
> > > --- a/drivers/net/phy/mediatek/Kconfig
> > > +++ b/drivers/net/phy/mediatek/Kconfig
> > > @@ -15,8 +15,7 @@ config MEDIATEK_GE_PHY
> > > 
> > >  config MEDIATEK_GE_SOC_PHY
> > >  	tristate "MediaTek SoC Ethernet PHYs"
> > > -	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> > > -	depends on NVMEM_MTK_EFUSE
> > > +	depends on (ARM64 && ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || COMPILE_TEST
> > >  	select MTK_NET_PHYLIB
> > >  	help
> > >  	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
> > > -- 
> > 
> > I would expect this to break the build with CONFIG_NVMEM=m
> > and MEDIATEK_GE_SOC_PHY=y.
> > 
> > The normal thing here would be to have a dependency on
> > CONFIG_NVMEM in place of the NVMEM_MTK_EFUSE dependency,
> > or possible on 'NVMEM || !NVMEM' if you want to make it
> > more likely to be enabled in randconfig builds.
> > 
> 
> The big idea of these dependency is that... In MTK the internal PHY of
> the switch needs calibration or it won't work hence it doesn't make
> sense to select the PHY as it won't ever work without the NVMEM driver.
> 
> But from a compile test view where we only evaluate if the driver have
> compilation error or other kind of warning, we should not care...
>

Also 99% I could be wrong but from what I can see in NVMEM kconfig,
NVMEM is not tristate but only bool? So NVMEM=m is not a thing?

-- 
	Ansuel

