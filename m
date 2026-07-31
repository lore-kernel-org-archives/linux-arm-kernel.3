Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AC6C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 20:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1b7OOK1ydfjojKAeVm00aLNWdWN8CVli0QWCGJGGJH4=; b=tJu/9tnL70709y66MO0NTT170B
	S1v5u8qwVEwsCQkrg8zlDYtr77pryZitbRW1b9rAGl80BXVVJcrt+4O22Oqf4V+jvOB3jhLpBGneG
	kBZrEETK3iTljxAuZYVJnzYGwEJTpwISNAHIqYqQ3I3U8x3qaD8VKHXLWCrm/rPT1K70kQ84rgQ5w
	cf0M1bmhtDBDTd9IO+Vstq/5IjfvBuGgQcPZZz3jP1xO7eCoTm6QoX6Mx2sOp9/2zoH6A0mmhtD+m
	q3B2ZethOeMbRLXzgE6e8K1/tSMIfmxXcVExMiFWryAi6/nxU/hEpOywmdHS3ndrg2MEuGAQW1BMh
	Job8IWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptwr-0000000DYiN-2xKg;
	Fri, 31 Jul 2026 20:35:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptwq-0000000DYi5-2D9t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 20:35:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EEF09439FC;
	Fri, 31 Jul 2026 20:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED4B1F00AC4;
	Fri, 31 Jul 2026 20:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785530115;
	bh=1b7OOK1ydfjojKAeVm00aLNWdWN8CVli0QWCGJGGJH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MAnlS0XCeeG+IAX/DZqY8aetmPZb9L9iC68UYljTTm34OpK/T93OaKcoaWl9zDNlh
	 qfS3qG4bG0a/935rvi1QLUI64nC7w4TZ+f2cZIQSKsLCdTY9izrFbigFcQ9NBCQ1z6
	 IWGutnQJ3FiEYxA8SviAJheFFfSNnqA6V89hkE6axDb5jIcaUsHD0pIXRyuR1q1tPj
	 zkfQjMVrLUPIP6nzoWlQ+HmsipDG4EdYUFtdrptG22DwTY8mrFEGOf9FGQ0sOkqjAq
	 mlSn1vQL84YLakUibYG9bJuMBeyvIrfg8Vb0RyJx+vUOk/BnNVIP5+n86MG1itqxaP
	 SSeejGJ0poq4Q==
Date: Fri, 31 Jul 2026 15:35:15 -0500
From: Rob Herring <robh@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ruidong Tian <tianruidong@linux.alibaba.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
Message-ID: <20260731203515.GA1619665-robh@kernel.org>
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
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

On Mon, Jul 20, 2026 at 01:49:51PM +0530, Umang Chheda wrote:
> ARMv8 and later processors implement the RAS (Reliability,
> Availability and Serviceability) extensions, exposing hardware
> error records through a standardised register interface.
> 
> Add Device Tree bindings to describe RAS error sources.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,ras-error-source.yaml    | 330 ++++++++++++++++++
>  include/dt-bindings/arm/arm-ras.h             |  11 +
>  2 files changed, 341 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
>  create mode 100644 include/dt-bindings/arm/arm-ras.h
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml b/Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
> new file mode 100644
> index 000000000000..add7063a1a62
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
> @@ -0,0 +1,330 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,ras-error-source.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM RAS error source
> +
> +maintainers:
> +  - Umang Chheda <umang.chheda@oss.qualcomm.com>
> +
> +description: |
> +  ARMv8 and later processors implement the Reliability, Availability and
> +  Serviceability (RAS) extensions.  Hardware blocks that support RAS expose
> +  one or more error records through a standardised register interface.  Each
> +  error record captures information about a detected hardware error (cache
> +  ECC fault, TLB parity error, interconnect error, etc.) and can optionally
> +  signal the OS via an interrupt.
> +
> +  Each DT node described by this binding represents one RAS error source —
> +  a hardware block that exposes a set of error records.  Error records are
> +  accessed either through system registers (for processor-local resources
> +  such as L1/L2 caches and TLBs) or through a memory-mapped register window
> +  (for shared or off-core resources such as L3 caches, SMMUs and GICs).
> +
> +properties:
> +  compatible:
> +    description:
> +      Identifies the class of hardware block this error source belongs to.
> +      arm,ras-processor covers processor error sources (cache, TLB, etc.).
> +      arm,ras-smmu covers SMMU error sources.
> +      arm,ras-gic covers GIC error sources.
> +    enum:
> +      - arm,ras-processor
> +      - arm,ras-smmu
> +      - arm,ras-gic
> +
> +  reg:
> +    description:
> +      Register windows for this error source.  When absent the error records
> +      are accessed through system registers (ERRSELR_EL1 + ERX*_EL1).
> +      When present, the first range is the primary error-record window;
> +      additional named ranges are identified by reg-names.
> +    minItems: 1
> +    maxItems: 4
> +
> +  reg-names:
> +    description:
> +      Names for the optional additional register windows beyond the primary
> +      error-record window.  err-group is the error group status register
> +      window (ERRGSR).  fault-inject is the fault injection register window
> +      (ERXPFG*).  irq-config is the interrupt routing configuration window.
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      enum:
> +        - err-group
> +        - fault-inject
> +        - irq-config

