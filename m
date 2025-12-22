Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0255D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0YQE5cIMQ8TuSN1tQuMtY/HpGiRBNZ+8oVm3GsMajU=; b=qwtR12l1+NrCGm5I3GrIpQlQaj
	2nLPHY4wtb5vETchhM/TkG2OOhvURhZUjYBBzfL7IGrLCohcRbiFW6c7nAo8IXdealfrg7HCQXDqs
	l1D10d9Otw4AYEjKu6saVU+mQv00ipILbGtZc7iovcD90SRQqFU9TTHuUGDoapH3oZYXpLJN54LkK
	rdzpqFt9qSwpJbHSIB8ytEqZmsq4EBx1u/mc3fPelnjz31xK43HzI2I6xyA7WKS8c6ANz2sc6ZpjA
	I6eqDRbGvz4Rhqidml8RXgbWCEuStGexErJ3c7xMqNMzs29Ir2xn98hvBv2Caf9fh+1SSHAuZ+qsL
	jRbH+v/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcFu-0000000DWWT-0ToP;
	Mon, 22 Dec 2025 09:31:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcFr-0000000DWVw-1ZUQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=i0YQE5cIMQ8TuSN1tQuMtY/HpGiRBNZ+8oVm3GsMajU=; b=5f7el+Au+oY3EUW9T9yq+a5+yu
	P7p5Qb7ePDeVrVBRvhwxZf8Tc1WDgGr1h0K3L5O0Xz/riY7zjw/kcYgAIolhYGxjeDhpojGZsERbm
	I4OwMLKL5NzmJjnFJmX9o7yX72xzkxc4qf3kwj990i5acruwf2fdw9VhOLKREt0rmA7s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vXcFY-000AAb-M0; Mon, 22 Dec 2025 10:30:44 +0100
Date: Mon, 22 Dec 2025 10:30:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
Message-ID: <c069b452-df22-4afa-bf6a-c48949f40ebc@lunn.ch>
References: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
 <20251222-ventura2_initial_dts-v1-2-1f06166c78a3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-ventura2_initial_dts-v1-2-1f06166c78a3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_013103_632388_E1DDF97D 
X-CRM114-Status: UNSURE (   8.28  )
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
> +};
> +
> +&mac2 {
> +	status = "okay";
> +	phy-mode = "rmii";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii3_default>;
> +	fixed-link {
> +		speed = <100>;
> +		full-duplex;
> +	};
> +};

That is an odd combination. You enable the MDIO bus, but don't have
any PHYs on it, no phandles pointing to it. And you have this
fixed-link. It makes me think you have an Ethernet switch on the bus,
and this connects to it?

    Andrew

