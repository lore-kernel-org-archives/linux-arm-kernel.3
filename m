Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D025FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=We2PZZN/Z/OuW0OC8GwI1XN1ZlLiDb7BHXEm1VKevUk=; b=kEj1ZidUXIlM5DjZjDHLqZalu4
	YS7DipRiqAmW4gkC4lt7UQ27kpLOQBzdhnX/Ebz3V4GxaOakxJLX0bCDiTnb1IxmPVHGSyYJUyPPQ
	nbudTgHsRGDAEpcUvnh0+HhCesYC8v8Dl2gtgWGTSDyFO1wPH+1l1Yy0VHK70CPc5i9oUZKcXPP05
	AUpFfKxFd8PJYFkEJTQgIIcFF/2bWPnv81FttzfkOT1IjViiAlhcVJPXlnJoGtwrxxhMBtSIdqrtS
	uYx8pBsnbK+Vz5w8WPDPqmBLoqVq5IyaSA5u2pDzMSs4H9zqbYhnyqc/FzvSLe/1HNlOACfIo6YBr
	j40jBQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJSf-00000004L3J-2oIx;
	Wed, 26 Feb 2025 15:36:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJR8-00000004Kkm-0YZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:35:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=We2PZZN/Z/OuW0OC8GwI1XN1ZlLiDb7BHXEm1VKevUk=; b=Nr0yY4QOvO504vfmWBFQmckDao
	kNFatIEDpJJ49/rgYpfiH++mWZHYZIFvqFiGiXICM9+pzthfUMdPm085ugAORIS3wfA6892RzO7ys
	XfghSaloouVCRP/vJ4x1dPqWm4qT9JOLDlXny/EWwtvq2FoQRvL01pJn6YNuVsEDQ2AQbmNrF1sMQ
	prEvODafyJe2vhYMbMrOCqIzl76gHh8JPgUgK0HbiqTvGpBjuY6PfdNEeMiouWLF5C7wG2IiUlS9m
	XFFePb5qrC1YziycPejRxgJ/jMXRSUZrhxfnRbnOM6zeZFJ4JKzGAho6Vn3ki5ucSBQ0Uy6i9xN8H
	fIvMutIA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42746)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnJQQ-0004iF-1A;
	Wed, 26 Feb 2025 15:34:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnJQG-0007CL-1X;
	Wed, 26 Feb 2025 15:34:08 +0000
Date: Wed, 26 Feb 2025 15:34:08 +0000
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
	Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v8 1/6] net: phylink: use pl->link_interface in
 phylink_expects_phy()
Message-ID: <Z780cM9bejxhzTXO@shell.armlinux.org.uk>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
 <20250226074837.1679988-2-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226074837.1679988-2-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_073502_172516_E86437DC 
X-CRM114-Status: GOOD (  14.84  )
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

On Wed, Feb 26, 2025 at 03:48:32PM +0800, Choong Yong Liang wrote:
> The phylink_expects_phy() function allows MAC drivers to check if they are
> expecting a PHY to attach. The checking condition in phylink_expects_phy()
> aims to achieve the same result as the checking condition in
> phylink_attach_phy().
> 
> However, the checking condition in phylink_expects_phy() uses
> pl->link_config.interface, while phylink_attach_phy() uses
> pl->link_interface.
> 
> Initially, both pl->link_interface and pl->link_config.interface are set
> to SGMII, and pl->cfg_link_an_mode is set to MLO_AN_INBAND.
> 
> When the interface switches from SGMII to 2500BASE-X,
> pl->link_config.interface is updated by phylink_major_config().
> At this point, pl->cfg_link_an_mode remains MLO_AN_INBAND, and
> pl->link_config.interface is set to 2500BASE-X.
> Subsequently, when the STMMAC link goes down and comes up again,
> it is blocked by phylink_expects_phy().

I thought we ascertained that it's not "link goes down" but when the
interface is taken down administratively. "Link goes down" to most
people mean an event such as the network cable being unplugged.
Please fix the patch description.

> Since phylink_expects_phy() and phylink_attach_phy() aim to achieve the
> same result, phylink_expects_phy() should check pl->link_interface,
> which never changes, instead of pl->link_config.interface, which is
> updated by phylink_major_config().
> 
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

With, and *only* with the above fixed:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

