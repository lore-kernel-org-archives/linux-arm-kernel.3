Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C02CEB26ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 17:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzYF97sVWz63m1CUxZf+jl+Hhjnz8guVOlV5+MbrsME=; b=NyuHrJ6Oj9ZUx7Pc5j0rbfFHLR
	nM472ocfqJcXf9+/GtKcgqH/B6BL5oTher9MHA3M73aUn0VMXSIc3omfR+RJypMQc0Dd0NIR2/cuf
	i1lyoQQRThLEJcuxPmyh0UU52dbodOkvtCn7raQsYFhYzWow/m7qbPldM7dgnZjEpaLSpxwDFWYy4
	AspZkisPE+hIxr4dOZfHPqgNoHAVjzfsWvjSI/2ajbwISVhonx3plAwTCvuhZntKIr2GXcHTVGZs/
	WXUfKmvYiqlJ/Ca+vMp3Dg9eWxlXm7Rgw1uNvzqgzy5dgjnBJoGOR9Q6hX+VAR37W7o5Jih1v0dRB
	A2Sud4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprHv-0000000HLFb-0t78;
	Tue, 10 Feb 2026 17:12:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprHs-0000000HLDE-3KXf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 17:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mzYF97sVWz63m1CUxZf+jl+Hhjnz8guVOlV5+MbrsME=; b=eR2SFbnI4lfCWYT1cmVHQL6SgG
	rkwXF+klYabsm6Z8drPNbxY5lCHy5UDtoDUyIbk8k4bkjUYCPQd6mhuVxaXlvC2WB454hmU/RXBnE
	paJhrdsndFkbykNv8/uEnSfLJnpMBDfDwP4/kfpQoVxwaPrnJj2qGDKQUgeXleafN9uRJ6KB1izT6
	B9Fyw7AL9cgLv/2DzrsdO5ebbUbRC+1m6eRDWKFX4IFp7saMMQijwOi8QniOzBpVTezDN8kP/gYIX
	nt7vaZMESAfi7iEyd7/yO16UiTBbbDZrCpBegIn53yo5+TBUJrhsPGPWdDJa/7ThDQfBPfrisXpqp
	uhM/QYaQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57276)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vprHc-000000002nw-193h;
	Tue, 10 Feb 2026 17:12:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vprHW-000000002wr-3vpe;
	Tue, 10 Feb 2026 17:12:11 +0000
Date: Tue, 10 Feb 2026 17:12:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: stmmac: intel: Fix IRQ vector leak
Message-ID: <aYtm6pCnw0hdWdNx@shell.armlinux.org.uk>
References: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
 <20260210-flo-net-stmmac-default-affinity-core-v1-1-4e76612444e1@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-flo-net-stmmac-default-affinity-core-v1-1-4e76612444e1@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_091232_848124_FE9DECE0 
X-CRM114-Status: GOOD (  15.39  )
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

Note that net-next is currently closed. Patches for net-next should
be sent RFC. Please see the netdev *whatever it is* documentation (I
can never remember the name of the renamed document nor it's URL).
It's somewhere on docs.kernel.org and is in Documentation/ somewhere.
I'm getting tired of having to do a google search every single time
I respond to someone about this.

On Tue, Feb 10, 2026 at 05:28:14PM +0100, Florian Bezdeka wrote:
> The IRQ vectors allocated in stmmac_config_multi_msi() or
> stmmac_config_single_msi() where never cleaned up.

Please refer to:

https://lore.kernel.org/netdev/27fec7d0ed633218a7787be3edce63c3038c63e2.camel@mailbox.org/
https://lore.kernel.org/netdev/7e024db2557a4d5822a0dd409ae678d10d815d9c.camel@mailbox.org/

and the associated discussion in that thread.

PCI is weird. If pcim_enable_device() is used, it switches all sorts of
other functions to managed mode. The missing cleanup here isn't
actually missing, it's buried in the depths of PCI code. So, this is
not a bug, and thus:

> 
> Fixes: b42446b9b37b ("stmmac: intel: add support for multi-vector msi and msi-x")

this is not a fix.

However, if you look at Philipp's replies, there is a desire to get
rid of this PCI behaviour, so your patch is useful - it just needs not
to be dressed up as a fix.

I am keen that we cut down on the duplication between drivers. Having
_four_ stmmac PCI drivers all using MSI but no sharing any code is
silly.

Please consider what you can do to improve the current situation with
these stmmac PCI drivers.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

