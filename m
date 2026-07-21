Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7946C4452F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mO74Pmw6UxmVZKXyVGBSWpqy/BgUtofKZS/t+pO3zxY=; b=ApjtwBLOU/8pAHX8xmxBt5gfiN
	IVSWJQk6uNsm+L1h0iKxK4Lm9YavClUy7cZJ71Lf8g9h5dsm7Sk+kYT16PRbLTcSzpeFePgtYjuMT
	CQkzL1zSBL8dz322cwbYvJ0MAbdXi7Z9ZdK+5ps4joPWnjEDNqoV08G/fU2FCBlsFdb/yijg69Gui
	BS9yy1UiZGnICeElu7SigE7tAYEuWB9ptQ9mrYzxEN3C54LcEWmJBhVtPA62gPWTodbVseWLgcuHv
	pbQOvkSO5BnTJZMR9l16gAuNfKbnzs5DZ5l+gCPkT1uUsmKsZzQZtNqXg01fi0XbOOFvAAq5q1iKK
	i5CwFuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm98G-00000009Mjl-1mBU;
	Tue, 21 Jul 2026 11:59:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm98E-00000009Mid-1jut
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 11:59:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D5DBB1A109D;
	Tue, 21 Jul 2026 11:59:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA34260368;
	Tue, 21 Jul 2026 11:59:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3109611BD2635;
	Tue, 21 Jul 2026 13:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784635167; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=mO74Pmw6UxmVZKXyVGBSWpqy/BgUtofKZS/t+pO3zxY=;
	b=lN9yo390/rq2VQ/FxlD+cm074MGQMPKR1qhZVtpF2vUIAh2feMxbi24XcA4Jo8iI5vEQPG
	yDzbbl9nt4PZhg+aY3pa+l+bA/ZxOMFdSdN2NH4mnNm+iyYQVpzg4Eq2t2y8JqLTFmTfXC
	CEG+pbj8aOfe6zFsEQGTp8E5zPVlJRm4oSNdpXvdHk966F7wtIWr8g7DpBvlhCUpBKctv/
	fCmaV0+4+HDfmkLx4xVW356MzPtB2SMWBmqFaY796+tsKQlIEVCXOwOWtGBIDA5IKZ8p/G
	ziTqE1IrCdPfrCumjG697Yrbvts9RFHoB659ngnRUrVYDYoXK/vPn0fdCcSzGA==
Message-ID: <baeff083-4c77-43e6-a6c0-9c0b24377fe5@bootlin.com>
Date: Tue, 21 Jul 2026 13:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-2-ansuelsmth@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260717065448.1498335-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_045930_603374_030110B8 
X-CRM114-Status: UNSURE (   9.31  )
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

Hi,

On 7/17/26 08:54, Christian Marangi wrote:
> Add in phylink struct a copy of supported_interfaces from phylink_config
> and make use of that instead of relying on phylink_config value.
> 
> This in preparation for support of PCS handling internally to phylink
> where a PCS can be removed or added after the phylink is created and we
> need both a reference of the supported_interfaces value from
> phylink_config and an internal value that can be updated with the new
> PCS info.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

