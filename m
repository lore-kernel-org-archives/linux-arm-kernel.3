Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280B0CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cwcx/LLJrt6Uufc15KwGlNwi/lfz0dnv+k38+ZDJcSY=; b=yrXfQW5Z5iva+rD6J00siHpkTX
	scf+X3XEpIpKXBrZNyjLUCVzaD+yTcMj4O9No0Z9PfbX19M+OaR3JO2srvwzkJqzlh91psghRveLX
	G55e2/CFK97zmGAepy7Gl8Xy5fBAcxO5jyQsclIrXhLx/FbdLrIBBgBqlzTNp02y1sS4ZRdGj2Uc3
	O5p4FF+2DMo+3egyyFf9i7iDrTIqKbmwXnRBkde69fo5B+qpelj4+UJbY7jv1JsmOZeMST0nlG/p/
	fXc2vdducP06vZQcic4tzOtI+EMM1i+JdXyxCppG21HpQHzLMpOZh08Xc2ZQ+oz/ZKr8je24sPm5F
	OuufkALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTJx-00000002wFP-34j4;
	Fri, 22 Aug 2025 15:04:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOZj-000000028sW-08oZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:00:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C8CBC8EC4A;
	Fri, 22 Aug 2025 10:00:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D6EC604AD;
	Fri, 22 Aug 2025 10:00:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5F881C228674;
	Fri, 22 Aug 2025 12:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755856837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Cwcx/LLJrt6Uufc15KwGlNwi/lfz0dnv+k38+ZDJcSY=;
	b=ItRoWf+nQG+M1Lwn65p6sSiFvXticGD8sE6THoM6h5mfmlo7E4wkegkFFkjxRCAwAkUCfN
	CQa8DEr0JLLoRNie6KJNmW9nX6t2FXMO7cWRWiu7TmZWDWavLcFL99MzRh5mVdLp26oxws
	C9vjARs1PMfQLc6AmBRwRkYJ4YTgskKbs3sbcaYVN06Mh/N9p8I9yxpwIFJfHi9mqNsWP4
	18bAYde0DtCt+xGLSjy5vDV+JEj2lrOGb1w7yV5ulK7qARF24SNN36deyBEyb30HsmSpTI
	kMOFKyjteZTcNTPx4CN4LktKK88tP+2UqH31hIPWUahG+5E3gXtULCLf/hUtKQ==
Message-ID: <fb499f87-141b-4098-9011-37ec273a07dd@bootlin.com>
Date: Fri, 22 Aug 2025 11:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 08/16] net: phy: Introduce generic SFP
 handling for PHY drivers
To: kernel test robot <lkp@intel.com>, davem@davemloft.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>
References: <20250814135832.174911-9-maxime.chevallier@bootlin.com>
 <202508151058.jqJsn9VB-lkp@intel.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <202508151058.jqJsn9VB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_030047_217023_04585123 
X-CRM114-Status: GOOD (  11.75  )
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



On 15/08/2025 05:25, kernel test robot wrote:
> Hi Maxime,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20250814-221559
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250814135832.174911-9-maxime.chevallier%40bootlin.com
> patch subject: [PATCH net-next v11 08/16] net: phy: Introduce generic SFP handling for PHY drivers
> config: i386-randconfig-013-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151058.jqJsn9VB-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151058.jqJsn9VB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508151058.jqJsn9VB-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/net/phy/phy_device.c:1625:47: warning: variable 'iface' is uninitialized when used here [-Wuninitialized]
>      1625 |                 return port->ops->configure_mii(port, true, iface);
>           |                                                             ^~~~~
>     drivers/net/phy/phy_device.c:1597:2: note: variable 'iface' is declared here
>      1597 |         phy_interface_t iface;
>           |         ^
>     1 warning generated.
>
That's completly wrong indeed... I had an extra question to ask to Russell
wrt. that feature, then forgot about it and sent the series...

I'll address that then

Maxime

