Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D04D75BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBCeFqCK1jSI1Ua+a0ZUWv77lGqxTB1zqiWJu/K/DFg=; b=pu+n3FNTvf7Pmi5TQWXooZYYQD
	e4veY7jz8xlIAcPoOi5WRyKbIX2AejKa+KMKAhjvqpBFZUmTDIQJmIlub13/i8KGtEDw0hUZPCREg
	7amZZ6+sDVhQEDM5m39AZMqQCWu71LeD/fiQNUnhLqz1RizRClAlZmsobF4u8yRMBoqhIcAcVsh6w
	Ya6IvjHE1sVg6Dvd2VqxUh/oe+3U5Cmfeveflo/R5McwmS4E0VTQ27IOnSJq/EPTynbkt2jZlK1gW
	FcI+CTUAZ5VDPUvxcogpKm9AoIkdOt85j5FnucaGekUAN/5SkBZXLrwsxJTvGlWodxFoz51gjUmNO
	sCD+XGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2eJ-0000000H6i4-0aVX;
	Thu, 21 Nov 2024 08:34:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2dM-0000000H6Wi-2Nop;
	Thu, 21 Nov 2024 08:33:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3CF55A40319;
	Thu, 21 Nov 2024 08:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEA7C4CECE;
	Thu, 21 Nov 2024 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732178031;
	bh=UVjC0lCppiZvBvU2+0HigKCKmBE9kV1WjWjDjVRBwE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ti0bBJevIFY8qI62pjuK02REqFvaKiofsgncbwXVs1ECJiUdZx+2FdldMx3yV2eJM
	 49Mw7OkthBNxaiCBN0XTKTYtbfC000cv6M7BnVVR5AcbAW3BG0VVMK0jZiCiokhkkz
	 G8BkGJdReMQYF7QjCBr1C7+Hb6lB/aJRoJGHyQxkW9YsanbS7tF+S08FGBh4Wn7Uzy
	 0jAYDuoU9IGt8FS96rGZfSf/dz8W5KFadxGskjscN8viNcD4JazBQmY0Ye/rhmNkM8
	 4M1gnyahkq/dJhizwMva/bbf35uK70qk7Qm0VNaqvqFrb3M/sMNm7ITUHWQbdRmiI5
	 pMFY3qBibpeDA==
Date: Thu, 21 Nov 2024 09:33:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: mediatek: Add mt8188 SMI
 reset control binding
Message-ID: <w4vy6wpjdnadpgmjn322wgwqch7udywjidfvmztexxkthiqzxo@uerntotbvr5c>
References: <20241120063305.8135-1-friday.yang@mediatek.com>
 <20241120063305.8135-2-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120063305.8135-2-friday.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_003352_735727_9FC7146F 
X-CRM114-Status: GOOD (  19.03  )
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

On Wed, Nov 20, 2024 at 02:32:55PM +0800, Friday Yang wrote:
> From: "Friday Yang" <friday.yang@mediatek.com>
> 
> To support SMI clamp and reset operation in genpd callback, add
> SMI LARB reset controller in the bindings. Add index in
> mt8188-resets.h to query the reset signal in the SMI reset
> control driver.
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>  .../bindings/reset/mediatek,smi-reset.yaml    | 53 +++++++++++++++++++
>  include/dt-bindings/reset/mt8188-resets.h     | 11 ++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml b/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
> new file mode 100644
> index 000000000000..77a6197a9846
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2024 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/mediatek,smi-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SMI Reset Controller
> +
> +maintainers:
> +  - Friday Yang <friday.yang@mediatek.com>
> +
> +description: |
> +  This reset controller node is used to perform reset management
> +  of SMI larbs on MediaTek platform. It is used to implement various
> +  reset functions required when SMI larbs apply clamp operation.
> +
> +  For list of all valid reset indices see
> +    <dt-bindings/reset/mt8188-resets.h> for MT8188.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8188-smi-reset
> +

Where is MMIO space?

> +  "#reset-cells":
> +    const: 1
> +    description:
> +      The cell should be the device ID. SMI reset controller driver could
> +      query the reset signal of each SMI larb by device ID.
> +
> +  mediatek,larb-rst:
> +    $ref: /schemas/types.yaml#/definitions/phandle

Ah, here it is? No, that is not how you access device MMIO. Use reg
property for this. That's a gross misrepresentation of hardware.

Best regards,
Krzysztof


