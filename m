Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CB4EB7EB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xn/i0N8EgAKuwuM15FDiV4PZjdt7rsAySJLonN4COK8=; b=No2P77z+vgNVdNaozYlr/gizlo
	F6iPfjqqpoCDwdnBSzfBObopYbDwTdVCF9mndsdux59AZUI8rpOeTGnVwVK7PUrAJ+hfbssL4F8Ip
	FrlfM7PKEkVqj/Q7Twt80/+5kyt+sJwY3+0dmyw83MEiqtj2c02RdM9wfXhKonTXFgkEV71UWGpAn
	WW1S0Yc5i0cZbYPy6X2XT1Am01D3wv+DzjkS6UtUlScMmR9NWspDr5Ei4vyyWtmzFHQKDx/znUWsW
	NGTGRZ3xOdxor0oZIIbruFEVAjBbH8n3eOoRYf/rwQyo7fey6d525mCVi+37JG5uRCtCC429+9k6D
	LiFqQc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiXP-0000000Gs1M-3dmL;
	Wed, 04 Mar 2026 09:29:03 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiXN-0000000Gs0t-0Ham;
	Wed, 04 Mar 2026 09:29:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F58322A039;
	Wed,  4 Mar 2026 10:28:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772616537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xn/i0N8EgAKuwuM15FDiV4PZjdt7rsAySJLonN4COK8=;
	b=ncHzYAwCogixHNVPZGRZuZBlCM11hw7NxKf1wlD/bw1xMbPi831jWfcgUfJU1SGpwp0cuN
	Rx2yqoJ/z4sL4VfWI0kLPehzjMcSF8eyL5zN2dHW7EJs38wYdXg7tYbpKLoccnxYqVBrO3
	rXGLP9iEhH2S+4/L2Q9mtYc8JR6Kj2LgowV0a0KvCrQ0sGg5HuYtoBhLpnzCb5PR0Zy+1C
	OCqlAhCLilI7JHL3nlXFdGJZsZruj//g7V1c9fs+C4s8N7lIRnhtTNAiQCNgu8RFvY38zP
	BtHLrE155jwkaELLPVa+tjzFSXjFq9YJJ+z2qaKnJvb8zr2xNEx4Kt/bixTrqw==
Message-ID: <63cd305f-e76f-4ed3-bb4d-d6b1dec8c92e@cjdns.fr>
Date: Wed, 4 Mar 2026 10:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 3/8] dt-bindings: phy: Document PCIe PHY in EcoNet
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
References: <20260303190948.694783-1-cjd@cjdns.fr>
 <20260303190948.694783-4-cjd@cjdns.fr>
 <20260304-proficient-coati-of-lightning-df2cab@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260304-proficient-coati-of-lightning-df2cab@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_012901_485867_CA61A50D 
X-CRM114-Status: GOOD (  24.01  )
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


On 04/03/2026 09:44, Krzysztof Kozlowski wrote:
> On Tue, Mar 03, 2026 at 07:09:43PM +0000, Caleb James DeLisle wrote:
>> EN751221 and EN7528 SoCs have two PCIe slots, and each one has a
>> PHY which behaves slightly differently because one slot is Gen1/Gen2
>> while the other is Gen1 only.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   .../phy/econet,en751221-pcie-phy.yaml         | 57 +++++++++++++++++++
> Why are you mixing multiple subsystems in the same patchset? That's
> like three or four different ones. Don't, just make it difficult to
> apply pieces and understand the dependencies.


Please pardon my ignorance, I was under the impression that a patch 
should be specific to a subsystem but a patchset should accomplish a 
goal and avoid introducing unused code. In this case the goal is PCIe 
support. If you prefer it, I can resend as a PHY patchset and a CLK 
patchset, and then after those are merged, send the PCIe patchset to use 
them.


>
>>   MAINTAINERS                                   |  6 ++
>>   2 files changed, 63 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
>> new file mode 100644
>> index 000000000000..8e1d3c791c6e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/econet,en751221-pcie-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: EcoNet PCI-Express PHY for EcoNet EN751221 and EN7528
>> +
>> +maintainers:
>> +  - Caleb James DeLisle <cjd@cjdns.fr>
>> +
>> +description:
>> +  The PCIe PHY supports physical layer functionality for PCIe Gen1 and
>> +  Gen1/Gen2 ports. On these SoCs, port 0 is a Gen1-only port while
>> +  port 1 is Gen1/Gen2 capable.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - econet,en751221-pcie-phy0
>> +      - econet,en751221-pcie-phy1
> What is the difference between phy0 and phy1? This must be explicitly
> explained in the description.
>
> If phy1 means "port 1" (although first sentence disagrees, because it
> says that THE SAME phy supports two ports), then the names aren't -gen1
> and -gen2? Or what are other differences?


In practice, port0 is gen1 only and port1 is gen1/2. But I suppose it 
makes sense to specify them as gen1 and gen2, so that fact is documented 
in the DT.


>
>> +      - econet,en7528-pcie-phy0
>> +      - econet,en7528-pcie-phy1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#phy-cells'
> Use consisent quotes.

OK

>
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/phy/phy.h>
> Where do you use it here?
Whoops, I think I daydreamed that it was needed for "#phy-cells", will 
drop.
>
>> +    soc {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +
>> +      pcie_phy0: pcie-phy@1faf2000 {
> Drop unused label.
OK
>
>> +        compatible = "econet,en7528-pcie-phy0";
>> +        reg = <0x1faf2000 0x1000>;
>> +        #phy-cells = <0>;
>> +      };
>> +
>> +      pcie_phy1: pcie-phy@1fac0000 {
>> +        compatible = "econet,en7528-pcie-phy1";
> Drop node, same as previous one.

OK


Thanks for the review.

Caleb


>
> Best regards,
> Krzysztof
>

