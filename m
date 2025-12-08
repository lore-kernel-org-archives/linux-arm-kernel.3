Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E964D3B7E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSKA2adOSd7CtcwNjJzXTJ8lZB55OpTQwGRjoW+TPhU=; b=2naYazLWxIdeUS/7oiQVJ9fMCo
	RCEqXI9B+yM2dupbSpFPdEed0eX0OZfJidHJy9CjOlE5E89tVWn5fxwgJ9jyZQ0oaOf61djaslKCz
	JKCZbQfCozRaVbXTivwgMN5n+Kzb+FBnTHigkISIK3O9VmX8+6dBI9mAjx9cBx4Z66ZWwITptSUb5
	B6JMkqVROPjDFplLPqvg6k9c1Lb4VThF9Qh8lR7iS7lebx4Yc4jkIXdfjBNoqtxBODTzP1ub3IzKj
	xEQVFr+3LF04aZp3GS2NY0lrd7VOiB4BJd7A6m7nh2oIucQ0SfS4R5BvhSfGTkcUXEzij6kvWiXyp
	x9Y1qxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUbx-0000000Cfpm-3bsa;
	Mon, 08 Dec 2025 06:20:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUbw-0000000CfoT-1aw2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 06:20:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C395B6014D;
	Mon,  8 Dec 2025 06:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2929C113D0;
	Mon,  8 Dec 2025 06:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765174839;
	bh=0trr4fT0A9nv1xciS3rk7DorKigTqK8XKKQd50Ytthk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfWg/N1Y+6df6xs9dof4BphrbSTU2er1yXtmHwCbTqFATECrACRgTVrzhSCa8l/FI
	 aRANhztCBmov36/Df6V+9aGm5VuBslrxy73g2F3bxZ3c/1rOL8kKhohXLPM77lpQze
	 qBGcH0YeK1S4F/dOkMtx/Clm86bfROpaZUQ3QfiCELi3/oK1b+GWug00vyGjZDCy6M
	 z5iT34PaLxAUiiy8/FEHFHdUOA2SYpSc4bH2GfTFgRiHxELTSR7jsC6G9tlD9VSEIs
	 degK30MlhEWdFsj2M0aINBRXvHzVJ7WCJO2SEPK4g9ektqx/xZQZhNg6EJT81KAFV5
	 8d8dv7b+Crcqg==
Date: Mon, 8 Dec 2025 07:20:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anshul Dalal <anshuld@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
Message-ID: <20251208-abiding-hedgehog-of-lightning-2fe7a2@quoll>
References: <20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com>
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

On Fri, Dec 05, 2025 at 11:45:43AM +0530, Anshul Dalal wrote:
> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
> which might be different than one's available to the kernel (firmware
> spec).
> 
> Therefore, this patch adds the missing mailbox entries to the DT binding
> if the matching compatible is ti,am654-sci to represent the mailboxes
> exposed by the hardware during boot for the purpose of loading the
> firmware.
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
> Changes in v4:
> - Make new boot_* mboxes conditional on ti,am654-sci compatible
> - Link to v3: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v3-1-66155a4236dc@ti.com
> 
> Changes in v3:
> - Drop [1/2] of the last patch series
> - Update existing example with boot_* mailboxes instead of adding a new one
> - Link to v2: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com
> 
> Changes in v2:
> - Remove maxItems entry
> - Remove RFC tag from patch (added by mistake in v1)
> - Document the new mailboxes in mboxes instead of mbox-names
> - Provide example with all the mailboxes set
> - Update commit title to have "ti,sci"
> - Split into two patches
> - Link to v1: https://lore.kernel.org/r/20251111-k3_syscon_add_boot_mailboxes-v1-1-529a27f21076@ti.com
> ---
>  .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 50 +++++++++++++++++++---
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> index 25a2b42105e5..d9eb2a81e539 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> @@ -51,15 +51,15 @@ properties:
>      minItems: 1
>  
>    mbox-names:
> +    minItems: 2
> +    maxItems: 6
>      description: |
>        Specifies the mailboxes used to communicate with TI-SCI Controller
>        made available from TI-SCI controller.
> -    items:
> -      - const: rx
> -      - const: tx
>  
>    mboxes:
>      minItems: 2
> +    maxItems: 6
>  
>    ti,host-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -79,6 +79,42 @@ properties:
>      type: object
>      $ref: /schemas/reset/ti,sci-reset.yaml#
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: ti,am654-sci
> +then:
> +  properties:
> +    mbox-names:
> +      minItems: 2

Why is this list flexible?

> +      items:
> +        - const: rx
> +        - const: tx
> +        - const: notify
> +        - const: boot_rx
> +        - const: boot_tx
> +        - const: boot_notify

So this list goes to top-level with minItems.

> +    mboxes:
> +      minItems: 2
> +      items:
> +        - description: RX thread
> +        - description: TX thread
> +        - description: Notify thread
> +        - description: boot stage RX thread
> +        - description: boot stage TX thread
> +        - description: boot stage Notify thread

This as well

> +else:

Best regards,
Krzysztof


