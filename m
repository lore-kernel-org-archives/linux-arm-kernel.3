Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877F3CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7haf6pMIluUViRaiSINM7pD1/1hWZ3HD3Qcce4LD6aE=; b=Qh1drC2U1U5+jIt1z+rJPVXGcf
	76GkDUG5IvqgQXUle3YKicd2Utd0KWjJbRE3YLEoBWYP2UEz8ODtEyhYWx6c5I3XLPiV2nj5jR1un
	4CfN0gWNQMxAcCQOeA1fHdVgJnQwf9N05kvc8VGzunfyfLJ+ugEvhW3ie1NBdvsMnnFBxMtUYGoWR
	qg/JjqyBMVtIfH+/H3MT5ziMYYfTjelEqQemy7dvTawWG5C2jKvXyBVBBfoX+0OzrPZSuZ4vPog3p
	TUmYafZO42UOLQcZUvgibSs03KEerWlnF2UEFnV8hILFLbaNNWNvylyOg2MTTwYeWky7g0WdxUkYI
	DywS8Cew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnzV-0000000D3N7-1mTs;
	Mon, 20 Oct 2025 11:23:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnzS-0000000D3MA-1Z2H;
	Mon, 20 Oct 2025 11:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760959427;
	bh=w6wBWLki2XIvs2oBWydKFD3OGmGR/riqqF+ZppMwnEk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=K3QH8yK4CEEZ/MSEEGQHJwb6X87Nc/goxw1hXt14U7wNfwqwIdy7XX3iZQzRE7DiY
	 BH0OxR6/vzSx29X+lGcqkvNblqc4+jJlBPNzPKafTI3MDq+JrmvH7facRLWOqC04OM
	 RvC/jJmVhrIQP9sNW0/R7TEm2GeWyzymO30QZWcE5tGcGflV+qbMI52t2PEX9KGSRG
	 uJDRdCqlmcRRzf58j0lQLSx+rnkcF+X91DSYmNYb3zfeUeODZHKi+5wsqwj1sRYmEL
	 l5L7yE7RXL1xlROPvyLkikA+W8dwkmr0KeCRw+QxGfyMSxYkouciCPHibtHkmJ00Ws
	 AfncBTEzkDMfw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8802A17E04DA;
	Mon, 20 Oct 2025 13:23:46 +0200 (CEST)
Message-ID: <98f8d06a-b470-42ca-880f-e0007abb28dc@collabora.com>
Date: Mon, 20 Oct 2025 13:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] PCI: mediatek: Add support for Airoha AN7583 SoC
To: Christian Marangi <ansuelsmth@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 upstream@airoha.com
References: <20251020111121.31779-1-ansuelsmth@gmail.com>
 <20251020111121.31779-6-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251020111121.31779-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_042350_577068_30286CCD 
X-CRM114-Status: GOOD (  10.08  )
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

Il 20/10/25 13:11, Christian Marangi ha scritto:
> Add support for the second PCIe Root Complex present on Airoha AN7583
> SoC.
> 
> This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
> also require workaround for the reset signals.
> 
> Introduce a new quirk to skip having to reset signals and also introduce
> some additional logic to configure the PBUS registers required for
> Airoha SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



