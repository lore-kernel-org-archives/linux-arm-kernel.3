Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ABBC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNLbvi05R+0xppE7dvLIZ87hpi3V6sXWpbl9gw3s2SU=; b=aqxdWxUb+FqZzVolMcEccBG1cf
	ETuKn3xHEqQLl7S2BqF0CW31sY/nzKGGA0X4SMB+NkacDtYO+Y++IW6/QTED0UAAF6CKf/QIms6n1
	AZjoAv64fRwQ/nfYl+U4GYqrKF+Z1o9uPeE+M/vz0/n9rwWRe+eG38P+eNSp5R+yLpe4fVe/Max++
	jbZUIdTIhM+vHRLSdV+MCgTO2hFyILzj9LiERi4Qe3OwdzrgqBZzDSIv16+NVGJ9p662QJCX5DHxn
	oAacwybqekpCztFGMbdjfCR4t+KmeCxoinFxVWVJkUPun13eccmyYGpsVqTokhI8Unep9GasjWfGZ
	iO0LuByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cbG-00000001ymY-1AMe;
	Mon, 21 Sep 2026 11:54:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cbC-00000001yl1-2mSJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:54:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E3A61A0FAE;
	Mon, 21 Sep 2026 11:54:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F0865FFB2;
	Mon, 21 Sep 2026 11:54:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B596A103281B7;
	Mon, 21 Sep 2026 13:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789991648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=hNLbvi05R+0xppE7dvLIZ87hpi3V6sXWpbl9gw3s2SU=;
	b=nIl7sW6xAQkxQ9/I0pwkb5XGFXtrlDtbn+4kHc3XOddvyTtw4Zd6gPaZoZMTGye1WYoORa
	ZQNSGKYaZdGLNl6daAnfHzKmJ4VVU7SCZLu2qhTHinstvbPQRjFzWd0vgkPoIx67Bv1NgR
	mwZQu4mo+eSZDFwq9MoR9nkukUawtmXeWtFDaW23KsOCW6qJgkLwLvEpewLcNggqSNn+Fy
	TALkSVERiHR3oMw2+/XLgeKCoTOmVl/htowEK+7GpUn52ArsjkiNIXFgID2TC+aerk3WUb
	tEh/SXfAa3pHTAi9ZJi7M1TprlSS8HW8tzPVQ0LZ66ask5yIGFkgTxZKuqZTBQ==
Message-ID: <475799c2-7eaf-45ed-a6cb-80c2c2c556e7@bootlin.com>
Date: Mon, 21 Sep 2026 13:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 0/6] net: stmmac: add Allwinner H616 EMAC1
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
 Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Tiezhu Yang
 <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_045418_840318_3B4E1131 
X-CRM114-Status: GOOD (  15.66  )
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

Hi James,

On 9/20/26 21:45, James Hilliard wrote:
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
> First fix failed MTU-change reopening and hardware-resume cleanup in the
> stmmac core so the interface is closed without repeating NAPI shutdown
> or resource teardown. Allow phylink to stop a suspended instance without
> restarting its link. Then move the MAC software reset from probe to the
> DMA reset callback, after PHY initialization. This lets the MAC and its
> MDIO bus remain registered when the PHY driver or one of its suppliers
> is not ready yet. Clear DMA and interrupt state even if the reset times
> out. Keep the separate H3 MDIO-mux reset sequence unchanged.
> 
> The AC200/AC300 EPHY driver and package bindings are already in
> net-next. This series separates the H616 EMAC1 MAC driver and binding
> support from the earlier combined series. PWM, MFD and device-tree
> enablement are being handled separately.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes in v4:
> - Add a prerequisite stmmac core fix closing the interface after a failed
>   MTU-change reopen without repeating DMA, IRQ or NAPI teardown.
> - Close the interface after failed hardware resume, and let phylink
>   finish shutdown directly from its suspended state.

[...]
> ---
> James Hilliard (6):
>       net: phylink: allow stopping a suspended instance
>       net: stmmac: close the interface after a failed MTU reopen
>       net: stmmac: close the interface after failed hardware resume

These new patches belong to net, don't mix the fixes and the glue code :)

The glue can land without these, no ?

Maxime


