Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D8AC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okBbflHhbz4wUNU0tbiRe6wQzQN9ITm4ZIZ0Gjariis=; b=Tw3iIZ1Vwygu0V4prA5hW/T98K
	HRVMLF7zR+js3Vw94yKtp0Yq2yOoMBG+lzuzT2l2+sQSBXMPoWiqm1/pU2DMacLbBluwWZuaLGMyZ
	NHuNV7Jxd97wbNLodrPv+sUEYSlJG6mJNVw16A2ctiuWNO3Hm4RBdWLuF1AEatgykvW9XjQkydHFc
	4GJjtJ9DW1umaQ6H+3eb3jR9cU+6lhLl9VpfvkOXh5jXMAMeb4nwbWN2a/CR3XEHr+KWx7+o5i1uu
	EevgVMJjBm/U9Wp7sOuPXsMENpW+/LPFuSukwqFMH/mQ3dzxjx6/xmVNVBagDLyaB9yOw0I+6UUFp
	+Y2u8laA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFcP-0000000FkJt-135h;
	Fri, 27 Jun 2025 20:24:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFSY-0000000FjMe-3hRx;
	Fri, 27 Jun 2025 20:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10ACB4587C;
	Fri, 27 Jun 2025 20:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE296C4CEE3;
	Fri, 27 Jun 2025 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055245;
	bh=VYYXKd4DVhfkDjJTOWxBgy92/r8CsxVv0INxt3+97j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/h+ThulbxEHu/znIGjOtmBfK3QVP+9m7X7rsOhRBfipwgL6fy267ecQXtR6nHCIW
	 ei7Z5DrFQx44UYPwalMOGhWVIG4TKI+2bXYZYYKBCou+ua3RmCMQgj4cRaGCMwHEbL
	 g55YQfwq2jk6wuTm2CgadnwpR2YOOY9U60KRa+e6VUD51yWgMuXukMZm6C6VCnfYUX
	 18vhQka3tjURh0/9ZNbxCHJVJlSkpSsSHNchQAJinehUZq+C9v1Vp4SL3fUY82HOcK
	 a+VoYgRb1akhChMPxA3wf3yzWqHV1IFMlEbHCS9jcdPbboSq4Aoqq3Xc3FxTfIyfTO
	 LYEsckce9Rftw==
Date: Fri, 27 Jun 2025 15:14:04 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	sudeep.holla@arm.com, cristian.marussi@arm.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/2] dt-bindings: firmware: Add MediaTek TinySYS SCMI
 Extension protocol
Message-ID: <20250627201404.GA4156149-robh@kernel.org>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
 <20250623120136.109311-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120136.109311-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_131406_937418_5D929FBF 
X-CRM114-Status: GOOD (  15.53  )
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

On Mon, Jun 23, 2025 at 02:01:35PM +0200, AngeloGioacchino Del Regno wrote:
> Add the MediaTek TinySYS SCMI Extension protocol as found on a
> number of SoCs, including MT6895 and MT8196.
> 
> This includes controls and power state notifications for the GPU,
> CPU Memory latency Manager (cm_mgr), SLBC, SSPM and others.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../firmware/mediatek,mt6895-scmi.yaml        | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml b/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
> new file mode 100644
> index 000000000000..98a5b81983b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2025 Collabora Ltd
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/mediatek,mt6895-scmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek System Control and Management Interface(SCMI) Vendor Protocols Extension
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +

This schema will never be applied.

> +properties:
> +  protocol@80:
> +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x80
> +
> +additionalProperties: true
> -- 
> 2.49.0
> 

