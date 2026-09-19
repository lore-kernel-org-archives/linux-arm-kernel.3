Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE451C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpl/mSTm+p04Puo8jE7IFv4cZMSLW9gDZpQr4h8v3CQ=; b=F8zXGwNsW7BlUqLSpZt3LZGg4j
	ZXM16Ykf1r5SNZl8QexX9eniYdGakFHnc+54cm+a6wHOFs4qRQfjE8gao8Jf4bL4NSE8aE+KbjQ/5
	AzBtqGvz6Ms81OpoZNaLmumhr/mlpmNjp6dRl/nWbRdmbCy51KjNQKElyT2qS5FEfXM8McTHsRfQ1
	QbNe/V/5t9eKP+QxSf3SnM5+narOrE9uWVQF6fknNZYwMn8BinlvXzkRWRcjsuE7bni65rDh2z1HK
	FKndrifLh6+wLY4S43KyYmZk5DKToZGTn9XrhqSALbxE2wmqdrCMttMnROAHmhLNCdzMRdJSI0b7f
	+kDRJ/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7x2q-0000000GRhZ-0xVP;
	Sat, 19 Sep 2026 15:32:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7x2n-0000000GRgt-0m75;
	Sat, 19 Sep 2026 15:32:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 238984E406D3;
	Sat, 19 Sep 2026 15:31:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 815D2606CA;
	Sat, 19 Sep 2026 15:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BF4410328325;
	Sat, 19 Sep 2026 17:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789831914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Fpl/mSTm+p04Puo8jE7IFv4cZMSLW9gDZpQr4h8v3CQ=;
	b=SZQR45nJhfHTdtdgkGAo8QT0jA3mhBNwoBPhRmiLJHvcu9zx7miKtDeAhpC4ybxTT3/zjN
	uZJ0CPnAif5itKeKuk/pOzqSFcq6r7qTrW5sk52cOUYojs5hYcGSZvBy4HO5xkwwNb0hCC
	/A0z9NYeU1OZ3zESRCrKPmGcwfSBgnSoIQqzIIEI4ljwYCN18tWJnBzHfsf3OIf9xIopfh
	hfZ3jJZ/FBXrwrMZefoCV+jF7QgMqKMwaFN2OkkEYjnfsPPepZOdYpat15I9D2rQNlyLH8
	mujB3qTseJ5IsDx4HkdQcC2sv213xZrSfkz9MZSL4M+UqI1UnUvHia+XmWnggQ==
Message-ID: <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
Date: Sat, 19 Sep 2026 17:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/12] net: pcs: add NXP SerDes XPCS shared core
To: jan.petrous@oss.nxp.com,
 Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ionut Vicovan <ionut.vicovan@nxp.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Coia Prant <coiaprant@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-4-9d68868c1e89@oss.nxp.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260919-s32g_serdes-v3-4-9d68868c1e89@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_083201_364532_0CAAE0C9 
X-CRM114-Status: GOOD (  13.16  )
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

Hi Jan,

On 9/19/26 08:54, Jan Petrous via B4 Relay wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> The SerDes subsystems found on NXP S32G and i.MX SoCs integrate a
> Synopsys DesignWare Ethernet XPCS and an Ethernet PHY (PMA) with an
> identical register layout. Only the register transport differs: indirect
> memory mapped access on S32G, Clause 45 MDIO on i.MX.
> 
> Add a transport agnostic phylink PCS core which operates on regmaps
> provided by the platform glue. It implements the phylink PCS operations,
> the Clause 37 SGMII / 2500BASE-X / USXGMII / 10GBASE-R configuration and
> link state handling, soft reset and polling helpers, and the common
> feature sets. The platform specific register sequences, compatibility
> tables and quirks are supplied through a per revision descriptor by the
> platform drivers selecting this core.
> 
> The register sequences and the feature lists are derived from the
> Synopsys pcs-xpcs driver, so its copyright is retained. A separate driver
> is needed because struct dw_xpcs is built around an mdio_device and owns
> the transport, the reset and the identification of a standalone PCS,
> while here the PMA can be shared with a PCIe controller, the bring-up is
> sequenced across both XPCS instances by the SerDes PHY driver, and the
> transport is not always MDIO.

Is there a way to avoid code duplication by wrapping the accesses into
a mii_bus ?

This is what the Rockchip submission does : 

https://lore.kernel.org/r/20260919125119.2107089-8-coiaprant@gmail.com

Maxime


