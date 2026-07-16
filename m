Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A189EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFhc3A2Gj3VLhoCuEB6Vfl4jXl6a5OTrf/QYp31N2CU=; b=uNgy0BgNt7mF965NJ59gzBUuUM
	nKOl6s5o9VUPQXPOpKZj+iAnz3hWQKCYO8cSTJUmoccOD3ONPDWqeJPxBsIdtl4dC7DlhFmaX5Q4s
	P8PSfmjgKdJHqLXJO55tS9F/5F6eR8/1ZMPzqbpzLQrapRT/EZjba8REuIUGhRinGsnQwFxk3yGKw
	1o9ie8S9PDa9Al26uL3+B1OvqK38KuWTGo22YLvsGOupPNmxjyIQyeYpmG/wfQeJ/dmU1KyWZC32E
	26N0+Wtp3ySkoyMlZrjB9EDkozm5X754IpsRtRg9QvMyyhPrnu0ktynI7spCMWqbOm4B9SWQYaSJ6
	yhauEY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkI2p-0000000Gonw-1E3i;
	Thu, 16 Jul 2026 09:06:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkI2o-0000000Gono-0gOd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:06:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DFB360054;
	Thu, 16 Jul 2026 09:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2825A1F000E9;
	Thu, 16 Jul 2026 09:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784192773;
	bh=cFhc3A2Gj3VLhoCuEB6Vfl4jXl6a5OTrf/QYp31N2CU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hknLmDoBW7ss9oL9YXcTCa2ZVl5Qn1Sv0jr3LP05pkNUX7XAOWheD0SyJrBdPxpPl
	 0u4o8X0y8lZwD2OakLJeUhHClG+rbUQjMc2V7pYUP4m+u5IbKk4AZCB/PzgAmKFCmY
	 poNYp/l2QImOFWL0Ne8SQTvf2AByHJ3133i7V37duv1bkX4vI7qwu3XbJNsXxjFNIq
	 NQ5YEHEWDXhbJmRdQ6YimHU0Fu6kSq5KXyEvesntxjPtt04oUlreNEeFtAvYFhcQoV
	 b8QsDw/BwJOUxXsRYSNHKSbSic25UqDo4n7qFxBIR4vb461zsdNhEKrA0fT32YZeyG
	 oX2i0JBvcAp9g==
Message-ID: <01c47287-0168-4416-8116-dc25a48fb05c@kernel.org>
Date: Thu, 16 Jul 2026 11:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/23] Introduce SCMI Telemetry support
To: Cristian Marussi <cristian.marussi@arm.com>,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 sudeep.holla@kernel.org, james.quinlan@broadcom.com, f.fainelli@gmail.com,
 vincent.guittot@linaro.org, etienne.carriere@st.com, peng.fan@oss.nxp.com,
 michal.simek@amd.com, d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
 lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
 souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
 puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
References: <20260703123601.381275-1-cristian.marussi@arm.com>
 <20260707063137.3222972-1-subrahmanya.lingappa@oss.qualcomm.com>
 <alCuJsOgh1ioFHAL@pluto>
 <CAPxK-6cE7QAnMxO843T_MhipsVed=q7M6yQG6q5mAknY+T91kw@mail.gmail.com>
 <alenP8e_2SFtgWw4@pluto>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <alenP8e_2SFtgWw4@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

thanks for looking into this again, Subrahmanya,

Let me add some additional points to Cristian's reply.

> 
>>
>>  I agree that asking this series to grow a generic telemetry subsystem now is
>>  too much. With only SCMI in-tree, it would be easy to create a "generic"
>>  interface that is really just SCMI with different names. I also agree that raw
>>  SHMTI is not just a debug path if the expected users are high-rate tooling.
>>
>>  So let me narrow the ask.
>>
>>  I am not asking for `drivers/telemetry/` in v6. I am asking that the SCMI
>>  chardev/UAPI not be tied too closely to the current SCMI core storage layout.
>>  In particular, I think v6 should try to:
>>
>>    - copy descriptor/config/sample data through fixed and extensible UAPI
>>      structs, not structs mirroring SCMI internal objects;
> 
> If you mean by this adding a bit more of pad/reserved space scattered
> here and there, it is not a problem; also, one thing that is still missing
> and planned to be added is some ABI Versioning and related IOCTL,
> should not this be enough to address future possible UAPI expansions ?
> 
> Regarding avoiding mapping internal SCMI object in the UAPI, I think I
> am already NOT blindly sharing internal structures but instead I copy
> explicitly internal representations into the UAPI fields....I think the
> only exception to this is the sample (scmi_tlm_de_sample) that I take
> care to keep aligned with the internals to avoid the overhead of the
> double copy...but it seems one of the few pretty much general concept
> that I felt confident to abstract no ?
> 
> ...but of course this UAPI abstraction into which I copy the results
> is mapped into SCMI inspired concepts/abstractions...for the reasons
> we said....

Getting the UAPI right and future-proof is certainly the most critical thing.
Adding some more padding to keep it extensible is certainly doable.

I remember plans for having an ABI versioning though, would that still be
required (or could it even be deferred) if we add some more padding to the structs?

Or would ABI versioning just avoid that for now?

> 
>>    - treat DE IDs, group IDs and SHMTI IDs as protocol identifiers, not as
>>      implicit indexes into kernel arrays;
> 
> Not sure what you mean here... a shim layer used to acces info data
> indirectly instead of the SCMI data structures ?
> 
> or some sort of layer/abstraction to be able to remap references
> internally ? again it is not easy to imagine an abstraction without any
> other example than SCMI...or you mean naming issue in the UAPI ?

I'm also having a hard time understanding this.

Subrahmanya, can you share an example of before vs. after to clarify? Thanks

> 
>>    - keep the TDCF/SHMTI parsing and SCMI command handling behind small
>>      internal ops used by the chardev side;
> 
> well..if you refer to the telemetry_ops, this is an SCMI driver so it
> has the structure of an SCMI driver, the Telemetry Operations exposed by
> the core SCMI stack are the internal ops themselves that you ask for in
> my opinion...I mean this is pretty much internal stuff that has nothing
> to do with the UAPI itself and I imagine that when some future protocol
> of yours, like the XXMI you mentioned, will appear you will write a new
> driver on your own subsystem that will implement the UAPI itself for
> your protocols (if you want to share that)...any possible future internal
> reworking due to possible common abstractions on our side can be carried
> out in the future...

Any internal refactorings should be had once required, not prematurely.

At this point it's not even clear when/how/if any internal user would want to
reuse some pieces.


> 
>>    - document the config model explicitly: per SCMI instance, last writer wins,
>>      generation changes tell userspace that state changed;
>>    - document the mmap contract: length, offsets, cache attributes, lifetime,
>>      and reset/reconfiguration behaviour.
> 
> Completely agreed on this...Documentation is still lacking, including
> extensive examples...I should have marked docs as RFC too...

+1

-- 
Cheers,

David

