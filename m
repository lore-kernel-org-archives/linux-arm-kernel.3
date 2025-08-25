Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6825CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 04:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKwnAQ4D1V1AfW/HNQ+jL2TtT+0KjP2VdZBXoNPgdnY=; b=roaI53C2eQD5JQv5QlbdO9F/5q
	GrlUjilLVHtUYH8rnBpwFqp8NG5VCV/+BNOUOk7jmVUf1DrX5oAyY8UMhIad/PiWTMg1VS6Uq60gS
	PiDIvGf0YgRhq1NSEqS/7UMF3fy/sHvpze78+k6gfvk85o/wu0QGmUxNftbe8V0q9rdaCzh2IU6xZ
	zajk8QcXqB8A+uN7IEmTNnoh65JXQiiHpgpY0XmaUH1Dl20pcFk7wrRHVOrjvPuLWvb9FBtVlr8qC
	WY7BhtNZ/RKuNo+SPFp2AOtOq5xs4TGD25y3rpBPnQhOpTrwQrhLRSGUaoQu88NAYE0oYpZZZAm6k
	wnjn7PrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqP0U-00000006tyG-0NBx;
	Mon, 25 Aug 2025 04:40:34 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOwb-00000006t6b-3RPn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 04:36:35 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 25 Aug 2025 13:36:29 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 5C1832091489;
	Mon, 25 Aug 2025 13:36:29 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Mon, 25 Aug 2025 13:36:29 +0900
Received: from [10.213.136.107] (unknown [10.213.136.107])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id EF23410A016;
	Mon, 25 Aug 2025 13:36:28 +0900 (JST)
Message-ID: <cb453b09-4aa0-45f4-8cf6-abcf5c625007@socionext.com>
Date: Mon, 25 Aug 2025 13:36:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: socionext: uniphier-ld20: Add default PCI
 interrup controller address cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250822133318.312232-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250822133318.312232-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_213633_973876_D3DD1320 
X-CRM114-Status: GOOD (  13.27  )
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

Hi Krzysztof,

On 2025/08/22 22:33, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to the PCI interrupt node to silence W=1
> warning:
> 
>    uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map):
> /soc@0/pcie@66000000:interrupt-map:
>      Missing property '#address-cells' in node
> /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>     the fourth component "parent unit address", which size is defined by
>     '#address-cells' of the node pointed to by the interrupt-parent
>     component, is not used (=0)

I understand that "parent unit address" is omitted, and according to
the devicetree specification, "#address-cells" define the the size of
the address. However, GIC doesn't specify the address, so this line
is needed to indicate it.

For both patches,
Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

There is no tree to manage the SoC-specified commits, so please apply
this series into the DT tree.

Thank you,

---
Best Regards
Kunihiko Hayashi

