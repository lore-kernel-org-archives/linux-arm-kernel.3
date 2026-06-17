Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61046CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51ctbLbHVsJZs66mKQaf/nxm/2hILs7lsh5HQTHfg+A=; b=rXmmPN1jV1uSC8Q2a3a1HQXAB0
	iCw4SiLlxi98HGKfCYEYrdw8RY8FMWB/WCTFBTcboTsc/E/uPRZYRJ3Z3LeFzib+qEhHEGOQ5MsOA
	GhzdcpRr0KaGbot1l8/pRMfO1eXpw3NQe4bW+zXLSgbOl9hCm+KE6jqTcQYAVIgjvt14zDgxkuiBp
	CXd3+z/0hL5IgnciRyv04PHQvfHhhQviC00bKTAYAGnxisKDMt0Rpa4CD2sACOGCP9vVdAiOCHQyQ
	Nc81rL0SUQkhEm78VQusAsV78U5lueEFQuJadrxYJ5tQMSBZsFDmXIDNUmHtwAdNg0nESSjOR3Q9S
	FDV2ZtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmtM-0000000GyPB-1Qkx;
	Wed, 17 Jun 2026 09:49:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmtG-0000000GyGe-3ORB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 09:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=51ctbLbHVsJZs66mKQaf/nxm/2hILs7lsh5HQTHfg+A=; b=JhvsVpN6ej2IBuFi+FcvUae3RP
	zJMn/wPTk55BILjvxpq/pWgh/RklBIZWU6pLfZ+Y3ns4Ra4TpC/QRfoXWVHYMwQlgfcl1WCbKwvL6
	U+VelxK06ddcOUHXFtm8pzgMnKoc0HBQDeX8lN3DfcsIqH3vdApWIcUEv0lQiVcBRDR0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wZmsy-0089wF-9C; Wed, 17 Jun 2026 11:48:40 +0200
Date: Wed, 17 Jun 2026 11:48:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable
 ethernet0
Message-ID: <621cd205-997f-49f0-bcc9-fa72ba1835a7@lunn.ch>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
 <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
 <ajF+xlipLuZtf4HL@oss.qualcomm.com>
 <4f3c6bee-3ccb-467e-a466-89fece0e6a7f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f3c6bee-3ccb-467e-a466-89fece0e6a7f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_024858_853408_65F34C81 
X-CRM114-Status: GOOD (  14.84  )
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

> >>> +	emac0_phy_en_hog: emac0-phy-en-hog {
> >>> +		gpio-hog;
> >>> +		gpios = <149 GPIO_ACTIVE_HIGH>;
> >>> +		output-high;
> >>> +		line-name = "emac0-phy-en";
> >>> +	};
> >>
> >> This looks like a hack - what does this pin actually do?
> >>
> > 
> > The power supply to both PHYs on Shikra is gated by a GPIO pin. I am
> > unsure whether they should be modelled as a fixed, enable-on-boot
> > regulator or just like this. They need to be powered on early so that
> > MDIO can detect them.
> 
> If it's a regulator, then it should be described as a regulator.

Agreed.

> There
> was some discussion regarding the power resources of PHYs over here:
> 
> https://lore.kernel.org/linux-arm-msm/SN7PR19MB67369F7DD02F702437C0F1919D1B2@SN7PR19MB6736.namprd19.prod.outlook.com/

MDIO detection is nice to have, but only works well on simple
boards. I would suggest hard coding the PHY ID in the compatible.

	Andrew

