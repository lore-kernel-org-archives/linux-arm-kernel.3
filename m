Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E57C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gt7L3h/h6JftjK7S6HBLGWArLASFLVo4SYarGabL1Sk=; b=Xy70boIWk/7j2X0PGErDbqvfCZ
	7DZAjYPFIEPKkySQKudj/nGj/REaDVm4MKpoOEOR2xELU78PVC9LDW0dc3kXkKA1J9DkyZGy9DwVS
	Iy+KsS/qsEkD/UKWQOIOCpXWrMNqW75yNkAJHXhdYl56Bjqlla1P9L0O+K0hbwHTAJv+bWW1wjGlF
	3+GxUvrf8KoHuRe0wUQmo+WZqf6ZD4K4XbFolNhlNh/rL3mCkQJDep+AOMe3GKb8BSexwMQcijJOF
	ph1TECU3poBNRsHoOP5lJUZ5As9mfyaVBCBjRvmo5QcAV+V6opacYkBnwKdlWNvDlZ1Ft1FDdNLMk
	9cyvqdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I9V-000000087DW-3p5M;
	Tue, 22 Apr 2025 18:15:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fbx-00000007jhf-2HFp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gt7L3h/h6JftjK7S6HBLGWArLASFLVo4SYarGabL1Sk=; b=ERX6sxypfDytXPK6JY1ybh0dep
	fWUaOf7LKQKP0oDx0asAHaPa1mlqj21OQAIm4wYUH4QL/pMZuI2fpI/jKmcizCooHta3UGi/ndYbz
	gdVAYVsdaH5pOB07HPPshfAC0mrMpf+I3EAi2VbUUpMNYkpardHsKFB+hh/sxfqgdA1x1+S5COQLV
	v6sxsZ0/Irb+3xGMzghdK3Y/Nesg6HcmLDneD7/o2wfJeJDE71P/Pnne/jIwFIxUX1M/IM9ZJm4dw
	WP2F+JbYlvNReGJvc4KSTff6qJK8LHjbFM1tzlsMjg+DN40gnlkZ2UccF5C78kyoubRzD4gLZDCzp
	dWDC+11w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52312)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u7Fbo-0004e6-2Y;
	Tue, 22 Apr 2025 16:32:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u7Fbl-0007a9-1U;
	Tue, 22 Apr 2025 16:32:25 +0100
Date: Tue, 22 Apr 2025 16:32:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: stmmac: fix multiplication overflow when
 reading timestamp
Message-ID: <aAe2iULNthghEEEt@shell.armlinux.org.uk>
References: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
 <20250422-stmmac_ts-v1-2-b59c9f406041@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422-stmmac_ts-v1-2-b59c9f406041@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_083237_576150_45629104 
X-CRM114-Status: UNSURE (   8.05  )
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

On Tue, Apr 22, 2025 at 05:07:23PM +0200, Alexis Lothoré wrote:
>  	ns = readl(ptpaddr + GMAC_PTP_ATNR);
> -	ns += readl(ptpaddr + GMAC_PTP_ATSR) * NSEC_PER_SEC;
> +	ns += (u64)(readl(ptpaddr + GMAC_PTP_ATSR)) * NSEC_PER_SEC;

I'm not sure what the extra parens around readl() are actually trying to
do. Please drop them if they're not useful.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

