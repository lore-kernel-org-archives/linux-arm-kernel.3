Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75A9C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0yBdNIFiNFE1FpbrRAP6wKPm7LpSS3P6fwzuoGhPPM=; b=wXVC6lB7n3KAaybQVRlUDE/hYs
	V7vhukyBvS5RjsSZWhjJzZ3XIst//NCwj4PsLkfOASURNxZ0Zl6HWsG2uuU5zy3HpLUGjfjrkZuxp
	/S49GWnVCgV00jbHMj3vBXQzNgAZSigCEjoKL9w3xZtn8roTL/dcrMQ9VqbYp9gKFEkNf57x5AdXc
	8QFFjyLbVAv12ZIk+R36Ofb8njcRtLKkAC0GuyCuACOvEdKeiLCU75S7vZpunpWnPoM5tevyxwINo
	KCBK652Fu5MSeiPaenGHfHPGW+sIR87LHZtiixNonrAmNzQ42Gh/rmct3zbaEaxvEUdJJ7F0tsnQd
	L9f5+FgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pw8-0000000AGIU-3Stg;
	Thu, 10 Apr 2025 11:19:12 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pBz-0000000A6Rt-1Hhm;
	Thu, 10 Apr 2025 10:31:32 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 3584C114010E;
	Thu, 10 Apr 2025 06:31:27 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 10 Apr 2025 06:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744281087;
	 x=1744367487; bh=V0yBdNIFiNFE1FpbrRAP6wKPm7LpSS3P6fwzuoGhPPM=; b=
	Z5KSZ7nJVbdwy9BhFww8lYpEdyJhzZWk9XLxTa+UG6uUBBj2rdqhWZasS+ErZ8br
	mmUPLlBEmpfYJIDD7uVeMUmMYiBjyGZgs/HwTvPomyyTjU/hsaS+Tj3qnpELuLOW
	UiSzIvC0FQbWRGhRVBBXcm5geduHs3X895U2faeoAz/I5BqKN9n2YdT7xQ7kbv8i
	kcvro6iOqTcI77aVWnuwZOEp8rXsVe0E9jGXy+BcNgQKQN2DZZf6LzTqj1+gG7Eb
	o6eQdAVs+cHkzQZfEL3E9l7Q1Dqnhh2Kq66Nt7WPvABBc7ABXFmP/yijnqgrsiLE
	QdcVLp7yRrgF3tTiOEeMiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1744281087; x=1744367487; bh=V
	0yBdNIFiNFE1FpbrRAP6wKPm7LpSS3P6fwzuoGhPPM=; b=UGIH6PgKM3vhT2VIE
	aBFuE80+Eqjo+S2oIkcsH9rO6OwI2i3iLbm8V+IIiqH0iRGxiyvau0fMgSetdXrC
	vPTxWhYmJRX7ieCba6fEtWSxY5nLKN9h5hcPaR2XNdUEKmXCiPv3IXWJmLv09J7w
	UZ1zoymlOy0QxnMDOpVjw1XjPQ7a7nHmdxM5CMx77iaEGbSpb/l3nljsOmUCZOAj
	jXoaw5SEJ+wb64IkHMKhSZ4pEvqjMSNEAf76Rasxzb+zsVAm1gNIJSByrqa2X7Ki
	pFnGJ1GHzJvrrYnvjw6iZDr17tCrP4klibJT2pQKIsXB8MJzbkXrtA06Bd0Z9B3W
	DEUtA==
X-ME-Sender: <xms:_Z33Z0X5BqMn_cSrL6aNS3-Obxa46Z30GQgcGGj5mGDQ2U_QPS42pw>
    <xme:_Z33Z4k8fpfX5TEMQkjQr9zko--N8gtzQjf_0X_bMjOnXUkuE--Xg7CRb7_hv1H9e
    i65puKGMioFG0Teklw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhkeeltdfffefhgffhteetheeuhffgteeghfdt
    ueefudeuleetgfehtdejieffhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuh
    igrdhorhhgrdhukhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggv
    lhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepuggrvhgvmhesug
    grvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhhsuhgvlhhsmhhthhesghhmrghi
    lhdrtghomhdprhgtphhtthhopeguqhhfvgigthesghhmrghilhdrtghomhdprhgtphhtth
    hopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhh
    ihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegvughumhgriigvthesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdr
    ohhrgh
X-ME-Proxy: <xmx:_Z33Z4Y0z37CzBhOWyz0En_d25z8H-7acC6HizYeN82BV-W20FZqUA>
    <xmx:_Z33ZzUt1QtGrN8Djm48g4a2K4XfLgUtr5tKUMuMsIgGpV6FRSmoSw>
    <xmx:_Z33Z-mhgW8KNjQWLry_fGsAqqkVl8MtKBxcdRwxElndIhjGUvRyAQ>
    <xmx:_Z33Z4fiW8MWbivsSOLRkzI2hBWPm-P9xIDG-hopMChnOXfz_poiPA>
    <xmx:_533Z4eNW4OfL-TJflZ4WA5fweG31XUM5p8BeO5Qwv_WwyvyJp7acXfw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8E3E72220073; Thu, 10 Apr 2025 06:31:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T2340d8c52bdbc82d
Date: Thu, 10 Apr 2025 12:31:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christian Marangi" <ansuelsmth@gmail.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Daniel Golle" <daniel@makrotopia.org>,
 "Qingfang Deng" <dqfext@gmail.com>,
 "SkyLake Huang" <SkyLake.Huang@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Simon Horman" <horms@kernel.org>,
 Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Message-Id: <c108aee9-f668-4cd7-b276-d5e0a266eaa4@app.fastmail.com>
In-Reply-To: <20250410100410.348-1-ansuelsmth@gmail.com>
References: <20250410100410.348-1-ansuelsmth@gmail.com>
Subject: Re: [net-next PATCH v2 1/2] net: phy: mediatek: permit to compile test GE SOC
 PHY driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_033131_826097_25EFF328 
X-CRM114-Status: GOOD (  12.41  )
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

On Thu, Apr 10, 2025, at 12:04, Christian Marangi wrote:
> When commit 462a3daad679 ("net: phy: mediatek: fix compile-test
> dependencies") fixed the dependency, it should have also introduced
> an or on COMPILE_TEST to permit this driver to be compile-tested even if
> NVMEM_MTK_EFUSE wasn't selected

Why does this matter? NVMEM_MTK_EFUSE can be enabled for both
allmodconfig and randconfig builds on any architecture, so you
get build coverage either way, it's just a little less likely
to be enabled in randconfig I guess?

> diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
> index 2a8ac5aed0f8..6a4c2b328c41 100644
> --- a/drivers/net/phy/mediatek/Kconfig
> +++ b/drivers/net/phy/mediatek/Kconfig
> @@ -15,8 +15,7 @@ config MEDIATEK_GE_PHY
> 
>  config MEDIATEK_GE_SOC_PHY
>  	tristate "MediaTek SoC Ethernet PHYs"
> -	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> -	depends on NVMEM_MTK_EFUSE
> +	depends on (ARM64 && ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || COMPILE_TEST
>  	select MTK_NET_PHYLIB
>  	help
>  	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
> -- 

I would expect this to break the build with CONFIG_NVMEM=m
and MEDIATEK_GE_SOC_PHY=y.

The normal thing here would be to have a dependency on
CONFIG_NVMEM in place of the NVMEM_MTK_EFUSE dependency,
or possible on 'NVMEM || !NVMEM' if you want to make it
more likely to be enabled in randconfig builds.

       Arnd

