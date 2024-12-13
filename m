Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B434E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAJ5fUjEEvUD9VbWS1/Qwk4AOyP6PIZbu8dIgzfahvY=; b=paG9T+WT97bqm6CrT3Zffn6PYi
	aRpjloh3hrJBRy0Twr4lvvDeYg0wAQuAw+yNGHJhL8GiJOzXyY1IGGP7gwXu6kfyV7nuG6dXqypLK
	tUssgz9oU+QQvIByo8Wsi7Ugcr4pB2M5tEwS9ve0p+jcndOIValh4+/KHijg3SPqozN+3NsuSSXPP
	eqvE0eY16zPKxAb51jhkQRcdrMLkBjI0f9PEQvCUL4Fqwbs3Yli9Rr6vdGqI+MD/blEJ7WkVW4WjE
	Shid/lYmeObIREK5LhgpaNtZh8DD39oqzoij4lrPJttEIpAdPl+0hDORX5uoHof3j8a6tNSNqEnzB
	1Dz8Pzqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMDmP-000000058Ls-3ee7;
	Fri, 13 Dec 2024 22:05:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMDkv-000000058Bl-0rKb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 22:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eAJ5fUjEEvUD9VbWS1/Qwk4AOyP6PIZbu8dIgzfahvY=; b=o8LES4esZv5ix34Gc9JkGkRBTO
	8jI9+EB6WnLt/SWorb5xz0+RR+w4GtBHikIa1l2xzyFOy/+DqD3IiiUsDn18/JmaOuNc1UqxmkS4G
	+wtVybgpSzeROJwq1f272TjTknbbYXdq0TiI7LX+1XeEeYlsePbam5iUH4WdIwXgLHUc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tMDkd-000OJn-GH; Fri, 13 Dec 2024 23:03:11 +0100
Date: Fri, 13 Dec 2024 23:03:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	NINAD PALSULE <ninadpalsule@us.ibm.com>
Subject: Re: [PATCH v1 3/8] ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <4a8788c1-8424-40f6-a9da-bf135acad29b@lunn.ch>
References: <20241213145037.3784931-1-ninad@linux.ibm.com>
 <20241213145037.3784931-4-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213145037.3784931-4-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_140329_323221_41F80144 
X-CRM114-Status: UNSURE (   6.76  )
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

> +&mac0 {
> +	status = "okay";
> +
> +	phy-mode = "rgmii-rxid";

Why is everybody getting RGMII wrong this week?

Do you have an extra long clock line on the PCB for the TX clock?

> +	phy-handle = <&ethphy0>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};
> +
>  &mac2 {
>  	status = "okay";
> +
> +	phy-mode = "rgmii";

Do you have extra long clock lines on the PCB for both Rx and Tx
clock?

I suspect you don't and the RGMII delays are messed up somehow.

	Andrew

