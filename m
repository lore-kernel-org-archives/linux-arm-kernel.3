Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0D2CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/bfZlkIthONZwal+BuFPrR21tTmL0QJZVmWIFcUsNk=; b=4JKAoQQqdu5qnBz6deMVQjR7bd
	2cDy1rVa1Yxeb90VZpeJo8uO+NCyHT+Wy5HRBhHycv1gRUZ1xVtZTptExr2F+F1V53y1iLxG6XD5e
	G3JbpwNq9rjIvIXOqdK9xQFWRttJIx8zR8TGeL7E0ZEXjLdExPT/++gjm5uWYpcEImHUB7HsJTXJq
	oBPZ+lcJtq1rx2SXyAZ5bQBmah/Q1kJwQU1Cq3Rah7ukYAqYknnysuSc003Q2odoaTUHjcbHleKzq
	PaIjMaemtnmEqOYFvN/9E74EscF0KarJhtOJwCHo0Qo4p24x/IJyqY6mO6/JS0quAGSh64s9+JCdl
	WZXVg7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ81D-0000000EMta-2gmD;
	Mon, 15 Jun 2026 14:10:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ81B-0000000EMsT-0xTz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 14:10:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so35425315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781532623; x=1782137423; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/bfZlkIthONZwal+BuFPrR21tTmL0QJZVmWIFcUsNk=;
        b=rW1Cn92wz+LrZz8IKcKNi3SaiklmVUFfTmmNF12IWThZf2tO+AHiuQUTw1+0ns/LDn
         uNn7b8XEtJC1CNidn8TFeVHjr44WHHKaPqzNRXRI0er1yk5UoRO4uoicc5C0gy5wu9xN
         ScNcp+feppmE/kb86/oHNdNiIpZEYhiYuV1f8c5rrAhkzbsKRGXW5mKhtnckOY08VlbH
         0KjBafnpGFeRpSfXEvbTGZEIpJhhfwCp2NEA0RdJFB+LAZGPRtGvbiCN20TaA4AWdEqq
         SlDyq2+6xbthproReb/xVE/JDIbM9rDICRyj/a+wzrjQKIiRdWoRd4YQjLanOhNavMnQ
         pFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532623; x=1782137423;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/bfZlkIthONZwal+BuFPrR21tTmL0QJZVmWIFcUsNk=;
        b=X6XPBl/R5sTFu1ACEAdY4HZJGMSXbIYVRtxbhMN1lP9FrB9nH+IEXC2aVyrRMuxrDy
         hMj8rPJjFwtO9Q9ZHHS/UapLlR8SGbSmvOHrqy25uzUXrFfq6SEs/h4LlwBSU3wIbaWZ
         aJyMMAdrRW78VJJQgKUv55ncCSdSHGvbdKJKiFqUeyuRtxaKUGNvTy23EAWjMQORnSt3
         Zx3b0MICIx6PaWGdOyP/GOvcZ7Wj8vXCARNCJgdtiwusFfDlpyI3bb5RchCdB8pPWdIr
         DX1zisd/w57qHXC4DoK8gyY7PfaXibNkVcsWA0KEinUmclYHL8PqEKIbfloAS6UOA6RP
         OKPw==
X-Forwarded-Encrypted: i=1; AFNElJ9OBgar71g66DvH3EaJHQqxVlMDkr27D06iUm80FZbPzBjTXgpq83AMpN/9WP6Q1MwXzPUWarq2S7GnjSOaWJKn@lists.infradead.org
X-Gm-Message-State: AOJu0YxUGa4FoXYntPoVav9V4Jgcd9kfwKvnLDMRG/8upYCq9LFXE/oC
	Qzg1kUJ9rSVmEnMTyUJQPqJ7idIzS+jbW7uyq4RV3K9A3+gkudSv34C9
