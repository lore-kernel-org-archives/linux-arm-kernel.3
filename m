Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D071DC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZVsy+u8Fm3uzDsHWAx5pSIoB+hcG1H+DFlE95sUZDk=; b=LsceLJnWuCHEWyb/+Qnq5AFm8Y
	yn5A2k9m2JV7HN+eG25WjqvJq8JXj/2nvGeX4Kce5u905eS5okbFj8aFO5pKdi/06apsvkBETPTpt
	/ViXgnYatNkNr8a+XEMrDkPcLQjzxRA0NCZrIHlW+DTsMvNDwrdTXQltAFfoCzT8lijaYvdsKGUyH
	P+a5SaHE4rUwNNsJX3kga3LwWPKhDSalCFKjDNEjjgOF1SLqEvFPjLnSAZZ87rEyMzyS9RroMCIxX
	Sw6eDSqsNPrtYwD8rEok8LQvsepVt2+QFvtXPna7HO/yxc92sBFGu2m8vxrGOkpWu6S8Wf7ctLis7
	ZScoVdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pwH-0000000AGWr-3gWn;
	Thu, 10 Apr 2025 11:19:21 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pEG-0000000A6lG-3HGz;
	Thu, 10 Apr 2025 10:33:53 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 89650114011B;
	Thu, 10 Apr 2025 06:33:51 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 10 Apr 2025 06:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744281231;
	 x=1744367631; bh=9ZVsy+u8Fm3uzDsHWAx5pSIoB+hcG1H+DFlE95sUZDk=; b=
	mHBP0RABN5/evqVdcLDafmhl/eBw+M8nMrynhaOcdKy/1G4/dJ8ZIvWZPQtZwrqR
	wEQ/rEyZwjZeU21ivpR/clvDqcMawCfeZZ+uqwwT286xP9mF0sD/Lx8ZI5Yn7+hf
	gCFHRwXiG1eRn0FqhwQY5hH81vXPnl7edxk+3lIlI3wnL9ls4hb1FceIW4GKcJrD
	O4IeZzzfx4NKHucUoC3TFWEkpSqwC2j2MrN9MZVEeZ2LQCP1Dx551p3trneK16WU
	0uj4Dfr7UBQWH2Wokc9dfJUW9bU2cE+/4OeOzaI90wO5i9VkhuXQjix9vcChGQYs
	jHr+osC4ZTq/BmbVooU/OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1744281231; x=1744367631; bh=9
	ZVsy+u8Fm3uzDsHWAx5pSIoB+hcG1H+DFlE95sUZDk=; b=ovFQjNzgb8yOF8q9w
	d7yGWos9r4QP2XSEvKfAjMPCm5ZFSh2JOG68wzQnmjIGo63fR83ZMJf2JTgWVkzX
	gUX5c/zZOKyxiFqUuWV/XMc6ovhDf2U8aGC6gxZCx3aw9GGsslb6+rx1RQjaZHdV
	CKGdl3LDlA1rF8+HoDE3Wt2VoasKDIqfedhcHc7dt3tcHwjUinDTAdl9lr7oUGqB
	MO1mi8iqHK93pZdc6SoACgcWhx95SnJQGp57wgx/g/6rrPa+1odEdA8cHSuBJnP9
	YGPSCS2G19vZQ8Rni0h6Xh7h2tKEhosUwRriGvGU50rQ7JTFrjeRQrCY+b9flpE0
	wiYyA==
X-ME-Sender: <xms:jp73Zzr5u-2-yT9r7klL04Sd2xqNZznM6aocr4Xa-aEr86MyGEgo3Q>
    <xme:jp73Z9pVYXBIAs2spukj08uR50buHfrv_G3MiZsb4RiVGISI3QLsVbLMmPpfGASNh
    IHeczReCFie6Lci8ZU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekieelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:jp73ZwPC63QEjRg65RleGg8mfcepyNDhKYQUe8Selt8Jrx69I0ccHg>
    <xmx:jp73Z265V1Lf2vQ8Us6g9e3cQCqXCm0Kky-VebrGT9lSbSU4r40RGg>
    <xmx:jp73Zy6MnnFR-j5t26EMKK9WpKZpPqs-_Y5MlKMfLQzMes8_NEF0_w>
    <xmx:jp73Z-ifwXGMhy6al8aPiEPEIycQWjnMdDJ_1eNT7CtWWx0vSJuTvA>
    <xmx:j573Z7yro9JETGk1AI_wDdM2v3NkVIDK4BCsdAKzbp2Qqqy9ZsQG4NyS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7851E2220074; Thu, 10 Apr 2025 06:33:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T36728e73d2ba2577
Date: Thu, 10 Apr 2025 12:33:27 +0200
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
Message-Id: <11698ed8-e607-4c21-bfa7-a0b7731d0d1e@app.fastmail.com>
In-Reply-To: <20250410100410.348-2-ansuelsmth@gmail.com>
References: <20250410100410.348-1-ansuelsmth@gmail.com>
 <20250410100410.348-2-ansuelsmth@gmail.com>
Subject: Re: [net-next PATCH v2 2/2] net: phy: mediatek: add Airoha PHY ID to SoC
 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_033352_868947_CE36DF79 
X-CRM114-Status: UNSURE (   5.82  )
X-CRM114-Notice: Please train this message.
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
> 
>  config MEDIATEK_GE_SOC_PHY
>  	tristate "MediaTek SoC Ethernet PHYs"
> -	depends on (ARM64 && ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || COMPILE_TEST
> +	depends on ARM64 || COMPILE_TEST
> +	depends on ARCH_AIROHA || (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || \
> +		   COMPILE_TEST
>  	select MTK_NET_PHYLIB
>  	help
>  	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.

This now also fails for non-compile-test builds with
NVMEM=m, ARCH_MEDIATEK=n, ARCH_AIROHA=y and MEDIATEK_GE_SOC_PHY=y.

     Arnd

