Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0229EFCD7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQCAnUp7//V84f3pl77t9PEUZW5Z6f4XI9axZUwQSpE=; b=t9hRDouWxlMPpLGH8ekVH8XQNH
	kjNn3HR9A5IgV12fzdY9t8iWdazKdfdQ3Pywsa6h7y7C0h6QlwM8CHbgbnsJJJ1TkF9wx4CgBzq3+
	kCHokKZLbKdedCHowtIXwrcyCfLMUk/b2HSuXgQX8cVQGPc9gO+BkwjQeJx0+1nWqQ/LCfB2xM0qn
	iSPrzaWLehplWUq5X32VPE9Wv/5DKIJmBUCiOqxUTH0F5Py4jQXeJSElzFHguuFoM2C/2TXHOmPuS
	a/nWKw6piBNDzcfBjDIz7BmskqDCclzlSxCUdec4yY0qRklL+QzDAA3uLfIfix0FH8QC7ZV3pttZ4
	b2D5l+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXd4-0000000747Y-18gB;
	Mon, 09 Mar 2026 10:14:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXd2-0000000746g-12S5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JQCAnUp7//V84f3pl77t9PEUZW5Z6f4XI9axZUwQSpE=; b=gjO6nNGZJMw2ib+A7rYOZ/Lfp6
	EvWePfBeLy40Gmt3Be9/E1FiJhzGv1F0eJ0HgYLYDU5S+nIkqAZb2kQZ3LBJqIW/58OkWuMIFzgAa
	EOi31iaGawCON0kunT882/6dSCR63dxCIpyoyaMJ3txpgEJEkBht/dcUgg2ZO9hMfXK9/2d9XYg5D
	+DvPE2jSb/LwDpcpab5u9Udece83MQMxKqeme+EQPy6VDfB7KeYNGhN8R2U+BAVE16glZ94qFkhBP
	JxFd4Mke/czOAluzjcBTREAhI1F6gJxMvtpV5KO69y4NGpDjPMR8q+LirGuwA9hXiNw7r2VD4Bv0b
	iR1POeXw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54824)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vzXcw-000000003aa-0iHa;
	Mon, 09 Mar 2026 10:14:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vzXct-000000004EK-2MNk;
	Mon, 09 Mar 2026 10:14:15 +0000
Date: Mon, 9 Mar 2026 10:14:15 +0000
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
Subject: Re: [PATCH RFC net-next v2 0/7] net: stmmac: improve PCS support
Message-ID: <aa6dd6vQWex9Kinv@shell.armlinux.org.uk>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
 <aandp3FYSJbwoZxo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aandp3FYSJbwoZxo@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_031424_318181_738B240C 
X-CRM114-Status: UNSURE (   8.20  )
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

On Fri, Mar 06, 2026 at 01:16:47AM +0530, Mohd Ayaan Anwar wrote:
>   - Link up at 2.5G, 1G, and 100M is fine (phylink logs below). The PCS
>     link takes a moment to stabilize, but after that it's stable.
>   - The warning ("PCS configuration changed from phylink by glue;
>     ANE 0 -> 1") is observed when the link comes up at 1G/100M.

Something else to try...

It may avoid some PCS link state bouncing if the writel() came before
the printing of the changes in dwmac_ctrl_ane(), as printing those
changes will be relatively slow.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

