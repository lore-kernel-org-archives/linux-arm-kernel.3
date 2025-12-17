Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FBBD65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pe1xhCfBGTHof4k+PvXrA2skCjTZw9Qyy+YRETzkeG4=; b=3Ela3BjRzlU9f43bjNyWxAdUcQ
	9wwwvRWsR5N3ocUknnrk88hFpPG1+9lZrV2p8C1UqRV9vKB305pI3D/qXNy4Xiei+4ZOf0+yXVkhD
	ky6Q2g1lu5h7LRnCAtsyeC+Bnb4UgXC9XxSMRdbMuSGEhPNfLZrwtrkZL93OY3vs0yLWfcu9XI3rQ
	5uO5qI4g1Vu7SU/Qiw7LDFbq2zJmWMkDuiuhyILMmAuVk9Pejhsd0cMSMHLoVvOkQfTaTW4fV7/7a
	Z/bqNMKNX50uKBLucVuNQOOqrSxCygmMHZgTnxEuPvTByYD++Odtb982jA6Rya6pIxO1VbxW1jna0
	3aLwAQAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVveh-00000007EBY-0e0t;
	Wed, 17 Dec 2025 17:49:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVved-00000007EBD-4BWl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 17:49:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B156F339;
	Wed, 17 Dec 2025 09:49:31 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC7783F73F;
	Wed, 17 Dec 2025 09:49:36 -0800 (PST)
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
Date: Wed, 17 Dec 2025 17:49:27 +0000
Message-ID: <20251217174933.1938909-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cd04e23a-9523-4d25-8240-29a0dffa0e75@kernel.org>
References: <cd04e23a-9523-4d25-8240-29a0dffa0e75@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_094940_080031_2DC52B38 
X-CRM114-Status: GOOD (  19.10  )
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
> What is ras? There is no such directory so some description would be
> useful. Usually you do not get your own directory per binding.

Would it make sense to move it under `Documentation/devicetree/bindings/firmware`
and expand the description so it spells out that
Arm RAS refers to reliability, availability and serviceability firmware.

> Do not describe what the binding does. Describe the hardware or firmware.

I'll reword that section.

> Again ras - what's that? Your patch or binding must explain that.

I'll add that explanation to the description.

> Why is this flexible?

Some platforms only expose the CPER status buffer, while others also expose a
doorbell that firmware expects to toggle before writing the next record.
I'll keep `reg` at 1-2 entries but make the description clear about which
region is optional.

> Does not match reg.

`reg-names` will only be allowed when both regions are present,
and in that case it must list `"status", "ack"`
so the entries line up with `reg`.
If only the status buffer exists, the property stays omitted.


> What OS is doing should not really matter. Either you have the interrupt
> or not.

I’ll trim the wording so it just states that firmware
may assert an interrupt when a new record is ready.


> That's OS policy, not suitable for binding.

I’ll drop `poll-interval` from the binding and let the driver fall back
to a fixed polling interval when no interrupt is wired.

> This is implied by the compatible, no?

I’ll drop `arm,sea-notify` so the compatible alone defines the behaviour.

> Drop all this.

I’ll delete the `allOf` clauses once the policy properties are gone.

> I do not see any schema referenced.

I’ll switch from `unevaluatedProperties` to `additionalProperties: false`.

> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).

I’ll rename the example node to `estatus@fe800000`
so it describes the firmware error-status block rather than using the driver name.

> Use proper defines.

I’ll update the example to use `GIC_SPI` and the `IRQ_TYPE_*` macros for the interrupt specifier.

Best regards,
Ahmed

