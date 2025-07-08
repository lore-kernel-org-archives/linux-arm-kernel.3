Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27588C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 06:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wtrK2WpKpdyhxNgapFFvEF0gkvLzAdX2rfvDy2T+tA=; b=ef0JepEdPUkcVIfiVCK43l5M6n
	kusmMVPQzdCVEj9ix3H4ujz8TkUhuuoTrak1GJ/4a8yqnmxr2wlM7ae6i+GcGUIEGsCCWL63sesfH
	hxyeBu7wloWQ/CwCDqyRWlk6s4tFSzXyZaJxW75XYuzelnto2BrerGeKY/o7VsSmN47tWiCKku+XX
	js7+wJemdopDI0J8hfmowkMNXaWHmtt6NqKth5xAnU4XdX7LqHsN+rXDliWqVcbg8LZIeruLTEJoA
	ytfV2D+VGeAAF00IdbVaLOoO2BfJQB2etxSGfnWBSn3PM2KoFBMNug53HJ0R6Vjeyv8/c9PPH9nZW
	Wt5ScLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1pg-00000004R3o-2yaQ;
	Tue, 08 Jul 2025 06:29:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1mZ-00000004Qa8-0H3O;
	Tue, 08 Jul 2025 06:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1EE44A4056D;
	Tue,  8 Jul 2025 06:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7C7C4CEED;
	Tue,  8 Jul 2025 06:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751955981;
	bh=L3HA/tyMA0TRaxoaUnpvv0ErFNnf684Z0UbbLl0ir8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WhHEtDvv4mnsqLLVj8sOF9egG/BAfoXGWWzhVZbc60cmJQvtGibRoqiziZgmR2SJk
	 WlwyntQjoXvF80Aw4YWrQUE8Fzzlx20fC81IVSPTiwejaG75DXZhxruzfSceTJli5v
	 Xeal4cXTCsxTKpRanOhPkdwT+Ks459V6pz4roXx4V/sJcsCYzFIeBMLDtPTI6RMW/m
	 GX7eN5R1HfbwQwIZJp8kuFfYdW56muEBBFFmB7K+PPOqpqaC6CHDRuUDxadwdVDWfL
	 gwPD7Mme0CFarUaKpsPSatO5B5j+YBN+R1WoUAWq5FiE0Jj4wQE0UJIogRI+xYHXzk
	 5mwHVa0ZBXhVg==
Message-ID: <904d1165-185e-43ac-9b52-a2f17f774e80@kernel.org>
Date: Tue, 8 Jul 2025 08:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/7] net: airoha: npu: Add NPU wlan memory
 initialization commands
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Felix Fietkau <nbd@nbd.name>
References: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
 <20250705-airoha-en7581-wlan-offlaod-v2-2-3cf32785e381@kernel.org>
 <20250707-agile-aardwolf-of-politeness-29fead@krzk-bin>
 <aGt2L1e3xbWVoqOO@lore-desk>
 <679e6fd2-967f-4057-9ccd-92a37ecc4819@kernel.org>
 <aGvmoJ83EtYOIa0K@lore-desk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aGvmoJ83EtYOIa0K@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_232623_316875_08A533D8 
X-CRM114-Status: GOOD (  24.84  )
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

On 07/07/2025 17:24, Lorenzo Bianconi wrote:
>> On 07/07/2025 09:24, Lorenzo Bianconi wrote:
>>>> On Sat, Jul 05, 2025 at 11:09:46PM +0200, Lorenzo Bianconi wrote:
>>>>> +
>>>>>  struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr)
>>>>>  {
>>>>>  	struct platform_device *pdev;
>>>>> @@ -493,6 +573,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
>>>>>  	npu->ops.ppe_deinit = airoha_npu_ppe_deinit;
>>>>>  	npu->ops.ppe_flush_sram_entries = airoha_npu_ppe_flush_sram_entries;
>>>>>  	npu->ops.ppe_foe_commit_entry = airoha_npu_foe_commit_entry;
>>>>> +	npu->ops.wlan_init_reserved_memory = airoha_npu_wlan_init_memory;
>>>>
>>>> I cannot find in your code single place calling this (later you add a
>>>> wrapper... which is not called either).
>>>>
>>>> All this looks like dead code...
>>>
>>> As pointed out in the commit log, these callbacks will be used by MT76 driver
>>> to initialize the NPU reserved memory and registers during driver probe in
>>> order to initialize the WiFi offloading. Since MT76 patches are going via
>>> the wireless tree, I needed to add these callbacks first.
>>
>> Cover letter does not link to your NPU patchset. You cannot add dead
>> code to the kernel and now it is pure dead code. Post your user - in
>> this or separate patchset.
> 
> I guess you mean the related MT76 patches are not linked in the cover-letter,
> right? I have not posted them yet.
> 
>>
>> Your explanation of dependency is also confusing. If these are added to
>> wireless tree (considering last experience how they rebase and cannot
>> easily handle cross tree merges), how does it solve your problem? You
>> will have it in one tree but not in the other, so still nothing...
>> That's anyway separate problem, because main issue is you add code which
>> we cannot even verify how it is being used.
> 
> My main point here is wireless tree can't acutally merge the MT76 patches
> since, without the net-next ones (this series), it will not compile (so I

This does not explain hiding the other part. Again - there is nothing
weird in patchset dependencies. Weird is saying there is dependency, so
I will not post code.

> posted net-next patches as preliminary ones for MT76 changes).
> Moreover, this is the same approach we used when we added WED support to
> mtk_eth_soc driver and the related MT76 support.
> However, I am fine to post the MT76 changes as RFC and just refer to it in
> this series cover-letter. Agree? 
> 
>>
>> So far I see ABI break, but without user cannot judge. And that's the
>> hard reason this cannot be accepted.
> 
> if you mean the dts changes, I will fix them in v3.
> 
No, I mean driver.

Best regards,
Krzysztof

