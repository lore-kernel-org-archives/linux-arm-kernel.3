Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED35EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7Ebb8GJEJb6NIM6gdjr5nFv9uJ03eowC6FC7H7+7yw=; b=FFZMe5rU89TYpXZXPH5XnWLk+B
	rc7VsA26ybPIdtsgk8v7PpyaDT3VgmMRRSRcCzDrMDWQe1N6I53mLvQjZr2Oc97afWPnpH/alM/jV
	ZPb5Rj65C8m6YcZKwKbOdCoDnX3SLidKThC0rTXUvX/lexPB298/S/ZZxEzcMFJCnx3hKWN9SlQUT
	ZwsUohJbeUAr+md2SDf+isA/ZD5m4MK3u9siURIhvVghqBzuSEi5Y6kRnc512bzO8QTTu3j+S4+IR
	Y7UZi35HyOOci5Eh0Ache3Ja4nMByONtmvoKzFS820Dvc7tjcg1S+aZLKeFOeCe6gZ+prsktfC3SI
	S/DGoIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOhD-00000004ltT-3JJV;
	Fri, 21 Feb 2025 08:47:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOfd-00000004laM-2c66
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 08:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5351F5C4BBB;
	Fri, 21 Feb 2025 08:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F1FC4CED6;
	Fri, 21 Feb 2025 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740127564;
	bh=XpEhHbp+h0bF2bdUl5GcpbzEs979Jm89KTGh2m+OmVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZKkPBZw8KFhau1TXSUdu2FfjiAWmTX/WjL6U65psI6YeWcdoi0qN4xBxzIik6GQ1
	 39G7GRTQe4qISeqG7wRRh6gZE83zSuALeevuvcT7gCwHq5cTbilu6frZfvIeMmRMtD
	 F7mmaUnStgMaPct7U9uqZeuk0/UQJQoYZMVv+VJ0u6c4MRw1MQQ+A8cXRSurVF2oGz
	 Iu0YwvOncRBopUa3kXL0inRTMghbeGXWxhVkABA9bNkwN+PVOyUzldRERcTwbC0RxW
	 7sbkb7BmvHXkJT+Dz37q/lO+wqfnJSNQv+18fl7qt2BKpyOhwhPv2wtN44OiXrrRXQ
	 xpaeKhRu2GqSA==
Date: Fri, 21 Feb 2025 09:46:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wilson Ding <dingwei@marvell.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, salee@marvell.com, gakula@marvell.com
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: Add Armada8K reset controller
Message-ID: <20250221-icy-flounder-of-potency-ee1a05@krzk-bin>
References: <20250220232527.882888-1-dingwei@marvell.com>
 <20250220232527.882888-2-dingwei@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220232527.882888-2-dingwei@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_004605_720937_DA2D2D42 
X-CRM114-Status: GOOD (  14.50  )
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

On Thu, Feb 20, 2025 at 03:25:24PM -0800, Wilson Ding wrote:
> Add device-tree binding documentation for the Armada8K reset driver.
> 
> Signed-off-by: Wilson Ding <dingwei@marvell.com>
> ---
>  .../reset/marvell,armada8k-reset.yaml         | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml b/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
> new file mode 100644
> index 000000000000..b9f7f3c24d3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2025 Wilson Ding <dingwei@marvell.com>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/marvell,armada8k-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Armada8K reset controller
> +
> +maintainers:
> +  - Wilson Ding <dingwei@marvell.com>
> +
> +description: The reset controller node must be a sub-node of the system
> +  controller node on Armada7K/8K or CN913x SoCs.
> +
> +properties:
> +  compatible:
> +    const: marvell,armada8k-reset
> +
> +  offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset in the register map for the gpio registers (in bytes)

That's neither correct nor needed. Your device knows ofsset based on the
compatible.

Best regards,
Krzysztof


