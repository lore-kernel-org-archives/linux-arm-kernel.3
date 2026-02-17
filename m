Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFE2E68172
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msnOE9yFLZfvQMIWKQ88JQI86G4idb63ZKoMwW6OVA8=; b=OzQaakHA7H1B3OMOpIrpQ1ugTV
	IX0bFX6n+i0xphan/e3/XUTFO+k4BqzZNiQBnfpouMLL0kmT/UEcaZDshOFLiXkZj7hMrExWe19IE
	Jth62Oope1QSOd2BsHyYO6rAhL4ZldWDREcBjuZCqbThLNQHUAzN9hMAZ7tAgHIqG//VUq9zYDHNU
	O9ltcgNGDor8xEJt3Qp5Agobrj2B1PmycE6igwLF067GTJJhr/5GMePra++fJW2VC0dsCC5lAfHsr
	It+oXsnjYv7AEL02+a4zLBPKZa7/YENs0ak4Q/Wreb92TmJBBqqg7nWUdci5vz+k+aBFLaAFsbpGn
	fqOkvYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJIJ-0000000881h-2xiY;
	Tue, 17 Feb 2026 11:31:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJID-0000000880w-1a8m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8178A43254;
	Tue, 17 Feb 2026 11:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3680C4CEF7;
	Tue, 17 Feb 2026 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771327860;
	bh=MoBw/M7yTwvIYgJNMf0Ti215ru/rCJSxdxH12EyqkRE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=rt/124FKXEMGsB7bD25BXeYp95XUgGbseWipfUuWLdZOOZv405e78t0W+h0fgRmj4
	 YGaOj0k5U3kXOJ8POmrF8zq9+tRd1rzKeealx4/oyEtCYMKFjaOQy0bLiYv9dgthNj
	 k4cOojt5hzgOT8W6nnPRuAmlMwK/pcQ3ff+Wc5zE4d3opZd2L9oYUTQGiIc1s7i3LY
	 uQXVc+SKy7IPRlQHBO661E9vZSwLzckiQcdZt9511KNara9sGhuEAIW4GLhHUOd0zf
	 iGPgutV6HBhq7zgB9aw7KJ8XQmcYwR6sR1FGq1HNxIOseh1EKtILCdUD882SXogm0o
	 BiVHl2E3Aw1ng==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id EF2A7F40068;
	Tue, 17 Feb 2026 06:30:58 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 17 Feb 2026 06:30:58 -0500
X-ME-Sender: <xms:clGUablUvze5eKNUulZ--y_zP_LHYCe-ldwjYWGPjbIekxf0v2wJ3w>
    <xme:clGUaZocsAbWZ01UisRnjsktu6sKxYdGikBJUzbRpAePVTIYCsO2hyR0qkKgO8mm3
    oCnzM-VNV_OAmZkK8qwA-XoMv9SE-vO4N-NUP3TLTmdRlqv6ytTQjrp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudelieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtph
    htthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepihhlihgrshdrrghprghlohguihhmrghssehlihhnrghrohdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehoshhsrd
    hquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdq
    mhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopehlih
    hnuhigqdgvfhhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:clGUaUkeeLE4PbdNc1DmTaiXFcMcPqjjjHHfjg72dotE7YGG0GtJQA>
    <xmx:clGUaQZiciyB-9njMfRazOBx0CP3QiWhEuh3zjNEaz11jAtGA5AUVw>
    <xmx:clGUaXFZ87XFM_x0qiGwPQKDnvt7hXejvS9Bp8LOxOk3r4hKWv3DtA>
    <xmx:clGUaXacmb1x6AF7Vj0RhOabaaxvRjzzKKh98j5tg9rxgZ5Po0cY5w>
    <xmx:clGUaTx636mfQpbU1SNYFwMI9HGSvcHYQuJGZOf35EwsIX-xHYxjkFyN>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C9718700065; Tue, 17 Feb 2026 06:30:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AEQLpXAyzQ_-
Date: Tue, 17 Feb 2026 12:30:38 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>
Cc: "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, linux-efi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <93de9e85-faf1-4394-a374-f9207bd823c7@app.fastmail.com>
In-Reply-To: <5823f778-d422-4190-99bf-d66ffa437f6c@oss.qualcomm.com>
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
 <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
 <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
 <5823f778-d422-4190-99bf-d66ffa437f6c@oss.qualcomm.com>
Subject: Re: [PATCH] efi: stmm: Constify struct efivar_operations
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_033103_713837_3F38F7FA 
X-CRM114-Status: GOOD (  16.58  )
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



On Mon, 16 Feb 2026, at 12:07, Krzysztof Kozlowski wrote:
> On 16/02/2026 11:43, Ilias Apalodimas wrote:
>> On Mon, 16 Feb 2026 at 12:33, Krzysztof Kozlowski
>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>
>>> On 16/02/2026 10:49, Ilias Apalodimas wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>>
>>>>> The 'struct efivar_operations' is not modified by the driver after
>>>>> initialization, so it should follow typical practice of being static
>>>>> const for increased code safety and readability.
>>>>
>>>> get_maintainers doesn't include me in the cc list?
>>>
>>> I use only get_maintainers and as you can see no. You might want to add
>>> yourself as maintainer of this driver if that's your part. Or have
>>> korgalore/lei filters.
>> 
>> Hrrm, that's weird. Running it locally returns a more extended list
>> which includes me and Sumit Garg.
>
> You might be using git fallback, but this is not a maintainer. It shows
> random people either involved or not involved (like cc-ing me on half of
> kernel drivers), thus it is not recommended for daily use and all tools
> (e.g b4 or personal scripts) do not use fallbacks.
>

The code you are touching came in via a different tree in the current merge window, and so this patch doesn't even apply to the EFI tree. Those 'random people' are the ones you should have sent this to, if you had taken the time to look at the history of the code you are modifying. So please don't lecture other people on how to use the tools.

I've queued this up now - I'll send it to Linus by the end of the week. Thanks.




