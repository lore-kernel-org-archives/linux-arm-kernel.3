Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BDFD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 19:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMAIfByDrljUcTHtSb0mvVkbtrVaLMiwYuVN4a+LvD8=; b=ycQBSCLZJRpugdUVC3siaCgvy0
	WMbvSdRfnT7FXFoh3jiRulZ1vrOUzDFU3cLrMNVD3PXkNYJpPotp5gB9YC7rZY4EPdR9GsOEv0zbu
	Jumes18kJDjYY+wJ3uhIpgRvXJVFM5ZDJ9MdLKmLBeI40f+nDnbtzMq/nfY03YxzNOvlcyNy3EZLm
	EdFoa6o+wq/n6SfR58BAGCjGEAoR+BnCkpKqi0FcufWgpQlUSsyGCzwzwMihoc9lpnDzIeO6t37YD
	SQyLpeRJXj71myT8Wz3xAp0TpzFtrgvU3+WiV49FqBWyvX0uc9xSfZG1vQ25Ht/QsuI1dk3CYli8g
	mtkSbM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvw3-00000000mAL-1S2s;
	Thu, 08 Jan 2026 19:44:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvw0-00000000m9f-1NLb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 19:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 939A443821;
	Thu,  8 Jan 2026 19:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC89C116C6;
	Thu,  8 Jan 2026 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767901479;
	bh=8RfRMlVDFkZfgKpt/lJTExflB5KKf8XGW+QQIfsHwe8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mM1BLJpogphrrcqUpZj74hD9Ac7HxV5e9VZs/CrMHciucDJVodVi25SN3HBOXmKKn
	 VYAI1lJd5qRf5TioPPfl8e/bL1kK/IDbBWE1utghMWT48dN4dwF7c9eieKkxBVxWfr
	 jIahpi5kVAcJJ6gfHgB5sXVXXvqHyNr89SBigaPx0x54WWTZSgdgQwidbT1EHR5zym
	 dA9fVqO2W0fRgetwgPJnVRlpU/vtsbynDhzfSyfOCnSsSrbyrDO1zr186rNc2VDuWv
	 imguLkVpMDIUhyT0Kr67Q+SIuH47rsmfEUC+eog35yBG6TJESR+j/qZrbdre6XS9hG
	 P+pVPxyG+DJRg==
Message-ID: <8a8c8a31-ebe8-48cb-9836-c69c6d65a545@kernel.org>
Date: Thu, 8 Jan 2026 20:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
 <7708243d6cca21004de8b3da87369c06dbee3848.1767804922.git.chleroy@kernel.org>
 <20260108190203.GA780464-robh@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260108190203.GA780464-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_114440_764364_92A4D50C 
X-CRM114-Status: GOOD (  17.36  )
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



Le 08/01/2026 à 20:02, Rob Herring a écrit :
> On Wed, Jan 07, 2026 at 05:59:10PM +0100, Christophe Leroy (CS GROUP) wrote:
>> The QUICC Engine provides interrupts for a few I/O ports. This is
>> handled via a separate interrupt ID and managed via a triplet of
>> dedicated registers hosted by the SoC.
>>
>> Implement an interrupt driver for it so that those IRQs can then
>> be linked to the related GPIOs.
>>
>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Already? On a v1?

This is extracted from a previous series, here: 
https://lore.kernel.org/all/67987bbf42344398709949cb53e3e8415260ec09.1758212309.git.christophe.leroy@csgroup.eu/

Should I have called it v7 even if it is only a small part of the 
initial series ?

Ack is here: 
https://lore.kernel.org/all/20250818-babbling-studio-81a974afc169@spud/

> 
>> ---
>>   .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>> new file mode 100644
>> index 0000000000000..1f3c652b1569d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fsoc%2Ffsl%2Fcpm_qe%2Ffsl%2Cqe-ports-ic.yaml%23&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6e4c1b33836d4443b5c608de4ee86aff%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639034957294961534%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=mH5SPbAw48C6BGcazDPJMtoiM71TXswUGBvSZf15dUQ%3D&reserved=0
>> +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6e4c1b33836d4443b5c608de4ee86aff%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639034957294990994%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=RhD807Jcx3MerOAXGWuwgwHkATpTzTkDIQC7lO3t1AA%3D&reserved=0
>> +
>> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
>> +
>> +maintainers:
>> +  - Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - fsl,mpc8323-qe-ports-ic
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  '#address-cells':
>> +    const: 0
>> +
>> +  '#interrupt-cells':
>> +    const: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupt-controller
>> +  - '#address-cells'
>> +  - '#interrupt-cells'
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    interrupt-controller@c00 {
>> +      compatible = "fsl,mpc8323-qe-ports-ic";
>> +      reg = <0xc00 0x18>;
>> +      interrupt-controller;
>> +      #address-cells = <0>;
>> +      #interrupt-cells = <1>;
>> +      interrupts = <74 0x8>;
>> +      interrupt-parent = <&ipic>;
> 
> This doesn't look like a separate block, but just part of its parent. So
> just add interrupt-controller/#interrupt-cells to the parent.

I don't understand what you mean, can you explain with the extract below ?

Extract from device tree including the parent:

	soc8321@b0000000 {
		#address-cells = <1>;
		#size-cells = <1>;
		device_type = "soc";
		compatible = "simple-bus";
		ranges = <0x0 0xb0000000 0x00100000>;
		reg = <0xb0000000 0x00000200>;
		bus-frequency = <0>;

		ipic:pic@700 {
			interrupt-controller;
			#address-cells = <0>;
			#interrupt-cells = <2>;
			reg = <0x700 0x100>;
			device_type = "ipic";
		};

		qepic:interrupt-controller@c00 {
			compatible = "fsl,mpc8323-qe-ports-ic";
			reg = <0xc00 0x18>;
			interrupt-controller;
			#address-cells = <0>;
			#interrupt-cells = <1>;
			interrupts = <74 0x8>;
			interrupt-parent = <&ipic>;
		};
	};


Thanks
Christophe

