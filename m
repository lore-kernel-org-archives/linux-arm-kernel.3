Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B654C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl5ihRMOzCbIkTbFuO/xpo8Dv4lTrmxjlUdD28fg19w=; b=fg2h1mKU3WUoDLac/rORk1uGyv
	LnoDfWG9BPsWtm1/J+yV7uKMB+7p7q6qb77wYP6i2XpG/8RMGj7qcYEFy8TQboMy7IqIcA0oRYHyW
	K3vVfW0/12SLn6ZmGh0pdD7i++LrQ5rE5n8j+yvkRO47qn+nDyzy8/WHy62It1WgFk7xK06GQEAxw
	GjVi74nTko1qHtWt0sWBCVbQl+hviu9muFSGsc4RaeCq1RwCIQmPlMiDXKLy0OsKLegAr8t9HxpjL
	UXs79f/q0QJGn6NXGvpD4rVBzDrmLKnqb5YhG3V+YVXwAXxU5AxQ5fk4hV4XntNKzCqAuzXPcMUXd
	+ZHwqRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26Hx-0000000HGvC-2Cvb;
	Thu, 03 Sep 2026 12:11:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26Hu-0000000HGtt-2d3o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xl5ihRMOzCbIkTbFuO/xpo8Dv4lTrmxjlUdD28fg19w=; b=bp2aa5XzrfyPcPnBIBwq6oHlN6
	88BYK5dx03MiAIuG01aderzieEPs23O6qP3Y38H7x8YQJYPW4yzRH6a5dA6jFRrqwDRRC90fCvakK
	pJXb3cmamC+YRs/FOUiMRMwkobrtsO3Ffc/SUrz0sBVS4Br3/JPjLg0QwcAIjK59pcw4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x26HG-002iLy-Sn; Thu, 03 Sep 2026 14:10:46 +0200
Date: Thu, 3 Sep 2026 14:10:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add UltraRISC DP1000 GMAC
 support
Message-ID: <1622b0a7-5516-4e72-b5e1-60c12b65b52e@lunn.ch>
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
 <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
 <910be156-b631-4b62-972a-79d9a9e38697@lunn.ch>
 <178842162417.2701756.3296149694160507506.b4-reply@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178842162417.2701756.3296149694160507506.b4-reply@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_051126_661501_05123750 
X-CRM114-Status: GOOD (  16.71  )
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

> > This looks to be 90% identical to dwmac-sophgo.c.
> > 
> > Do you expect any further changes to this driver? Is everything
> > supported? Are there more clocks? A GPIO for WoL?
> > 
> > I'm just wondering if the common code should be pulled out, or even
> > dwmac-sophgo.c made generic so it can handle all plain boring devices
> > which have RGMII delays and not a lot else.
> > 
> 
> The probe boilerplate is indeed largely similar because both drivers
> use the common stmmac platform helpers. However, their platform-specific
> requirements differ: Sophgo requires additional TX clock handling and
> other configuration, while DP1000 requires fixed TX and RX delay
> handling. ACPI support under development is also intended to use the
> UltraRISC glue driver.

ACPI is going to be fun, since nobody does ACPI networking.

But how big is the change to the glue driver? I expect the change will
be minor, a call to devm_stmmac_probe_config_acpi(), in addition to
devm_stmmac_probe_config_dt(). Anything else?

One problem the stmmac driver has is cut/paste glue driver
development. The same code is repeated again and again. Russell King
spent a lot of time and effort trying to reduce the duplication. So we
should not be adding more duplicated code unless it is actually
required.

	Andrew

