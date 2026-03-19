Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829391075275
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 08:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYirgxlbtyYTR8eaVYVqd4x+Y6+ElOUB1YfysSU14as=; b=a1RReYP8I5E9B28tsmQw5rdnhP
	LEbeqKaeF3AZikRqhr7/11tthIMcIqXjTZqrx+Cm6t+7Qt+zKwNWKLSGvtT42OebyBphvWOnts2mF
	eFjyCeq0YDPpdfkHps5JZbAuvXy2jSNWHhfSW42nba2hQdWLwxr0ylUabbOCfTA2dFChLtR9M7mFi
	4+jf2K0PoqcjLR0TZEjlrxCZ6Vk5M1gpDcPIu37fHEy4fVyp4GVsCJWTuLv0/XFc0EJ2717sUhXmO
	a+twR35S4hT6UIvFCOUcdSwCJYLQ+oGGRGHkQNKz+IGmEVdNWlD/CC+CKjKW8XPh6zVws7MW+i19q
	g/M4os0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38OQ-0000000ACl4-30aM;
	Thu, 19 Mar 2026 08:06:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38ON-0000000ACke-3AAc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 08:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40C3E41AF0;
	Thu, 19 Mar 2026 08:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD00C19424;
	Thu, 19 Mar 2026 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773907566;
	bh=4JCWNF+D/qWHcNu86lWPqI3P/Ks4jxVkRRfjXis1WB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPJywGWmfPZKo4esFCd879TXQJvbVAD2piXfU4mtgyq9Zd4VcIigyHRLZaniM+AT1
	 DDSGrTb18/IGjBT2vl9PL7tjXDWVt8mZB/W/zHqEveP77YHO3N+8XLAZili5hOhvRD
	 3Ep0CcTceZNeof0PKKDgqBl8VnpubVB3H3OCk9U7yI0OGVEMkv9tv6vTqeoYfyPHsX
	 awSjW9RNWaf9p2Cpza8WkNWThQu7XNSh3q6d4yYYICM869q/XOTWD9c9JrKurNK98k
	 VtILAttqv7Ww0SGR27d1IAjLYU41dnH6K9J+dNZ2joj2RY/dPzSvL1jePwpNgCbpnc
	 ijcCCxdNNy1EQ==
Date: Thu, 19 Mar 2026 09:06:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v21 2/6] dt-bindings: remoteproc: Add STM32
 TEE-controlled rproc binding
Message-ID: <20260319-glistening-ultramarine-ibis-1eb3d6@quoll>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
 <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_010607_863328_4820F296 
X-CRM114-Status: GOOD (  26.51  )
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

On Tue, Mar 17, 2026 at 07:03:23PM +0100, Arnaud Pouliquen wrote:
> Add a Device Tree binding for the STM32 remote processor controlled
> via a Trusted Application running in OP-TEE.
> This binding describes the interface and properties required for STM32MP
> remoteproc instances managed by the TEE rproc service, including a
> linkage to the TEE backend through the property "rproc-tee-phandle".
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> V21 updates:
> - the m4 node is no more declared as a child of the optee-rproc node
> - "rproc-tee-phandle" property is introduced to reference the optee-rproc
> ---
>  .../remoteproc/st,stm32-rproc-tee.yaml        | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
> new file mode 100644
> index 000000000000..ca4dd1c8e7b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc-tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 remote processor controlled via TEE
> +
> +maintainers:
> +  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> +
> +description: |
> +  STM32MP remote processor controlled by a Trusted Application
> +  running in OP-TEE. This node is a child of the TEE remoteproc service
> +  (UUID 80a4c275-0a47-4905-8285-1486a9771a08) and exposes a remoteproc
> +  instance managed by the Linux remoteproc core via the TEE rproc service.
> +
> +  Firmware loading, authentication and remote processor start/stop are managed
> +  by the TEE application. The STM32-specific driver handles platform resources
> +  such as the mailboxes and reserved-memory.
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp1-m4-tee

Drop "tee", it suggests that compatible is tied to implementation of FW
you put there.

> +
> +  reg:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Remote processor identifier used by the TEE service. The <0> value
> +      in the example denotes a single instance with ID 0.
> +    maxItems: 1
> +
> +  mboxes:
> +    description: |
> +      Mailbox channels used for rpmsg/virtio functionality and processor
> +      shutdown.
> +    maxItems: 3
> +
> +  mbox-names:
> +    items:
> +      - const: vq0
> +      - const: vq1
> +      - const: shutdown
> +
> +  memory-region:
> +    description: |
> +      List of phandles to reserved-memory nodes describing the memory layout
> +      for the interprocessors communication.

Drop description. You miss maxItems, though.

> +
> +  interrupts:
> +    description: |

Same comments...

> +      Optional watchdog / status interrupt line used to detect crashes
> +      and optionally wake up the system.
> +    maxItems: 1
> +
> +  st,auto-boot:
> +    type: boolean
> +    description: |
> +      If present, the remote processor will be automatically started by
> +      the remoteproc core at boot.

That's policy, not DT property.

> +
> +  wakeup-source:
> +    type: boolean
> +    description: |
> +      Indicates that the watchdog interrupt can be used as a wakeup source.
> +
> +  rproc-tee-phandle:

Missing vendor prefix, drop phandle. You do not say that "st,auto-boot"
is "st,auto-boot-boolean"

> +    description: |
> +      Phandle to the remote processor backend node and its identifier. This property
> +      is used to link the TEE remoteproc service to the remote processor instance
> +      it controls. The value is a phandle reference to the remote processor node,
> +      followed by a cell specifying the remote processor identifier used by the TEE.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Missing constraints.

I also do not understand which bus node this is being child, if not
remote proc.

> +
> +required:
> +  - compatible
> +  - reg
> +  - rproc-tee-phandle
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    firmware {
> +        tee_rproc: optee-rproc {
> +            compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
> +        };
> +    };

Drop

> +
> +    m4: m4@0 {

Drop unused label.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

e.g. mcu, because m4 feels like given model (Cortex M4?).

> +      compatible = "st,stm32mp1-m4-tee";
> +      reg = <0 0>;
> +
> +      mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> +      mbox-names = "vq0", "vq1", "shutdown";
> +
> +      memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
> +                      <&vdev0vring1>, <&vdev0buffer>, <&retram>;
> +
> +      interrupt-parent = <&exti>;
> +      interrupts = <68 1>;
> +
> +      rproc-tee-phandle = <&tee_rproc 0>;
> +      st,auto-boot;
> +      wakeup-source;
> +
> +      status = "okay";

Drop

Best regards,
Krzysztof


