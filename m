Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04753CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUBTmrJzlHEyvioYPG6dRMuebJKjGgnlUmA+FpZYTdw=; b=YEh9OeDohZK0tKp4iETm/AgJul
	JiCJEyCXKZwf7/qFkeqG0CjYHDC41rx8iLdZkaS+bO76kkU7ou+ZVcPJjuAoMGzpWJmZdWP5rpM0u
	BiNgtVYCOOXdCo/py9L4D2bvjTqIUY4739AWU+4q2vnifF/vdhYDjHzqOJB6krNj/uYffc9DufjD4
	WcdddPKORQBTlbeNBoJP8XxcqAvSjJHGlFirwNtj1CUx2Jb59FiyvAVJY0mjDjN6GMdvkvmv+og0C
	zfnryujp4+LHCwcEGe7dEXg8Ych1DRkzoyo3KeFmBKSO5+AQi9SSblFpzkQbB2CpN4aXMY8RtG+Fv
	Bkkopeug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsRS-00000007KhJ-2tQA;
	Wed, 03 Sep 2025 18:42:48 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto2v-00000006fyL-46Hw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:01:11 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C3F9E40AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756908064; bh=CUBTmrJzlHEyvioYPG6dRMuebJKjGgnlUmA+FpZYTdw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d1rLcnuJ70Bdcnd6BGrhB8gji9pR6Y1PLBLs0vnsBUjGXNK2OHn7M66gh49hk8Qux
	 2DX7OQsSV6eNQ3JtadwQ0LWkDIOPDiUQcfs+2D7MisdpCDCB3JEQIpgockV/ezsYb1
	 FEGjyF7taom2AH737SHRdoktAuhWHKl2q8j3VK4sQsmQBWZQSR+CmlQGEUkX6aM9se
	 XTUB3sYlhhQ4/Yu9ZAs8WpNbyEy7z9KFDuadUYjzfqA20SQdA80La5sXba8V6bsR9f
	 TLHcz3S5H7KiobgLXhpDOstfwiBhHLtki6e5O+p085XJbaQHQz216IVSeJAYg+RpD8
	 HtDLhd0x+bSow==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C3F9E40AD8;
	Wed,  3 Sep 2025 14:01:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Akshaykumar Gunari
 <akshaygunari@gmail.com>, mcoquelin.stm32@gmail.com
Cc: linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] docs: arm: stm32: fix typo "busses" -> "buses"
In-Reply-To: <078fb552-c848-49ef-b917-14aec0e4b6aa@foss.st.com>
References: <20250807145119.2214-1-akshaygunari@gmail.com>
 <078fb552-c848-49ef-b917-14aec0e4b6aa@foss.st.com>
Date: Wed, 03 Sep 2025 08:01:02 -0600
Message-ID: <87plc7zlcx.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_070110_014671_659DBCD2 
X-CRM114-Status: GOOD (  10.73  )
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

Alexandre TORGUE <alexandre.torgue@foss.st.com> writes:

> Hi
>
> On 8/7/25 16:51, Akshaykumar Gunari wrote:
>> Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
>> architecture documentation.
>> 
>> Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
>> ---
>>   Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
>>   Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
>>   Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
>>   Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
>>   Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
>>   Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
>>   6 files changed, 6 insertions(+), 6 deletions(-)
>> 
>
> Applied on stm32-next.

I had already done so (and copied you) on August 12.  I can drop my
copy, I suppose, if that's how you want to do it?

Thanks,

jon

