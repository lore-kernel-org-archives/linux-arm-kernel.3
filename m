Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1582AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 08:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UsyWPnL5ob5l6Ps7hTf/l+F5LVv80B2LILw031g/tE=; b=0OL8xrx8kieyJBUSd1HRZnv5r0
	ykQX37ypQv7Y3HqT88trwUPFQ6CtcsRW4dhDgrEDhKVNFzoYjlSuczY/oIi+51w9v7A6d10Bb3DwR
	+JbRRbyuM7JhaqpqctrSsdVJHs4OVUdrbMPKmVaTNcOxOn6deQyRfF5AgUJMd3dDzRUae0SJ2u6Ms
	/zXwID4n6RSkgKi84cFtWYCtoM3a767bNoPj7SLOUmVfzXsTRX43NYLGL1/52zfCz1gZcMbhnUGDR
	hJvvHxO9TpcxcqkWk6bWgI8tjUcKNV3Z8lMRaY7B8yQv4zM3iLqXkc+aq/xz7Jr7fZBBpBnSR7YqW
	noQFXCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHaZ-000000082OT-3lgs;
	Sun, 22 Dec 2024 08:45:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHZO-000000082Gp-2So3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 08:44:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE62D5C4717;
	Sun, 22 Dec 2024 08:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF7CC4CECD;
	Sun, 22 Dec 2024 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734857053;
	bh=FulWww1sbzJO3b867Nrkdh4wLx+LMHxeVucGOcRpMlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=occDcVq7Cz4JxWPiwSEBYMPGgqf+goJ/jE8rwNcja5D7WIFIeP7sep21RJf2L2H5Q
	 s1lr1lbKeQEgw0kYvc71nLn6thbNSgobV5FZt3DSPb4zOicfj5HCtQKsEF/hYvtWUV
	 0c27JHIKlg7xFlDrloZSqoE8dXoCH7CMjX2T8RlTXw/CTx5XLbVrhh7r7K1/OfBkaX
	 UggAk7LghIyA6H0rOenIIBTc48+NkZEHDaTTDEPZK3/jt+p4/fgJiHxnTrG2vuVE8T
	 tL5lC8JYYqpndGkINvcQ1IPsAe8Ek7uW8iMd0oCvdDMwuCBZ3UMfELz4Uz/UrYYOMJ
	 WBlBtnPNxGDqg==
Date: Sun, 22 Dec 2024 09:44:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v6 2/5] dt-bindings: mailbox: add google,gs101-mbox
Message-ID: <uo4zvw4sl6uxsj2ewvoue7l3obugivq5z74ukwnd4sj3ndtwhu@hxxque3r4nvb>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
 <20241220-acpm-v4-upstream-mbox-v6-2-a6942806e52a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-2-a6942806e52a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_004414_785935_038066B1 
X-CRM114-Status: GOOD (  17.82  )
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

On Fri, Dec 20, 2024 at 01:49:57PM +0000, Tudor Ambarus wrote:
> Add bindings for the Samsung Exynos Mailbox Controller.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/mailbox/google,gs101-mbox.yaml        | 70 ++++++++++++++++++++++
>  include/dt-bindings/mailbox/google,gs101.h         | 14 +++++

Drop the header, not used.

>  2 files changed, 84 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> new file mode 100644
> index 000000000000..a1fbc3b2b9de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2024 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/google,gs101-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos Mailbox Controller
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description: |

Drop |

> +  The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16 flag
> +  bits for hardware interrupt generation and a shared register for passing
> +  mailbox messages. When the controller is used by the ACPM protocol the shared
> +  register is ignored and the mailbox controller acts as a doorbell.
> +  The controller just raises the interrupt to the firmware after the
> +  ACPM protocol has written the message to SRAM.
> +
> +properties:
> +  compatible:
> +    const: google,gs101-mbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +
> +  interrupts:
> +    description: IRQ line for the RX mailbox.
> +    maxItems: 1
> +
> +  '#mbox-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - '#mbox-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  # Doorbell mode.

Drop comment, not applicable now, I think.

Best regards,
Krzysztof


