Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9020AC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuC27taB2IF/lU1JfOMklqbdMtf+CtnMNlFmlDqS2xk=; b=jBn5A1fO9lFrrJoJiti5ncWRMJ
	X4bsIpexi4xU5VtWUCvDMBilbhyEUqYsX8PLMFLQKHdDtpkKKETNfnIG/0lqqQzddMWmlWyUvq0Lc
	ifAgDaty+usgvedK/jswXvADqWzE3qlJ3tfXlDa8l0Lu5J3p37a5RaCwEO00LlT4W8B4ARaUhRQbu
	kmRD4X++fn9ay30I3BwvVH8GouZ+tLUpL4U5F8ENlt2LO+Kul+MUBCFcBpWFFSma59L9MC3NuL2/o
	M5xAZ1uSEtJ+QyZxB1idyXoa00dYd0Ulj57tQCAgRC7emZGGRRphLu7Y2rHdk7UTb2KLfwCvXa0pt
	DlSEoVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Rpd-00000005vaJ-2Djy;
	Mon, 07 Sep 2026 05:23:49 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Rpb-00000005va7-32Y0;
	Mon, 07 Sep 2026 05:23:47 +0000
Message-ID: <273db26b-2485-4614-9045-97ac7ce5a009@infradead.org>
Date: Sun, 6 Sep 2026 22:23:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Documentation/arch: fix typo "initalised" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <b7b77956-591f-4282-aaad-04c9f7899413@infradead.org>
 <20260907043933.33452-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260907043933.33452-1-hemanth.selam@gmail.com>
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

On 9/6/26 9:39 PM, Hemanth Selam wrote:
> Thanks for the pointer, and you are right to raise it - I checked and this
> patch does fall foul of that rule.
> 
> The word in Documentation/arch/arm64/booting.rst is "zero-initalised", and
> I changed it to "zero-initialized", which quietly moves the file from
> British to American spelling.  The minimal fix is "zero-initialised".
> 
> I followed checkpatch here, and checkpatch is following the dictionary:
> 
>   scripts/spelling.txt:875:initalised||initialized
>   scripts/spelling.txt:874:initalise||initialize
> 
> Those are the only two entries in the file that map a British form to an
> American one, and by the rule you quoted they should read
> 
>   initalise||initialise
>   initalised||initialised
> 
> so that the misspelling is corrected without changing the variety of
> English in the file.  arch/arm64 currently has 58 uses of "initialised"
> against 132 of "initialized", so both spellings are clearly in use there.
> 
> I will send a v2 that uses "zero-initialised".  Would a separate patch
> fixing those two spelling.txt entries be welcome, or is that better left
> alone?

IMO the 2 entries in spelling.txt should be corrected.

thanks.
-- 
~Randy