reg and reg-names must be the same number of entries.

> +
> +  interrupts:
> +    description:
> +      Interrupts signalled by this error source.  The first interrupt is the
> +      Fault Handling Interrupt (FHI), fired when a corrected error counter
> +      overflows or a deferred error is detected.  The optional second
> +      interrupt is the Error Recovery Interrupt (ERI), fired when an
> +      uncorrected recoverable error is detected.
> +    minItems: 1
> +    maxItems: 2

Replace description with:

minItems: 1
items:
  - description:
      Fault Handling Interrupt (FHI), fired when a corrected error 
      counter overflows or a deferred error is detected.
  - description: 
      Error Recovery Interrupt (ERI), fired when an uncorrected 
      recoverable error is detected.


Seems backwards to me that corrected errors is required and uncorrected 
errors is optional. Should be fine to not care about corrected errors, 
but uncorrected errors can't really be ignored.

> +
> +  interrupt-names:
> +    description:
> +      Names identifying the interrupts.  "fhi" is the Fault Handling
> +      Interrupt; "eri" is the optional Error Recovery Interrupt.
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum:
> +        - fhi
> +        - eri

Define the order.

> +
> +  arm,group-format:
> +    description:
> +      Page granularity of the memory-mapped error record group register
> +      window.  Determines the ioremap size and the number of error group
> +      status registers (ERRGSR) available.  Required when reg is present.

Don't state constraints which are expressed as schemas.

> +      Use the ARM_RAS_GROUP_* constants from <dt-bindings/arm/arm-ras.h>.
> +      0 (ARM_RAS_GROUP_4K) is a 4 KiB window with 1 ERRGSR supporting up
> +      to 64 records.  1 (ARM_RAS_GROUP_16K) is 16 KiB with 4 ERRGSRs and
> +      up to 256 records.  2 (ARM_RAS_GROUP_64K) is 64 KiB with 14 ERRGSRs
> +      and up to 896 records.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +
> +  arm,num-records:
> +    description:
> +      Total number of error records in this error source, including both
> +      implemented and unimplemented slots.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +
> +  arm,record-impl:
> +    description:
> +      Bitmap of implemented error records.  Bit N set to 1 means error
> +      record N is present and active in this error source.  Bit N set to 0
> +      means record N is not implemented and must be skipped.  The array
> +      length must equal the number of ERRGSRs implied by arm,group-format
> +      (1 element for 4K, 4 for 16K, 14 for 64K).  For system-register
> +      nodes (no reg property) a single u64 element is used.
> +    $ref: /schemas/types.yaml#/definitions/uint64-array
> +    minItems: 1
> +    maxItems: 14
> +
> +  arm,status-reporting:
> +    description:
> +      Bitmap indicating which implemented error records must be polled
> +      directly by the OS.  Bit N set to 1 means record N does not report
> +      through the ERRGSR and must be polled by reading its ERX_STATUS
> +      register directly in the interrupt handler.  Bit N set to 0 means
> +      record N reports its status through the ERRGSR and will be discovered
> +      via the ERRGSR scan path.  For system-register nodes (no reg property)
> +      there is no ERRGSR, so every implemented record must be polled
> +      directly; arm,status-reporting must equal arm,record-impl for all
> +      system-register nodes.  Array length as for arm,record-impl.
> +    $ref: /schemas/types.yaml#/definitions/uint64-array
> +    minItems: 1
> +    maxItems: 14
> +
> +  arm,addressing-mode:
> +    description:
> +      Bitmap indicating the type of address reported in the error address
> +      register (ERX_ADDR) for each error record.  Bit N set to 0 means
> +      record N reports a System Physical Address (SPA) that the OS can use
> +      directly.  Bit N set to 1 means record N reports a node-specific
> +      Logical Address (LA) that requires platform-specific translation to
> +      obtain a SPA.  Array length as for arm,record-impl.
> +    $ref: /schemas/types.yaml#/definitions/uint64-array
> +    minItems: 1
> +    maxItems: 14
> +
> +  # Processor error source properties (arm,ras-processor only)
> +
> +  cache:
> +    description:
> +      Phandle to the cache node (L1, L2, or L3) that this processor error
> +      source monitors.  The referenced node must have compatible = "cache"
> +      and a cache-level property identifying the level in the hierarchy.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  # SMMU error source properties (arm,ras-smmu only)
> +
> +  iommus:
> +    description:
> +      Phandle to the SMMU node that this error source monitors.

If the iommu has #iommu-cells >0, then this property must match the cell 
size. You can't have your own definition of 'iommus'.

> +    maxItems: 1
> +
> +  # GIC error source properties (arm,ras-gic only)
> +
> +  arm,gic-ref:
> +    description:
> +      Phandle to the GIC node that this error source monitors.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - arm,num-records
> +  - arm,record-impl
> +  - arm,status-reporting
> +
> +allOf:
> +  - if:
> +      required:
> +        - reg
> +    then:
> +      required:
> +        - arm,group-format

Better expressed as:

dependentRequired:
  reg: [ 'arm,group-format' ]

Rob

