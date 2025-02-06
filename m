Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7853BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGtT4jJj54W9qkniOIuHDmAyLAJNfLsZ3atVdSoL2Sw=; b=Sq31FURdaHESs+GwFBpg579Zm/
	0EfVbDk9RrBh7XVXl+Im/GWDSkUoHHooTHG0Awrey0aJue1S4TMz3SIj/qfvc7EVorfmeqmzvAUZ/
	Bq0fcTaEu/i/oeS41YZOfiteQcK3ikjOLrJnADmyn9NaXHwEPMLhsHsMI5vuLFvb22Eni30TydKxS
	HSMSdCuATIIUOaQDe9/0HnuyCIU5idKocqbt0XxZxWBG384Zfrf/J5O6yskq71a5jCU51OrYsaaPl
	p1tkuoE5aqcnqPr0nDbm0T5MOUILIYfUy8cSqJ3vxAdu3hiGP/nv1UktfHJohDvo1mhVlqxiCmu9G
	zOTZIHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyvV-00000005xGD-02Z9;
	Thu, 06 Feb 2025 10:16:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyrj-00000005wjm-13Gj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IGtT4jJj54W9qkniOIuHDmAyLAJNfLsZ3atVdSoL2Sw=; b=VrGjZMXNKqp11sBPpNPyr9bd8j
	iDW8pjUfPny4JDeSdAM75qSlzDloRDzAuw8WPJ+YuCmZrT/uT0LWIy5VkIf9jmIxSMpOpb6SgsdTz
	+G/JpsS0x5S/EIl2UzUs7CYJrHEb12+B0+LZp+ntHccablhQbEOP6Cy+ZaXE0VSy1uFyMo53wgLfH
	2hzZRTL4roOnp4giNFVCOQ1gW/WFSYAStewJD3KnebYOAQ68PoitLuWosk5mUgkGk6NMo3H8ZUfCN
	PpjJf3Ew9XEO+zWoiOltaJbtDSQyt0EopVzMPvXzJaHI9iniyUZh974YIgNFl/TXHxlLDo/DfkjRE
	J+0zciZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58646)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tfyqw-0001h6-11;
	Thu, 06 Feb 2025 10:11:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tfyqn-0003LY-04;
	Thu, 06 Feb 2025 10:11:13 +0000
Date: Thu, 6 Feb 2025 10:11:12 +0000
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
Subject: Re: [PATCH net-next v6 4/7] stmmac: intel: configure SerDes
 according to the interface mode
Message-ID: <Z6SKwNF8ib2BgIsL@shell.armlinux.org.uk>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
 <Z6IDWiRF73sdVWob@shell.armlinux.org.uk>
 <f272cb2a-1167-4e34-9209-ffdbbb107bdd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f272cb2a-1167-4e34-9209-ffdbbb107bdd@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_021211_290537_9D6799BB 
X-CRM114-Status: GOOD (  11.21  )
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

On Thu, Feb 06, 2025 at 10:22:04AM +0800, Choong Yong Liang wrote:
> Thank you for your feedback on the patch. Based on your suggestion, I have
> updated the code to align with the mac_finish() method and included the AN
> mode as well. The updated function signature is as follows:
> 
> int (*mac_finish)(struct net_device *ndev,
>                   void *priv,
>                   unsigned int mode,
>                   phy_interface_t interface);
> 
> Could you please confirm if this meets your expectations, or if there are
> any further adjustments needed?

That's fine, thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

