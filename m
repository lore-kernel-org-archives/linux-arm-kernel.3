Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A3DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0y1/5KjujPLLYN0/a/OAGfW6wEftE6jNU0MO4+5f08=; b=XiVCxmLtCwG/BYDxIMB0tH2GmE
	nkOBG4GHS8D0bJrAbzzKuZsJFPXWjs8srf9XqBb6V2gyr+EaC51pQGiPe9QG6LckKtFSIhEyQZ72T
	OgA5gOJFlir/7ucV7UkFBNSawBLKn/wKR67OgBWeKxiE/pyrosDfIeh44uBayQYAD0J9kOue31LtJ
	U+Y22t4hmwtzqppyCvRuPiWFd+IOCViLKxo16Iii43yL1qvrrfLOgrX4BsN32TmTu/ib/P24aWjev
	zlkuIGQeoWEKBFEurW9GILz/MVd+0v5U3nuk26TCLhvue8lDO89QGedE3mL8T5GiyINPByfjHc2mE
	RvoZz71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcn67-000000055f1-2hqu;
	Tue, 28 Jan 2025 15:01:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcn4m-000000055WW-04Om
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U0y1/5KjujPLLYN0/a/OAGfW6wEftE6jNU0MO4+5f08=; b=bQv7y2Vk//g3H/hdiNSHTo2fkb
	5rkNlvgrieDxx2+XrUXeykAh16ZYPuQonhyRvcDlXZsibeVKZvw2rQ3A5ChZeTW7Dr7a6HXQqgpq0
	M7mg8suoSySCT1qYG1uG5Io1T5I24Ouk19C7lxE/mlrQdHQnnBBMPFWVinUc3qbge6w/C5LkkGbQa
	VnIjA6fBz6nq28N+1C0LEe6Jq12INu+vt++UroH0nqdRrZwFJysb9SkDhcguTxTfn9PBzFSWY45zD
	MTt3IGISTU3pufnRvMhep54CEt8+V4mqWdyWEhat0v3dlLWKeW/jLeI0C8zjY+GetUnXM5jLl/PYc
	zcOGnM0g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58350)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tcn4Q-0007Nk-0L;
	Tue, 28 Jan 2025 15:00:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tcn4I-0002jM-0z;
	Tue, 28 Jan 2025 14:59:58 +0000
Date: Tue, 28 Jan 2025 14:59:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, andrew@lunn.ch, alim.akhtar@samsung.com,
	linux-fsd@tesla.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, alexandre.torgue@foss.st.com,
	peppe.cavallaro@st.com, joabreu@synopsys.com, rcsekar@samsung.com,
	ssiddha@tesla.com, jayati.sahu@samsung.com,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: Re: [PATCH v5 2/4] net: stmmac: dwc-qos: Add FSD EQoS support
Message-ID: <Z5jw7pUXEoGjLtgP@shell.armlinux.org.uk>
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102732epcas5p4618e808063ffa992b476f03f7098d991@epcas5p4.samsung.com>
 <20250128102558.22459-3-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128102558.22459-3-swathi.ks@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_070028_054080_01FC799D 
X-CRM114-Status: UNSURE (   7.27  )
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

On Tue, Jan 28, 2025 at 03:55:56PM +0530, Swathi K S wrote:
> +struct fsd_eqos_plat_data {
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	struct device *dev;

You only write to this, so it serves no purpose in this patch. Please
remove.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

