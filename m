Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05714C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajTS+ah2xlTtyM+2OdyBW0mQCdQADRwx6tcLGItIUGs=; b=gUtyDDuk+SWUT5RYDs+0fvszQw
	d5lg7p99HtZ41PzCt4YDHKwiBsQd0wKegzAm/ZBAilKGMusFmAr1YqIaUG16OoVV9k47iiRwN8cIm
	057h4VJ1VPLf/s+yl6N8azM8m1Z7/TtavenM6shLpNEPlsKdTKjIhIn3nsZ7O83kpBbVflNfjcOC7
	vq0TTwGtvqxePhiJDc14MkPPJehjB1g++W2xSueDU0gY4FdoOcJW7k8qT8eOnCiIn4ovkdjTch3hY
	GMC0ZonM6cRjXzfZAu5ltk6d7RzFUcR1z0eyb1IlOwtZ9IwQJ5+WDwp2jDgDj9cyH/QEsFI8exLhS
	dxQ3XXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXa8-00000009Iyr-3DLj;
	Wed, 09 Jul 2025 16:23:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVoL-00000008zFJ-24js
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ajTS+ah2xlTtyM+2OdyBW0mQCdQADRwx6tcLGItIUGs=; b=BU0Lh4cVcC9JYAhMHeec6iLzAT
	8B5BDM6aSsgVyvlRIMF6YCm8hNDqSUb2nGDVOWOmgXMvbpfgML81+XLGjklzaaYdNmPIpIZNnReXE
	XlOqfQTEeMzFTwwOKatkqx/5Kn5NqNQT5YPQalMmTq4IzcFAVHjTJG9Q5S2RwwqWa9at6i13H580M
	bku1dmWB+UoihrDFufqoiIoFAmKf8H+67IYEVLSeyIScCP9VR+z3Jx01MAHmZYnaK5BC8EaDKx2Qy
	gfctDV+yS+iGIo50Y7Si6JdllgeBE9inn4Dlo+524ULJ8HmSVIK2IM9sgxHLbjlNPBBddZkkO16va
	GPhq0umw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51968)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uZVo2-00086d-16;
	Wed, 09 Jul 2025 15:29:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uZVnv-0002hv-0I;
	Wed, 09 Jul 2025 15:29:47 +0100
Date: Wed, 9 Jul 2025 15:29:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: lizhe <sensor1010@163.com>
Cc: Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: Re: [PATCH] net: stmmac: Support gpio high-level reset
 for devices requiring it
Message-ID: <aG582lPgpOr8oyyx@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
 <aG3vj1WYn3TjcBZe@shell.armlinux.org.uk>
 <5bb49dc0.6933.197ee28444e.Coremail.sensor1010@163.com>
 <aG5ORmbgMYd08eNR@shell.armlinux.org.uk>
 <4cfb4aab.9588.197eefef55f.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cfb4aab.9588.197eefef55f.Coremail.sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073013_530936_378C49B1 
X-CRM114-Status: GOOD (  10.89  )
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

On Wed, Jul 09, 2025 at 07:42:55PM +0800, lizhe wrote:
> Hi,
>     i have already declared it in the DTS.
> 
>     &gmac {
>             snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
>     };

Active high means that the reset is in effect when the output is at the
logic '1' state. So, gpiod_get_value*() will return the same as
gpiod_get_raw_value*().

Active low means that the reset is in effect when the output is at the
logic '0' state, and in that case the return value of
gpiod_get_value*() will return true when the reset is active (at logic
'0' state) whereas gpiod_get_raw_value*() will return zero.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

