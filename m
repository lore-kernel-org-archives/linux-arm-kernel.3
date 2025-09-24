Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DEFCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0hF39s+PNPVeOVqJoEiQX/x4ftXzQgSSeNBKI04lks=; b=oTXOWImJs/O5WZ02odorW22wmj
	Q5YHEDE+37L21AGCN52r0y6yEZ9kOG0oj9SVB8iPnyDM0ILNG+mPKvyQqZQId3T0rt4o/zzYiCCPs
	yiDBjU9jAXBpRTx0uxH1PZrJMy9tXcAk6dPtajR2OTKBd0jtHEVpb6TVxMkXW1w+69kdhMLmD7yZl
	6aaG8TanuA7Fwgyrn+2/e0iCxtuyC9PAZ4dLuAVHnmSNHTIIxawTl2Dr84KCCmqHCwhK+OmMeoRDz
	1+7++C/82J5HPxAWIwkOV5wJaF/LU2yEI89iBt9eBuZYqtAbqP/FKUccFuKeEVurkwKxaUjULdyE+
	8B8E3dtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1L3F-0000000Fuq2-0fpy;
	Wed, 24 Sep 2025 08:40:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1L3C-0000000FupN-2QYu;
	Wed, 24 Sep 2025 08:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758703232;
	bh=GBBy8OfUbS037/v/HVudu6cAjDC718OOGqsKe4ghfXA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=LpBW/jDlmidfKvgjk/Z26EZJxIP98EgnR+TEYeFA7JUWlAv9iriMFLrqgjsczXMM0
	 Ik56f0Zb1kcH4wtkAqogIsPerYyhy0Wmw9er2p3GivQm3kU7Ix9XfhAS7u/b7oX31p
	 14fES58bZCzydYZt7j4n8WfsvrwwpKzoClzAOO9hdiIfA8lReMzYlMD9uLVVR3YUpk
	 cjykWly8FciQeHL+jbVoheOAZBE49jJ5N7y/z4G+U4hBpAjn3ze+kMnlFAslKlspR1
	 brIg2AxEDJk3cVhvfARAzf5k2gAVQxqmXbis/pOssJBX2LfjC9r9RairVB6KqQuH3C
	 6202ZCZIo+h7Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E76C817E0237;
	Wed, 24 Sep 2025 10:40:31 +0200 (CEST)
Message-ID: <18af5a93-e5b1-45fa-b942-47c6c3cd5ddb@collabora.com>
Date: Wed, 24 Sep 2025 10:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 Airoha AN7583
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com
References: <20250923190711.23304-1-ansuelsmth@gmail.com>
 <5613a7f0-c624-46ca-9c65-1b48b4e3e3bd@collabora.com>
Content-Language: en-US
In-Reply-To: <5613a7f0-c624-46ca-9c65-1b48b4e3e3bd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_014034_789677_FAEA762F 
X-CRM114-Status: GOOD (  14.03  )
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

Il 24/09/25 10:36, AngeloGioacchino Del Regno ha scritto:
> Il 23/09/25 21:06, Christian Marangi ha scritto:
>> Introduce Airoha AN7583 SoC compatible in mediatek-gen3 PCIe controller
>> binding.
>>
>> This differ from the Airoha EN7581 SoC by the fact that only one Gen3
>> PCIe controller is present on the SoC.
>>
>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
>> ---
>> Changes v2:
>> - Fix alphabetical order
>>
>>   .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/ 
>> Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
>> index 0278845701ce..1ca9594a9739 100644
>> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
>> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
>> @@ -58,6 +58,7 @@ properties:
>>             - const: mediatek,mt8196-pcie
>>         - const: mediatek,mt8192-pcie
>>         - const: mediatek,mt8196-pcie
>> +      - const: airoha,an7583-pcie-gen3
> 
> In the previous review, I also asked you to change the compatible string to be
> consistent with the others.
> 
> airoha,an7583-pcie

I have just seen the other series where you add AN7583 to the GEN2 PCIe controller
driver; this means that this SoC has two controllers, one GEN2 and one GEN3.

The compatible string inconsistency is therefore acceptable.

Please, though - add this information in the commit message, saying that the new
string is inconsistent with the others and explain the reason.

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



