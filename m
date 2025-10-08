Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2CBCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcnFRnwHjObsdxBkkeLOLw4qyepfECBaDSy6h5l58gw=; b=q+7xr3LsQw7lIzuVodpNYvaN8n
	qN84q9uCS7ZPCfeT5CQPcxTye8xUNGGfteyQXMVnAJxbwKYRqAn1WRmIBGzqWqqBbVYdo7z7Jy40y
	UWCAyzejup/A3kpe+MlAgiay9IbOPLJHMav0NWnB39TCfgyzgblNa6na8MSLjjPLnwGpgKXx6NBrr
	KG+AFSkUkcaESuYXKqIGE3I5hTpIv5omOgyqf6jndjGlC8QHOmGBZ0sizObLH4wdJkdvJ5kumijDi
	SQ8CL8B+YIPNvX1fGSOvumfSEEDyOXCHgehXFBai/x1GX5+6bvHWjg959JUOeWcOtnySDr2mkUc0d
	qW4U6Npw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WWy-00000004EXA-2Ust;
	Wed, 08 Oct 2025 15:56:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WWv-00000004EVV-1cjO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB07240659;
	Wed,  8 Oct 2025 15:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE07C4CEE7;
	Wed,  8 Oct 2025 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759939000;
	bh=OTtx94002DcN85g3AnhuB82aJANJNeLNX0xgDeQazR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJty5anIU2p5TwpwV90XJuJKHmBucrx6RFXaizi9UQVrNGa1AIX1JQMotCiW7sZ6Y
	 UQu90FEZ/AHbz+b07lehm7d8ZND0VH3Z8bgWegnwXYWCMOTbRSHhmITPHTbi0PN7H5
	 nEFfqoQPMT2rXt0jeXw2jCmKWkU7PT8LBv9yhceoS3aky4DBYF4fHCWgvnIYrUKRfp
	 R2I9TKZ66YOYigL89ClOibXbmsWmHMXCSGfR12TccwtJsW0ND72z3wPq914xGSA79U
	 uYo3r45pLxSJu5SLV4sZvAflr4a+fQja2PN0Dp2EGxXPySklxdW3DQSgNJARnRvHjm
	 +te5uxkIu/hEA==
Date: Wed, 8 Oct 2025 10:56:39 -0500
From: Rob Herring <robh@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: peng.fan@oss.nxp.com, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwlock:  Adding brcmstb-hwspinlock
 support
Message-ID: <20251008155639.GA3512742-robh@kernel.org>
References: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
 <20251001181641.1561472-2-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001181641.1561472-2-kamal.dasu@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_085641_443587_43D3496C 
X-CRM114-Status: GOOD (  16.34  )
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

On Wed, Oct 01, 2025 at 02:16:39PM -0400, Kamal Dasu wrote:
> Adding brcmstb-hwspinlock bindings.

That's obvious from the diff. Tell us something about the h/w and 
convince me we don't need per SoC compatible which is standard practice.

> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> new file mode 100644
> index 000000000000..f45399b4fe0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom settop Hardware Spinlock
> +
> +maintainers:
> +  - Kamal Dasu <kamal.dasu@broadcom.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,brcmstb-hwspinlock

hwspinlock is the name of the h/w block? Use the name of the h/w, not 
linux subsystem names.

> +
> +  "#hwlock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#hwlock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwlock@8404038 {
> +        compatible = "brcm,brcmstb-hwspinlock";
> +        reg = <0x8404038 0x40>;

h/w blocks rarely start at an offset like that. Is this part of some 
other h/w block? If so, then just add '#hwlock-cells' to *that* node.

> +        #hwlock-cells = <1>;
> +    };
> +
> -- 
> 2.34.1
> 

