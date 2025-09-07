Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25B4CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/KUq6pSTXq+6IeioXoPeuwVExsq2hrUKmGGJELtuVI=; b=ycordKEzUrhW5+LVJxiyiuiBrr
	dLfyZhz5giDCCfNwC3eoGit2TKfdvfJg+jhID3y4kT18VI9GJ5PcBQIWh1xJXydXkk3eD0/aSHGyg
	1uIp4oCMJZINXidJmD1v3HsQqu5k5iWIDNwv509Us8CDz5G4KBJtPA3QIT93u6BBfCuzvxqqPjiEd
	c7W1tpIAx1BQzEhBtHpVJb3b8EKkc2+EEUl+rHKS4mAzMWMKF5EhBb9UNrv434FOQZ4pcd6CfHElH
	yYzs/IOK9uUs1Kcow/TCywKtRNYj9dfsKgJJJsDp1xhVlsLSFjnj0QS2aIyKPbEAjMy8oxj1qM8we
	TqgoFG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFHw-0000000BF5h-2K4p;
	Sun, 07 Sep 2025 13:18:36 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFF6-0000000BECd-173b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 13:15:41 +0000
Date: Sun, 7 Sep 2025 09:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1757250938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S/KUq6pSTXq+6IeioXoPeuwVExsq2hrUKmGGJELtuVI=;
	b=mFfJk3jPrq2PSVa5pryxIo9DqIP/tWcI51vlOz3BNmXJL/QW5ixV3gvPtQMTqLlhfFWoAj
	VyJs++CEOPsdCfp+Eb3m7RmwPM9ep8GBaKxBeBskm0o6AEvLj6/xNXMvXmJECEKnr12NzL
	8pd/TRi5r2iNaHU9W74lLCd9byKepNk0KGM1lRqaHRsJ2VuutCPFTYczDxhOJYBN/Otwhc
	HPb8MEZXCVHbh1lmNiRCvjkhMC0OvoSThpecM++4MbfBhJJcBfsGBcP0mKMbq7LojgXwfk
	Wq2OUStSnlP7T3L7CaEGPi4CLQgmIvIGgePoxVs1LRMbiKx9dmQCKnbjg7cINA==
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
Message-ID: <aL2Fdd2Ls26pksJN@fedora>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-18-52c348623ef6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906-atcphy-6-17-v2-18-52c348623ef6@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_061540_451558_690F78EF 
X-CRM114-Status: UNSURE (   6.22  )
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

In functions like atcphy_dp_configure_lane, I'm wondering if we want to
pull out individual registers like `void __iomem *tx_shm_txa_ldoclk =
tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK`, likewise for
MAIN_REG0/1/IMP_REG0/etc, just to make the actual pokes below a lot less
noisy.

Incidentally, the txa_ldoclk_bypass handling is another place where the
cond_set32 helper would shine.

---

Also, do we know what _OV means?

