Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453661125892
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 19:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL70AeZN9UK2m7sj41DcGvsRBuEFD6s19+k/6cH7f7g=; b=nUtlzgV1An5i+XfRRzVbJZrngR
	TtRKsPnZV21JpvfBmRPrUDAqwNnRJAFDwFz+ZpIaf08TrgXdaSitA6frPeOscA/lPyUwjw3ovdpXI
	gXsQL9RV+KbMq+v/vh++mZYSVobk0GQzzfyz3d9QAr4eUOfYjoATGqAkNH3DQ/lfu0GvDVkRPbu3I
	GOlqgpVTHHScydSuHkRAUUvbxigxwH5gKf6+ytJS+J09FbRgBnVcmIYfWZxGKY+Li4u5Dj1Gvsp93
	vU4RJ/3xo+NA0quk9S2nyMRD2wwPjkP3rPJcdrnUH946aeSU034CvfE5ET3HHTIsXcUnBv7QOgVL6
	sV+PRKdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PYz-0000000COx2-0SGC;
	Wed, 11 Mar 2026 19:49:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PYw-0000000COwQ-30IF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 19:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BL70AeZN9UK2m7sj41DcGvsRBuEFD6s19+k/6cH7f7g=; b=5J99swfhm2ay0BaMoydJFYnjjn
	3ByWBx6Q6qo0wbdoP74koAHuUCqF1nZBJ6dNS5TdxyvQ1mRTFYN6ormC/47L3mWGLYfzwza1ybRvU
	ZMr6eLRzSIqZIJw7/GBVpE4Cvv887GaRfSjEaMtJsRiX84NixG8ghwA+mBYC4rfz/vz4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w0PYi-00BELU-Ej; Wed, 11 Mar 2026 20:49:32 +0100
Date: Wed, 11 Mar 2026 20:49:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Williams <patrick@stwcx.xyz>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add Meta SanMiguel BMC
Message-ID: <368b7c5d-6a28-4eb7-9b58-9f2a63443af1@lunn.ch>
References: <20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com>
 <20260311-sanmiguel_init_dts-v3-2-2b4d1ab7a8a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-sanmiguel_init_dts-v3-2-2b4d1ab7a8a1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_124946_757904_EB51B9D0 
X-CRM114-Status: UNSURE (   6.28  )
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

> +&mdio0 {
> +	status = "okay";
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};

For this only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

