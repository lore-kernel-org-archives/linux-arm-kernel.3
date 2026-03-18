Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1723B10706ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1zjxHeHTb4trDm2/L79bBPANq6xqVwqdU3EGuv0aGE=; b=D/Q3KkFsuqx4t6
	ceXkBKnGogJ6rH1jWscRdPyWaFLk6CoETdgwNFFzvprkwdPHb7/EvwvB9c78tTbRks/TEUWDT744/
	KTgNnppVfjEFXBFNEq91ElbaCqRjHt1h2oeMTnfv4PvYFaYcX2BR96rYRi2TdlNesgkYdc70pmq8/
	ExLx5hSOfvdQpUFTzfknGNBUXQze7WwBd8Wjfyn2sdhHKz5iaXKXLUnKSKKJLlzIMzcKZMJbgXUnh
	zaZn/hr1knvbuQLg1oa7r0T3ttl/uuGQN7gkxfLE6YKZlea1/MsGwTmYVQVOSRp3zTfyZDWqbRf/N
	AcE6bH++i7U0K+21sQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tKZ-00000008sHC-25Dr;
	Wed, 18 Mar 2026 16:01:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tKY-00000008sGW-06qV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=f1zjxHeHTb4trDm2/L79bBPANq6xqVwqdU3EGuv0aGE=; b=owtDRiptuugxeNZQNd/N6mebdF
	1tbH2INKzbkzF3l+GWjfH3f5S+hc1S0LBCIriEzf5KUEXB5PMxgZhwd4dQLWIbLcI4ShY8vfSfcy6
	5JB5zgN+HUkPesYfgHe7tbiCJbxjJl/UELYuddIGWH3b2fKUrSfs506Qy+NrM8kLhL4Vtsje2u1W9
	MyvkJJ76XiKKrYfGcPN6URnYDUxcLWA2Nb31qhCpsKqL7zgE6iUrn09ugDfYbpp/3GgXrJ0gTrCgJ
	D6IUmCB29huPvVfYX+ytndHkpO6aXZeICqCrxtDuIMSAOIoTHGwAfD9z0mydp9dp91IHoQ23H0lgV
	2DIOpwwQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tKU-0000000Beps-1Ffj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:01:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75B7D1A25;
	Wed, 18 Mar 2026 09:00:58 -0700 (PDT)
Received: from [192.168.178.23] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F200B3F73B;
	Wed, 18 Mar 2026 09:01:00 -0700 (PDT)
Message-ID: <73a2e7fa-ab30-4d81-a4ff-0292b6adf346@arm.com>
Date: Wed, 18 Mar 2026 17:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: arm: Add Live Firmware Activation
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
 <20260317103336.1273582-2-andre.przywara@arm.com>
 <20260318-inventive-tortoise-of-romance-c7ceba@quoll>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260318-inventive-tortoise-of-romance-c7ceba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_160106_652881_C9C08DEE 
X-CRM114-Status: GOOD (  25.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, vwadekar@nvidia.com, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 3/18/26 09:04, Krzysztof Kozlowski wrote:
> On Tue, Mar 17, 2026 at 11:33:27AM +0100, Andre Przywara wrote:
>> The Arm Live Firmware Activation spec [1] describes updating firmware
> 
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Sure, will fix.

>> images during runtime, without requiring a reboot. Update images might
>> be deployed out-of-band, for instance via a BMC, in this case the OS
>> needs to be notified about the availability of a new image.
>>
>> This binding describes an interrupt that could be triggered by the
> 
> Describe hardware/firmware, not the binding.

Right, sorry, this slipped through.


>> platform, to notify about any changes.
>>
>> [1] https://developer.arm.com/documentation/den0147/latest/
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   .../devicetree/bindings/arm/arm,lfa.yaml      | 45 +++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
>> new file mode 100644
>> index 000000000000..92f0564fd672
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
>> @@ -0,0 +1,45 @@
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
> 
> Does specification has a version? Does it support version discovery?

Yes and yes. there is a mandatory LFA_GET_VERSION call, with major and 
minor version.

And please note that the discovery of the firmware functionality doesn't 
rely on DT (or ACPI) at all - it uses discoverable SMCCC calls instead. 
We just need this DT node to convey the (optional) platform specific 
interrupt number.

>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: notification interrupt for changed firmware image status
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
>> +        arm-lfa {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
> 
> arm-lfa is specific, so this could be as "fota" or "firmware-update"

OK, will try to come up with a good name.

Thanks for the review!

Cheers,
Andre


> 
> Best regards,
> Krzysztof
> 


