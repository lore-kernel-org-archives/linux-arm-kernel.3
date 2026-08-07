Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0B9C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ju7RnRq+k/paTJJQnJ4wFhHYcKti9rbeLUqp6cbspV0=; b=VZCrbftEVAhcSsjyx3D7ICXxh7
	kcoo6Te2VXD0tByhX5KJumks5oQez6kOYmloeQ6RMi3IrZCeJDOzkV9GGvV1TD9OXmqzf280DQLGC
	qHw1NhQdKtP3uHs/ftPMLHfXi9Y/XO+nAprylfbuoJNytliKkhiMET4HfhOiWG+9pbkUQ0MmE7rrT
	tIIvu81suI2pYKZUIoi/VrB60pZ5Na0uaZyMbpIYgmHu3SENVWLsMQLXba+YNuLTTvwsHvGUfT8kw
	sSzLw7jEY3uSJ22sfSmLwz8R9DaqdjNItjCOSx9vvCaWs/gShYwbzn/M47x9qLqDepePhhVYIR4XT
	LlzHi+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL3k-00000008CPc-1rbR;
	Fri, 07 Aug 2026 13:56:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL3i-00000008CPQ-3Be2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:56:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F076360A6F;
	Fri,  7 Aug 2026 13:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C51A1F00AC4;
	Fri,  7 Aug 2026 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786110985;
	bh=ju7RnRq+k/paTJJQnJ4wFhHYcKti9rbeLUqp6cbspV0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=EMbxb3v7XMe+wJ7m33vfflWCirm9BYjUUeexHFCM1HhM60j96jIDHOMRzWox53rEf
	 LW+WA5jez6QoMliGtCsm1R/Ir8YlIQ68XIMxrsfS6GLU5JNtYQQU9W3woJbK+zk34Y
	 /3uTvUd9FQz60ONdCIf5jBv9xijS+kN3/ND1QC2PpnqkZ0r8oPUNbtpX951Mjid1tx
	 +uMDJaSoMpzbDzRdfXGW6qJ6LP+wMRiZ0+urFNpblGh0WZVq2Iw/1APnAaIX7JGx8Q
	 zNhU6FEqKxI1qc5f9vgtfkgfgcsIeM2TTPRgkRpSdjQCh8XkfnIupKuVgA7HKC1mRD
	 DJs/Nqbz+i62Q==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 897161980060;
	Fri,  7 Aug 2026 09:56:23 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 07 Aug 2026 09:56:23 -0400
X-ME-Sender: <xms:BeR1akGVGsC3Ch1TBlhFrJK-pwnLrQ-yyh9daiTuH12ZvvVR1wws-Q>
    <xme:BeR1aoLG5H5Mw3-EDZBum7CLlfjse8j4hM8lJdG_7ZPQQgWwu5SyB0wKENV08anJT
    YbQ7VF15Yxjl_1d0H0AlZE-V7fFtAs5sR9YLOLlc6McA2IoSLgBoG2R>
X-ME-Proxy-Cause: dmFkZTFoi/FfTpwWxN1L7rzjkmioo0gHL67DDBJGGutW8A0r/xwmyy545V0359GA+WZcWA
    6HttZcQ24FDbdXsTyRd0gs4bv7mtViNxw+CgPi0ZVzfd2mz5Adz9I3IIFJ4ebpL5dYOCei
    9u5vXyUc3NoD5aueo7v5RIVkFoHYfpRU4kROdQgCkhRaEHBZD0QS9+O/+U/U3AKiz9h44N
    f6W4s22gTJWhrhi8UUnV+XQjfd0rdaQoAt3DVAJw5EiFWr79wMbMvjBFBgR2NOKXU/bSI1
    e0akCaB9PYxyCUg6JZ/sbAbKxV/nMCdP8Ial4dVsvwM1Dy0Rlh3Vv/3ywXAHtMpYQbuMgy
    sp0LqNE3QW2MYjT5EbYKRgSW6U7NBwlOhAje+zuXU6nHkWHIgWLW/XRppq/AacvdZdKftA
    hFM/DVrKPaqNlfZH71hNU70gpQdl6Pdyt5LlIM65XIGCHTpeEhg1B7oljqeAXs7yjJxC06
    N4mhrvzoVdcfoiVM9g4a65MaIhW8XRqs8SE8KwDZiEzojKQqTQJcbMCs6btD9zstnKWmvG
    SRuezJpeF4mI7xju9VCiFT5IfFZHArTPSNAY5GbophIc1Zn3CYka/AG2ZhbTQ707ECUJD/
    wX5uGj7yi5i9CP8SG3hNmQnSVGpxVXG6yZh6sujR0zjZsMq0ah0Hm4SBDw8w
