Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7666E10A88FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q04VIAHNkeO/Oab8CZfYBVf+J5N6KJreQMXprmET4N4=; b=ch3tbdpKioBooP9dR42uucG9wL
	/6kD+ihnWZ/6MW7U8a1wxwySI3bcmKMsWtjaS2IkQau3Mf3L4JF1TYwtJPweAb9XjDkJibHVaCJvm
	5w7czEWaVKkr2TNHxgRX8VacbGG6/RMjPFOJ632jYiB5PSUNyZXr568gK17fB3UeNx2uvwNhOLWIi
	8QVnL1B7xVJU1cJ4OtgiXxKi3PYbYhwKsFJjzmklnKh1KY41Uyso3AyLw11AwhPHp6DYKsyUUakJR
	RvIedZgleada+LQWYmXTxvTHB1db6sB9Hgv71fsuVH8ANP1t3skyTIevawuEbTZkJXr5gbKPgjjM4
	xfXS9dyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pF8-000000061Ba-08e8;
	Thu, 26 Mar 2026 18:15:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pF6-000000061A4-0q2j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q04VIAHNkeO/Oab8CZfYBVf+J5N6KJreQMXprmET4N4=; b=A91llKaRZg1Kmp6LhWd1OiFvcj
	3itUEP0PSvXO6oGyTtfgHDbDG28LoaPafvUnAUVxPxPAGgzivyFflJrT+8x7+D5B6aEBiE5KUJvpx
	hsLC3Q9MtLtj5zS6XTV+mTFQHCTk/a4GPoJsYEIH5dzvP8DG3wwdU6/BAhPw3H9Z4kE7jlOleNzY4
	938Lcw/7mq1ZxXXkBvdTj0rrQ/E8FqgyUjbin2ESTPaMpntIg5biA5leRtVjbSi3EMVY1NPQ2UQUW
	vZvi82S6JJQyDlX/01L00gn7bQ3JaN9y4RDLm9UG60iu0fAZ20CIs2Nv6xeag98tIykPe2I/N4nY9
	WeQ2ggwA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54672)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5pEw-0000000059k-0PVC;
	Thu, 26 Mar 2026 18:15:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5pEt-000000007G1-3NVj;
	Thu, 26 Mar 2026 18:15:27 +0000
Date: Thu, 26 Mar 2026 18:15:27 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next 1/2] net: stmmac: remove axi_kbbe, axi_mb and
 axi_rb members
Message-ID: <acV3v-iyoCUTh2a8@shell.armlinux.org.uk>
References: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
 <E1w4ydo-0000000Dlpb-34jd@rmk-PC.armlinux.org.uk>
 <20260326172943.GR111839@horms.kernel.org>
 <acVxNBLE8Ck2qfjc@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acVxNBLE8Ck2qfjc@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_111540_260889_7455D1DA 
X-CRM114-Status: GOOD (  13.60  )
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

On Thu, Mar 26, 2026 at 05:47:32PM +0000, Russell King (Oracle) wrote:
> On Thu, Mar 26, 2026 at 05:29:43PM +0000, Simon Horman wrote:
> > On Tue, Mar 24, 2026 at 10:05:40AM +0000, Russell King (Oracle) wrote:
> > > axi_kbbe, axi_mb and axi_rb are all written, but nothing ever reads
> > > their values. Remove the code that sets these and the struct members.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > Hi Russell,
> > 
> > FYI, AI review suggests that these fields should also be removed from
> > Documentation/networking/device_drivers/ethernet/stmicro/stmmac.rst
> 
> I noticed. I've prepared an update if netdev folk want that to happen
> as I've noticed that that documentation is fairly out of date now.

There's another reason I haven't submitted an update, and that's
because netdev is fairly backlogged at the moment - currently there's
381 patches in patchwork - four pages of patchwork, with the oldest
"new" patch dated 21st March. I don't think netdev patchwork needs
more patches at the moment!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

