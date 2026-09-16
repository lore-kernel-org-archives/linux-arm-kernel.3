Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CF3C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=US2yq1sGRJHPOj/xzuG498kyLNhvScgzcm69R59EPbA=; b=rnQU8likGMz3818dSXRhOIanZi
	Nhx9CulMPPW1igNkyQxOoZyNafjrLYuCxt1QEFeO0O7YSVJ51XSxtWSU11hcskvH6EckbVuu48T90
	Afxnqd4+f5Eb/AWaxojgIByrXtUfw/rH7gKsCCLutqlQKySbmxHPRpJr/QWJlH3SE28jkzYvDUk15
	871Ef4hdnVZKack6yddwReDAqrr9KqJzSI6Wp5gRVZVn5s8a6SoE/SB5iepeJXYJolT1Uu6cMDZV8
	Y6wuP4S3Jc/oHBvEAO6XSy7rFaF48Ob79rLbVcXFmsk6JUDrueXKUzco2DjS74eFF2p3AWnEj0+ne
	nFPbsGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kZT-00000008f4i-0Xp3;
	Wed, 16 Sep 2026 08:00:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYG-00000008eHM-1KMU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D6647C5CD5E;
	Wed, 16 Sep 2026 08:00:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3CFE60337;
	Wed, 16 Sep 2026 07:59:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C8CC11C7AFE2;
	Wed, 16 Sep 2026 09:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789545568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=US2yq1sGRJHPOj/xzuG498kyLNhvScgzcm69R59EPbA=;
	b=pzBjbPPaN7n2BiS2bDcVorC+akn3GejLWK2tQ9r7T4LyoBU4WO+17WnwBfshoGteKUuF8/
	9DhRI2wOV5uYY4jSJDhyXamKpvrwalVF8Z2JpMr4CIHK/baAs2k66/xL4fj2NoQsErjZiR
	Ap8UGI52VKYgmQ9CskVrP0h5+AxOHrc9CXdBThWrFvLB2k1Tx5oXbXaPADBaG3MnLP5p/E
	cMvpHJQeMqkbqExi3tFb46l6SFFhTBRsHEleazzIwkL2b/VRBsKT2Y0s8H3x1AgnPFWPfn
	MF+UpKNyMQuP+NlrEe0U4bWNXq2lAMhSohA6QbCaQvO0rKXgY8ycg8w1gC/edA==
Message-ID: <c030d207-ac65-49be-b778-29f9c0aa70d5@bootlin.com>
Date: Wed, 16 Sep 2026 09:59:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: add Allwinner H616 EMAC1
 support
To: James Hilliard <james.hilliard1@gmail.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alastair D'Silva <alastair@d-silva.org>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_005932_590289_AA842506 
X-CRM114-Status: GOOD (  12.13  )
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

On 9/16/26 05:07, James Hilliard wrote:
> The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separate
> system-control clock register at offset 0x34. Add its binding and a
> sun8i stmmac variant using that register. A distinct compatible without
> an older fallback prevents the driver from using EMAC0's clock register.
> 
> EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and has
> no external PHY pins. Leave PHY initialization to the PHY driver instead
> of using the H3 internal-PHY controls. The RMII-only variant does not
> expose the RGMII clock-delay properties.
> 
> The AC200/AC300 EPHY driver and package bindings are already in
> net-next. This series separates the H616 EMAC1 MAC driver and binding
> support from the earlier combined series. PWM, MFD and device-tree
> enablement are being handled separately.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes in v2:
> - Drop EMAC1 TX/RX clock-delay property support and keep the existing
>   RGMII-only delay descriptions unchanged, as requested by Maxime Ripard.
> - Clarify that EMAC1 connects internally to a co-packaged PHY, not an
>   external PHY or the H3-style internal-PHY controls.
> - Rebase onto current net-next.
> - Link to v1: https://patch.msgid.link/20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com

I didn't see that V2, but in all fairness you're not supposed to iterate
this fast. 24 hours between submissions, please :

https://docs.kernel.org/process/maintainer-netdev.html

There were discussions on Alastair's submission too, the MUX, clock,
reset part.

Adding Alastair so that he can test it on his board, and see what's missing.

Maxime