X-Gm-Gg: Acq92OFRM49uIdBf/0vglGcrdC97z5ZmE9rD5Ov4g8c9jS8E7Q8f7B1TMXvirRygbi8
	zBIiKsuvoQF3JTNf8jUp1Qc6N/CeJux6JBr8YflFoVMCwJIVAN0yRCQF6hznwS7UYx1NPgqaTV/
	Td3g13crkLr0/kYobXN4iPWa4OLSNA3pv0vlMzjmk6/zaxrNhZ4wqJMH5mrJIb5hu55kjvY8mgy
	xoZ92QHia4wcwbeJXO7NSh07vg3LPzAHWqpjJUaaVD99ouOw0TYrewK0f+qvnOnj++XqhprQU04
	F0VjBGe6SqOv8QePIzFxJHzp6neNaiNBoy6zrRchERIjYuG3g5wfkuSq6fKRIjc/eRkdUKvbZ8V
	NFhP/dPr23xr3eZTQ+fgPIZN2EFmQfVb0eVAlLh8DAQZ74kyJKpgGMNycEzoAAW5r4gFdiaaSXn
	78nWfcvkPuyi6JPTy6BYRxF61vH8x0xr8I3kXmuSVffvpcki4du58nFQ==
X-Received: by 2002:a05:600c:1912:b0:490:bbc1:c9be with SMTP id 5b1f17b1804b1-490ec30f6aamr146216505e9.0.1781532623124;
        Mon, 15 Jun 2026 07:10:23 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea9563b8sm223213855e9.2.2026.06.15.07.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:10:22 -0700 (PDT)
Message-ID: <6a3007ce.73de60af.3a056d.d903@mx.google.com>
X-Google-Original-Message-ID: <ajAHynRJ1jnbycam@Ansuel-XPS.>
Date: Mon, 15 Jun 2026 16:10:18 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v7 05/12] net: phylink: support late PCS
 provider attach
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-6-ansuelsmth@gmail.com>
 <867a39de-ccc2-4dcf-be24-ab2542d20ab6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <867a39de-ccc2-4dcf-be24-ab2542d20ab6@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_071025_283173_604B6065 
X-CRM114-Status: GOOD (  27.71  )
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

On Mon, Jun 15, 2026 at 04:07:03PM +0200, Maxime Chevallier wrote:
> Hi Christian,
> 
> On 6/15/26 14:29, Christian Marangi wrote:
> > Add support for late PCS provider attachment to a phylink instance.
> > This works by creating a global notifier for the PCS provider and
> > making each phylink instance that makes use of fwnode subscribe to
> > this notifier.
> > 
> > The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
> > a new PCS provider is added.
> > 
> > phylink will then react to this event and will call the new function
> > fwnode_phylink_pcs_get_from_fwnode() that will check if the PCS fwnode
> > provided by the event is present in the pcs-handle property of the
> > phylink instance.
> > 
> > If a related PCS is found, then such PCS is added to the phylink
> > instance PCS list.
> > 
> > Then we link the PCS to the phylink instance and we refresh the supported
> > interfaces of the phylink instance.
> > 
> > Finally we check if we are in a major_config_failed scenario and trigger
> > an interface reconfiguration in the next phylink resolve.
> > 
> > In the example scenario where the link was previously torn down due to
> > removal of PCS, the link will be established again as the PCS came back
> > and is now available to phylink.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> 
> [...]
> 
> > @@ -2151,6 +2204,10 @@ void phylink_destroy(struct phylink *pl)
> >  	if (pl->link_gpio)
> >  		gpiod_put(pl->link_gpio);
> >  
> > +	/* Unregister notifier for late PCS attach */
> > +	if (pl->fwnode_pcs_nb.notifier_call)
> > +		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> 
> I wanted to try this out, but I get :
> 
> drivers/net/phy/phylink.c:2218:17: error: implicit declaration of function ‘unregister_fwnode_pcs_notifier’; did you mean ‘register_fwnode_pcs_notifier’? [-Werror=implicit-function-declaration]
>  2218 |                 unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                 register_fwnode_pcs_notifier
> 
> I guess you either need to stub this, or there's a missing Kconfig
> dependency somewhere
>

Hi yes if you want toi test just enable CONFIG_FWNODE_PCS. I forgot to add
the static declaration for unregister_fwnode_pcs_notifier. 

-- 
	Ansuel

