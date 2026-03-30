Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB1010D14A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veBAT8N9PXJSRI8kHRpQ29JL9EyN/jr+PWryhqRzBmk=; b=11M1ayjG73AJ7Jw/S9VbEfXOM8
	JEx3rf/1OBu6sEhh6sivvW6hXRwiAsx8cXQgVTtX3eO1za5eDJlbmJkWnj0y6CKTBvCKjKHmjxUo0
	bhooXEmddNrSGGpLwFbJVERoGzLSRY1gmAHsczx2LsYiVSbnk/O/l+bV0kDyVPTJ57kpG0Fa9PoOh
	L3N/hgjVbK6ho09fm2K44MZiROK7xdsP4mt9DVzLjyewhb36vl7fcRNHBbnQuoRjpvGUF7Vvnc//0
	EOHxgb6hWyPLT2JSiPAbJ5HR0Ab5Voy1YMTHZBb/XGs0zyrKgsX76JwSJSapmXId+GdRllm9qkMWC
	OG4YiENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Bbf-0000000BF1e-1dqa;
	Mon, 30 Mar 2026 12:20:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Bbc-0000000BF15-2TfB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=veBAT8N9PXJSRI8kHRpQ29JL9EyN/jr+PWryhqRzBmk=; b=wPM54DK01Q8N254E8px4APBfKH
	UIeqvvYFYUsrpjSXOvsemWOhETVj9D7LVVWZ4Ce1H8ZKqgyUwC9DDugUIAfjC3yXNUOAng3YrAIju
	1MfcTshv5NYdJ2Qu8XwgPmFt5LMmZYlNtNtJ+l4Sjr9x6U1HQILzrZnP8PIeetsO5hGUjb7vSnD7x
	oOsSxFtJacRtDdOXXqmpNp93fFKC71HVZV791Zda3UFp9nhYBegRjRWvAjv14/cbVa9AFdgQvmydL
	XKOgRJKGfski3b9FnylZKtYwC71nejuyTMqwTOHCn9QTTz+wfif1lNo1cUhveN1ublyANzSwl6bfy
	2o2ypw7g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38442)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w7BbS-000000000ST-11Bh;
	Mon, 30 Mar 2026 13:20:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w7BbO-000000002fP-0eU8;
	Mon, 30 Mar 2026 13:20:18 +0100
Date: Mon, 30 Mar 2026 13:20:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
Message-ID: <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_052032_736946_D33ABD59 
X-CRM114-Status: GOOD (  14.90  )
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

On Mon, Mar 30, 2026 at 01:18:56PM +0200, Konrad Dybcio wrote:
> On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> > The clocks for qcom-ethqos return a rate of zero as firmware manages
> > their rate. According to hardware documentation, the clock which is
> > fed to the slave AHB interface can crange between 50 and 100MHz.
> 
> FWIW this __may__ possibly differ between platforms, but I'm not sure
> to what degree. Will there be visible impact if we e.g. have a 200 or
> 300 MHz clock somewhere?

When you add other platforms, you're going to have to deal with their
differences.

IEEE 802.3 states that the maximum clock rate for the MDIO bus is
2.5MHz. You need to ensure that is the case.

Current qcom-ethqos code doesn't set clk_csr, and returns zero for
clk_get_rate() on the stmmac clocks because they are managed entirely
in firmware.

This leads to the GMII_Address register field CR "CSR Clock Range"
being programmed with a value of 15, which, according to some
documentation, states that the clock divisor is CSR clock / 18.

With the /18 divisor (assuming your dwmac uses that divisor):

CSR clock	MDIO MDC clock rate
50MHz		2.78MHz (exceeds IEEE 802.3 maximum)
100MHz		5.56MHz (exceeds IEEE 802.3 maximum)
200MHz		11.1MHz (exceeds IEEE 802.3 maximum)
300MHz		16.7MHz (exceeds IEEE 802.3 maximum)

Do you think this is acceptable, or do you think this should be
fixed before anything else happens with the driver?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

