Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE34C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hU8UIsJBJs/wJVPysC5SFtDzxZng9BNNVfogLEp8pw=; b=cILygJkLyN+m1+mkcFClFKSTnw
	zuaDCnRoLztyAWFUHyL1bCezxDg975yfnBr+rioFKKcTjL4bhIi6y4w89GuhLFF4LAH8+5D9FHBka
	3Ok3RZR98cAldFhAWss7vbCbKvwwuMViRO6hIryleOs87HzUxugs51SRdiHk677BFpB3vHcj5NePH
	Bnftd8JWi66YUKVqud0IsNDzZHL8JNQUYKEDaHdUhpxfoJQei9apnJJEdeANLrnYbGX/Bt3KBMq/5
	WZ+aMw821BEvh1jXYOU4N54hyizZ4bOR2Qxbfl451ie5+YFQwyNWzXykKDdlwr6dB+F5pzm2OLxJH
	VO9pBbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfL1y-000000056ze-0fJ5;
	Thu, 02 Jul 2026 17:16:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfL1v-000000056yp-3IsK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9hU8UIsJBJs/wJVPysC5SFtDzxZng9BNNVfogLEp8pw=; b=kjpQTX/SSMGDFX7PWnu5oH6F0R
	qH26UpJqTO5RPkm0abkr6Kd0jMQplVjnu4Hb4qRiXAEMzNFV3OKWgqJ+/JQMkVpTLWlFq75MQPgdd
	d8xMaN9+t0KnrWLbfp4yQzeRU4879A9J3N17qndTPck/+reBKLKw0WqgPFfpScFnFo/Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wfL1Z-00APGr-Sh; Thu, 02 Jul 2026 19:16:29 +0200
Date: Thu, 2 Jul 2026 19:16:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Message-ID: <c43899a8-3d6a-4c94-b0c2-33c00a830610@lunn.ch>
References: <20260702165524.2168091-1-jackyhuang@nvidia.com>
 <20260702165524.2168091-3-jackyhuang@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702165524.2168091-3-jackyhuang@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_101651_903760_F9F1BDBC 
X-CRM114-Status: GOOD (  14.09  )
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

On Fri, Jul 03, 2026 at 01:55:24AM +0900, Jacky Huang wrote:
> Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
> Rubin NVL compute platform.
> 
> MAC0 uses phy-mode = "rgmii-id" because the on-board PHY supplies
> both RGMII internal delays.  The matching U-Boot device tree does not
> enable SoC-side MAC clock delays, leaving the MAC internal delay at
> zero so the PHY-provided delay is not doubled by the MAC controller.

> +&mac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +	/*
> +	 * The on-board PHY is strapped to add both RX and TX RGMII
> +	 * internal delays;

No change required, just a comment. The strapping should not
matter. All Linux PHY drivers should configure the PHY based on
phy-mode, replacing the strapping settings. There have been cases
where the strapping is wrong...

>                       declare "rgmii-id" so the MAC does not add
> +	 * additional delay.  The same setting is applied in the
> +	 * matching u-boot DTS to keep early-boot networking working.
> +	 */
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	status = "okay";
> +};
> +
> +&mdio0 {
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};

For these nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

