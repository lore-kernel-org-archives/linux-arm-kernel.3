Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AA6CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 23:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfBP9bG2tl0NXE5ziSY+fRi8/aEFKp1uutR7MpEd4G0=; b=A8PyIxCfNqpUPxgilcoBAMggm6
	bm84JsE1aLf9lqoqdQji8HUdBZZNHqCySbxcgLE1X875c7O/fAw0G62MP5sX7afEOrgL/gDApxbFt
	qiTTnFUfenXkZVJiTussisikBXxSfxHj2PY8vdrnLgaGyPxwRbtvuVaGPBPjvklewZ9D8EfEA4h0T
	m7YpWNH3VCVbDGD/RRtxj/GzDPryOfYFCv6ZIAk91rDtcdoQ17V3HP9AtLiWvllktFdM6R1LYGYSX
	BmliaHsg6LiQ2kf53ZF+pLiLAzWK1ivsfv8oDzsdYYF4vKO4CNosgu9yrCqeyiFL7UQuSRQi6eOF7
	N/X8wt1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwTpX-0000000HCm1-3SDk;
	Wed, 10 Sep 2025 23:02:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwTpU-0000000HCir-2nrl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 23:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XfBP9bG2tl0NXE5ziSY+fRi8/aEFKp1uutR7MpEd4G0=; b=ehZy0YEK3SoZWMNLnS8hKW++R6
	pi9lEWn+q4alBozXX1FaURdClBIU4Z5Ux1mM46qU7Q+NYXL5Pj+sl0js1xL/1xetnjETmOEYWD/Qf
	qodDqbNGiam30JDn0x1DQu2TwRw+I9IKEfiIKyRHGjHYxiu6TEjJkch4izOOutaDK6F768vBcrBjz
	yK88UxY5COOJzzRn/yty70Dmj2AEHm469DSqzf5nDtUAh9/R6XDv6vF0ITiNv8+zXSebv/nhZnUan
	I5xsrDBuQxLw/zChwYSGWrbK7fLtYxo6bpFvE8h48p9mNX4RfK1tlpIqZgBm7wRRKrKx4/4ZNOJ5B
	C7KeTHFw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56228)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uwTpC-000000002E4-1Vz1;
	Thu, 11 Sep 2025 00:02:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uwTp7-000000001lV-0Zix;
	Thu, 11 Sep 2025 00:01:57 +0100
Date: Thu, 11 Sep 2025 00:01:56 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	John Fastabend <john.fastabend@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: rename
 stmmac_init_ptp()
Message-ID: <aMIDZE0mLHAa5pdr@shell.armlinux.org.uk>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
 <E1uw1Vk-00000004MCX-38Zs@rmk-PC.armlinux.org.uk>
 <94e20b19-eb89-43c1-9a7c-3a529c60be8b@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94e20b19-eb89-43c1-9a7c-3a529c60be8b@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_160220_704417_F6B0E227 
X-CRM114-Status: GOOD (  14.61  )
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

On Wed, Sep 10, 2025 at 04:42:18PM +0200, Gatien CHEVALLIER wrote:
> 
> 
> On 9/9/25 18:48, Russell King (Oracle) wrote:
> > In preparation to cleaning up the (re-)initialisation of timestamping,
> > rename the existing stmmac_init_ptp() to stmmac_init_timestamping()
> > which better reflects its functionality.
> > 
> 
> I agree it's mostly about time stamping but if the ptp_clk_freq_config()
> ops is implemented, then it's not only about timestamping. Wasn't it
> fine as is?

No, if you look at the history, various bits of PTP initialisation
have had to be moved out of stmmac_init_ptp() due to various problems,
and this includes initialisation of the TAI timekeeping block block
(or what we call ptp_clock in the kernel.) It's become less about
initialising the entire PTP subsystem, more about just the time-
stamping part.

So, the rename is justified, even though there's still bits in there
that need to be re-architected.

However, continuing to call it "init_ptp" when it doesn't initialise
all of PTP, especially as the patches after this adds another function
that _does_ to the full initialisation just doesn't make sense - in
fact, it becomes down-right confusing.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

