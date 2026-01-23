Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8AFD77897
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATqUy5/Sp0hLV7kTQCotJYn2id+kgnBDhi2Bfu1dxMw=; b=hFnWaXJDnF/zR8/rfre/HTa/Qo
	3kWAsiZOlMSpi3cHTatFG0Ua51WqPNgWe+bw3WmwfVkvNolrCnEe/uZIpcnZ8LZ/gv9DbQGRLF+s3
	GdJVXe3AqwndW8rcDAkSUJ9Yikc7g06FM8YFOeizoyKForGUv3cCx801Z+7c/zK0MemP6Wy1R3BmS
	kn7vRq1tdktwMMMExKnByxqefNGG2vy/pWbjve00YelVhx59IoZWrKeZoGjlX2juoKvg8NpBL5O37
	Z8EnvjfqV6kr144p3KutOUD6yZd6HZ27o02+SPbOIt4QPfhMw66zlkhhTfWlXUjzTwNLhcPwhbk28
	uO+wMOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKw9-00000009Hxs-0BTT;
	Fri, 23 Jan 2026 17:27:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKw5-00000009Hvn-3Euu;
	Fri, 23 Jan 2026 17:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ATqUy5/Sp0hLV7kTQCotJYn2id+kgnBDhi2Bfu1dxMw=; b=WbE7SAtucfXWKA5HnfaYgijWAA
	7L0Et33+VW7YE0lTPtIg91YcJfGT/yqR4XWo1hOw3m7+aVG65JgF7eEHkVJ2uucFrEz9d3yS0RouW
	pT+Tki0zV5+Z5Jy3b1t3Syzoa/LXYZcZEwiBOglSDeN7qf+1Dhgk0Mv06lfV2fsphs/ho1GU7SiPk
	7Lup2A1+JyjmwnTix8YwXKrcGF4aBOn7KZ/kjR695XoY5LJlDU4d/Hqm0YJmltDvCL7s3/OAaJ++m
	ZpZK6f8PfdvQq5KpcTqsfmSNWwQZtHE4V5fTLx3oUaU2CZ+leNEvhXGF4mPe+8IT6GbIMaS6sLY5/
	Fp2PCgHA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42282)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vjKvr-000000002Mn-2kBY;
	Fri, 23 Jan 2026 17:26:51 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vjKvn-000000002GB-2S0Y;
	Fri, 23 Jan 2026 17:26:47 +0000
Date: Fri, 23 Jan 2026 17:26:47 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXOvV-XRmn_Pe-ca@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_092705_809334_BC878931 
X-CRM114-Status: GOOD (  29.21  )
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

On Fri, Jan 23, 2026 at 07:05:00PM +0530, Mohd Ayaan Anwar wrote:
> Hello Russell,
> On Fri, Jan 23, 2026 at 09:52:00AM +0000, Russell King (Oracle) wrote:
> > This is the v1 submission: if it doesn't get tested but review goes
> > well, it'll end up in net-next and mainline without testing on the
> > affected hardware!
> > 
> > Mentioned previously, I've been trying to sort out the PCS support in
> > stmmac, and this series represents the current state of play.
> > 
> > Previous posted patches centred around merely getting autonegotiation
> > to be configured correctly, to a point where the manual configuration
> > can be removed from the qcom-ethqos driver. The qcom-ethqos driver
> > uses both SGMII and 2500BASE-X, manually configuring the dwmac's
> > integrated PCS appropriately.
> > 
> 
> Thank you for CC'ing me on this series. Sorry, but I have been M.I.A.
> for the past couple of months due to some health issues, which caused a
> backlog at work that I had to power through. I haven't been able to
> monitor the mailing list for stmmac patches.

Sorry to hear that, but if it's any consolation, you're not alone. On
new year's eve, I had three teeth extracted, including one that was
laying horizontally in the palate of the mouth buried in bone, and
needed in bone graft (modern bone grafts are quite different from what
you'd expect btw.) It's been quite sore/painful as it heals.

> I tested v1 last night and just picked up v2. Here are my observations
> and logs (phylink logs are enabled). I haven't had time to debug the
> issues, but they are not seen on the net-next tree. One thing that I
> remember from our last discussion is the need to test with comma
> detection enabled; I will test that next.
> 
> Tested on the QCS9100 Ride R3 board with 2X AQR115C PHYs. I have one
> more board that I can test next week (IQ8275, which has a single
> QCA8081 PHY, but that is limited to 2.5G because the PHY switches its
> mode according to the speed).

Thanks for testing!

Given the results you've given, my suggestion would be that the
following patches are probably the most risky:

Patch 2 "net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method"

This changes the way the clock is configured. It would be worth
testing that and giving a tested-by for the first two patches if
that's successful.

Patch 6 "net: stmmac: qcom-ethqos: convert to dwmac generic SerDes
support"

This changes how the SerDes is handled, which is a significant change.
It's possible that the PHY calibration needs some other state to be
appropriately configured, and that's not happening in the same order.

Either of these two would account for what appears to be an unstable
SerDes link.

As for the NULL pointer deref, I'll look at that in a bit (waiting
for a build to complete so I can hopefully pinpoint where the oops
is happening.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

