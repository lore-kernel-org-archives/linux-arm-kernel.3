Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6385FECD984
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcTjrwZnRUs6I9pb05yvCe0/2ynz4xeAqxjhsg9PbTA=; b=jt2JihU3ahzAQRjtrVkOGDk/Rp
	6UB/3a5h3lj46TwqIDZZqsOfJ6wA6WSkeraW6X9y3KY2/82jSZXW2HkDQcZP2s0q+KfTWVzi2Gm3c
	vd+T3LB3VivIVcDxv+nxEgsaMKer3xBltNoXFXLAYQPnVurBVCDEhZaaxGPk5SLlYik0H7dIvF0JN
	KlHhpeYe9K28bEHpoS+oxZvncE3h3S9thCHAtlyB/SOJ9bwm5o3PE92vr9+8P8YF4xYdMydBhBHtS
	RsIxwS+LuF6p01YXCuDSm8Ncfef3pFOvV+OEzDVFVkiiiSup+d2WZn9VpoG25e35MtbGszfwN6SgZ
	CgmxIa/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1Zy-0000000AAE2-3rGj;
	Thu, 05 Feb 2026 15:47:38 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1Zt-0000000AAC7-0jOj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 15:47:37 +0000
Message-ID: <89516358-7b13-43ad-b303-1731f61d72e7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770306446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lcTjrwZnRUs6I9pb05yvCe0/2ynz4xeAqxjhsg9PbTA=;
	b=UTOeXiptGYn1ElFY5mxb7dWkCFuSyO2HKHmDBQKd7HpV4fhN5sVrCBUDUEqz7PTZcEyETF
	tmA/rGRsphpF59I8fqd5xqe8VBy4i2VSmCDBEYNyOy0AurXOIYFlNcg/D7w0Xn5KnuGZe2
	r8zPdD9Nw/t/9p5tEJ1Oi834cE8kLWk=
Date: Thu, 5 Feb 2026 10:47:21 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] dt-bindings: pci: xilinx-nwl: Add resets
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vinod Koul <vkoul@kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 "Havalige, Thippeswamy" <thippeswamy.havalige@amd.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20260203002128.935842-1-sean.anderson@linux.dev>
 <20260203002128.935842-2-sean.anderson@linux.dev>
 <MN0PR12MB59537BC8B60D76CCE0B1391CB798A@MN0PR12MB5953.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <MN0PR12MB59537BC8B60D76CCE0B1391CB798A@MN0PR12MB5953.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_074733_448710_A0C77BEF 
X-CRM114-Status: GOOD (  11.53  )
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

On 2/4/26 03:32, Pandey, Radhey Shyam wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@linux.dev>
>> Sent: Tuesday, February 3, 2026 5:51 AM
>> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Vinod Koul
>> <vkoul@kernel.org>; linux-phy@lists.infradead.org
>> Cc: Krzysztof Wilczyński <kwilczynski@kernel.org>; Lorenzo Pieralisi
>> <lpieralisi@kernel.org>; Pandey, Radhey Shyam
>> <radhey.shyam.pandey@amd.com>; linux-kernel@vger.kernel.org; Simek, Michal
>> <michal.simek@amd.com>; linux-arm-kernel@lists.infradead.org; linux-
>> pci@vger.kernel.org; Neil Armstrong <neil.armstrong@linaro.org>; Rob Herring
>> <robh@kernel.org>; Havalige, Thippeswamy <thippeswamy.havalige@amd.com>;
>> Manivannan Sadhasivam <mani@kernel.org>; Bjorn Helgaas
>> <bhelgaas@google.com>; Sean Anderson <sean.anderson@linux.dev>; Conor
>> Dooley <conor+dt@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
>> devicetree@vger.kernel.org
>> Subject: [PATCH 1/8] dt-bindings: pci: xilinx-nwl: Add resets
>>
>> Add resets so we can hold the bridge in reset while we perform phy calibration.
> 
> Seems like this should a required property?

It's optional as it does not exist in previous versions of the
devicetree. In the past I have received pushback against making these
sort of properties required.

If the resets don't exist we just don't assert them and assume the
bootloader has deasserted them.

--Sean

> Rest looks fine to me.
> 
>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>>
>>  .../devicetree/bindings/pci/xlnx,nwl-pcie.yaml  | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
>> b/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
>> index 9de3c09efb6e..7efb3dd9955f 100644
>> --- a/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
>> +++ b/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
>> @@ -69,6 +69,18 @@ properties:
>>    power-domains:
>>      maxItems: 1
>>
>> +  resets:
>> +    maxItems: 3
>> +
>> +  reset-names:
>> +    items:
>> +      - description: APB register block reset
>> +        const: cfg
>> +      - description: AXI-PCIe bridge reset
>> +        const: bridge
>> +      - description: PCIe MAC reset
>> +        const: ctrl
>> +
>>    iommus:
>>      maxItems: 1
>>
>> @@ -117,6 +129,7 @@ examples:
>>      #include <dt-bindings/interrupt-controller/irq.h>
>>      #include <dt-bindings/phy/phy.h>
>>      #include <dt-bindings/power/xlnx-zynqmp-power.h>
>> +    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
>>      soc {
>>          #address-cells = <2>;
>>          #size-cells = <2>;
>> @@ -146,6 +159,10 @@ examples:
>>              msi-parent = <&nwl_pcie>;
>>              phys = <&psgtr 0 PHY_TYPE_PCIE 0 0>;
>>              power-domains = <&zynqmp_firmware PD_PCIE>;
>> +            resets = <&zynqmp_reset ZYNQMP_RESET_PCIE_CFG>,
>> +                     <&zynqmp_reset ZYNQMP_RESET_PCIE_BRIDGE>,
>> +                     <&zynqmp_reset ZYNQMP_RESET_PCIE_CTRL>;
>> +            reset-names = "cfg", "bridge", "ctrl";
>>              iommus = <&smmu 0x4d0>;
>>              pcie_intc: legacy-interrupt-controller {
>>                  interrupt-controller;
>> --
>> 2.35.1.1320.gc452695387.dirty
> 

