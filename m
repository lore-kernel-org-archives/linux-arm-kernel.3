Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9118CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3wDg+4g2GptZbsh0HCiLEhJwcrrrvElip6Ufk/Fn/o=; b=B6so3QpOrrBhnOCz+G7K9o4bGi
	2MBCiDBAkhJ8SuQcph64pxGGTj6MlxOnds0HyFxkNl6HSoc//hJ2ttoLvI28SuefrM1lIrGoOYobi
	sD2Z+BHHQ96u4+eBX9pdS0Pcf2H4Or76w/lf3K34oxqz3YZ6D8TOMHFLPArsAEuvCu3yuC851vYEn
	rqHgRG7rk8Nibq+bx0T1lnGTQicxg0NsIRmUwKJeJGFy60lXh1zkhdk+QqS6d3augjIdVxc7lNYfe
	2dxUgdRxKiswcf8pilPZpUGf2gdIeZh36xZEjKmDssgbezUblvz3D3rT/ppyXfIdAHoPyOKDDdUOP
	M3MnhGeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Jt-00000007v6P-2rOB;
	Fri, 29 May 2026 16:44:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Jr-00000007v5i-45BH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:44:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABDE443CE6;
	Fri, 29 May 2026 16:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FF41F00893;
	Fri, 29 May 2026 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073063;
	bh=G3wDg+4g2GptZbsh0HCiLEhJwcrrrvElip6Ufk/Fn/o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WM0FXepsh/oPSKCdzTWjewW0wPQJFUaBHz7CLH18fotnVaOFZU+Ne2y6a0Q6qnlwe
	 tsxFmYFSHcvpPZGdmr3Xqv1rSHY+RHAlzg4dCm2D4uSI1Ohspv05QeRm5jSGHI48qk
	 imSVQ5s0omjKZRBZZAFxtjnfzqZizp6PFRfoCHK+oIHvuxetQzWtLKPteUn4NW/Qnh
	 NNWgpPd45k+Sd42HIf1LFbykbOj1IKD/Bwskw3FNLfCcGApKbjFRXJKB8TfeCg1uYM
	 KGMAQguxHHBhC4/wKlhQ1SnVVRgvCtGrNgpE/dDZwSmh9iekrsStpOO6qbKG8lF5Sa
	 nF04ArOzslibQ==
Date: Fri, 29 May 2026 17:44:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: will@kernel.org, xueshuai@linux.alibaba.com, saket.dumbre@intel.com,
 mchehab@kernel.org, dave@stgolabs.net, djbw@kernel.org, bp@alien8.de,
 tony.luck@intel.com, guohanjun@huawei.com, lenb@kernel.org,
 skhan@linuxfoundation.org, vishal.l.verma@intel.com, rafael@kernel.org,
 corbet@lwn.net, ira.weiny@intel.com, dave.jiang@intel.com,
 krzk+dt@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
 alison.schofield@intel.com, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael.Zhao2@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, Dmitry.Lamerov@arm.com,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 09/10] dt-bindings: firmware: add arm,ras-cper
Message-ID: <20260529174407.7081ad0b@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-9-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
	<20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-9-2e0500d42642@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_094424_060257_9D03968C 
X-CRM114-Status: GOOD (  20.30  )
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

On Fri, 29 May 2026 10:50:49 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Describe the DeviceTree node that exposes the Arm firmware-first
> CPER provider and hook the file into MAINTAINERS so the
> binding has an owner.

Odd wrap. Pick a length (72 / 75 typical for commit messages) and
stick to it.

Request for references inline + a question on whether we have
to allow for the ack register not existing. I'd rather we required
it if possible.

> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  .../devicetree/bindings/firmware/arm,ras-cper.yaml | 54 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> new file mode 100644
> index 000000000000..3d4de096093f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/arm,ras-cper.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm RAS CPER provider
> +
> +maintainers:
> +  - Ahmed Tiba <ahmed.tiba@arm.com>
> +
> +description:
> +  Arm Reliability, Availability and Serviceability (RAS) firmware can expose
> +  a firmware-first CPER error source directly via DeviceTree. Firmware
> +  provides the CPER Generic Error Status block and notifies the OS through
> +  an interrupt.

I'd like some spec references in here if possible.

> +
> +properties:
> +  compatible:
> +    const: arm,ras-cper
> +
> +  memory-region:
> +    minItems: 1
> +    items:
> +      - description:
> +          CPER Generic Error Status block exposed by firmware.
> +      - description:
> +          Optional firmware-owned ack buffer used on platforms
> +          where firmware needs an explicit "ack" handshake before overwriting
> +          the CPER buffer. Firmware watches bit 0 and expects the OS to set it
> +          once the current status block has been consumed.

Does the arm spec really make this optional?  Can we constraint it to not be
just to make our lives easier?  I've never been sure how you would actually
make a working platform without the ack support.


> diff --git a/MAINTAINERS b/MAINTAINERS
> index 461a3eed6129..8a9714603a7d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22261,6 +22261,11 @@ M:	Alexandre Bounine <alex.bou9@gmail.com>
>  S:	Maintained
>  F:	drivers/rapidio/
>  
> +RAS ERROR STATUS
> +M:	Ahmed Tiba <ahmed.tiba@arm.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> +
>  RAS INFRASTRUCTURE
>  M:	Tony Luck <tony.luck@intel.com>
>  M:	Borislav Petkov <bp@alien8.de>
> 


