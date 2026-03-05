Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A825EF30952
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adPKuTDj311mrU46icrWV6qx1xxD/9YvPmgbDDG4zJs=; b=Lfp3+/w6LSg5Tkb8TnO2I4zsbL
	uostf/BWT9CSVEMLJ4IZ05yqBz3vxzGUKu5SnLBHmm9hGDxmMz+5fk29iEGFHk1f6VPke7N7GaVTg
	y23gzoUvNgVa+mfkzHspOuXvIHRsdCSFiFW0NswTZVnxfSZ5VD6izTY+z0DK5AR1Hvj3T/HjdWYaL
	QgvCzvqU0IJIUeiKg1CCzqZmOItjC/9h0I0XQc8EoTlPt57btrQ/O53/ThrpSTDv/hXcqh/MNXnlq
	pO6B4jP0CXmv8pj+CiRPeV2GdVq6UFnrzqs5vDh/FA4KTjKugLOPgKtynIzwhVctE/Crun8DT4VWA
	Ivoo6BKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7Y0-00000001jlF-0sqI;
	Thu, 05 Mar 2026 12:11:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7Xx-00000001jkI-2MgX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=adPKuTDj311mrU46icrWV6qx1xxD/9YvPmgbDDG4zJs=; b=ghrz1f/MlnSY//xnY1pmNaJ8bh
	C+aS6OV+6jEoiyM2r6/Gw1WlBYmPNo+0Hq+kjsbS+Wu3xVcLu/uOfDlZWLbSs06cO6MDd5cJgb5fq
	qTossY+p7iyBfomaQFtjZ8vQqQFckpITGcI3N55/nUEp6jhfJbaMWcVrtNPAdKSjRd5QOOlS9RYZY
	iF/2A2yQC8qXB084l+1xd7WtDwpK9zfeKcy3l74FQfmTs7qe/VAFf7QJALy5wELAR38iFNkTD2FZ0
	R7JJ9zFL3YDXOXuotLp1LcxEKF1HnMMF+CO3IYqfKKwFzTTbsialbP4PFwliMvFANW0KBGazNjVjm
	/7IxYj/w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38680)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vy7Xp-000000007tu-44JZ;
	Thu, 05 Mar 2026 12:11:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vy7Xm-000000000RW-2Zb6;
	Thu, 05 Mar 2026 12:11:06 +0000
Date: Thu, 5 Mar 2026 12:11:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH net-next v2 1/8] net: stmmac: mdio: convert MDC clock
 divisor selection to tables
Message-ID: <aaly2p34HoJAIJbx@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
 <E1vy69y-0000000Btwd-3oq7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vy69y-0000000Btwd-3oq7@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_041117_602941_A43D7BC5 
X-CRM114-Status: UNSURE (   9.27  )
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

On Thu, Mar 05, 2026 at 10:42:26AM +0000, Russell King (Oracle) wrote:
> Convert the MDC clock divisor selection to tabular format.
> 
> Note that there is a change for 300MHz, but this is not a problem,
> as the MDC clock remains within the useable ranges, which are:

I notice that checkpatch complains about "useable", which it should
not do. "useable" is perfectly correct, especially in British English.
As I'm British, I won't be fixing this checkpatch complaint.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

