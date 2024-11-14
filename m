Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1825CD637D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 02:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJq+FCylc0jmdKMgnYo/ob9xvCnB0F5KgIKVz3m2Nfs=; b=aHRNTqMNO3zfStjrQ1pvclYc3I
	M1lG52tcDf27R/5yjItc+584cVgktAWlZuQNwe11OfgU80BUr3KFc5Vp46xl9k2iT5zojXO2gQ+IU
	0EvHmL93esYfULz91S4aGgMx/i9gJ0c5V6oH/O68Rx5YabFCdqy0Iqovp0WKCmELxrlTTs953H2f+
	FLVikYYfumVCfyZ9LuoN2RitOeWBO3I/25oVSMruwNb9lEvpc/iHJDF+nj/04qGMGP7jyU9I7cBeR
	WrckexqZo+nh4ICrZw2zt6VH6MgNTImh+gEU5ToXy/IVYPixLJSvkkhqmsLVGDJJpm/oag/qwb201
	Tx+fuleg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQ41-00000008ccq-3BDG;
	Thu, 14 Nov 2024 02:58:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQ2A-00000008cSG-132g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 02:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JJq+FCylc0jmdKMgnYo/ob9xvCnB0F5KgIKVz3m2Nfs=; b=rXHBOzefIqgQ8x33CXqamAs/rK
	nzL1Spdpkwe3YloUQNFyv7UIdHE4tWNPm7JLtHn0sNJgC1M2Cug/DVCLmcVedA9kiJoboJ9v1Ski4
	4+eI6HBVUo72sS9vIr6cyhHIOd8tVnFRxjPAXkiP9GXLB2s3QwLLF7SMzoUf1wDK4nfA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tBQ1x-00DEnU-TW; Thu, 14 Nov 2024 03:56:25 +0100
Date: Thu, 14 Nov 2024 03:56:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac support for
 MA35 family
Message-ID: <b7fb59a9-989e-42b9-ac72-71f353854812@lunn.ch>
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113051857.12732-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_185638_311864_2D1D2C90 
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

> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
> +		tx_delay = 0; /* Default value is 0 */
> +	} else {
> +		if (arg > 0 && arg <= 2000) {
> +			tx_delay = (arg == 2000) ? 0xF : (arg / PATHDLY_DEC);
> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
> +		} else {
> +			tx_delay = 0;
> +			dev_err(dev, "Invalid Tx path delay argument. Setting to default.\n");
> +		}
> +	}

The device tree binding says that only [0, 2000] are valid. You should
enforce this here, return -EINVAL of any other value.

	Andrew

