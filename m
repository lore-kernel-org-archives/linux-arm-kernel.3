Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55738C54FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XplPRsqT1dOGxtNL8oz8dbA1AjGmMA3dulHIVCm7n8Y=; b=F4jsD8/YsA21WB5LdFIy456e+C
	dkmtElgJv+nffYNFwsnzo7jEWGnEVBIOUxT5NqE31JscNZEACozm3cR2JJwLu3xNOxV5S8Vyool1r
	hICFDwjR2Akni+tmb3t2in2BzJva8LGn+GZebDzJIwIz0TVke47uqaZGS5YsE3qCJkEVBObabgRP0
	SJqR2IN3zjjxAZ77ViHb/0tPjGzwgRsEfLNOaSPZ0LLI6kkkvCngqX4wtN7Y9p4hxbihIcA/4v2wt
	Zkik5SEt1nFsn04+hM1kTzJMXICXOB/Jd5AEiHaSNaFBgNC7otcndfnMEEuQtTTImck2FKv9R9dRL
	hPhqf9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtKxn-0000000DLqi-1IGB;
	Fri, 20 Feb 2026 07:30:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtKxl-0000000DLqZ-3Ol6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 07:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85C4160054;
	Fri, 20 Feb 2026 07:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95481C116C6;
	Fri, 20 Feb 2026 07:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771572607;
	bh=uJQW5gF+fFaKWb6wAwk2P/MP6Gl+g/OYOJPjpiQ1z4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdX0A3DEBkR/3rc3bvrv7yAe83c63INWm3ULhlVJ4yZrzDYrBWSHyHsA62kbObtjA
	 7tNHgMr7Cy8AemCROQjmJGtOjr+cOHOgtBZlmyIJLuS80J+iakM8kLOV22ADi/ANUW
	 A6VtCNUYimym4VPMSaLyevIltpcINCSE9zswF86kXmJyNzIf7GCJr5P+b1K6Txhr0i
	 AxsQeUwIodkeWx2aJzcaOp0WojVbgQgrwh65BVS+9goJBPBuMVLIytomi2wCCJUVOi
	 8EDA8uzGv/gzYb2j0iT30CjzlLlVthO0dhlhbcYphxcv8RWPTY8MUOEh4KEiPUQlUk
	 AD+JF8w7nxTBg==
Date: Fri, 20 Feb 2026 08:30:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Message-ID: <20260220-agate-okapi-of-recreation-3cb930@quoll>
References: <20260219215702.63321-1-kamal.dasu@broadcom.com>
 <20260219215702.63321-2-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219215702.63321-2-kamal.dasu@broadcom.com>
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

On Thu, Feb 19, 2026 at 04:57:00PM -0500, Kamal Dasu wrote:
> The Broadcom settop SoCs have hardware semaphores as part of the
> "sundry" IP block which has other controls that do not belong anywhere
> else e.g. pin/mux controls, SoC identification, drive strength, reset
> controls, and other misc bits are part of this block.
> 
> Adding brcmstb hwspinlock bindings which allows hwlock driver
> to iomap 16 hardware semaphore registers that are part of all
> settop SoCs. The bindings use the common
> "brcm,brcmstb-sun-top-ctrl-semaphore" compatible string reflecting the
> actual hardware register block name.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> new file mode 100644
> index 000000000000..0a9a1bf19fe2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

Incorrect filename. It must match compatible.

> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom Settop Sundry Block Hardware Semaphore
> +
> +description:
> +  Broadcom settop SoCs contain 16 hardware semaphore registers
> +  (SEMAPHORE_0 through SEMAPHORE_15) that provide hardware-arbitrated
> +  mutual exclusion between drivers running on the SoC.
> +
> +  The semaphore registers belong to the sundry hardware block. The
> +  node describes the semaphore register range carved out of the larger
> +  sundry block address space.
> +
> +maintainers:
> +  - Kamal Dasu <kamal.dasu@broadcom.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,brcmstb-sun-top-ctrl-semaphore

That's still not SoC specific.

Best regards,
Krzysztof


