Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC89C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIFdCVcsL4iQx7G5iUzW/N9jrVLeZnqO/8rPT1T8r64=; b=Ft+jMdjV5tofGmcTewEW7YH12T
	ym465oHgvHyMN1l/2UBYf3HYJ6K+ft0RpGGE8dkxnmFFVHk9p7HEPkvZDwISnwULH4M/0ciYJYiM/
	rSiK9LeXshxZ/Hrml0oaAg+ky/zXA9c7KhiYRXhKSZt2oczg2BAOgdq2q+NntKyM+wT7WMmLk4vy9
	LSbbX7ngU1ui2bmCrNLeZjztPpVsirJ0gtRCgSnATt1RC48rZtpQMoJFhDr4X3iJZGobzlLNpfsj7
	IpLSaL+bPv+OemS/OyuB9X1mGo+MWPaLCJlqqWObQ7iFeBM83cXAVFGmWmb38mZAPE3tQ77AM7Fof
	EUTOFq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprvL-00000008ijP-13Ah;
	Wed, 05 Mar 2025 16:48:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tprt8-00000008iPp-2Wlu;
	Wed, 05 Mar 2025 16:46:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2943A5C6AC9;
	Wed,  5 Mar 2025 16:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80768C4CED1;
	Wed,  5 Mar 2025 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741193189;
	bh=5R+bfCWSs0CHr+4SSHK1pIvtQQhw4GPWfj0W69fAkXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjjbyQHSEB3yA22fSpVSJRaEeGXTbXrmkP5/dCpYJnECMFDRectCzrJEh7nPQgMbJ
	 /QWKDpAXRo8VKVQvNvwhypmWNoyb5v8Z2WgolFKvD6ULWtEeSOIyrAYb79XorXJtGk
	 XiOMotXGo5WZO9WZzcA8S8c7D3gbgMFvV2ej1DJW1FF3KOCuld8iLldC1Wrch0M2Vf
	 kRnb2p4pNr3WYUqbmg/ZmWHmRsGmwUnZmEOiQy7YSAPTuJgemH4vXPXvjfdeB+Eijl
	 UcNJdISBztpd9R7sw8tuXb6GGIRlYIaOcxtQ/gKvFwn8xqzK/C+DxsvN8R9d4+ps/r
	 5Z9gQFbpix4gw==
Date: Wed, 5 Mar 2025 10:46:27 -0600
From: Rob Herring <robh@kernel.org>
To: Jjian Zhou <jjian.zhou@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jason-ch Chen <jason-ch.chen@mediatek.com>
Subject: Re: [PATCH RFC 3/3] dt-bindings: mailbox: mtk,vcp-mbox: add mtk
 vcp-mbox document
Message-ID: <20250305164627.GA2117924-robh@kernel.org>
References: <20250305082047.15746-1-jjian.zhou@mediatek.com>
 <20250305082047.15746-4-jjian.zhou@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305082047.15746-4-jjian.zhou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_084630_696506_E954D20B 
X-CRM114-Status: GOOD (  16.92  )
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

On Wed, Mar 05, 2025 at 04:20:40PM +0800, Jjian Zhou wrote:
> This patch adds document for mediatek vcp mbox.
> 
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
> ---
>  .../bindings/mailbox/mtk,vcp-mbox.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,vcp-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk,vcp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,vcp-mbox.yaml
> new file mode 100644
> index 000000000000..d5afe295af14
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mtk,vcp-mbox.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mtk,vcp-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Video Companion Processor (VCP) mailbox
> +
> +maintainers:
> +  - Jjian Zhou <Jjian.Zhou@mediatek.com>
> +
> +description: |

Don't need '|' if no formatting

> +  The MTK VCP mailbox enables the SoC to communicate with the VCP by passing
> +  messages through 64 32-bit wide registers. It has 32 interrupt vectors in
> +  either direction for signalling purposes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-vcp-mbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    vcp_mailbox0: mailbox@31b80000 {
> +        compatible = "mediatek,mt8196-vcp-mbox";
> +        reg = <0x31b80000 0x1000>;
> +        interrupts = <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #mbox-cells = <0>;
> +    };
> -- 
> 2.45.2
> 

