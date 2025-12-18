Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EB8D6ACDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ur8ybo59k4YZanBQcTNpsXAXC81n7uFQ7Ayir8JSkY=; b=bkmqFpHF9eOMBjppfJIYGyK08A
	ikfGQk07cNDF6oobcKp3CSsgkUTa7NxU9uq0T2/eFLMtR6j9WArGFOSrepMtXdcfgd5b5ZvJGo55M
	KD5CrGb0IRwEYn/sDk4hquJ9TKU1SxttFHFa9BXJhnTTu+zN2DtMEsSwsgqDbsQcUccK+UypWsdfK
	yZ2f/i8FJB4UjzTATI8kCCjS1E3HNzzPByMhr/Wn9t3A3Ehc8iSUCoWVfG5s80zvLE5K35D10KnBD
	qhWuA5d+CU7pfRuYIpC8cKVjCpisv7LG7ZwWQRUzf2cPc0BrZleKFq/N5kMSibcqujCbOOZ4/yvrq
	vNXuSupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBIU-00000008Ee9-0ZuT;
	Thu, 18 Dec 2025 10:31:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBIQ-00000008Edg-43bP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:31:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B88AFEC;
	Thu, 18 Dec 2025 02:31:37 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3A8C3F73F;
	Thu, 18 Dec 2025 02:31:42 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: krzk@kernel.org,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	ahmed.tiba@arm.com
Subject: Re: [PATCH 10/12] dt-bindings: ras: document estatus provider
Date: Thu, 18 Dec 2025 10:31:38 +0000
Message-ID: <20251218103139.2238844-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2a2baef6-c294-4c31-bec2-10fbaa3f7941@kernel.org>
References: <2a2baef6-c294-4c31-bec2-10fbaa3f7941@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_023148_068127_2AE2242E 
X-CRM114-Status: GOOD (  28.91  )
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

On 17/12/2025 12:41, Krzysztof Kozlowski wrote:
>> Add a binding for firmware-first CPER providers described via
>> DeviceTree. It covers the shared status block, optional acknowledgment
>> registers, interrupt versus polling modes and the SEA notification
>> flag so non-ACPI platforms can describe their error sources.
>>
>> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
>> ---
>>  .../devicetree/bindings/ras/arm,ras-ffh.yaml  | 95 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 96 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml b/Documentation/devicetree/>bindings/ras/arm,ras-ffh.yaml
>> new file mode 100644
>> index 000000000000..0d2acbf8e8a8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
>
> What is ras? There is no such directory so some description would be
> useful. Usually you do not get your own directory per binding.

For the next revision I will move the schema under
`Documentation/devicetree/bindings/firmware/` and expand the description to
spell out that Arm Reliability, Availability and Serviceability (RAS) firmware
exposes this FFH CPER provider.

>> @@ -0,0 +1,95 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/ras/arm,ras-ffh.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Firmware-First Handler (FFH) CPER provider
>> +
>> +maintainers:
>> +  - Ahmed Tiba <ahmed.tiba@arm.com>
>> +
>> +description: |
>> +  Some Arm platforms describe a firmware-first error handler that exposes a
>> +  Common Platform Error Record (CPER) buffer directly via DeviceTree. The OS
>> +  maps the buffer to consume the error records, and firmware signals that a new
>> +  record is ready either by asserting an interrupt or by relying on a periodic
>> +  poll. This binding describes the buffer and the associated notification
>
> Do not describe what the binding does. Describe the hardware or firmware.

I'll reword the description so it focuses on the firmware-managed CPER buffer,
optional doorbell register and optional interrupt rather than describing how
the binding is consumed.

>> +  signal. If firmware delivers the error via Synchronous External Abort (SEA),
>> +  the optional sea-notify flag marks the source accordingly.
>> +
>> +properties:
>> +  compatible:
>> +    const: arm,ras-ffh
>
> Again ras - what's that? Your patch or binding must explain that.

That updated description will explicitly expand the Arm RAS acronym so the
compatible string is self-explanatory.

>> +
>> +  reg:
>> +    minItems: 1
>
> Why is this flexible?

I'll keep `reg` describing the CPER status buffer, cap it at two entries, and
document the second entry as the optional doorbell register that some firmware
requires before reusing the buffer.

>> +    items:
>> +      - description: CPER status block exposed by firmware
>> +      - description:
>> +          Optional 32- or 64-bit acknowledgment register. Firmware watches this
>> +          register and expects bit 0 to be written to 1 once the OS consumes the
>> +          status buffer so it can reuse the record.
>> +
>> +  reg-names:
>> +    items:
>> +      - const: status
>> +      - const: ack
>
> Does not match reg.

`reg-names` will remain optional, but when provided the first entry will be
restricted to `"status"` and the second (if present) to `"ack"`, matching the
single optional region permitted in `reg`.

>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description:
>> +      Optional interrupt used to signal that a new status record is ready. If
>> +      omitted, the OS relies on the polling interval property.
>
> What OS is doing should not really matter. Either you have the interrupt
> or not.

I'll trim the wording so it just states that firmware may assert an interrupt
when a new record is ready.

>> +
>> +  poll-interval:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +    description:
>> +      Optional polling interval, in milliseconds, for platforms that cannot
>> +      route an interrupt.
>
> That's OS policy, not suitable for binding.

I'll drop `poll-interval` from the binding so the driver can fall back to its
fixed interval when no interrupt is wired.

>> +
>> +  arm,sea-notify:
>> +    type: boolean
>> +    description:
>> +      Set if the platform delivers these errors as Synchronous External Aborts.
>
> This is implied by the compatible, no?

I'll drop `arm,sea-notify` so the compatible alone defines the behaviour.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        poll-interval: false
>> +    then:
>> +      required:
>> +        - interrupts
>> +  - if:
>> +      properties:
>> +        interrupts: false
>> +    then:
>> +      required:
>> +        - poll-interval
>> +  - if:
>> +      properties:
>> +        reg:
>> +          minItems: 2
>> +    then:
>> +      required:
>> +        - reg-names
>
>Drop all this.

I'll drop this block entirely.

>> +
>> +unevaluatedProperties: false
>
> I do not see any schema referenced.

I'll switch to `additionalProperties: false` so we rely solely on the schema
referenced by `$schema` while still rejecting unknown properties.

>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    ras-ffh@fe800000 {
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.> html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).

I'll rename the example node to the generic `error-handler@fe800000` so it
describes the shared error-status block instead of the driver name.

>> +        compatible = "arm,ras-ffh";
>> +        reg = <0xfe800000 0x1000>,
>> +              <0xfe810000 0x4>;
>> +        reg-names = "status", "ack";
>> +        interrupts = <0 32 IRQ_TYPE_LEVEL_HIGH>;
>
> Use proper defines.

I'll also switch the example interrupt listing to `GIC_SPI` and `IRQ_TYPE_*`
macros.



Best regards,
Ahmed

