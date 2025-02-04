Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74A2C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gq2wazRAbrp185rruXLj3Ehs/Mugu8zBiYtybcRB/os=; b=o1Kx8oyWQYG4ZjrsIPyCmLN5bw
	6dlv5VOE7rX8EJhI1EXVpmlTUIZRoFIXfRX+dCo/SZGu7BGsxNMNVX94ZMpHEE1IF9CZqs50EUgvn
	xb08zLCbM7qbSs9wmO1430VJSGlpewTYrckgoBIkSiZfr3CfFb5M5e7zB4czBuigmXyziIY0kBOms
	S/PxO1q2Ki0m5wqKlQz0To9abbttKqhstU6wPde5JfQuTALDwaSaU8XMosT5xdek86x2q4GGlmFw9
	q6f2rZy2E+qkfb0mamdL1azHrCLhpzP2yUvcDezWA7j5NjfIYMRJbygZu1DEyPS51uGMqDWmJmxR4
	oQrimbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHia-00000000M4e-45CG;
	Tue, 04 Feb 2025 12:07:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHfx-00000000L1t-0nEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 12:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gq2wazRAbrp185rruXLj3Ehs/Mugu8zBiYtybcRB/os=; b=F9LQMlvnrmGPgIpcbMjdaAj2UI
	XPQn5iaUyLpVHVd/20+T8l13CaXUuRN0vk2oksjffIvOfhAZFdkHQurpIeTI3L1S97CdLSdxOXBkT
	5LQZjbU7yZI0hqbJd12Vwf71Gs5ksVbNP/YIbSqAaQCCMC/QQNQz8TudeS7D6JvcZPEWBtcyev2fG
	O9/dlgBLBOYy9ZLNytH/0leqlnL239vU+9aKA9prP7hCk0x3TGHf5lJSfa6YCXk8sqVn/NkBJR2IP
	1oUff3Kv10m+TI/wUGVg3paABvvNiel+lxQ8Ia6beTuMwTrbl8UHDeEFULbfhco3cFbRvATviUyyU
	6ivrE2vg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49344)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tfHfA-0003Qg-2v;
	Tue, 04 Feb 2025 12:04:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tfHf1-0001NA-1A;
	Tue, 04 Feb 2025 12:04:11 +0000
Date: Tue, 4 Feb 2025 12:04:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v6 1/7] net: phylink: use act_link_an_mode to
 determine PHY
Message-ID: <Z6ICO06RbJ1ulDh1@shell.armlinux.org.uk>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-2-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204061020.1199124-2-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_040509_218971_23CD632B 
X-CRM114-Status: GOOD (  16.11  )
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

On Tue, Feb 04, 2025 at 02:10:14PM +0800, Choong Yong Liang wrote:
> When the interface mode is SGMII and act_link_an_mode is MLO_AN_INBAND,
> switching to the 2500BASE-X interface mode will trigger
> phylink_major_config, and act_link_an_mode will be updated to MLO_AN_PHY
> in phylink_pcs_neg_mode when the PCS does not support in-band mode.
> The MAC and PCS will configure according to the interface mode
> and act_link_an_mode.

act_link_an_mode must only ever be updated by phylink_major_config()
since it defines state for the currently configured mode, and must
stay in sync with how the hardware has been programmed at all times.

> However, when the interface goes link down and then link up again, the MAC
> will attempt to attach the PHY.

Why is the MAC trying to disconnect and reconnect the PHY on link
changes? Do you really mean "link down" and "link up" as in "connection
with the link partner" or do you mean administratively taking the
interface down and up (which is a completely different thing.)

> The interface mode remains as 2500BASE-X,
> but cfg_link_an_mode still holds MLO_AN_INBAND. This causes a failure to
> attach the PHY.

Hmm.

pl->link_interface is the configured setting from firmware etc and doesn't
change.

pl->cfg_link_an_mode is the configured mode from firmware etc which was
passed to phylink_create(), and again doesn't change.

So there should be no difference unless something weird is going on,
which as you're talking about stmmac, could be the case.

More information needed, but as this patch currently stands, I deem it
to be incorrect, sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

