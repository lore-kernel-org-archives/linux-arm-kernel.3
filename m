Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C13C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpwqSNruxdEe6Tj6+x/b0+t0/YgQGS7L4fW77qV7xuo=; b=1cxptI1UsrNBeimSLQVn/6KSm3
	cXUmC+LMR+B99Vp6lCCcBapbxjBzV9F+TKZe3JcvbvcKLx5Q6exfQ5kE4o/b4wDi/bPtBTlBu72+T
	9Km6bhrPYdiJt8VnRNkpgKdqgkZcpmsEVeKe8xXMFvgMA5tG8pQdvpn+1IlCnRqZyEfDRgIV+Y8Dn
	DqLj2oOFbOoUDPUvfyoIw3zLDfqUQudkP3Mszh5anctSWwWne5bgcgJ5r0GeBSljFcbGjgdbLxFhx
	ysILa5py9I1hEXTGgbB47uXo9tE3eEswxU0VZeIaKjb4Ns3s2VuHkN7IGbar9asHhuZFYesoDTcVb
	DsEZEDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd1t-0000000C9Ah-3UkN;
	Tue, 14 Jul 2026 13:18:33 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd1r-0000000C99k-3XGv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:18:33 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4h00HS2tQMzKw4Z;
	Tue, 14 Jul 2026 15:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784035108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpwqSNruxdEe6Tj6+x/b0+t0/YgQGS7L4fW77qV7xuo=;
	b=YimZB6JVxxClVkukBv8d0EGG0tg4ASzL4WYGXIInUVeEu4ob3M/rQ+OqY3ggBP1wM6R2Lf
	Hvi/a/LJfy0mjwUOjW/IqoJy0YBy8op2VOdNfgCg0UQoFIQNPHh5cJNauMq8MzGRgW9iX9
	7H006OqG4fbmU53qW9SitP6AYRtK6DOky5vsAkwgbQsykD+elhQOvroD4PCGqbXzZ24Xlo
	2QYTzsqoHcbWzt7wLDRMcuEgNJEF3SMv7Q0Lqdvr/cK1CWMdIEM+jiMe4Z1RRJAm7SkWaN
	SkKN2lzquz8grEBTSXQJ8YgNR8fIoK4yzNcrK4mPK41WerKIUIJC4rJpL9I7Ww==
Message-ID: <47bf010a-622d-4978-834f-de3e483b2990@mailbox.org>
Date: Tue, 14 Jul 2026 15:18:23 +0200
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-pci@vger.kernel.org, kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260713175400.GA1258926@bhelgaas>
 <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
 <CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 4790a4a28d19f015309
X-MBO-RS-META: mbz4dnndw38hnzbsotnhrof5d7tigzxn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_061832_044404_E51DD59F 
X-CRM114-Status: GOOD (  12.51  )
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

On 7/14/26 9:54 AM, Geert Uytterhoeven wrote:

Hello Geert,

>>>> So in the end, it is either this patch or limit the build to
>>>> arm/arm64 . At least this patch still allows building this driver
>>>> with more compilers on the various build bots, so I would opt for
>>>> this patch here.
>>>
>>> I like the build coverage, but duplicating the #define doesn't really
>>> seem good to me.  It makes readability worse because cscope/tags now
>>> sees two definitions without an obvious reason.
>>
>> I can rename the macro, or ... sigh ... I can reduce the driver to build
> 
> That would obfuscate the code?
> 
>> only on ARM/ARM64. Which one do you prefer ?
> 
> Just add the dependency for compile-testing, just like
> PCIE_IPROC_PLATFORM does.

I will send a V2 shortly.

