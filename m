Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC26C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3POSKf1l//awqxiJqBaWGp6u9Aetu6Ug9QJG/mcoxA=; b=veolUJQyrK77eJm/mQ4aux2fdo
	0S4L6CD83qiued78Ybul/2sNSKY5zdOT+Q0kbZZbqXuoi0oBfY27Sr1aaK05/FHxWYtPjwNVW6xnq
	4iGk7INd3KG6c14+6szq2ZrHvQJo86czUIYSrzzds4fSqgp8xzY+WfoixtWdgqWdZzt8mrqT9Ga4F
	ENpKepzrGNFfJWEuXKFmclVe3udb/urW7JqnZXkBTs4wPyekb89998a3WHcpE9SNiTtN47ozKtwDt
	PHTjm/QVcSjGb4k/vkq1vBgYro+9V0qnjQJxrmL7gPMJi1hNflGoRzHG3TiBqHQs4YYoYJlWQin+s
	qyireeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x234M-0000000Gpn5-3n7W;
	Thu, 03 Sep 2026 08:45:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x234K-0000000GpmT-0c4Q;
	Thu, 03 Sep 2026 08:45:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 132F71A1977;
	Thu,  3 Sep 2026 08:45:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D597F602B8;
	Thu,  3 Sep 2026 08:45:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C649D11C791C9;
	Thu,  3 Sep 2026 10:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788425103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=I3POSKf1l//awqxiJqBaWGp6u9Aetu6Ug9QJG/mcoxA=;
	b=AmBlqR4yi+H5GQeKIjxkNzi6kZX3aEWZ8QCr/EcPduO6XYg/IwNnZ9vkAQYzDyyCDXAs47
	JazVtt8sceaDeIRUwWVCPt9E528QZaJe3GlSuqVINZM7WrVNuyeyeERvZS2/YGk3gfc6Yx
	Fm9rOEZpk7lg11HFl/1AY6veXzz7lycr9VBy1ymsWzEyl5SoiUtTRnZHFU88cIwelGlMJe
	YLXI2aost0tfd5vmQdRuJeJtSbVke7QmyfJadI3wDFUkIEAHsMCAOCx6Yjn6jGSmWC1t4Z
	6zokH2E1Xc+OQgDcM1pOHBxVZ0S0jMzeMdCetjn3vRV8Gns4xE/jPDQtQENm9Q==
Message-ID: <2711c2ec-3e3c-4cfd-bda6-cfc832a873c2@bootlin.com>
Date: Thu, 3 Sep 2026 10:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 08/10] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
To: Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org
References: <20260901150111.141037-1-coiaprant@gmail.com>
 <20260901150111.141037-9-coiaprant@gmail.com>
 <f07c64b4-3018-4e9d-8aea-12454f132419@bootlin.com>
 <CALj3r0hxSOrtRwOmAQ4Vw=nEkTfA+x93KzpAdG9m=xWFYbOuTw@mail.gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <CALj3r0hxSOrtRwOmAQ4Vw=nEkTfA+x93KzpAdG9m=xWFYbOuTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_014512_327624_F6AE828E 
X-CRM114-Status: GOOD (  15.07  )
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

>>> gmac_clk_enable() is now called before any register access, including
>>> the SGMII mode setup path.  Previously SGMII mode would bypass the
>>> clock enable via a goto, which could cause synchronous external abort
>>> when accessing MAC registers with the clock domain disabled.
>>>
>>> Also clean up the error handling in rk_gmac_powerup() by using a
>>> unified clk_disable label, and add error handling for the default
>>> (unhandled interface) case.
>>>
>>> SGMII In-band vs Out-of-band
>>> ============================
>>> On RK3568, the MAC clock is fixed at 125 MHz and cannot be dynamically
>>> changed by the stmmac core's set_clk_tx_rate callback.  In-band mode
>>> works because the PCS handles rate adaptation internally.  Out-of-band
>>> mode does not work because the MAC would need to change the clock rate
>>> to 125/12.5/1.25 MHz for 1000/100/10 Mbps respectively, and the clock
>>> is fixed.
>>>
>>> Enable default_an_inband for SGMII and disable the generic stmmac
>>> set_clk_tx_rate callback.  This forces phylink to use in-band mode,
>>> where the PCS is responsible for speed/duplex negotiation.  Without
>>> this, the stmmac core would attempt to change the clock rate on speed
>>> changes, causing TX to work but RX to fail.
>>>
>>> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 386)
>>> Signed-off-by: Coia Prant <coiaprant@gmail.com>
>>
>> [...]
>>
>>> +static int rk_pcs_init(struct stmmac_priv *priv)
>>> +{
>>> +     struct device_node *np = priv->device->of_node;
>>> +     struct device_node *pcs_node;
>>> +     struct dw_xpcs *xpcs;
>>> +
>>> +     pcs_node = of_parse_phandle(np, "pcs-handle", 0);
>>> +     if (!pcs_node)
>>> +             return -ENODEV;
>>
>> Here aswell you make it mandatory to have a PCS, as the generic pcs logic
>> introduced in patch 1 doesn't handle -ENODEV, it treats it as any other
>> error.
>>
>> So, either you return 0 when there's no PCS (so that we don't break platforms
>> that don't have one), or you handle -ENODEV gracefully in patch 1.
>>
>> Maxime
>>
> 
> Hi,
> 
> Currently, `rk_pcs_init` is called only for SGMII, which requires a PCS.
> 
> As it stands, only the RK3568 supports SGMII, so we won't break anything here.

Ah yes, it's protected by

if (plat_dat->phy_interface == PHY_INTERFACE_MODE_SGMII) {
 ...
}

My bad, this is fine then :)

the intel thing from patch 1 is still standing though from what I can see ? or have
I made the same error there ?

Maxime

