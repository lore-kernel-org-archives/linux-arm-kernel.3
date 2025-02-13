Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BCCC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzQPYU9YfHy6ub9VigT3rtdUgbT32pzX4StInrVw1E4=; b=AjLwzMGEkH7TiCKPFcnX44pGDu
	Pp0qGedPDRl2wl9C85dI4qIr9uME7mx04b1Dd89Nrl2BSgLLysaQTGi6+UiD+l2AscvZWBJnr2kMY
	jKxJ72zukXUHptJloG0Z8I6ZM50U4RbTugpkn3le4jmUwtv3jKuc4YezXqlvkoNkENwPZ4qjcLv1s
	IIvtcT+xDy+v2EdCYQrIzkbr4yBfTgaSOb072Y1TXdYaTevqguJg9MzZrm+snqcLzzmqoxVn4/te8
	pr2hpty40LCqkpDZ78lB3LnPqgKhBHiF4mbYYRvpD7S4h+Fis2I/SnDdl+Kl8yTQcMC8L1yMxMWrU
	mVAmDTLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigBY-0000000Cc1h-2uUI;
	Thu, 13 Feb 2025 20:51:48 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigA7-0000000Cbjp-2QiO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:50:20 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 83E82203F3E5;
	Thu, 13 Feb 2025 12:50:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 83E82203F3E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739479817;
	bh=XzQPYU9YfHy6ub9VigT3rtdUgbT32pzX4StInrVw1E4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=XeTAcxIrprlHTTTPMf8HhI8CE7pfNVAgM8QgQEmhFcRGXQvzr/nQBmciYK3jhEmJX
	 tydKjmyGSzh+NZdxKyYLSaHG4PGn5nB5buGjbO5npIVqSIGOlOpl5UP27xsVYpBKIQ
	 C2q46+OmyyevQ+L1KlcwRiLGpbRqE44dKts5w7gc=
Message-ID: <a10abb83-1bb2-4e62-b537-8b8948b055ea@linux.microsoft.com>
Date: Thu, 13 Feb 2025 12:50:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v4 4/6] dt-bindings: microsoft,vmbus: Add GIC
 and DMA coherence to the example
From: Roman Kisel <romank@linux.microsoft.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dave.hansen@linux.intel.com,
 decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
 krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com, lpieralisi@kernel.org,
 manivannan.sadhasivam@linaro.org, mingo@redhat.com, robh@kernel.org,
 ssengar@linux.microsoft.com, tglx@linutronix.de, wei.liu@kernel.org,
 will@kernel.org, devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-5-romank@linux.microsoft.com>
 <20250212-rough-terrier-of-serendipity-68a0db@krzk-bin>
 <bb863c8f-a92c-42d0-abc4-ff0b92f701c2@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <bb863c8f-a92c-42d0-abc4-ff0b92f701c2@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_125019_645609_4F62A2A8 
X-CRM114-Status: UNSURE (   6.91  )
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



On 2/12/2025 3:57 PM, Roman Kisel wrote:
> 

[...]

Thank you for your guidance!! The below passes tests and addresses the
feedback you have provided. If no further comments from you, I'll
send the file in this form in the next version of the patch series (also
fixing the commit title and description).


# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
%YAML 1.2
---
$id: http://devicetree.org/schemas/bus/microsoft,vmbus.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: Microsoft Hyper-V VMBus

maintainers:
   - Saurabh Sengar <ssengar@linux.microsoft.com>

description:
   VMBus is a software bus that implement the protocols for communication
   between the root or host OS and guest OSs (virtual machines).

properties:
   compatible:
     const: microsoft,vmbus

   ranges: true

   '#address-cells':
     const: 2

   '#size-cells':
     const: 1

required:
   - compatible
   - ranges
   - interrupts
   - '#address-cells'
   - '#size-cells'

additionalProperties: true

examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     soc {
         #address-cells = <2>;
         #size-cells = <1>;
         bus {
             compatible = "simple-bus";
             #address-cells = <2>;
             #size-cells = <1>;
             ranges;

             vmbus@ff0000000 {
                 compatible = "microsoft,vmbus";
                 #address-cells = <2>;
                 #size-cells = <1>;
                 ranges = <0x0f 0xf0000000 0x0f 0xf0000000 0x10000000>;
                 dma-coherent;
                 interrupt-parent = <&gic>;
                 interrupts = <GIC_PPI 2 IRQ_TYPE_EDGE_RISING>;
             };
         };
     };


>> Best regards,
>> Krzysztof
> 

-- 
Thank you,
Roman


