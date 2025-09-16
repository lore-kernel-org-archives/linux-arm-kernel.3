Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5DBCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiyjNEA8HTQrFKmyieL284e8HrJvXIakDBqII+agtjg=; b=sUuYA0uCIgnCVtYhyPv5i0P8Tw
	iGtZgDHRcxa0UzMydzknpq+gwogq4shEYhj2Fi1PHIjJ99WVWxwrwCnWDRqE/CY0hZ3KHtiaLv1VJ
	VHCXFGz5rCVoTB/8LFw8uR7eE0IdILypWNdk+ZbminYgPySEITdHqfu4qypFXFRueNiXfkL01zUIj
	bZ54VgovQB+h6OfTScPm94dsn2nzAtk1qwiW48n72XKVFg9Vb9wwdLemxRopmypHlC4B8D5lbUaRf
	Jct9BP4IFd9Tczjg2v1XgHTAaAPd5OhIsrSPrlzfYQxSW+j4v/rfTvoz/1CXzqNmndqwc0NGMII+1
	tLnrzMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRm9-00000007KqD-1LO0;
	Tue, 16 Sep 2025 09:15:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRm6-00000007Koe-3vaj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 09:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC4E9438F4;
	Tue, 16 Sep 2025 09:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F39C4CEFD;
	Tue, 16 Sep 2025 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758014097;
	bh=lWa38QWpQKBheh2+8pa3IIFdfHdW+eC2aXKWV7xfz+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0zirtnhTBVOiXpUexGzhnv1iQ/q+CWOJgJKWTOLGOASvxhhj+Bv9NubaV4y7JaJS
	 MqdEdfBJoIVu4GFO2aiejrWspeBeSfhQwZvUpmVzro5c1Mo1o/AGAcZR2vkamUUWrT
	 pjKKrSIuE9Lw8jBBE+OrQ4otNtlpyRUDF8JzNqjz7EjBiKLg1DsGjYfWiTeiPR4UsP
	 plbwEvzdOEvN98EGCUvGXetxDz6fb2UrOIe02rLnfkdIfoB5986CWiDP6gx6Y5EbQZ
	 PHqGcVEOmfwzgaPxgDcr2mc+W0sdCrbzVItMt4HvYo/va3p7gP1iOtYCX3oX4EUOPJ
	 EsCIF/J2p7MFg==
Date: Tue, 16 Sep 2025 14:44:49 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 4/6] dt-bindings: remoteproc: Add compatibility for
 TEE support
Message-ID: <aMkqifHSdlCs4VjA@sumit-X1>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_021459_020169_4BE5A136 
X-CRM114-Status: GOOD (  31.46  )
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

Hi Arnaud,

First of all apologies for such a late review comment as previously I
wasn't CCed or involved in the review of this patch-set. In case any of
my following comments have been discussed in the past then feel free to
point me at relevant discussions.

On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
> where the Cortex-M4 firmware is loaded by the Trusted Execution Environment
> (TEE).

Having a DT based compatible for a TEE service to me just feels like it
is redundant here. I can see you have also used a TEE bus based device
too but that is not being properly used. I know subsystems like
remoteproc, SCMI and others heavily rely on DT to hardcode properties of
system firmware which are rather better to be discovered dynamically.

So I have an open question for you and the remoteproc subsystem
maintainers being:

Is it feasible to rather leverage the benefits of a fully discoverable
TEE bus rather than relying on platform bus/ DT to hardcode firmware
properties?

> 
> For instance, this compatible is used in both the Linux and OP-TEE device
> trees:
> - In OP-TEE, a node is defined in the device tree with the
>   "st,stm32mp1-m4-tee" compatible to support signed remoteproc firmware.
>   Based on DT properties, the OP-TEE remoteproc framework is initiated to
>   expose a trusted application service to authenticate and load the remote
>   processor firmware provided by the Linux remoteproc framework, as well
>   as to start and stop the remote processor.
> - In Linux, when the compatibility is set, the Cortex-M resets should not
>   be declared in the device tree. In such a configuration, the reset is
>   managed by the OP-TEE remoteproc driver and is no longer accessible from
>   the Linux kernel.
> 
> Associated with this new compatible, add the "st,proc-id" property to
> identify the remote processor. This ID is used to define a unique ID,
> common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.

This "st,proc-id" is just one such property which can rather be directly
probed from the TEE/OP-TEE service rather than hardcoding it in DT here.
I think the same will apply to other properties as well.

-Sumit

> This ID will be used in requests to the OP-TEE remoteproc Trusted
> Application to specify the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 58 ++++++++++++++++---
>  1 file changed, 50 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 843679c557e7..58da07e536fc 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -16,7 +16,12 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: st,stm32mp1-m4
> +    enum:
> +      - st,stm32mp1-m4
> +      - st,stm32mp1-m4-tee
> +    description:
> +      Use "st,stm32mp1-m4" for the Cortex-M4 coprocessor management by non-secure context
> +      Use "st,stm32mp1-m4-tee" for the Cortex-M4 coprocessor management by secure context
>  
>    reg:
>      description:
> @@ -43,6 +48,10 @@ properties:
>            - description: The offset of the hold boot setting register
>            - description: The field mask of the hold boot
>  
> +  st,proc-id:
> +    description: remote processor identifier
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>    st,syscfg-tz:
>      deprecated: true
>      description:
> @@ -146,21 +155,43 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - resets
>  
>  allOf:
>    - if:
>        properties:
> -        reset-names:
> -          not:
> -            contains:
> -              const: hold_boot
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-m4
>      then:
> +      if:
> +        properties:
> +          reset-names:
> +            not:
> +              contains:
> +                const: hold_boot
> +      then:
> +        required:
> +          - st,syscfg-holdboot
> +      else:
> +        properties:
> +          st,syscfg-holdboot: false
> +        required:
> +          - reset-names
>        required:
> -        - st,syscfg-holdboot
> -    else:
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-m4-tee
> +    then:
>        properties:
>          st,syscfg-holdboot: false
> +        reset-names: false
> +        resets: false
> +      required:
> +        - st,proc-id
>  
>  additionalProperties: false
>  
> @@ -192,5 +223,16 @@ examples:
>        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>      };
> +  - |
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    m4@10000000 {
> +      compatible = "st,stm32mp1-m4-tee";
> +      reg = <0x10000000 0x40000>,
> +            <0x30000000 0x40000>,
> +            <0x38000000 0x10000>;
> +      st,proc-id = <0>;
> +      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
> +      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
> +    };
>  
>  ...
> -- 
> 2.25.1
> 
> 