X-ME-Proxy: <xmx:B-R1aoie0F7-_rYri2G13iXWIJUkKz930XZXlt9e54aQF-BkGwjp5g>
    <xmx:B-R1al9lLvAvH1EmDV_LZZxywUM2y6uRU2hdnJ-5x4VLyMlU_so58w>
    <xmx:B-R1akWz6EmMejLKTKAhdesC9zxDvkyDYe_sCO5VvKi_qcu-NDqmRQ>
    <xmx:B-R1apAIYrTG5C6kKDStoJxQSlzRCOwweIpUA1wrlCC9U068q67oiQ>
    <xmx:B-R1apEBNm_xkSKPIQ_qXFYfTAmdEKjsRlrZbYg_3xXeLgKFqb1iquo1>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 63221F80064; Fri,  7 Aug 2026 09:56:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 07 Aug 2026 16:56:00 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, "gus bourg" <gus@bourg.net>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <30c5499e-8041-4e39-933b-c5220d53be77@app.fastmail.com>
In-Reply-To: <anXMug2_-vZl_pZ7@willie-the-truck>
References: <20260806000144.3388823-1-gus@bourg.net>
 <anXMug2_-vZl_pZ7@willie-the-truck>
Subject: Re: [PATCH] arm64/efi: Do not call EFI runtime services preemptibly under SW
 PAN
Content-Type: text/plain
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



On Fri, 7 Aug 2026, at 15:16, Will Deacon wrote:
> On Wed, Aug 05, 2026 at 05:01:44PM -0700, gus bourg wrote:
>> From: Gus Bourg <gus@bourg.net>
>> 
>> When PAN is emulated by switching TTBR0_EL1, arch_efi_call_virt_setup()
>> installs the EFI mm into TTBR0_EL1 via uaccess_ttbr0_enable(), and only a
>> return from exception ever puts it back: check_and_switch_context() skips
>> the register write by design ("Defer TTBR0_EL1 setting for user threads to
>> uaccess_enable() when emulating PAN"), and __switch_to() does not touch it
>> either. switch_mm() updates only thread_info->ttbr0.
>> 
>> Since commit a5baf582f4c0 ("arm64/efi: Call EFI runtime services without
>> disabling preemption") the runtime call is preemptible, so the EFI worker
>> can now be scheduled out inside that window. An involuntary preemption is
>> harmless, because __swpan_entry_el1()/__swpan_exit_el1() save and restore
>> the state around the exception. A voluntary reschedule is not: it performs
>> no return from exception, so the worker resumes with another task's
>> TTBR0_EL1 - or reserved_pg_dir - and the next efi_mm access takes a level 0
>> translation fault.
>> 
>> There is such a preemption point in arch_efi_call_virt_setup() itself,
>> immediately after the TTBR0 install: __efi_fpsimd_begin() ->
>> kernel_neon_begin() -> put_cpu_fpsimd_context() -> local_bh_enable() ->
>> preempt_check_resched().
>
> Hmm, can we move the ttbr0 toggling until after __efi_fpsimd_begin() so
> that this preemption point doesn't interfere?
>

Either that, or tweak the logic so that the switch is done eagerly in
this particular case (untested):

--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -266,7 +266,7 @@
         * Defer TTBR0_EL1 setting for user threads to uaccess_enable() when
         * emulating PAN.
         */
-       if (!system_uses_ttbr0_pan())
+       if (!system_uses_ttbr0_pan() || mm_is_efi(mm))
                cpu_switch_mm(mm->pgd, mm);
 }
 

