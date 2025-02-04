Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39D0C02196
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rox8IBA4TOog/Xi9d+CxsHeyf4Lozl25g79JAYxmrsE=; b=WA5teb6yRH5xFbqQNSVlGIll0D
	O8HjmHOi7dsiiIY3kw8mf+z3AtDkM+hNMVKEYFyIpvEOj8WRqQYNP4hQ1Z9fDVn/SjxiJOMef3s/i
	Xc5dL0yELcDTjSHMIdbaJJQF45qlqvgw5/gsOArSpPaZUkoNdZW1c0L1xNiDGQSK49nRs92/AvYdQ
	w0C7eHxu9no0SnoaKXmiwLsCVV7XN9C3f9ucfWoOTT3OBkB7XCw/VlvXvRYIeoE+x798Q5K0sThX7
	MuaHAhdjMzKPkR6riQtTLK4mmyzBWSx9kTP7bZ26ZNeOEBBS1lbwC5RQXSBQgFHKJftYafvNf7aBZ
	9ALbx8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfJFV-00000000ZCY-0pc5;
	Tue, 04 Feb 2025 13:45:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHkR-00000000MaX-128s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 12:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rox8IBA4TOog/Xi9d+CxsHeyf4Lozl25g79JAYxmrsE=; b=grjh7xGPy1aXjV8j/7VAJRQ/3Q
	Zq+FAY0cDbRfh8SEOCyMIV1sMNeR3vmdA4pZtUw+BnlN6lhG2on+Btf+bSiva7Db/YMxo3UGx9Oro
	9NpsoE4iXTuhscCT73b1FFUfGw/NpiYwJw03GvNr7R74HprHXSBG91FnziUApwNBAVuNBN0vN3vVQ
	NM9Y34zvc+ynj9Gt07JXEehZEc4GfFbRKq1vvfRLBqmB9q4XfR8hCmC99NPeOidVjlz2C/poPwJwx
	B8/RLvAKHGc9fg+IFjS8I9g9n2f8zGD1y+5e64/F6tdwo8zhM6iEceRokQhidTowc8xIC9O9DjWJq
	JVdGvBZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43894)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tfHji-0003Tg-3A;
	Tue, 04 Feb 2025 12:09:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tfHje-0001NM-1y;
	Tue, 04 Feb 2025 12:08:58 +0000
Date: Tue, 4 Feb 2025 12:08:58 +0000
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
Message-ID: <Z6IDWiRF73sdVWob@shell.armlinux.org.uk>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_040947_276904_077526FB 
X-CRM114-Status: UNSURE (   9.42  )
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

On Tue, Feb 04, 2025 at 02:10:17PM +0800, Choong Yong Liang wrote:
> +	int (*config_serdes)(struct net_device *ndev,
> +			     void *priv,
> +			     phy_interface_t interface);

Since you call this from phylink's mac_finish() method, I would much
rather the call down into platform code was also called the same so
we don't end up with a proliferation of methods called from that
function. As such, please also arrange for it to pass the AN mode as
well.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

