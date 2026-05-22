Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8366ECD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEbqrWvVDYxx+B7e/TxBC9n41trsCgfBY57Po1nlULE=; b=bI/3i2hrkdN669mCz3EDjVk026
	DtSuRiIiLPLkxR7y3Gccb0MNUhTndtR5S74Qa2j+3LRWbqiNl+wsme+94o0ScGq5CJliBhRhTLrAk
	cIcG8KPmXzfbraUtvpdRrgoMP6apR2F8owmNVciflmoK6E5LXMTEq/+04wnPQHODYhDdJ1bCmBO6x
	hMY8tzzbU3hxUgTFqkRroVMKAyDhT5duZkffejqA5RAJnEc58uLXkn3C3u8+vSO7DQyos/IN3J/lI
	9a0FWN0BqVW4T396Wr+2i4TvqW5wcDz2XmkgrO5ttRGgLmGjwdBKS69qO7sQc6lImxDpBa/+R7aT7
	B11CfXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQfK-0000000B6Iy-1Cs8;
	Fri, 22 May 2026 14:15:54 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQfH-0000000B6HI-2o47
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 14:15:53 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gMS404YYtz9tpl;
	Fri, 22 May 2026 16:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779459344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iEbqrWvVDYxx+B7e/TxBC9n41trsCgfBY57Po1nlULE=;
	b=lRS5zKXmUGypCwJWAGu0+/cuqA8o4QWQQ1OXi1JXmwGkknuqRY9rna0t3wmr+TxfQJ0MEe
	bQivhky3lynv3S8lGRVxunSMHRnYdZqSy7wLFGLg6rVZtLr5XGNz0VfTVAcU3iAyJP4ipj
	zcffbJnDnccuNsS3+kFCMN0+/JEuqhb3vtFVIVvTC5EGd60HdiHCjxHfPcGnf+0K6UuXor
	m7GutVFr28U2eV516JlX+F9BH5rP6SPPBcZE1CJ+oswOH6iYoM0siWIK/iGQERaoQ1/Pnd
	lolwFkGeVgE+Mq88K4JBPkVjyaT3DntJNHcxlNpe6B73gNtNwWD3HCE40/HWig==
Message-ID: <61f25f94-afc3-4ce1-912e-684026c2ceb9@mailbox.org>
Date: Fri, 22 May 2026 16:15:41 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 00/11] arm64: dts: renesas: Specify ethernet PHY reset
 timings
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXoRBA-A8e=R8A4QOwdhVf2Xvca+PCD=UaKEjgFZU7RdA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXoRBA-A8e=R8A4QOwdhVf2Xvca+PCD=UaKEjgFZU7RdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 2058f61fb9214cbf956
X-MBO-RS-META: cq59w5wg9tz38dpopxqru4rqtc3c3zun
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_071552_001962_69272390 
X-CRM114-Status: GOOD (  14.09  )
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

On 5/22/26 3:18 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Tue, 5 May 2026 at 05:43, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> This is the same patch for various boards, details are below.
>> The discussion that prompted this patchset is at [0].
> 
> Thanks for your series!
> 
>> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> 
> DS00002117K page 62 FIGURE 7-5
> 
> (and page 74 on the older document I had ;-)
> 
>> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
>> de-assertion of reset, wait a minimum of 100 us before starting
>> programming on the MIIM (MDC/MDIO) interface. Set DT property
>> reset-deassert-us to three times that, 300 us, to provide ample
>> time between reset deassertion and MDIO access.
>>
>> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
>> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> 
> page 62 TABLE 7-4
> 
>> voltages to de-assertion of reset is at minimum 10 ms. Set DT
>> property reset-assert-us to 10ms because the KSZ9031RNX RM does
>> not explicitly spell out how long the reset has to be asserted,
>> but this at least covers the worst case scenario.
>>
>> The Gray Hawk patch in this series depends on [2].
>>
>> [0] https://lore.kernel.org/all/CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com/
>> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
> 
> This link leads to the KSZ9031MNX part. Correct link is:
> 
> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf
> 
>> [2] https://lore.kernel.org/all/20260504225428.114959-1-marek.vasut+renesas@mailbox.org/
> 
> Shall I do the big search-and-replace while applying?
Yes please. Thank you for spotting this.

