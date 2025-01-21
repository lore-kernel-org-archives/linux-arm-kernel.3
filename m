Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA51C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5SY3ixS2vGf5OsjUh3qWK0Ry9P1z8jaz5mDXOxz1ZU=; b=p6fKNpRX7bClCDpE/mR9XTW8VL
	zl4tic9WeDaR3mIDy5W/zb2Q0pgx1mOvyMC5FI/PH0yIit+D/QezMsbaKZ1m6wr7tSW5uQPuoQpL6
	+RvrU3cVr7/RaCzjgn2cXDg6W8l0USs+uLODg4yrqh6havY/fWo4prmN/zEL/WLu9tiTrzNJZ4o/U
	DP/fobfyWItHp0VVINNpQuX/7/yZpcVqcfI/oSPle6l7cOdz3QIptLJiJLuIzUGrZ6EHZSVFKtSfb
	6yn5s91W2uoVKpymDp0MzpgBFiLv/cBOVPXrrZD3N6agnfXad7jEZllJ9sp+MZ5UOwFccNfXxf69J
	xgAReZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBVq-00000007a13-40nn;
	Tue, 21 Jan 2025 10:29:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBUX-00000007ZEQ-35KT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w5SY3ixS2vGf5OsjUh3qWK0Ry9P1z8jaz5mDXOxz1ZU=; b=cyX/jYjGB1FPjJydxCZWUDLLHK
	7aeF842Hs7W4CSWW23q+pFVdtjVG3Y+tD7EoDzTrsqGUQdGlXBxsHxudB+7wFVSwNAKeqTE1KL7pi
	ZG/r4GCwhoIC1NlqIJsnnrxNncSn8sYcRSVRI1Ljh84zwwC1KYGXQQg0c21lcbBAxVOnJDXQxIilR
	lL3zwrwXu3fCXJ1S7FTG5kPUhL8FuvcpFI1vRI4XdWATP6R2X3y/mSaxAnK+CleT/hmIDVAaEsLSE
	P9DIWC5HUYObLadSYDH5UNhRgIcjX7BWeqInmGTlSAysGz1snRkohC0KLfb12dYHDk5GUdEvuspDR
	37QFTyrA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42832)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1taBSI-000767-17;
	Tue, 21 Jan 2025 10:25:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1taBSE-0003pB-1H;
	Tue, 21 Jan 2025 10:25:54 +0000
Date: Tue, 21 Jan 2025 10:25:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Furong Xu <0x1207@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
	Vince Bridgers <vbridger@opensource.altera.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/3] Limit devicetree parameters to hardware
 capability
Message-ID: <Z492Mvw-BxLBR1eZ@shell.armlinux.org.uk>
References: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_022817_777903_075EB729 
X-CRM114-Status: GOOD (  15.60  )
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

On Tue, Jan 21, 2025 at 01:41:35PM +0900, Kunihiko Hayashi wrote:
> This series includes patches that checks the devicetree properties,
> the number of MTL queues and FIFO size values, and if these specified
> values exceed the value contained in the hardware capabilities, limit to
> the values from the capabilities.
> 
> And this sets hardware capability values if FIFO sizes are not specified
> and removes redundant lines.

I think you also indeed to explain why (and possibly understand) - if
there are hardware capabilities that describe these parameters - it has
been necessary to have them in firmware as well.

There are two scenarios I can think of why these would be duplicated:

1. firmware/platform capabilities are there to correct wrong values
   provided by the hardware.
2. firmware/platform capabilities are there to reduce the parameters
   below hardware maximums.

Which it is affects whether your patch is correct or not, and thus needs
to be mentioned.

Finally, as you are submitting to the net tree, you really need to
describe what has regressed in the driver. To me, this looks like a new
"feature" to validate parameters against the hardware.

Please answer these points in this email thread. Please also include
the explanation in future postings.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

