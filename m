Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B8BC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JlzhtmvZ8Ag/WAvVExitfa9Wktl7jlByBZ2QZESG9N4=; b=H2vMakGEIEc9dj
	LDsrMm7FZzgLdZnBvWO+JfTVnHsSY/m9VbAlLCRC4vMuI/UYIgvGqglqqP7JruvZBEeDraXu7EWMn
	O1k8ItspZUBfW24ejMx+ep5EPQqMgtavWcvUR6U2bGJccDGnv5pFWnbNFko9YVdMSXuqr8iJkynYc
	S/q9qw71/OaaSY4DXHv0pxRlCvPJKY5lmK+RomAOYpBfDIymzyXP3hsX6qL3UCGHD8ofI/5J7lRfs
	+CDiBCWGCeca+7iAz47nLJ8QZYR6WvdoZEtrXcF9Qj8Eci2sHSIKMJUhiYNzqsjvX9Oh490EfqRBk
	p98UUheYeu1Dg7ON7m6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8g9H-00000002fa2-1Hct;
	Mon, 21 Sep 2026 15:41:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8g9E-00000002fY7-0HK3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:41:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 441F4176C;
	Mon, 21 Sep 2026 08:41:35 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26F9D3F632;
	Mon, 21 Sep 2026 08:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790005298; bh=Ic2Gw84krfr8c7OaYlaNtXNSDyS2HBWD7FYe8NgJc6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qqanq/gIdpOeMALookRJz4vD67sUMrtzWGffKczUef/dIagy2c/LYWFWyMCc3h1Ed
	 2p4sUCSs4EJ3vzM0AxfAJLIz6GvESQCA7xzNhkqb2edwnckVyugKDnwN8SGH5qiOOz
	 nTzfnMggNZmMuboRpCuuaJd/1ffKo+vYyMW4w9Ao=
Message-ID: <93d25b91-a361-45af-aa2e-82118179291a@arm.com>
Date: Mon, 21 Sep 2026 17:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: Add Live Firmware Activation
To: Sudeep Holla <sudeep.holla@kernel.org>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-2-andre.przywara@arm.com>
 <20260921-nice-russet-caracal-6db6d3@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260921-nice-russet-caracal-6db6d3@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_084140_202652_C98274EA 
X-CRM114-Status: GOOD (  25.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 9/21/26 17:10, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 04:11:04PM +0200, Andre Przywara wrote:
>> The Arm Live Firmware Activation spec [1] describes updating firmware
>> images during runtime, without requiring a reboot. Update images might
>> be deployed out-of-band, for instance via a BMC, in this case the OS
>> needs to be notified about the availability of a new image.
>>
>> Describe an interrupt that could be triggered by the platform, to notify
>> about any changes.
>>
>> [1] https://developer.arm.com/documentation/den0147/latest/
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/arm/arm,lfa.yaml      | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
>> new file mode 100644
>> index 0000000000000..179c542f383d4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
>> @@ -0,0 +1,50 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,lfa.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Live Firmware Activation (LFA)
>> +
>> +maintainers:
>> +  - Andre Przywara <andre.przywara@arm.com>
>> +  - Sudeep Holla <sudeep.holla@arm.com>
>> +
>> +description:
>> +  The Arm Live Firmware Activation (LFA) specification [1] describes a
>> +  firmware interface to activate an updated firmware at runtime, without
>> +  requiring a reboot. Updates might be supplied out-of-band, for instance
>> +  via a BMC, in which case the platform needs to notify an OS about pending
>> +  image updates.
>> +  [1] https://developer.arm.com/documentation/den0147/latest/
>> +
>> +properties:
>> +  compatible:
>> +    const: arm,lfa
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description:
>> +      The notification interrupt for changed firmware image status. For
>> +      an out-of-band firmware update, some system entity would signal
>> +      the availability of a firmware update to the host OS via this interrupt.
>> +
>> +      This must be an edge-triggered IRQ.
>> +
>> +required:
>> +  - compatible
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    firmware {
>> +        firmware-update {
>> +            compatible = "arm,lfa";
>> +            interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> 
> Could the example use an edge-triggered interrupt type as it must be
> edge-triggered IRQ as per the above scheme ? As written, a device tree

Oops, sorry, of course, forgot to change that!

> copied from the example violates the binding's requirement.
> 
> Alternatively, is the binding incorrect and needs fixing ? I am not sure
> if there is any requirement on it from the specification. Where did you
> derive it from ?
Indeed the spec doesn't say that explicitly, but it's pretty mute on 
that front anyway.
The need for edge comes somewhat naturally: since the originator of the 
interrupt is unknown (the agent injecting something? Some BMC triggering 
a GPIO line? Some SPC triggering an on-chip IRQ line?), it's unclear 
whose responsibility it is the lower the IRQ line again. And even if the 
LFA agent could somehow arrange that - by having firmware component 
specific code to do that - it in unclear when exactly this lowering 
should happen: at LFA_PRIME? At LFA_ACTIVATE? Already at the first core 
calling ACTIAVTE, or only if the activation happened successfully? What 
about errors in between? What about if the admin decides to not update now?
As the spec doesn't say anything about that, and the ACPI notification 
is naturally edge, IIUC, I went with demanding an edge triggered IRQ.

Cheers,
Andre.


