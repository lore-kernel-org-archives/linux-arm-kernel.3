Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75157FD8FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sppcnqILA2tjvw6TKSRMqAQpcumxQwdnuBhqn1AdTqk=; b=mzNLH3lfjjqcyG2dAVdfFpEsA3
	jQAxC9q9RV3AfAn6mf+WNH5duTTPYT388HE5SuHQpERgpM//eK1O2x1n5PA20pBb/MM61fSeIPFFI
	BICB8I4mwtySsxG4jlGSxJUPEUhGCfQbmJNFg5G4hjmvHfhaKOE5ScuWWGPCtyWG0ZudLaBFmp2SH
	bBufYgFfV5zb/opeToe8oNhrcUwoLlUS05U5UTV/pinvow0gNAZdE/HID3YnA4xiHEprd/9MHBEjY
	XPy9e39QT0flPe9329938gQla6bV3GqND4fgjqgL5C+y1lwPIgawIK9M+JJppYyGS2ux1jXgAt1Hl
	T9ixggNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcwi-00000006PIQ-2G19;
	Thu, 26 Feb 2026 15:06:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcwf-00000006PH9-37qS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sppcnqILA2tjvw6TKSRMqAQpcumxQwdnuBhqn1AdTqk=; b=mBBMvm05wtdNdy58rWBB4+xVTp
	ZvoqQB3Hi3d4Bx2ndMvT3t/UfsnipUVE6GN//goqK3BM+evLJaox/FIoxeIyk/NKtUt+F7sEjPH78
	1R9vHqc8kMAyWgZvrBhSwic3F6kIqW7neOJNy7XOSsaRyMpDdE35XOc+zcn7pcEYRArg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vvcwN-008tqe-2N; Thu, 26 Feb 2026 16:06:11 +0100
Date: Thu, 26 Feb 2026 16:06:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "P.K. Lee" <pkleequanta@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
Message-ID: <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226055521.1655243-3-pkleequanta@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_070629_780727_7DF72D9A 
X-CRM114-Status: UNSURE (   6.77  )
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

> +&mac3 {
> +	status = "okay";
> +	phy-mode = "rmii";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii4_default>;
> +	fixed-link {
> +		speed = <100>;
> +		full-duplex;
> +	};

What is on the other end of this fixed link?

> +};
> +
> +&mdio0 {
> +	status = "okay";
> +};

If there are no devices on the bus, why enable it?

   Andrew

