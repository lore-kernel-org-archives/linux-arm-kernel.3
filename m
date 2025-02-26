Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04C7C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2n0SyBskTlQqySFKw03y012R8BLnOILHzRtG1rgE2Hs=; b=bBHVbwDpvOU0uhG7Niudtx6EnE
	Jb2tezUELodbMALtrWLpNlxZmT5O3pjsRdzpthRw+uinouxP9GqKblYD1ZB7iUW40mObJURntY9r/
	+5B0BKDbYsTYOGFwpNEflk2oih7ZbfmpKjgIPIKFwIE0Ew9YZ882JXXq2wTaDROfP2otQh0G1/uXb
	qRuetgpLhIniMIRTBURVuI/e9YZ+giEJ/O0JUY+YNiP+T4E5iKpHjA4xiD3eACoS+pczmct1skWmz
	g6EpPMpmy0jhBszQkgZ06GfQNPA/u9eg6JNCklvYB+JqjIk/JMza8EMdaQAD8blgF/Y7+XXYw7z0o
	XM3jBdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCzY-00000002w8C-3eFA;
	Wed, 26 Feb 2025 08:42:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCxh-00000002vgr-1pYR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:40:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 385496127F;
	Wed, 26 Feb 2025 08:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC53BC4CEE2;
	Wed, 26 Feb 2025 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740559212;
	bh=S+u82oGXKHKqK6UVbq7Xud0c+o6+TCL3UqFRIOajgSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JNZVLf/JuTwbwct/+vjWBhu1FR28Tl441ySbnnr6d31aFnvR1Q8YM2MoWvbnOYGX4
	 kYkvjkCvcOzyJ/LJoeTUmglttOfczXiVLvb5AJGRiD4fkPzteuKd5mmOVFpLBRgrmy
	 NUVLxSwp/H0Po7HoOk6mZkdwyisCgoSRunvw92WI5g+8J4ql/5Mo5nGJnAbHBc/Csb
	 gHI70MY3BeRTaL7lhAJSPaTk7KGACztPoPCLe5+8Y80+3wder3xzTNpNmJk2COzMjg
	 DnQFo9B8Nmw5WS7snpUFiCv5QQWmXGaC3ejjB9ZtbWQgBchmhmIp6X3JWtWob8fKgl
	 e3JccHtzajxZQ==
Message-ID: <d9556611-cfe7-44fa-8965-bc2b0f870845@kernel.org>
Date: Wed, 26 Feb 2025 09:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: arm: add CIX P1 (SKY1) SoC
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 marcin@juszkiewicz.com.pl, Fugang Duan <fugang.duan@cixtech.com>
References: <20250226012136.854614-1-peter.chen@cixtech.com>
 <20250226012136.854614-3-peter.chen@cixtech.com>
 <f89817fe-22af-460e-9f5c-a3347eba1892@kernel.org>
 <Z77MHGhUF6pPwLww@nchen-desktop>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z77MHGhUF6pPwLww@nchen-desktop>
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

On 26/02/2025 09:09, Peter Chen wrote:
> On 25-02-26 08:02:12, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL
>>
>> On 26/02/2025 02:21, Peter Chen wrote:
>>> Add device tree bindings for CIX P1 (Internal name sky1) Arm SoC,
>>> it consists several SoC models like CP8180, CD8180, etc.
>>>
>>> Acked-by: Fugang Duan <fugang.duan@cixtech.com>
>>> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
>>> ---
>>
>> <form letter>
>> This is a friendly reminder during the review process.
>>
>> It looks like you received a tag and forgot to add it.
>>
>> If you do not know the process, here is a short explanation:
>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
>> of patchset, under or above your Signed-off-by tag, unless patch changed
>> significantly (e.g. new properties added to the DT bindings). Tag is
>> "received", when provided in a message replied to you on the mailing
>> list. Tools like b4 can help here. However, there's no need to repost
>> patches *only* to add the tags. The upstream maintainer will do that for
>> tags received on the version they apply.
>>
>> Please read:
>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>>
>> If a tag was not added on purpose, please state why and what changed.
>> </form letter>
>>
> 
> I have checked the review-process again at:
> https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=935897

This does not matter - that's not a patchwork anyone uses...

> It seems no one gives any Reviewed-by or Acked-by Tag.

You were directly addressed! So you got email and what did you do with it?

And lists received it:
https://lore.kernel.org/all/ac6c4a8b-a6bd-44a9-993b-3b743a172dcc@kernel.org/

> 
> If I am missing something, please correct me.
> 


Best regards,
Krzysztof

