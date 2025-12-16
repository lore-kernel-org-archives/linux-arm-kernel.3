Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B1CD5B87E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 01:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGRqu4Zw0x5kNgByauSHb7Bx9cBGc/JIhCZpE33IJwc=; b=bZQuI4mE0vZg8A1DB17yL3QYA5
	V0KtyNX+1Z6gHEtRllpu6UKRJobX9KdXTs2KqcFD/zgMAlyheMee9vJQpmIY5MquGhCPPX8EDMGUv
	E2UpfYCIfga+HYC9YWluYK4AtirEy9wpeUa09vP+Q/9FtKnKygKAhZAP0fied4vmkV3yyuPzFFSyP
	KTgpghMlBXI0aQgZvfvGJ3ZuD9yr3mzTaGBz2lS8/BdhimALb8+FYkYYYVSllyvU2Vtb5w2Lt8VCl
	yQPuVPb8Q01ziQ9ZXKO8qddYwkHi+SpAuv7BhgCQg0vmlLsF/4T8GorpAHrmZ6K3S0AXDoCc6gsiD
	741P4aCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJkR-00000004UNZ-3D1t;
	Tue, 16 Dec 2025 01:21:07 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJkO-00000004UMZ-3U0a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 01:21:06 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Dec 2025 10:21:04 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 1C6372069FC4;
	Tue, 16 Dec 2025 10:21:04 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 16 Dec 2025 10:21:04 +0900
Received: from [10.212.247.110] (unknown [10.212.247.110])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 56FA910A00E;
	Tue, 16 Dec 2025 10:21:03 +0900 (JST)
Message-ID: <3f1b7852-1494-4a73-8783-b578f9ad5d40@socionext.com>
Date: Tue, 16 Dec 2025 10:21:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: PCI: socionext,uniphier-pcie: Fix interrupt
 controller node name
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251215212456.3317558-1-robh@kernel.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20251215212456.3317558-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_172104_992381_5D601DAE 
X-CRM114-Status: GOOD (  18.63  )
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

Hi Rob,

Thank you for pointing out.

On 2025/12/16 6:24, Rob Herring (Arm) wrote:
> The child node name in use by .dts files and the driver is
> "legacy-interrupt-controller", not "interrupt-controller".
After your change commit bcd7ec2cd720 were merged, it was a long time
before I realized I needed to fix it.

"interrupt-controller" is included in the list of Generic Names
Recommendation. Would it be better to apply (i.e. restore) this,
or fix the PCI driver and .dts?

> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../devicetree/bindings/pci/socionext,uniphier-pcie.yaml      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
> b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
> index c07b0ed51613..8a2f1eef51bd 100644
> --- a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
> @@ -51,7 +51,7 @@ properties:
>     phy-names:
>       const: pcie-phy
>   
> -  interrupt-controller:
> +  legacy-interrupt-controller:
>       type: object
>       additionalProperties: false
>   
> @@ -111,7 +111,7 @@ examples:
>                           <0 0 0  3  &pcie_intc 2>,
>                           <0 0 0  4  &pcie_intc 3>;
>   
> -        pcie_intc: interrupt-controller {
> +        pcie_intc: legacy-interrupt-controller {
>               #address-cells = <0>;
>               interrupt-controller;
>               #interrupt-cells = <1>;

Thank you,

---
Best Regards
Kunihiko Hayashi

