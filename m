Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A8BF4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvvpJ/qL3MAP3HugIiBTVzG72IPcnHfG1iqnkHNtFTQ=; b=aMfs80GJxqelJ2UeI23jWTWzHi
	ef4Pxq9FMPBbGRpBGSUPGokDftM4Q5yiyK8YpGB1fxEMTcXe9Ua/kVhItYGFNRI+hmddy2o/7jlLN
	iPfc2MvzWaiz9uezN61ExBrg8frRhpkLHQTdQqzV6hiK+UorOpgS+ODdqzkWC+O2FJ9fahl1kw7Ic
	idtzkfnXLXZsxR4wsJUgBNmI5WfQrzJiVsOOPPYaJBa9gGmpccKiBVFxoICscBRVYrB0WTckOeJQG
	8igcm38i0OO/EIe390GI7EYHMWjlpGbgJlWXBImnlZTSeTXrxyC5A7lwDdEY0nLRGZHukR+pTML8Z
	UhLWeNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAtf-0000000CFHW-1wTN;
	Fri, 10 Apr 2026 12:23:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAtc-0000000CFGx-2Ulc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 12:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VvvpJ/qL3MAP3HugIiBTVzG72IPcnHfG1iqnkHNtFTQ=; b=U0tX3hmjJcm8tsXTtdEAC8/h1W
	LON04cNtMGN8ZEK5ppHySEkXKvnn92S3XIVyNP8bh0+prT160P9lajYz9nNr8GP8yRL0I4fafk5PN
	KLYE90UPlcZ+rAW09ET5aYUFiMcrf2ESf2opJ6EHeZR7tvkvUdkZBuy4wz616K+HvIg5cSYnIMXQn
	gV4s34DVxbYM+8GjhifF6nnLLBlsYESvPpqIzHE0OGETx49mCX1fLnsuBVrvHliHlozGUAG9p5iWU
	yGoT4MXjdD9iuGw9ng9OZEZUktWdzOkiOVDGVEWRZugPHSXmgRE4pR4a+MTa5RaFtrbsII9YxQee2
	mRZSapog==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52432)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wBAtN-000000004xu-3ZEF;
	Fri, 10 Apr 2026 13:23:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wBAtJ-000000005cT-2CP5;
	Fri, 10 Apr 2026 13:23:17 +0100
Date: Fri, 10 Apr 2026 13:23:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 0/2] stmmac crash/stall fixes when under memory
 pressure
Message-ID: <adjrtRSepmac2hpN@shell.armlinux.org.uk>
References: <20260401041929.12392-1-CFSworks@gmail.com>
 <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
 <CAH5Ym4g3pbU_bWzMwJMdhEFv4K2sp3pty3g04=0=9Z80_LzW1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5Ym4g3pbU_bWzMwJMdhEFv4K2sp3pty3g04=0=9Z80_LzW1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_052336_635970_EA22DB39 
X-CRM114-Status: GOOD (  26.25  )
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

On Thu, Apr 02, 2026 at 10:39:32AM -0700, Sam Edwards wrote:
> On Thu, Apr 2, 2026 at 10:16 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > I've tested this on my Jetson Xavier platform. One of the issues I've
> > had is that running iperf3 results in the receive side stalling because
> > it runs out of descriptors. However, despite the receive ring
> > eventually being re-filled and the hardware appropriately prodded, it
> > steadfastly refuses to restart, despite the descriptors having been
> > updated.
> 
> Hi Russell,
> 
> Just to make sure I understand correctly: before my patches, you've
> been observing this problem on Xavier for a while (no interrupts, ring
> goes dry); with my patches, the ring is refilled, but the dwmac5
> doesn't resume DMA. (Ah, just saw your follow-up email.)
> 
> > Any ideas?
> 
> Off the top of my head, my hypothesis is that dwmac5 has an additional
> tripwire when the receive DMA is exhausted, and the
> stmmac_set_rx_tail_ptr()/stmmac_enable_dma_reception() at the end of
> stmmac_rx_refill() aren't sufficient to wake it back up.
> 
> I think this is new to dwmac5, because my RK3588 (dwmac4.20 iirc)
> happily resumes after the same condition.
> 
> You gave a lot of info; thanks! I'll try to scrape up some
> documentation on dwmac5 to see if there's something more
> stmmac_rx_refill() ought to be doing. I think I have a Xavier NX
> around here somewhere, I'll see if I can repro the problem.

