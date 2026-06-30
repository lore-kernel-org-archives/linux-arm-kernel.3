Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C7AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ip7IFQoe+FjDmN/C09LzOH0hgzEjluyXXN8qgQJUD6g=; b=GjeqGjTKfgcfKWdsdVHoRhyRq1
	qJrcYl2TvSQOEvfDB67nzIAJN3YGbct3Eio10HwJgREJLGx8FEa+mzIkAFkGiWLRKmz4fgiYyAnn6
	6aL5iYcfvCIJ9M9idxBAy5xTGmA8Tuni9XUrkqG53/Ra1vcrUWFxsibmpbr57erkgyeMu8D28AfU8
	wAs9enJ2LZPxdU9DD5clTeK1zjxIiszWRD70ue5N9onZlHX7ddaycK5eiZUSPnr3u+4w7QsF1aHLW
	JWmadeX+jHCEx0mwFWZsYSLpgPvYD662YZ4xzv9v/hdp6TqaF5tEyizEBLhaGoUJoT5ffizjs8OXq
	l/J/A3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weacB-0000000HOtI-49wy;
	Tue, 30 Jun 2026 15:43:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weac7-0000000HOsc-31qD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:43:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 75F371A0D74;
	Tue, 30 Jun 2026 15:43:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2CED36025A;
	Tue, 30 Jun 2026 15:43:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0673106F2116;
	Tue, 30 Jun 2026 17:42:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782834183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ip7IFQoe+FjDmN/C09LzOH0hgzEjluyXXN8qgQJUD6g=;
	b=NRf0kcaRF6+dzSqatZMU6jAZsF3CbnVzeWRZfIL/O2jDpkAxiL1B2Fw9066IRCYycAxOW0
	ZrtC9XkzokO8Vxs8QrE4k8Ve54K0KgcKQpNyn4mGle0cPqxEpC6PEDIkHDP6FSgS2zdQBB
	UQ6VlI6PrIFjOxyjT8relPexBhA6I1oIRVGYf0hsQNkXcJOuHjxLXlyIMHsDzHyaxHv9kc
	9Y/2mSq6EOz6chGC+v3YWSiZdd2iz6XXdUib/TLNCPbEiyALIdeeaeLD86oS12CXmTL1oe
	FtmAU4XjT7PoUBiOzWOqmaH2OHc/X9do/cf0PYy8szLNG1nTPy3A0D8YNxRDlA==
Message-ID: <e691298f-b3e5-4c1a-8270-a821c1f46a2b@bootlin.com>
Date: Tue, 30 Jun 2026 17:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: stmmac: dwmac-socfpga: Add mac-mode DT property
 support
To: "Nazle Asmade, Muhammad Nazim Amirul"
 <muhammad.nazim.amirul.nazle.asmade@altera.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260630133108.27244-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <4c285993-978c-4d9e-a8c5-c3b36baa6840@lunn.ch>
 <7c57bb08-b72d-44bf-be44-f1bcb2aa9a84@bootlin.com>
 <b6c52ac8-32dc-4a58-83ec-ef600b306448@altera.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <b6c52ac8-32dc-4a58-83ec-ef600b306448@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084307_904028_183464A7 
X-CRM114-Status: UNSURE (   5.64  )
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



On 6/30/26 17:13, Nazle Asmade, Muhammad Nazim Amirul wrote:

> Yes, Agilex5 has the same concept. The GMII-to-RGMII converter is a 
> Quartus soft IP instantiated in the FPGA fabric — equivalent to the 
> CycloneV EMAC splitter. The XGMAC outputs GMII signals to the FPGA 
> fabric, the soft IP converts them to RGMII, and the RGMII signals then 
> go through the FPGA HVIO pins to the external Marvell 88E1512 PHY.

Does this converter need any special config, and does it expose any
control registers ? or is it fully autonomous ?

If it's fully autonomous, can you detect its presence through some
capability registers or something like that ?


Maxime


