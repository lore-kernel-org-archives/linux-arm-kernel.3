Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E274BCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYRqvLNplKcHBpCSubZye+sJzBUl9lFEGv93iADHNo4=; b=a/zitHnpB/Zl0wqKhMbX4oPz7X
	tbqHcw4YLGORTXiRJV5schdmRbFGn9Sd5J5IE2BJqDJF8srMiqZugE3DFbP8P7DrD2+8MbcurO0Vn
	O54PGrKJHfUKL9wLNs2pZLnbUnL+efboTKxsbQKVT1UEAh+WT/3c1buOXzMe/feKjhf+41oGlqHOE
	QWxx3J5U6EJWXjn558uXKFga1tKAB20cwpV94WkVKYFEIwg2jkBjn2Yj6K/QkncYeIIzXEUe3dIG9
	ttSw8XoFef+CcVx16Tqu1Pf/lNG36AvTGv520pqwz9ofJUQpCLEewc5LrLQxERTdvyXLyJEoHxSbt
	gMQEWTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3vt-00000007yVV-1FgA;
	Thu, 21 May 2026 13:59:29 +0000
Received: from smtp1.tecnico.ulisboa.pt ([193.136.128.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3vq-00000007yTy-1YUH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:59:28 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 62C84600300F;
	Thu, 21 May 2026 14:59:21 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id OhRAXJUdua68; Thu, 21 May 2026 14:59:19 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 182B2600022F;
	Thu, 21 May 2026 14:59:18 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1779371959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYRqvLNplKcHBpCSubZye+sJzBUl9lFEGv93iADHNo4=;
	b=qjWPx4ILk3hXKN8Kk2jhid2H6oIUEd1PMQaPeh7FJzZfQgzhYSQZzQQ9UtZ+IiXiKC4XwK
	/53AvDPqDRjMFBnXfbhZOsQZ8+yfU63iakF0DQ0UAAtdYKP3NyT8vLtM3+shhiaQCJeUAr
	QzzWGLSx9Z/F/w1ap/B+MA0KjvbGTWOaMH+gNh7u0OBC+f1X+byGIJC0xQkU56Y0lIQ7tZ
	Ah5kHzUxSlgGEBq7cZkgcbPJXZsZ+gwX+nlM+8YS1kW9PW2+RP/UXQhJv8gFd7HxuJezuz
	ylSHwV1z3qjZtjzkZFS3nSjIRUY1mh9Bxnyfri1Nrk5KzBLp4JCOMilSTbtoFg==
Received: from [IPV6:2001:861:8c82:4ef0:2bc6:7ef1:5c9b:813f] (unknown [IPv6:2001:861:8c82:4ef0:2bc6:7ef1:5c9b:813f])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 38C8136029E;
	Thu, 21 May 2026 14:59:17 +0100 (WEST)
Message-ID: <f98bcd81-29c6-4df2-8040-d17686b28f45@tecnico.ulisboa.pt>
Date: Thu, 21 May 2026 15:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via
 MAX77620
To: Lee Jones <lee@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <177929432727.2891971.15568098895295536822.b4-ty@b4>
 <31ef61bd-6672-440a-a52e-eedb950d3d03@tecnico.ulisboa.pt>
 <20260521104136.GA2921053@google.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20260521104136.GA2921053@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_065926_831842_5D3071B1 
X-CRM114-Status: GOOD (  23.14  )
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



On 5/21/26 12:41, Lee Jones wrote:
> On Thu, 21 May 2026, Diogo Ivo wrote:
> 
>> Hi Lee,
>>
>> On 5/20/26 18:25, Lee Jones wrote:
>>> On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
>>>> This series migrates PSCI and MAX77620 poweroff handling to the
>>>> sys-off framework and fixes shutdown on the Pixel C (Smaug).
>>>>
>>>> The first two patches replace legacy pm_power_off usage in the PSCI
>>>> and MAX77620 drivers with sys-off handlers. Besides aligning both
>>>> drivers with the modern poweroff infrastructure, this removes the
>>>> global callback dependency and allows multiple handlers to coexist
>>>> with explicit priorities.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>
>> Thanks for applying the patches! Just a question and an observation:
>>
>>   - I'm assuming you were ok with merging [2/4] despite the possible
>>     deadlock since this risk is already present in mainline in the same
>>     form so we're not actually making things worse, is that so?
> 
> Did you see the text below?

Yes, but patch 3 is not addressing the possible deadlock hence my
question.

> Both patches 2 and 3 are applied.
> 
>>   - The observation is that the comment about overriding PSCI is only
>>     true after (and if) a reworked [1/4] is actually merged.
>>     If it isn't then patch [3/4] is actually working around another handler
>>     in soc/tegra/pmc.c where a handler that only does work for the Nexus
>>     7 is actually registered at FIRMWARE level for all platforms that
>>     probe that driver (I will send out a patch shortly to only register
>>     the handler on the Nexus 7).
> 
> I assume the other patches will be applied soon.
>
> If this causes some kind of issue - let me know later on in the cycle
> and I'll remove whatever patches you ask me to.

The PSCI patch [1/4] has a fundamental issue and needs a respin to be
applied.

In connection with this it might then become easier to quirk the PSCI
driver rather than the PMIC driver, so for the moment I'll ask you to
drop [3/4] until I propose the changes to the PSCI maintainers and see
the feedback and at that point we can either completely drop [3/4] or
reapply it; sorry for the noise.

Best regards,
Diogo

