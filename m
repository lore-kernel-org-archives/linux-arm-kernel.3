Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00AAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YR6sefChmMCI3W3DFYxDLqp5TsMPa0xO2IcTo2b1+w=; b=l3BDAFCvxXVMC3LAAVd+ujkW4n
	8DPjvk73pBSY26+QgIxfs2LmQqZ/rwuxjUeFe9hjx1z/OERePDPYvbmBxs595YAh0ua8HPZFRvlin
	8HRM37/4IgmoAIeiMVbCIdIq1cO8twy6riath2VE27Fhp+RhKQ1SgTzyNr4TrFXHEZY+d68015a/s
	Wz5n4ZPq6QMnzB21WXcBeItqsLqqlsga/bGXA+sJLVBuqqsZ5NPTerS4l0NdGL8ZyH4e3m+Ne9ew6
	asSX0x/RWkX9dAOdN9ecRCkE2To2+pPAcom2uYHD9QdtjpNwewVwHOyf7761Dqw2776k0yyaAugDj
	NgG/GXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTj7-000000085Lf-1mM8;
	Wed, 08 Jan 2025 10:55:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTUj-000000081iR-0WEC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8YR6sefChmMCI3W3DFYxDLqp5TsMPa0xO2IcTo2b1+w=; b=x384X12HeI0q3E5tqTrjVvRoNg
	X64WIEcS89d47QITj3u/LON+Bg/9390WtUuzt9Cwiu8NjZrivtwto9/sozpwySdpHr/Jp54N1ID3d
	Amopwt5v8gHqfbcx69zNlrxlHHCsi+Ev7k83iODuv8XEgRx50aCR4f/cA1uEAGyFbdc6LEb+IifT4
	iIvt1oN6L/oumBR6K9Z2Q3sFiwr8IcWy4Xnp3RdpTn3IvS9WKRNqAFBVhM1YVE9hco0vDlyAYbZzc
	ULeqdH+OClsNO8YOJFLm65qUz90qQT0DfALOG/TrWokphBgDSPtuy21CIuOI9+QM+zoVNC0fLRrvy
	HN1MZUhw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34564)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tVTUT-0000Pe-06;
	Wed, 08 Jan 2025 10:40:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tVTUO-0006Dw-0t;
	Wed, 08 Jan 2025 10:40:40 +0000
Date: Wed, 8 Jan 2025 10:40:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v3 02/18] net: stmmac: move tx_lpi_timer
 tracking to phylib
Message-ID: <Z35WKDhVGMvPIi7d@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
 <E1tVCRZ-007Y35-9N@rmk-PC.armlinux.org.uk>
 <66b95153-cb12-494d-851c-093a0006547f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66b95153-cb12-494d-851c-093a0006547f@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_024101_160102_2F6FDD78 
X-CRM114-Status: UNSURE (   6.48  )
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

Hi,

On Wed, Jan 08, 2025 at 03:36:57PM +0800, Choong Yong Liang wrote:
> Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

Please let me know if this is for the entire series.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

