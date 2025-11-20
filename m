Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BBACF8844
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiWH0/YZBx9aFxNDPIFdolJuvMUpl0yJwssz6YI10nY=; b=LUcXedGFtGIOoRaPRsdHkYmHbF
	dpIkt8knFQhVU7baJt9L4AT4JB8OhZn5PdoTCI09yIEzjYrygxd+0dCXdgbzCE8gqE2mNhzHgPgzX
	YlhaCnJC+cvqT1r2KIogV7bOh/q197GsRGuDMM2/+R+2JGRbvqrK56ne4I70W53F/OBQSrEwT8XLE
	HtceoKafK3Pwu4eIbCS3CP88KkTRDctOqgLHkUwYUcLfpJiTtup47CkfYT+uI2JW+l5WpGwp9yQQR
	Vwj3f52R6ZfGzUb+sUETYQ4EeZDdbJ9GgxkPl5dcchjsCfQi48v0VtsSrzCqquC0s+8USM81anhRh
	C9A2AjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2sg-00000006akE-32ge;
	Thu, 20 Nov 2025 11:31:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2sW-00000006agh-07ij
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kiWH0/YZBx9aFxNDPIFdolJuvMUpl0yJwssz6YI10nY=; b=VxgBKxUq2Aq7FKSBV1RbjVUfju
	+zReZgekJzT9LDjDfe4qebH7lqQNCk7+WUnAV/ZO+7Qxnh5EBuxb8ZX6Z1jVpkGi4x/bc++LYkMVQ
	F35otdxM3SNxdjDcBH+5J6gAgmjqlNRsV4zD9R9QS9KsoWOA/VdMggGSKQfchF0R0y6QrN61nq2vQ
	LHH3nuW1mbDsOF9PT2srPRfQhpFUiVCvuep1RQnrQ/3Tk8vWY74m9wdgIA7/xP8CoqguR/mhEffIS
	Is28Cbajewd52w6d9Ky14ayNlSVvKFowAjsP2q07eCDZh11rPRLA8JCNmRefn87+4LlOWXhmTPzWP
	qqOt9epQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54204)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vM2sQ-000000006A3-0xfZ;
	Thu, 20 Nov 2025 11:31:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vM2sO-000000004LM-0FuK;
	Thu, 20 Nov 2025 11:31:00 +0000
Date: Thu, 20 Nov 2025 11:30:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 1/3] net: stmmac: qcom-ethqos: use u32 for
 rgmii read/write/update
Message-ID: <aR778ygQp-SZO19n@shell.armlinux.org.uk>
References: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
 <E1vM2mq-0000000FRTi-3y5F@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vM2mq-0000000FRTi-3y5F@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_033109_878737_AF1ECC3E 
X-CRM114-Status: GOOD (  13.02  )
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

On Thu, Nov 20, 2025 at 11:25:16AM +0000, Russell King (Oracle) wrote:
> readl() returns a u32, and writel() takes a "u32" for the value. These
> are used in rgmii_readl()() and rgmii_writel(), but the value and
> return are "int". As these are 32-bit register values which are not
> signed, use "u32".
> 
> These changes do not cause generated code changes.
> 
> Update rgmii_updatel() to use u32 for mask and val. Changing "mask"
> to "u32" also does not cause generated code changes. However, changing
> "val" causes the generated assembly to be re-ordered for aarch64.
> 
> Update the temporary variables used with the rgmii functions to use
> u32.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Konrad provided his reviewed-by in
https://lore.kernel.org/r/76d153cf-8048-4c6f-8765-51741de78298@oss.qualcomm.com
but for some reason I forgot to add it, so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

