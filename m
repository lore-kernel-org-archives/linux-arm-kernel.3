Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69971FC9EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZW8BuA0fC0U5YN4Qe9g19o/YY6ZaWP0T7NsULZ97aE=; b=zreWVdVFiNlSgYpEFlAiJ+wbDi
	NO+1YwGOX0uCpDJUUqI6d8H/cpTwOBd4+W3hIlOTvgxO+KTSuKIQZG+cEj6v6Eai4fhLTZe0fSwGF
	XkSTVPGLWoIwfneI6/kfJoiIEhC+l3hk4QdDqWGx0oUAYg+rDY0ZngfKE1gNH68UCzbp9ujIbRLjJ
	iIJzQvSn/y6jlUzAYpgNZbckQfokOlS51VeMebKRu2L+t5xCwBOd5IxLY3qpRyAbbvmbmL06DtjX4
	5OE2EbDS1D0Qhoh3xQ2PSoI4POz1rji29ztvipdICUyXNQPJnTqu74GA8awB2cvJmT8aUoCvj/4/3
	RbfR0RCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyoxx-000000056H6-3F4m;
	Sat, 07 Mar 2026 10:33:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyoxw-000000056Gw-1RAX;
	Sat, 07 Mar 2026 10:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2B666001D;
	Sat,  7 Mar 2026 10:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A07C19422;
	Sat,  7 Mar 2026 10:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772879579;
	bh=XQO4sCLXxXDne2+PAc+XCPnSDZI9JjNGghwMRWmQ2O8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQXbp8KIZsdHycc72E7W0k4ZKb+xVdA+DD1CmhISHUGUaX+I4jIQwbQ4mNL+wImNL
	 bYjQt60TOtHVGvrEPjZCgtZnU4RudcHrLVU4bAaS2vr7tLski067aLciZs4o7tPBrj
	 QyglSwwFq0r2aZmAMPxbUgtYUAzyL2b5ZeApYCX+vMSy4ltP0BUlqaANiFijr3pr6h
	 wufkXPIRYclC4Ez4nKgHOm41JB26Ipg2trI9jqIW4E9EYW+glTc8RPl13EH+dMbNrd
	 kDqCGS54itw8SbW+w3nUb8TF4Edk9tnJsOCgAD3SOVC5lt1Q/cVxsgSvCrBarRKQZt
	 srcRJZtjwctoA==
Date: Sat, 7 Mar 2026 11:32:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/4] phy: airoha: Add support for Airoha AN7581 USB PHY
Message-ID: <20260307-otter-of-imminent-merriment-d3475d@quoll>
References: <20260306190156.22297-1-ansuelsmth@gmail.com>
 <20260306190156.22297-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306190156.22297-5-ansuelsmth@gmail.com>
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

On Fri, Mar 06, 2026 at 08:01:53PM +0100, Christian Marangi wrote:
> +	for (index = 0; index < AIROHA_PHY_USB_MAX; index++) {
> +		enum an7581_usb_phy_instance_type phy_type;
> +		struct an7581_usb_phy_instance *instance;
> +
> +		switch (index) {
> +		case AIROHA_PHY_USB2:
> +			phy_type = PHY_TYPE_USB2;
> +			break;
> +		case AIROHA_PHY_USB3:
> +			phy_type = PHY_TYPE_USB3;
> +			break;
> +		}
> +
> +		if (phy_type == PHY_TYPE_USB3) {
> +			ret = of_property_read_u32(dev->of_node, "airoha,usb3-serdes",
> +						   &priv->serdes_port);
> +			if (ret)
> +				return dev_err_probe(dev, ret, "missing serdes line for USB 3.0\n");
> +
> +			priv->scu = syscon_regmap_lookup_by_compatible("airoha,en7581-scu");

Nope, you need phandle to express proper device links.

Don't sprinkle compatible lookups for new code which does not need to
keep things backwards compatible. How do you manage device links
without phandle? How do you manage device probe ordering?

Best regards,
Krzysztof


