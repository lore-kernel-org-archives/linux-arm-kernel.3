Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D712F506D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ybCcCawDXPxiVqUP7psGH8DaNW0UmkbnwZ0YM4VDmU=; b=0sOc9T9gmkUSckZTEV+2w3YrbX
	FD90IpZL4oHNq/0cwUptGWXYIa3UchF9zmZ2bfl5jX7qOQF1Meg4r8NlE8dCiGffP5kUYXwe7YkVG
	RIdc9AFRNaUjtCub/WBEyDlw1QuHHewl9qJ1XBHRqWSFvAerLnak1GhgMAM0lU38mW9QCIirPS8VK
	/FMyScsjqdcvgEQ/1glOvIlN5NUTnbj5qYB867MFFIC9ETzqkktr4ZQmb3pRDp2nRQ2k6ad5zQfV4
	VeEVfc2DNjJSBqN9Y199m4HW2A++CWyLfrbkJu28FvScbq2P0y41wDDpmFW4xNBPF6PjUcFFW8bwo
	tdj79rWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28MP-000000046uZ-3HU8;
	Mon, 16 Mar 2026 13:51:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28MM-000000046tp-3H9D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 13:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3ybCcCawDXPxiVqUP7psGH8DaNW0UmkbnwZ0YM4VDmU=; b=FRQ7hAVm4iQ4dhJvKK8D6gyiA5
	e7GDM3Y5SCT5e/lzvHpwV/XGQJrZoaVjp0eKuJogtKWnHxhD/cj4M7w7hiQCpb0/jIeib5mkktQn+
	Cj9z59qu42+vDbz1SWWxGTQOdE04q9ZnKL3rnjkBZRMo83FzEpHMeBzXvaXiWECwd9mMpo7+KAmav
	ziQxmkORg7OAfZ1XZ0SlnOrDbjj+KRxPxahKhs8Z1VHeisUt5GcEQhYOBrjWbpX+FNqHuD7AWs2DK
	m/eG8YfURk7qBmZyXkCbo8VMN7AfnUuHMiGdLTciaGu/3UrkASLThwa+uunMyk4IRHEteu9XAFfQN
	48+shy8g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38174)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w28MF-000000003r0-47U7;
	Mon, 16 Mar 2026 13:51:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w28MD-00000000581-2FJx;
	Mon, 16 Mar 2026 13:51:45 +0000
Date: Mon, 16 Mar 2026 13:51:45 +0000
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
Message-ID: <abgK8ThJCs7A5C4I@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abdEscs44fU4kRag@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_065154_841605_454C36CB 
X-CRM114-Status: UNSURE (   9.37  )
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

On Mon, Mar 16, 2026 at 05:15:53AM +0530, Mohd Ayaan Anwar wrote:
> 	[    8.865707] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating

I also think this needs to be investigated. This message is the result
of a recent patch of mine which will error if the clk_csr clock rate
is not something we support.

I see all of the in-kernel dts which match qcom,.*ethqos provide a
stmmaceth clock, so plat->stmmac_clk should be populated.

stmmac_clk_csr_set() should get the clock rate, and look it up in the
stmmac_std_csr_to_mdc table. We'll get this warning if the clock rate
is larger than 800MHz or less or equal to 20MHz.

The divisor selection of 15 is not supported by the hardware.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

