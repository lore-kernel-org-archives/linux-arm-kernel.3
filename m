Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE8DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvZq130tiT45bvyCEcIJ+K9zjA5skCS0X4i6X4l6Bi0=; b=nkCfW/F+NUmPIpqXgJ7PNFCAcq
	IaHRODJ9rmCCU2+LztWarpbVsHQuk8OF52yKHQBtnqybWyQNt0Mr1iuRlsFhvt4/i4UjmEdXtGQWW
	P/9mDrwm3ABrOkK7G0Llm+NxzTQA5wYdrUGcqM/3fq4o1LuDcdnRxbEERdk7JGPDm6dlFSxpgNgfZ
	YShobZ+bLeHHnhR797aJD5LJ9X5q0b67bpRuKUXobRcpjeMauqoA4xe0r1OiErUrY7qhS7Rpun3ho
	EkaZ+vI/81+g15X9iC6f5p+qEGQkU6xKTnXe3/dst+4DwtO0hPngVxgrNNWtu2uYJktAH+uVgqxbI
	lVCkGw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUsy-00000008nA8-2OzH;
	Wed, 09 Jul 2025 13:30:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZShz-00000008S1d-18wL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 11:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vvZq130tiT45bvyCEcIJ+K9zjA5skCS0X4i6X4l6Bi0=; b=YvNUzQZEcwdbrQV8j3ZTIqZJZa
	4HP+dnk7X61abQxSvtPEiHSu67e/O70tubpndvJGshW1wE7Rw645Ghcv6TIyLcFBige9a9uYqop0I
	R+OOU+roJBWbQIWazOyqgOYN03OH07FCTN1B+SCFOc+GyasPNYxKsT+rRiyl9Miig+bNXl/9jzseA
	Ex/MpQ1pYFn0Z9pAdk4tUwreZdx4z7qxGTsudBKN75fGUIXOFkF8Ld2b3KcO2bX2CqnUyg7K2HQls
	mQhCdO2KqiqrVlw89GJpy1CPr2OQLsJyqVOieoY5DpNj0+86Jd41OsT+AMSNe/oyayroPljcDFRWQ
	S4S+1uCw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55728)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uZShg-0007qh-2n;
	Wed, 09 Jul 2025 12:11:09 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uZSha-0002bB-1i;
	Wed, 09 Jul 2025 12:11:02 +0100
Date: Wed, 9 Jul 2025 12:11:02 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: lizhe <sensor1010@163.com>
Cc: Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH] net: stmmac: Support gpio high-level reset for
 devices requiring it
Message-ID: <aG5ORmbgMYd08eNR@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
 <aG3vj1WYn3TjcBZe@shell.armlinux.org.uk>
 <5bb49dc0.6933.197ee28444e.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bb49dc0.6933.197ee28444e.Coremail.sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_041127_597403_A555DD2D 
X-CRM114-Status: GOOD (  10.26  )
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

On Wed, Jul 09, 2025 at 03:48:25PM +0800, lizhe wrote:
> Hi, 
> 
> after replacing with this function, the function returns 0, meaning the gpio is
> still at a low voltage level.
> 
> +              int gpio_state = -1;
> 
> 
>                 if (delays[2])
>                         msleep(DIV_ROUND_UP(delays[2], 1000));
> +
> +               gpio_state = gpiod_get_raw_value_cansleep(reset_gpio);
> +               pr_info("gpio_state: %d\n", gpio_state);
> +               pr_info("gpio_state: %d\n", gpio_state);
> 
>  gpio-111 (                    |snps,reset          ) out lo
> 
> 
> [    3.899319] gpio_state: 0
> [    3.899324] gpio_state: 0

How have you declared the snps,reset-gpio property in DT?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

