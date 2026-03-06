Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABF6F01835
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c20mkraPRlwGY3oRHlW+Mslb5VLebC/91Q18kftMfIc=; b=N38SgP9ZfT6ZklGqp5uh5N7/j+
	sEFG2iLsHxT1KaiXWkXhYj7p3DIoxF2zBuZEACCfx+LnOoRPUEqiTrmssOH8Wsgy1A5WHiNRxpYZP
	aDcJnta0gdProTb8RfWr4nygNI0k0w3blX6K67GzoGJkdAiNJOCt+fdqweh1zzEGaeZPniaXzQOPS
	jWd0ckR8HdEajfAENp6airWRpNj8IkrK4z9UihLc6y7PPplOcGHLLwwPD4PFqjbTKH/dA3xhtTqr+
	Ci/UMllCSBSnsbRCaTxAD/9snEgnmJ0qvUwhH6ObAE1Avbe5mWoZhep43twlXe3nRfGWzQrgu0Pm2
	53oJAv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVYx-00000003pFo-0voV;
	Fri, 06 Mar 2026 13:49:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVYu-00000003pFI-0XiC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:49:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1A76F4E4259E;
	Fri,  6 Mar 2026 13:49:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6AF35FF92;
	Fri,  6 Mar 2026 13:49:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47679103699EA;
	Fri,  6 Mar 2026 14:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772804988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=c20mkraPRlwGY3oRHlW+Mslb5VLebC/91Q18kftMfIc=;
	b=V+Lc+Q3YI20csUK/+es6cMzQASPQbm3w0yg/676z9/NKiipGSIEG+Xm0iztANxCElgi6ho
	3SetuUv4madjjCv8utjMBKnn2LX9XiLztVnv7/xWOTO3FBB/DAIF0xnkxbDOHaUocQKppe
	TLNSBuLsBbamRXcb9fA/myymZx6gqKHxZWim+hdnIKkWusoxhfcmm6Wi6OV7KY7+9uFLLi
	yR8gUKiFUkq3C8uZU3g4sgtTQkN4C6bbWGuCPXMC84gv/ViTnEgv/WM8uKDd6WfqINtslQ
	WR4Tw59PXLXt9GIhLJp1Hq2cg8/8OzgRvf1x9aVACnZvpAgc7f4H9soUuirqfA==
Message-ID: <ff7fc863-0f8a-49e2-8e75-ee446a43df34@bootlin.com>
Date: Fri, 6 Mar 2026 14:49:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/8] net: stmmac: mdio related cleanups
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Samuel Holland <samuel@sholland.org>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aald--qJquWGIvmO@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_054952_755280_E70240A3 
X-CRM114-Status: GOOD (  14.55  )
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

Hi,

On 05/03/2026 11:42, Russell King (Oracle) wrote:
> Hi,
> 
> The first four patches clean up the MDC clock divisor selection code,
> turning the three different ways we choose a divisor into tabular form,
> rather than doing the selection purely in code.
> 
> Convert MDIO to use field_prep() which allows a non-constant mask to be
> used when preparing fields.
> 
> Then use u32 and the associated typed GENMASK for MDIO register field
> definitions.
> 
> Finally, an extra couple of patches that use appropriate types in
> struct mdio_bus_data.
> 
> v2:
> - add comments about 300MHz to commit message in patch 1
> - fix incorrect usage of stmmac_sun8i_csr_to_mdc in patch 3
> - fix BIT_u32()->BIT_U32() in patch 8

I have tested this series as a whole on 2 platforms using the dwmac mdio
driver (socfpga - KSZ9031 / imx8mp + KSZ9131), no regressions found. I'm
not stressing the 300M case though.

feel free to add my :

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

>  drivers/net/ethernet/stmicro/stmmac/common.h       |  10 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |   2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |  11 +--
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |   9 +-
>  .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |   9 +-
>  .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |   9 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   9 +-
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  18 ++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  | 106 ++++++++++++---------
>  include/linux/stmmac.h                             |   6 +-
>  10 files changed, 92 insertions(+), 97 deletions(-)
> 


