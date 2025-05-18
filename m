Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2336BC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PAtzibwPGzPsb2gvUMPS4izyL4nfJ85lKJcGMeMkIY=; b=2wTNOQIHYx8gUguO8lCqRUZU92
	CyAIJyD48Wy1yNvDF9dbTwG5b85fBtQ/WEXjN58zpSi6hLJC2/vzmJz8N7uaacbs02lkpl4c9BqUA
	cbrjNv9/u6Mhf5bcOxerK1R7VCqGCV29VTP4IFoIoJeqe5MhK1z1mC7RImdWquf0LEZrldAt0oT+G
	n29soqiVgd4sXkR0EfgO5xk5gE9WWS63DKVZ8Tsq+FIxCkYxxRVCrXC4Htqh25Pq1mYnd8s1R/yYg
	fjp9cqSRKyeFYC++IdIU2cDxb7hUc+EhD6VkG2mtM4cWaDIai978k1PRV0mbkU0KBE7y2VEvZ7TJG
	FKBVsWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmlc-00000007ejV-1zRP;
	Sun, 18 May 2025 22:46:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmeQ-00000007dk4-1C7c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 22:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9PAtzibwPGzPsb2gvUMPS4izyL4nfJ85lKJcGMeMkIY=; b=u9It1wTng+n27k/Da9wot3ipbE
	nkgw93z5yood/RlJjxLZBNSayr0VihjFpH/DTgZN7LxwMLqSt+tX+zWsdW+hrzeOFHIPK7L/wJwSf
	JuxxLpQFWBMFnRxHoYOZgzGvYxQ/L6ebDJ39lmuxrWpq+EXU5WltIGdq21ljuvLHxrxk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uGme5-00Cwv3-Rh; Mon, 19 May 2025 00:38:13 +0200
Date: Mon, 19 May 2025 00:38:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	yong.liang.choong@linux.intel.com, rmk+kernel@armlinux.org.uk,
	jszhang@kernel.org, inochiama@gmail.com, jan.petrous@oss.nxp.com,
	dfustini@tenstorrent.com, 0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com
Subject: Re: [PATCH v1 1/2] ethernet: eswin: Document for eic7700 SoC
Message-ID: <c9f0cb9e-26e9-43cb-bf67-3fd27033f55c@lunn.ch>
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
 <20250516011040.801-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516011040.801-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_153834_319611_AFBEBD1D 
X-CRM114-Status: UNSURE (   7.05  )
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

> +  phy-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [mii, gmii, rgmii, rmii, sgmii]

In theory, all four rgmii modes should be listed. In practice, only
rgmii-id is likely to be used.

> +examples:
> +  - |
> +    gmac0: ethernet@50400000 {
> +        compatible = "eswin,eic7700-qos-eth";
> +        reg = <0x0 0x50400000 0x0 0x10000>;
> +        interrupt-parent = <&plic>;
> +        interrupt-names = "macirq";
> +        interrupts = <61>;
> +        phy-mode = "rgmii";

Please don't use rgmii in an example. It is probably wrong, unless you
have an unusual PCB design.

	Andrew

