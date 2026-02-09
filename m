Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CFAE78D45
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6jC0h1P4AimHECTj91dAMJUplx9nyACNal2IJFRayA=; b=KxTXN475Dd5gmqdwiYwlXkjjRY
	ddMcaKdS6lTOgN0siXYL7opYapwgVOec2xl1k3a5ZOjUWcAaEr9ffu6LJwBVEuJz69366IuWoqjtv
	AD+y1nCfaXB78G0lq4jaDS8xpTwsN+R7XZOhtBMhdvF8ZYtN0ScvmRVzUqxMBZQt40mFCvlWXAsLC
	bT1xEBHfnrqvTE0uIEUcOuWI0/gOYZooRcmcInklTYBYCXAMbdkMvObaGYhTOa7q1ZF1xnE0eWnAv
	jEPD++xlcJBug9/jGST8tgOXZinqwBSZg1BElIJPft6d3osNt70uAsHYLd7em6kTmVBt+NCri1p/l
	9eiZyRcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpN18-0000000F4El-2fsQ;
	Mon, 09 Feb 2026 08:53:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpN15-0000000F4E9-2npQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 08:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a6jC0h1P4AimHECTj91dAMJUplx9nyACNal2IJFRayA=; b=fcDG5xkbNSfLio/ORJQorF8cX7
	cKWkAZZgBL5R59C1srzyAKxJezC4tYS1KDmZLso8BghHAbVgODx3hsXsTkwD6TxxWTHm5ysIm/8/u
	p6j2DXS2CGWHGyW96j/UdgJBeVlnZAFjmSj8d0A7B/Att9ebd+2LKUzsgPlUdssECZ5T3Q44FG/nu
	SKZSLHgvaDS6APxE1lUNJQmdVYW/Ttgotz3nponNbxV/NaNYjddk5ID8cOTNEk2Sv5Zc46ZaIltkb
	7Mnq6sm2dZoE/PQR/14shG3y8LRXCQj9PiXIKLNP7K3enqiM5qfN8zfORRIohnW1NMHRQZnoZ4hST
	D7yOxYxg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57142)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vpN0e-000000001NA-46iH;
	Mon, 09 Feb 2026 08:52:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vpN0X-000000001eo-3B6l;
	Mon, 09 Feb 2026 08:52:37 +0000
Date: Mon, 9 Feb 2026 08:52:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jie Zhang <jzhang918@gmail.com>
Cc: netdev@vger.kernel.org, jie.zhang@analog.com, horms@kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: fix oops when split header is enabled
Message-ID: <aYmgVS3c7PFC6mfz@shell.armlinux.org.uk>
References: <20260206195643.11333-1-jie.zhang@analog.com>
 <aYZPUx2WrIkPmvIU@shell.armlinux.org.uk>
 <aYlXVIqHfdOfcAAl@P5510>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYlXVIqHfdOfcAAl@P5510>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_005312_010115_C54A9DCA 
X-CRM114-Status: GOOD (  16.63  )
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

On Sun, Feb 08, 2026 at 10:41:08PM -0500, Jie Zhang wrote:
> Thanks. This is a new version of the patch I sent last year. I tested
> the original version again the net tree. But I forgot to test the new
> version again. I just test it now on the latest net tree with other
> patches for our board. But Ethernet stops working. I'm trying to figure
> out what causes this new issue. After that I will send out a new version
> of this patch.

You're not listed in MAINTAINERS, so you wouldn't have been Cc'd on the
various patches I've submitted for stmmac, and so wouldn't have had the
opportunity to test them and highlight any issues.

Please consider adding a MAINTAINERS entry so you can be aware of
patches as they are posted.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