I've added dma_rmb() into dwmac4_wrback_get_tx_status() and
dwmac4_wrback_get_rx_status(), and with that I've had an iperf3
instance finally complete... but only once:

root@tegra-ubuntu:~# iperf3 -c 192.168.248.1 -R
Connecting to host 192.168.248.1, port 5201
Reverse mode, remote host 192.168.248.1 is sending
[  5] local 192.168.248.174 port 42232 connected to 192.168.248.1 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  50.8 MBytes   426 Mbits/sec
[  5]   1.00-2.00   sec  54.9 MBytes   460 Mbits/sec
[  5]   2.00-3.00   sec  54.0 MBytes   453 Mbits/sec
[  5]   3.00-4.00   sec  53.8 MBytes   452 Mbits/sec
[  5]   4.00-5.00   sec  52.4 MBytes   438 Mbits/sec
[  5]   5.00-6.00   sec  54.3 MBytes   455 Mbits/sec
[  5]   6.00-7.00   sec  53.7 MBytes   452 Mbits/sec
[  5]   7.00-8.00   sec  52.8 MBytes   443 Mbits/sec
[  5]   8.00-9.00   sec  53.7 MBytes   451 Mbits/sec
[  5]   9.00-10.00  sec  54.3 MBytes   455 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.01  sec   537 MBytes   450 Mbits/sec   13             sender
[  5]   0.00-10.00  sec   535 MBytes   448 Mbits/sec                  receiver

iperf Done.

So, it seems better, but not completely solved.

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index 2994df41ec2c..119f31c94b61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -17,10 +17,12 @@ static int dwmac4_wrback_get_tx_status(struct stmmac_extra_stats *x,
 				       struct dma_desc *p,
 				       void __iomem *ioaddr)
 {
-	u32 tdes3 = le32_to_cpu(p->des3);
+	u32 tdes3;
 	int ret = tx_done;
 
 	/* Get tx owner first */
+	dma_rmb();
+	tdes3 = le32_to_cpu(p->des3);
 	if (unlikely(tdes3 & TDES3_OWN))
 		return tx_dma_own;
 
@@ -70,12 +72,12 @@ static int dwmac4_wrback_get_tx_status(struct stmmac_extra_stats *x,
 static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 				       struct dma_desc *p)
 {
-	u32 rdes1 = le32_to_cpu(p->des1);
-	u32 rdes2 = le32_to_cpu(p->des2);
-	u32 rdes3 = le32_to_cpu(p->des3);
+	u32 rdes1, rdes2, rdes3;
 	int message_type;
 	int ret = good_frame;
 
+	dma_rmb();
+	rdes3 = le32_to_cpu(p->des3);
 	if (unlikely(rdes3 & RDES3_OWN))
 		return dma_own;
 
@@ -107,6 +109,7 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 
 	message_type = FIELD_GET(RDES1_PTP_MSG_TYPE_MASK, rdes1);
 
+	rdes1 = le32_to_cpu(p->des1);
 	if (rdes1 & RDES1_IP_HDR_ERROR) {
 		x->ip_hdr_err++;
 		ret |= csum_none;
@@ -152,6 +155,7 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 	if (rdes1 & RDES1_TIMESTAMP_DROPPED)
 		x->timestamp_dropped++;
 
+	rdes2 = le32_to_cpu(p->des2);
 	if (unlikely(rdes2 & RDES2_SA_FILTER_FAIL)) {
 		x->sa_rx_filter_fail++;
 		ret = discard_frame;

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

