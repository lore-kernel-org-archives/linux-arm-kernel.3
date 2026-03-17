Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F96F3383D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBLyAAnBvC4Y6dlPU+VQ8J/Go3H/Rpdcc6gQ7q2rdNM=; b=08zRFTMZ92c0cn8kcLoJW2zqVk
	DFMIQ28ttvfYviGPVtdKcRU3ymuigsiFE4PdFW0/WSXhGyQvVqHlTB1DTaicNOAR5+0I+xNpVEbIP
	hFXLfs3uJKDUSU+LPepwR5I6bwpTV7S+XhuYyQaEuG66ej1WPLIlU8YYJPexfXTPR0O/6THvFO782
	RPzgyLMHvRs0VjzwM1ELrPZl06IjJCqA0VFjuIRm3bISdTPxrtMYjtPgni1cIdanOJpxSDa7+aMZA
	wtoMUvMiM8JltFt3OY5ddqyF8ovGmhsJVKuQXzdU91fRq+QlZLKXfhrF5ZCUR6Pcw4F771Bd+yXBW
	QqVtAjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vj1-00000006erz-32H4;
	Tue, 17 Mar 2026 14:48:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Viz-00000006erZ-32Eu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uBLyAAnBvC4Y6dlPU+VQ8J/Go3H/Rpdcc6gQ7q2rdNM=; b=1vSt24yX6OiavMjiOSTcAQRqR1
	uA/E2DbMceTjg7uSYVVHh1h7VuI7SW2cB08Wg235S2FUZtHr7U2bo9BoKDmtDo8L1VqLGQTDw4Bzk
	Jkh4Y4/J4K3ze0MRStvQgKEo0bXeI+ErvXEcOt7viJ/rRGdNxsWtnSob1I+uGztbeLmvU+yMoJu52
	/aLtGZsfQYgflkyudQ87Rg/H/lr5MZQslAae89dvQEPjb+w9pnikmzu5jbrf7WuDXTzX1vl8OnZhq
	v8c0jCPEGj4cONRgAZiQiuVuhpQr2JFNdDJeaUrnYuuLwvQTbWGpk3DvyDge2poLH5L5af+LKg45p
	TwfCWwdQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42608)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w2Vis-000000005NL-3Zzy;
	Tue, 17 Mar 2026 14:48:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w2Vip-0000000067Q-3LVa;
	Tue, 17 Mar 2026 14:48:39 +0000
Date: Tue, 17 Mar 2026 14:48:39 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
Message-ID: <ablpxwGks9m38fhM@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abdYu864OmNWiWIW@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_074849_784716_AD77318C 
X-CRM114-Status: UNSURE (   8.51  )
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

On Mon, Mar 16, 2026 at 01:11:23AM +0000, Russell King (Oracle) wrote:
> This will be because we're not attaching any PHYs when phylink is
> being told to operate in 2500BASE-X with inband, since it thinks
> that's the media. That, and, because stmmac has a long history, it
> needed a special phylink_expects_phy() check added in stmmac_init_phy()
> which his what prevents the PHY being attached.

Okay, another idea that I hope will work. Please drop the "net: stmmac:
qcom-ethqos: enable inband mode for SGMII" patch so we go back to using
outband mode for everything.

Then, disable the call to ethqos_pcs_set_inband() so inband mode
doesn't get enabled for SGMII - as phylink will be telling the PHY to
disable inband mode.

Does that result in functional 100M, 1G and 2.5G speeds?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

