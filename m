Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D5CCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12cJkgmNpZePALEcCCii3OEhCzXZc//+4qAWWEONSCc=; b=tm9f+RNz6YPDitNd3rcNbHNp6m
	3dxyQkeapmvhDjEIlrvJC5TkDzPh6Ml5up225JKseRY1RBWyAM4VqvNM+CmCKhTUkOjYBTf8BkXYF
	QgSy7iNx603zw1ierN8WWLXzPyJh3fLBMkCmQTgnNgDRTCbnEuvmEvKHwUNaOgSfnevx8klGeTVla
	rY4dryp6nHT+LyTyk7eJap0bRuzDwPgngTCOU5pi9/lEIuOwXgaTeED5eaJxIGddB1rQ4oxPRv09w
	2sclC/rUTCazBuf4pRM2jfQ8rP27XkinD7B3M8OoGH4AwUxUjDSLu6N8HhIYWxzb9Y5GZW00+S9XZ
	EPEkoLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7yD-0000000EMX7-0zA7;
	Mon, 15 Jun 2026 14:07:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7yA-0000000EMWg-0xTe;
	Mon, 15 Jun 2026 14:07:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 578FA4E42EFF;
	Mon, 15 Jun 2026 14:07:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20E3360015;
	Mon, 15 Jun 2026 14:07:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF69D106C96A5;
	Mon, 15 Jun 2026 16:07:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781532433; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=12cJkgmNpZePALEcCCii3OEhCzXZc//+4qAWWEONSCc=;
	b=zdj55i0XH3giozHt1HpWm9UfrnYusBZsrgy8BIRAXrB12gRGFYttdKWdel5vEcrpKgU3pO
	kBhdbrbf9QdwQ+fPiu2opW/5t31ghiReeLTz6M8Y8J0kWp7gICiIuQG7YVavMSQEiI06nh
	XvF3aocbyXTK/ga1gpylQ0kuKXc0Um1owXiC90x7Ys+HJLXRgCbneEwZiDpMT/vI957D7Q
	/Mj+jd+MV5kLA+KI0SHns+JUCPL7eeozwOQqR9YDjvnN/Pc7ZtsNkSm9VnBjFNVavlxozq
	mJ5t9Eg7cg97pu12QnsGmSdYOCU/VEFxF7+986tvH4yr+YZ/rUitb7n14j6Eew==
Message-ID: <867a39de-ccc2-4dcf-be24-ab2542d20ab6@bootlin.com>
Date: Mon, 15 Jun 2026 16:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 05/12] net: phylink: support late PCS provider
 attach
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
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-6-ansuelsmth@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260615122950.22281-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_070718_403411_0EA90602 
X-CRM114-Status: GOOD (  17.27  )
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

Hi Christian,

On 6/15/26 14:29, Christian Marangi wrote:
> Add support for late PCS provider attachment to a phylink instance.
> This works by creating a global notifier for the PCS provider and
> making each phylink instance that makes use of fwnode subscribe to
> this notifier.
> 
> The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
> a new PCS provider is added.
> 
> phylink will then react to this event and will call the new function
> fwnode_phylink_pcs_get_from_fwnode() that will check if the PCS fwnode
> provided by the event is present in the pcs-handle property of the
> phylink instance.
> 
> If a related PCS is found, then such PCS is added to the phylink
> instance PCS list.
> 
> Then we link the PCS to the phylink instance and we refresh the supported
> interfaces of the phylink instance.
> 
> Finally we check if we are in a major_config_failed scenario and trigger
> an interface reconfiguration in the next phylink resolve.
> 
> In the example scenario where the link was previously torn down due to
> removal of PCS, the link will be established again as the PCS came back
> and is now available to phylink.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

[...]

> @@ -2151,6 +2204,10 @@ void phylink_destroy(struct phylink *pl)
>  	if (pl->link_gpio)
>  		gpiod_put(pl->link_gpio);
>  
> +	/* Unregister notifier for late PCS attach */
> +	if (pl->fwnode_pcs_nb.notifier_call)
> +		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);

I wanted to try this out, but I get :

drivers/net/phy/phylink.c:2218:17: error: implicit declaration of function ‘unregister_fwnode_pcs_notifier’; did you mean ‘register_fwnode_pcs_notifier’? [-Werror=implicit-function-declaration]
 2218 |                 unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                 register_fwnode_pcs_notifier

I guess you either need to stub this, or there's a missing Kconfig
dependency somewhere

Maxime




