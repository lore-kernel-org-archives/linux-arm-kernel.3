Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B3CC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbjjAievrk0TRpJw/qD0GOXbcxqQaMhuiUNPc/d2A7k=; b=ehvBCPkkBXihdN5DkPsc+wwf24
	uz5zCfxdFtFgysppeyRtniHZUKZthILt5YgDnNO6u9nNwTfVQ7Qx89/0T20w7lQ5e8TObqTrIzLfZ
	Y1LhUIdVvZs3h59rVXgWZAWj2LEABsE0lyWlXLRSdCsH8NjgP8wmkGWpwDyMbI4VOIw0E/ju/mwna
	j/IMwEAqLHOkX1iASawQa4R5lwbVo3MBw2XfF/oTltXflReZ1fSRRKPBKlso8wkQK1cLJmHzrSsok
	9LzGNv4WZ0HxuvTphmKxCM0zIjUi9MIvJpQA88NWFhEMC3K9JRexxmE3CKlPXhgIVuWAZp0a9Tikg
	ZGqXdxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrlU-0000000DttK-0JFq;
	Wed, 04 Jun 2025 17:19:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjJ-0000000DsYi-0wgV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 17:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pbjjAievrk0TRpJw/qD0GOXbcxqQaMhuiUNPc/d2A7k=; b=5LMJuy8czXGhJbnvQhd/7KM5jD
	xTa7+YBTRAVXVqntNCeDTCOV8p8YdzlX479W00i+Zc4rVUj/Ytd2u4EdMhrqVfrKBSYofbfOUA0X9
	dqwY8Jipbbud+Qt2813lGG7FaNXlnpzblFG7oIcsHY/9L+SoNnNIXq1/wzThGSQch2Uo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMrj3-00EhMP-QE; Wed, 04 Jun 2025 19:16:29 +0200
Date: Wed, 4 Jun 2025 19:16:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	othacehe@gnu.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
Message-ID: <92e4de77-07da-4583-bf0f-46891101c327@lunn.ch>
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_101645_278088_264490F2 
X-CRM114-Status: UNSURE (   7.43  )
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

>  &eqos {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_eqos>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
>  	phy-mode = "rgmii";

For this part only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

