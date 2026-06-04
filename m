Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6334CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 09:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h32UZ5HZFbLbTSLtdvm/gYQOt7Gn6obLad7jKFKWu5o=; b=eV534zZh7GyCwDY03Myug2rYx+
	EJL2I6Wfhhurj3WwetjEGb+dIVRxjG0hVog/DhPX0IuyOPV+nGu5ih34fBMy1fSRvZ0WCIH8vIUR2
	lzinOgJeTssVeLeW+RfnGFjEpf/6MVw5tNMu9phj88IjYvVdHSca0MiHoPTW59UR6wazo0tCNUJky
	w9vZHLimA+JKy11OTonnjAqYiS1qaqCbXbmbEMiVDkKda5O/IxAJoueTngrO/lcgMddDKGHpR2uHU
	S7zlVkS9n5WfgqWomM4AlknEXVeOXJ5e8z0y8mNrOlEvfT9ex9DHf5uBRUQCvhRPfL0upV9MN1Qla
	w+5uk/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4ap-0000000GWLF-3suw;
	Thu, 04 Jun 2026 09:42:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4ap-0000000GWL2-0oxR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 09:42:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0480443AA;
	Thu,  4 Jun 2026 09:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAB21F00899;
	Thu,  4 Jun 2026 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780566146;
	bh=h32UZ5HZFbLbTSLtdvm/gYQOt7Gn6obLad7jKFKWu5o=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=hPgDBCekiKpW4vsoiNUg34hBRJItnYz49diVbmcIBJpGeSORVpPZ1IJVJQyrBbI0C
	 m9W5WEjRZuinWHEA/Df+lZxy7p8KLJRqPuJDs4v89R38xmJMviOUN5V38PSIMwY3ZA
	 KjMIP4aYw9jFBTnbewd5FOmEJBzVp0dQzbwg9EfDLTGW6QdrXWsZ48pnTRY6d9Tsri
	 /ywOxUsm/lwonGGlxl16DjPaFXxb381A9ZXPUPsHUnS9b8bzsZW1A820g64JGbrVNa
	 aPsyVTx58Iys7utRCu8fc2acm7xORzZNKGPiVuNf9pRlahmWwoqnfjLHN0lcO5j/yJ
	 Eu86kCiBLaZtA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 918AAF4006C;
	Thu,  4 Jun 2026 05:42:25 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Thu, 04 Jun 2026 05:42:25 -0400
X-ME-Sender: <xms:gUghaubucraqB0dJvmV7PBFH8TyMG-dPUY_bKatFhicuCI5nxZhweQ>
    <xme:gUghasMvKX0WjFWvGD2wsbsnCSiG9Nq_OvVP81Vn98AzRe_REQbCMz1k_2ZHi4GeS
    mLQpImIX2fqFJwGBsmnXtrd918klAWLX5v1Ri_UKKgNojmfOYU2yFU>
X-ME-Proxy-Cause: dmFkZTEWK7AzM/IHw7L3c3dp0bgYN2sBJkCGo08+s4CDuaXVnB8mYhhT5VbvTZTRiVTrCo
    iuSi7yFaAWIzhOubRbRREFZYkC5GbFYW65UVJoor9RUs0Vv7OVCRXeDaY2E0kV+FEY+WKl
    OO6nE4EcOfJpKtYNdIBbD6w7mJgmGYno/gYPzIo9+WOk7SGSMB8PskMZpYZsvMgBrqf8Ro
    WgvuZrR1JCIQsrKUU+Wi+1BFPf774ZqZtgnx7sUFBQXD/cL9Wg99LXtupDGkmP4oa2RQXE
    aS5pfa4Dj6IrN/IgAIVPqWS7SvdMTtSm2ZxU9XqFO6ojpPqHhlZOIMdXNPcV0OvxZHAvSo
    D3OMxYdGKd8fESQ4IKkOW9PX6I6BAcVkVswbSCnfEEF/vBUMAUx/PnEkVQuUM4qBgZp69z
    l9iNRTn9CEGGZ7oKWwDUSQsaBg3ryCbiP8DylLsimqulotXc+g2MYsVknxpf+IFKTtujuA
    nyMbLehAq1G9KtFGeglSrqu/FO998tUg527k1wlsiYKjr5Vp/EwM9ItRmt8PVAk85kAH3E
    JUNoTzHg9iWmGNCSLWeML5XiqZMlKvV2TSqqtQVemCybBZrKMCCklABTS53YiNzZAJ/Lux
    Tg1WsqO7FZUEQIS5+u3EjaPgdUlmb+GK+j9HAOupQvHocVY1155XBTDTxIig
