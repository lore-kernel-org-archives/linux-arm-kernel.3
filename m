Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E0ECAC581
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6m2JvKKQLislbG/lLsCQpWLwDoRY8Pnbo43WEoeMe4=; b=hr+QQMwOVWvchjDgyyD9EXbgb8
	P0SmqpvQjKimR0gTcSvHBkdTNS6SG/68bWyxnI5BIMK9GGS2OucC3ZsEO4gq5p2KOVMKN0Nz4tu4L
	6sb1rZO7T4IWP0DUujS+YQD56YfG2COT3nSlavWD7QjBQJPhF364z7CFKR8iB9yg/5w7aNZyL63/o
	Zhw8/Y5UXIS7E+OWptGWV3FBZoNN14deDqnpvT6Yss8/8GuEfZH2usk95DgSMMtwnUpiKaUQx0w27
	XPEQlkgfWB60d+HRnlLvoUNJZ/Ue1POMvPlkoyoJXvs1z3LzYfrYmi1zU/1lJJwJ6tXjz5TRnVp7r
	Gkzl3ZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFF1-0000000BE9Z-1uhr;
	Sun, 07 Sep 2025 13:15:35 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFCA-0000000BDZy-3f9m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 13:12:40 +0000
Date: Sun, 7 Sep 2025 09:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1757250755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c6m2JvKKQLislbG/lLsCQpWLwDoRY8Pnbo43WEoeMe4=;
	b=Xa1Qe31ib2MbCn8EA7bchWhfdlA69tFg5z35UwJQfmd/Y+tD/PnIaII2ok+/cGbmnaygXG
	cnw0y5r7Lms2YbuHpkXTnZCsUwBRzmNUq0k2vkecwSzbffFAP5DJB/cgPz2kYUDhWVQydd
	MxpBtCD9cBLbhBTqvlClPvOT+OV0rOM3rCofbu3hXvPlLJDNFiPdeWMyrU+CCuBkmMtoaw
	Gtga+xNV4nk42xOEzsnqV6FeJAZ86ROd+Y12UL15xy8xQYr4FlA62dk47mPE1AdKArv3Ag
	aSPKmGr8VWm5B50+e1c/3HddNFZeSixDBFM38iHoz+QSwegkhGRdJDD4gc2PDQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Anne Rosenzweig <alyssa@rosenzweig.io>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 18/22] phy: apple: Add Apple Type-C PHY
Message-ID: <aL2EvQojjEv7z_y-@fedora>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-18-52c348623ef6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906-atcphy-6-17-v2-18-52c348623ef6@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_061239_202740_5DBA9711 
X-CRM114-Status: UNSURE (   8.41  )
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

Looks a lot nicer than the initial version I looked at a few months ago,
nice work Sven :-)

If we're going to define all those mask32/clear32/etc convenience
helpers, there are a couple more we should probably add and use too:

1.
    void cond_set32(void __iomem *reg, bool cond, u32 mask) {
        if (cond) {
            set32(reg, mask);
        } else {
            clear32(reg, mask);
        }
    }

Not sure on the name but this shows up a bunch of places and turns
messy sequences into straight-line code at least.

2.
   #define bit_to_OV(reg, bit) \
        clear32(reg, bit); \
        set32(reg, bit ## _OV); \

Also not sure on the name, but this would make a bunch of sequences
more compact. For example

> clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST);
> set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_OV);
> clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_2R);
> set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_2R_OV);
> clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_4R);
> set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_4R_OV);
> clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE);
> set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_OV);
> clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_2R);
> set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_2R_OV);
> clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_4R);
> set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_4R_OV);

turns into

> bit_to_OV(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST);
> bit_to_OV(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_2R);
> bit_to_OV(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_4R);
> bit_to_OV(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE);
> bit_to_OV(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_2R);
> bit_to_OV(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_4R);

3. static inline const struct atcphy_mode_configuration
*get_mode_cfg(struct apple_atcphy *atcphy, enum atcphy_mode) {
	if (atcphy->swap_lanes)
		return &atcphy_modes[mode].swapped;
	else
		return &atcphy_modes[mode].normal;
   }

This only shows up two places but both would be improved by its use.

---

With those cleanups (or an explanation why they're silly), ttbomk this
is r-b me, thank you!

