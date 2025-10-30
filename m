Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96BFCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 00:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IniilaBss4ARvgvSKGFl6OJKKn5eXDeB1rP41HTysu0=; b=hwKSFVPRfm32TvnbG8OMLsNgau
	59bKWbyj9UWuf3JoMvjtZTS1tNKi3wVfXaGEsIsf5+Iv5hbpmeUU7vgT1i5Wfh3g8fqlvIy1RdfLT
	oswpcNaIDrTCaugz6VY6CyseqO7To8a4zR0cBGzd/RLKQd6sSV91lvmZlqUHjKuw+sbws+ME4+M6V
	AEJDhWGNMug0sZaof6GA9oT8ruzjDyH4ZA/gau9pjXJioAzundh0tgl6Pz+oVOwUU86NmFlm05KPQ
	7JZZ6W6V10ZT+PohFxmu6jlsDWUvbgb6hH76vlOAToUdoKa2ZHHQr0F0V+m3GjwFlcj8i2aAZHL3M
	RYv+ce/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGuP-00000003JAT-17gm;
	Thu, 30 Oct 2025 00:52:57 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGuM-00000003J9X-3PKA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 00:52:56 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cxlvd0Hprz9scQ;
	Thu, 30 Oct 2025 01:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761785565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IniilaBss4ARvgvSKGFl6OJKKn5eXDeB1rP41HTysu0=;
	b=kEI1bBYyyLEhaTuVznkOU9OUJQPU6XXU4pjIJhf1QXSwTb0uh2uh2IwGh28dDJeCZjZzTK
	DtWIbPfSDMmnGNqf1+YWJqqZeWEcZiw6GJak0wTW7SOilU4bBoAODKKLw4OuH2siLnewHc
	vVKjAh5Yx0CmtFQjNUloAi/e1ZGGDf8ndvO4weaCG2vTllk3hP7GMeX8wHj5znHHbqpz8C
	ZvJ0fw3lOsDOjphHR3xXI3ejXu1sPH/4j3yAZxtBW6XALi4JYUa8KISnK1VxFIss5DJq9f
	ywYnWWdRIP28CQnxUsDhpthZSRUxygTaR+Oc06o1xnwkitIQX/kBy0va5NcnUA==
Message-ID: <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
Date: Thu, 30 Oct 2025 01:52:42 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
From: Marek Vasut <marek.vasut@mailbox.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto> <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
Content-Language: en-US
In-Reply-To: <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: meqz3wrctz4xpsm9cpmk745gwhfgm5x4
X-MBO-RS-ID: 1b87ccad0ed6c2ee2ee
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_175255_193341_F0001660 
X-CRM114-Status: GOOD (  17.05  )
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

On 10/23/25 4:00 PM, Marek Vasut wrote:

Hello again,

>> On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
>>> Document new property arm,poll-transport, which sets all SCMI 
>>> operation into
>>> poll mode. This is meant to work around uncooperative SCP 
>>> implementations,
>>> which do not generate completion interrupts. This applies primarily 
>>> on mbox
>>> based implementations, but does also cover SMC and VirtIO ones.
>>
>> Hi,
>>
>> ..indeed I was thinking a while ago about exposing the existing force- 
>> polling
>> switch but in my case it was purely a testing-scenario configuration, 
>> so a
>> no-no for the DT, things are different if you have to describe an HW 
>> that has
>> no completion IRQ also on the a2p channel...
> 
> Correct, at least until the SCP on this hardware is updated.
> 
>> ...having said that, though, usually polling-mode is reserved to a few
>> selected commands in a few chosen scenarios (as you may have seen),
>> 'carpet-polling' non-for-testing for all the commands on A2P seems a lot
>> inefficient and heavy...is it really a viable solution ? or these
>> systems use such a low rate of SCMI messages that polling after each and
>> every message is negligible ?
>>
>> ..just to understand the context...
> 
> These systems are early in development and it is likely that the SCP 
> will be updated to generate interrupts properly. Currently, this is not 
> the case, hence the carpet-polling, until this is resolved.

While I was going through the SCMI spec, DEN0056F , page 209 , section 
"4.1 Shared memory based transport" , bullet • Completion interrupts, I 
found it explicitly states:

"
This transport supports polling or interrupt driven modes of 
communication. In interrupt mode, when the callee completes processing a 
message, it raises an interrupt to the caller. Hardware support for 
completion interrupts is optional.
"

-- 
Best regards,
Marek Vasut

