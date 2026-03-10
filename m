Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B520EEB104A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHawHue/HHoIMdOylZQNB/N2WuX1uZGGBcXmmXhdZ6Q=; b=Ei5qxgpTKCDD34jHL2aWm4AACg
	b2OXegYLQ5GwUrYMXDLGfhqwnfsiGALUXiH10vQE/ftLWUxBk8AqMk8eHTSPWj1eb1LZcaSL5NtLB
	0VmHeSPZbamQSCfQKmWfHSmO1A7SN4+kDr8aD7A1kgaq93D0IifNN82ULCGlw40PeUl8HM/MaW0wF
	j9ZVJv8X2PMkhFowzN3nsqXtKismVexcQ8QoNlVuTCe0S+BN1hJ2DWKlnrnKxqiECbS8Ku8qEPkFc
	zXAEjMuFPeucSlXs2YbfMlIZ8Ze8h79VKM7NPbMdLX6sTVp3DwgEBUU6NLgEHZb9Uu4ZYwCm2qflK
	AcQE3ipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuT3-00000009DLH-2AYw;
	Tue, 10 Mar 2026 10:37:37 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuT0-00000009DKp-3A4g;
	Tue, 10 Mar 2026 10:37:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1E2D28EE37;
	Tue, 10 Mar 2026 11:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773139050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jHawHue/HHoIMdOylZQNB/N2WuX1uZGGBcXmmXhdZ6Q=;
	b=Ad7zddx8oLtstjGz5KASb6EIQGTzoZs9lk+j6pG7a0EA2N4rQpTuEP/dPCcVzlag/LRZmu
	A81x245jxiYDnd5BMETB4uihbQnNA7byLOz7LruvohZlV/sNgt1BnsyR0wJiCRLK48B63M
	gagBE0XLsr4ZbDD8AF0PvSXE/QSv+xEMMV608qhIzaFzoVIdQolWDUmN1+9NtEPf8O1Pyx
	xZcZf+m3VNtkOThDFb2EuxSNqPbznlw1h2JWdyN8vSP1NdYYgIBXce9F97j7LVneL1fTfv
	Ba5bkpXm9uRLbjKmPKvQXQpF91TvVk8rjDBQJBgYsVxamlUen4GS0++ZGkdZEA==
Message-ID: <1611d3d5-8c3b-4298-bf50-55ab2c2db0e7@cjdns.fr>
Date: Tue, 10 Mar 2026 11:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: Document PCIe PHY in EcoNet
 EN751221 and EN7528
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, bhelgaas@google.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, nbd@nbd.name, ansuelsmth@gmail.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-4-cjd@cjdns.fr>
 <20260310-scrupulous-fat-ara-eab47c@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260310-scrupulous-fat-ara-eab47c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_033735_010430_710C64C2 
X-CRM114-Status: GOOD (  12.68  )
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


On 10/03/2026 09:24, Krzysztof Kozlowski wrote:
> On Mon, Mar 09, 2026 at 01:18:13PM +0000, Caleb James DeLisle wrote:
>> EN751221 and EN7528 SoCs have two PCIe slots, and each one has a PHY
>> which behaves slightly differently because one slot is Gen1/Gen2 while
>> the other is Gen1 only.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Still, four separate subsystems unnecessarily merged into one patchset.
> Split independent parts of your work per subsystem. See also submitting
> patches.


I asked for clarification last time and didn't get a reply. I'm not 
against changing it but need to understand exactly what's expected b/c 
the way I'm imagining it seems way worse. submitting-patches.rst only 
says of patch sets "only post say 15 or so at a time", obviously not the 
case here.

If you're asking for one patchset for phy, one for clock, one for PCI, 
and then one to introduce them to the device, I can do that. I just want 
to be sure because introducing unused code, and patch sets that depend 
on other patch sets both seem like anti-patterns to me.


Thanks,

Caleb


>> ---
>>   .../phy/econet,en751221-pcie-phy.yaml         | 50 +++++++++++++++++++
>>   MAINTAINERS                                   |  6 +++
>>   2 files changed, 56 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
>

