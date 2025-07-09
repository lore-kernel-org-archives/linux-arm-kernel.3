Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFE4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 04:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQhCFUQXqPLefJ8ih+mruiWIMzk9Nrdb8hgYrHL70VE=; b=Zs5NqbSc+mvMuIlnIgr+Z8HJ9N
	5vWsP+Jlnm+qmMGduJM07Tym1gnPMOF5cOafFvv4jonT+U5CHqgivCJA+BPzQrdqmYQwCJpRQ7PG+
	vs5Uq0VSyr9yPOfKAO7pFkJomk94n27AOrfrgi0sjmx4u2vDFOxIzds8DO8OiNa7bALAGAJf0FqlC
	BQ8dA+FLM/bSw4fvbBZIVGJEpH6bcFakZEDapOnwYYRsXyp4i5xdv7+98ZnsErzzfnCAD2Vd+6d4L
	9YnFlrn2fGqfvPtcPvJ38iwg4xA7VLbElQXDRq/+dsWUBK5MOTTke0ri3T27FLsN2ZIF1bAnm2BKJ
	IxdOv7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZMRJ-00000007OTf-3wWc;
	Wed, 09 Jul 2025 04:29:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZMN7-00000007O1p-2ssE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 04:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aQhCFUQXqPLefJ8ih+mruiWIMzk9Nrdb8hgYrHL70VE=; b=MsmRFSigcjwHp0/QI7Y+z2ad1J
	OzLRdnjHBrSem8CT+BNtEr0BbPkjhzGoFsa1LbsaUYxWHeXYMcJVKktOo9a9MV4eqJdtbiAut7gV5
	lnpQ+Q1frb/YoQaniLYJiURHOU+AmNJHwZpEyC+Pvb4ZI2PtUNsTUVwIpjIImJHU2Z1EDk5/9kCyG
	19W6fUV9LeNj9HoVjeF4J4VjtLPkWFQBdniGEckrsA1QYBjmRJB8bWP3Xy0CBJ2HYXz8dTe0jb01C
	dG0J0wR8oEyLHinHhRXPuwXtBU8eCITvAaHdkZYsCvr4IImrHSA37oMbERsb7+Trttb6kiB46XqQm
	wdxltntA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59580)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uZMMq-0007Pm-0q;
	Wed, 09 Jul 2025 05:25:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uZMMi-0002Dj-0p;
	Wed, 09 Jul 2025 05:25:04 +0100
Date: Wed, 9 Jul 2025 05:25:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: lizhe <sensor1010@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] net: stmmac: Support gpio high-level reset for
 devices requiring it
Message-ID: <aG3vIMHkPezr4rJT@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
 <aG1X9pPYDGO8kfM9@shell.armlinux.org.uk>
 <2588871d.189d.197ece7c486.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2588871d.189d.197ece7c486.Coremail.sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_212529_729997_509378DA 
X-CRM114-Status: UNSURE (   9.87  )
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

On Wed, Jul 09, 2025 at 09:58:21AM +0800, lizhe wrote:
> Hi, 
> 
> Thx !
> 
> i conducted an experiment, and no matter whether i configured it as 
> GPIO_ACTIVE_LOW or GPIO_ACTIVE_HIGH in the dts, the resulting
> GPIO pin state was 0, indicating a low level.
> 
> 
> if (delays[2])
>     msleep(DIV_ROUND_UP(DELAYS[2], 1000));
> 
> + gpio_state = gpiod_get_value_can_sleep(reset_gpio);
> + pr_info("gpio_state: %d\n", gpio_state);

Use gpiod_get_raw_value_cansleep().

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

