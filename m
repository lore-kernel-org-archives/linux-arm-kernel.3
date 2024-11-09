Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA55D5E379
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b7aaELHBeDEdpJDJ7Z7QVtKGMNqkbqGXwu903GOf+I=; b=u6ZaU8UmFx8ErAeG8qrkvxpW6X
	a89Fna9NIrGt9eR6n8Xe7mDXNNNc6NIA1z6XfN+DR8EfSMsZlsYynvPMS8waZ+tUpoC1LB8gHIl39
	/5fHAuNMaEe/dsqpx7pte10wt+MSzdUhiyhj2aVeaHTPqzKdoOubNP1dvQ65fVpada1p2CxjeFSFq
	CmAGV+tQSMMkwZVUhmOpHjhK5AYS6Ae77pCZKm9OjTuY88rvMESg/lIyWFaLAjpZJOSereOSCNfM5
	qEoSZ5UqFoAu6nry1XhcGjEVtSaUQ9j2HP57IIrgxTEC86budawo9PO6ltPuhcZScMiOBOMIUckiK
	EM37+kEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pJM-0000000DjNX-06Oj;
	Sat, 09 Nov 2024 17:31:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pHa-0000000DjEM-26Fg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 17:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3b7aaELHBeDEdpJDJ7Z7QVtKGMNqkbqGXwu903GOf+I=; b=b3XI5w2YXoS7VgzzcGnMP6gp9f
	wvq0Voo5dd4mmjryDLdv+oMWirO0t49Vuvg8q+iAx0omdNZvfSAHXDogzWaXE/5ZOn5uRVFhjDth9
	tkP1IiJCaRb5UA4mAsNS/iXAjsj8ROYmSraU75DovtndXeV7RFL4JKBVFQCqfKfTBsEs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t9pHM-00CinF-Q5; Sat, 09 Nov 2024 18:29:44 +0100
Date: Sat, 9 Nov 2024 18:29:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf conditional failed
Message-ID: <e534c723-6d65-433f-8ab5-1c0d424d7367@lunn.ch>
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109094623.37518-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_092958_562322_5842B679 
X-CRM114-Status: GOOD (  14.43  )
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

On Sat, Nov 09, 2024 at 10:46:19AM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> after converting the ahci-platform binding to yaml the following files
> reporting "'anyOf' conditional failed" on
> 
> sata@540000: sata-port@0
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> index 1e0ab35cc686..2b5e45d2c5a6 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> @@ -214,6 +214,7 @@ &cp0_sata0 {
>  
>  	sata-port@1 {
>  		phys = <&cp0_comphy3 1>;
> +		status = "okay";
>  	};
>  };

>  
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> index 7af949092b91..6bdc4f1e6939 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> @@ -433,11 +433,13 @@ &cp0_sata0 {
>  	/* 7 + 12 SATA connector (J24) */
>  	sata-port@0 {
>  		phys = <&cp0_comphy2 0>;
> +		status = "okay";
>  	};
>  
>  	/* M.2-2250 B-key (J39) */
>  	sata-port@1 {
>  		phys = <&cp0_comphy3 1>;
> +		status = "okay";
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> index 7e595ac80043..161beec0b6b0 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> @@ -347,10 +347,12 @@ CP11X_LABEL(sata0): sata@540000 {
>  
>  			sata-port@0 {
>  				reg = <0>;
> +				status = "disabled";
>  			};

I don't know the yaml too well, but it is not obvious how adding a few 
status = "disabled"; status = "okay"; fixes a "'anyOf' conditional failed".

Maybe you can expand the explanation a bit?

	Andrew

