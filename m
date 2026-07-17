Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B56EC44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymvy/Qu6IufbtJ2OYFKCXViCLO4cAmRswHnBu7Hf5lQ=; b=3nIhEqKaUy/rp4wLj/y6af+npd
	SFuWu+1OKSuKNm+P6oA+cPXILR2iimSf0rdT+05uUR9TeD6VkGRSQiWyCf13IoOyPkzB9b4UnQH29
	zXVZ/p94APYAGXu2Yw3QTYvxATgcm8HcPZNyoftDYoJG4pJe5Y/0A/e6pG7t8nEE7sh3IBUZ7OPmU
	o4MxKlP7XxHWpZKGXH0ep2C8OhCd4GSC5eniGPFKx6WeJ3+wI2h3IC0H/v8n0cfdv8hQKlRfqbAQb
	24ti64fGyniyrOcRROj2+W9z7e64NtoG0UxQbSISSJ4363psgst+sKL9W0mDKPt2JbCsv0Cvdy5AV
	jtbuV5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhkh-00000002IQR-2aP7;
	Fri, 17 Jul 2026 12:33:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhkf-00000002IPy-0FI7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:33:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A85021476;
	Fri, 17 Jul 2026 05:33:07 -0700 (PDT)
Received: from [10.57.84.220] (unknown [10.57.84.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 467C23F7B4;
	Fri, 17 Jul 2026 05:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784291591; bh=RDpVVg8kFR8tLzOuRdIhEL58jET3NKRROOt/Z0gxSao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hMWp8GwJzRF5UZIO7llWHBXTN/HLu31bPfKJMWbDqFPVX/ABCDP7Uv8E3nfr/pgz6
	 mz93o+2LPGP9NgzF7GOkgmnMKpHPVuOlv83VrSes5m+va/CFG+etb0rtKfkR6zbW0B
	 a1EOO8mqxjWKsUm2Nf3s27A0ZKvy/CA6wT5MW1T8=
Message-ID: <a39b2bef-8fb5-444d-8ab8-3882224a3311@arm.com>
Date: Fri, 17 Jul 2026 13:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/8] Arm Core Local Accelerator Driver
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jean-Philippe Brucker <jpb@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 oupton@kernel.org, hch@infradead.org, jgg@nvidia.com
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <aloS_T3LQvpHeZUV@willie-the-truck> <87ech1rf6n.wl-maz@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <87ech1rf6n.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_053313_165995_4F456777 
X-CRM114-Status: GOOD (  17.04  )
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

On 17/07/2026 13:09, Marc Zyngier wrote:
> Thanks Will for roping me in.

Sorry - I intentionally didn't include you because last time we spoke you said
you were only really interested in discussions on the virt side of things and I
didn't want to spam your inbox. Perhaps the wrong decision...

> 
> On Fri, 17 Jul 2026 12:33:17 +0100,
> Will Deacon <will@kernel.org> wrote:
>>
>>> I'm deliberately constraining the scope to bare-metal support for now.
>>> Virtualization is something we are considering (and have prototyped), but plan
>>> to post a separate RFC for that as follow-up, once we have agreement on
>>> direction for the bare-metal driver.
>>
>> I'd actually like to see what the virtualisation part looks like first
>> because doing it as a bolt-on later feels like the wrong approach. The
>> structure you have at the moment is remarkably clean, given the
>> architectural/CPU interactions (this thing even apparently builds as a
>> module, nice!), but I'm unsure how far you can push the separation once
>> you need to start hacking at KVM. Maybe the MMU notifiers are enough,
>> but I can't tell.
> 
> +1.
> 
> Virtualisation cannot be a "bolt on the side" exercise. It is an
> integral part of the arm64 tree, particularly for memory management
> and scheduling, all of which have a direct impact on KVM.
> 
> I don't think we can really evaluate anything here without looking at
> the full picture.

OK understood - as per reply to Will, we'll prioritise doing a version with virt
support.

Thanks,
Ryan


> 
> Thanks,
> 
> 	M.
> 


