Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF8DCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t//bbBNUhyP65PWrZQ0g45yV9ZKC744g1ycgqE51bxY=; b=yp7kl3hKkMRZHqW6xVVtyxQ3Qz
	38tI8sqkpqXesDq1RF+1pQ2J4qDvE3hqlb7ZCERRqS30l8rvYJo164jwpwKig4NUJzrl5cIONmFHn
	Jt7WrqEE2eqODVls3XiKpdLhK4Bad5JS6HquCoygb2+WuChphBsEdtkulURmU3wwqDYvVv2l9luxR
	tB6WdzXVSrdFuSrffkYWwEOd+P6jaXQ5WNHXmdydiJHwG9P5qMBeUPZs8NOIbaX2NIzKt9lFDOsuC
	EnHa2nkavEQuP5Zx5Ej6tRdhiSAzoDsgTttJDkorr9W6cxTr/vEDm86aT3IAh06Hl12c49Yrz+xIu
	nrv4L1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnTc-00000006aEt-04R1;
	Wed, 03 Sep 2025 13:24:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmXG-00000006NVG-0hRV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=t//bbBNUhyP65PWrZQ0g45yV9ZKC744g1ycgqE51bxY=; b=eNGAaE32uD/yOcNkA2MH0sZQKM
	QdlR5ObodgGOWF42Wempybp9Bh5NvzclfnZcrCQEA0gdwAX/EQcfShJQXkOs5yObVgyd+l8JVRK69
	Z0G4jeRv29z2gi4+fIc+1J2UA+HK7B3Vgb1B00v6gvjxLE5K9WxTae0Ko5Dh2LlZaeT0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1utmXB-0070qQ-Kb; Wed, 03 Sep 2025 14:24:17 +0200
Date: Wed, 3 Sep 2025 14:24:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: st: enable ethernet1 controller on
 stm32mp257f-ev1
Message-ID: <faa673a3-d68c-4b7f-a2b6-1f5bf40aabfb@lunn.ch>
References: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
 <20250903-mp2_ethernet-v1-3-4105b0ad2344@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-mp2_ethernet-v1-3-4105b0ad2344@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_052422_204399_4B1550D1 
X-CRM114-Status: UNSURE (   6.53  )
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

> +		phy1_eth1: ethernet-phy@4 {
> +			compatible = "ethernet-phy-id001c.c916";
> +			reset-gpios =  <&gpioj 9 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +			reg = <4>;

The DT coding style would suggest reg comes after compatible.

	Andrew