X-ME-Proxy: <xmx:gUghaprJlMeHvjUo_Ay4xK-zdfR0aRkxumO0Nu9_P6WGjw1llUu8NQ>
    <xmx:gUghasHoEx_TCDWXWFHACKNj1pzYHo7fnspwoy3nwyU6dTzBJ5kxAw>
    <xmx:gUgham58itfYYvsNYq-q6becJ2UcOiZZUxOF9DHlRi8pO0oY29ufgg>
    <xmx:gUghase19cIdkCYNSqryy2s9PAK6Lyu-Oa9MFuMSgGfoJKBYZ6ZCpw>
    <xmx:gUghap5oCV2pOkN8y0T925Fs5LmDTnGL8FDjvBhdBhkaGQzGA5JOCYnq>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 673161820082; Thu,  4 Jun 2026 05:42:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 04 Jun 2026 11:42:05 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, maz@kernel.org,
 "Kevin Brodsky" <kevin.brodsky@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "David Hildenbrand" <david@kernel.org>
Message-Id: <183c8a1e-abb7-4a2f-8e97-e161af4e4fc5@app.fastmail.com>
In-Reply-To: <aiFDFbeOoxgKigP0@arm.com>
References: <20260603160949.3372482-6-ardb+git@google.com>
 <20260603160949.3372482-9-ardb+git@google.com> <aiFDFbeOoxgKigP0@arm.com>
Subject: Re: [PATCH 3/4] arm64: mte: Disregard the zero page explicitly for
 manipulating tags
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



On Thu, 4 Jun 2026, at 11:19, Catalin Marinas wrote:
> On Wed, Jun 03, 2026 at 06:09:53PM +0200, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> The zero page is conceptually immutable, and will be moved into .rodata
>> to prevent inadvertent corruption.
>> 
>> Prepare the MTE code for this, by ensuring that the zero page is never
>> taken into account for tag manipulation, given that those actions will
>> no longer be permitted on the read-only alias of .rodata in the linear
>> map.
>> 
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>  arch/arm64/include/asm/mte.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
>> index 7f7b97e09996..093b34944aee 100644
>> --- a/arch/arm64/include/asm/mte.h
>> +++ b/arch/arm64/include/asm/mte.h
>> @@ -80,6 +80,11 @@ static inline bool page_mte_tagged(struct page *page)
>>   */
>>  static inline bool try_page_mte_tagging(struct page *page)
>>  {
>> +	extern struct page *__zero_page;
>> +
>> +	if (page == __zero_page)
>> +		return false;
>
> Better as is_zero_page()
>

True, but I was concerned about #inclusion hell.

>> +
>>  	VM_WARN_ON_ONCE(folio_test_hugetlb(page_folio(page)));
>>  
>>  	if (!test_and_set_bit(PG_mte_lock, &page->flags.f))
>
> Some form of this fix should have:
>
> Fixes: f620d66af316 ("arm64: mte: Do not flag the zero page as PG_mte_tagged")
> Cc: <stable@vger.kernel.org> # 5.10.x
>
> The current mainline assumption is that mapping the zero page in user
> space is always mapped with pte_special() and we skip the MTE tag
> zeroing (and PG flag setting). However, the above commit missed the KVM
> kvm_s2_fault_map() -> sanitise_mte_tags() path and we don't have a form
> of pte_special() for stage 2 mappings.
>
> I'm more inclined to go with a specific test in the KVM path. It matches
> the stage 1 where we skip the actual tagging. We could add a
> VM_WARN_ONCE in try_page_mte_tagging() to trap future changes.
>

Let's go with that - I'll turn this into a patch for v2


> -------------8<-----------------------
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d089c107d9b7..445d6cf035c9 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1479,6 +1479,11 @@ static void sanitise_mte_tags(struct kvm *kvm, 
> kvm_pfn_t pfn,
>  	if (!kvm_has_mte(kvm))
>  		return;
> 
> +	if (is_zero_pfn(pfn)) {
> +		WARN_ON_ONCE(nr_pages != 1);
> +		return;
> +	}
> +
>  	if (folio_test_hugetlb(folio)) {
>  		/* Hugetlb has MTE flags set on head page only */
>  		if (folio_try_hugetlb_mte_tagging(folio)) {
>
> -- 
> Catalin

