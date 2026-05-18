Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC39CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iwo03FilELrj8cj1rntHjDn5SWnXINAdxD4xskJUgE8=; b=vqY2EeaNR3iSd+bLnGVdHIE848
	bOf4fdNSOfFVGFbE31ZM8tia6gdGECR+UT0t/3EgSqlCIqcus6DLGF7vd/qRQk+NuC4ZMz7g6FX4a
	Muhmxa3jftEh6jaG/F7f+jqAiWqgG78hTnaM8ia4Ci25UPnW8suFz8r6PMMTMQVOjJ+gsZBiwoXi0
	1xdVwdp0MHzr4IfWM65/KkDAEw5simhRnuOMGbOYVS4I1o6YJptx6/33Q8SRZ7cF5XOAcI4wrzXr9
	TrVf5dX1fqQ6ysVZfgajzSACCXYxh4/BjzOm3iLUTxU1M7NBj8eshwxTH0wfm0P+gYY2WIHI9iMx0
	R3xtXBiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxR8-0000000FhS6-3YvP;
	Mon, 18 May 2026 12:51:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxR5-0000000FhRH-34Mn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:51:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16A1845BF;
	Mon, 18 May 2026 05:51:00 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 430EC3F632;
	Mon, 18 May 2026 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779108665; bh=Gr6HIT44vFcV8C+E8WlT4h6l59fieOXbPOTn6N6uLP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MBvSK9Hvf/XPfsiNPIrSzcte289au5Y2Cn/b5XVPTmU2JM1ONgQxz9obCfZV4CfOB
	 30LL8Sj7Wc+RwEJqfZ7WcA6Kn9Hl1wxGOhLMjVyZb3VrbCprbvgOzgLBB0nfPUcdcq
	 6e99de2KxWXLms/HW1aq1CkIngmgWM1xb00lHbrA=
Message-ID: <4883b037-45b8-4c9a-92ba-72e6b795dc93@arm.com>
Date: Mon, 18 May 2026 14:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
 <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
 <6d8659f393e0bb4f0805107a17e306422982247c.camel@gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <6d8659f393e0bb4f0805107a17e306422982247c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_055107_861364_80CE5228 
X-CRM114-Status: GOOD (  17.03  )
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

On 5/18/26 13:29, Alexander Sverdlin wrote:
> Hi Andre,
> 
> On Mon, 2026-05-18 at 13:16 +0200, Andre Przywara wrote:
>>>> And anyway, I see a *dual* USB-A socket on the pictures online, in
>>>> addition to the USB-OTG port. So where does the third USB come from? The
>>>> A133 only supports one host USB port plus the one OTG port. So is there
>>>> an USB hub chip on the board?
>>>
>>> There are two hubs, one on each usbphy. OTG side hub is even bus-powered,
>>
>> What do you mean with OTG side hub, exactly? Is there a hub on USB0? How
>> does this work, then?
> 
> the upstream port of this hub is wired to the USB-C connector, one port has
> CH340E USB-UART on it for the console, the other port goes to the SoC usbphy 0.
> So it would be "peripheral" only, I suppose.

Ah, that's interesting, I was wondering about this, but don't think we 
have seen this before.
So yeah, then it's definitely peripheral only. And please state in the 
comment that it's connected to the downstream port of a hub, so changing 
it to "host" will not work.

Thanks,
Andre


