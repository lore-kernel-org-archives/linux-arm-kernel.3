Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70328C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 06:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIXfUGDau1R1F000czVeK/WYeyuoKN/NfJ+li8Oka9U=; b=hmgpD19QdR7oaSaMicH7SrDW5q
	SX5A7binlUH+jbXIP9Qvrge0KgXTaErXkDtkua5fIAdLagLx+Vll4a1P5E5RWoqlpOsmlX9O+W3pT
	3rlYk8pnTGSOI00Y/F6ZiSUaVa4Fhb2YzbyEIr9E5pNQoiPaWlv+tZz9hdfW8fcN3rTAyo9zLM6UB
	Q+tOmHeUf7G4MEC+AABk/mid2fpiTxdCXB/TqFiKad6HqcRRxZ0Sb9pjDf4tFxnUSZtOWQ+stMRb3
	KHunu+RhhxmXvIIwnjBH6uMGTPvoPlWsG08aURHlcMj7m87rEw+Mnnl8oP/ExDV2Go8iRZ3qLEggS
	rCLyxEhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uepBK-00000006a60-2Z7v;
	Thu, 24 Jul 2025 06:11:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uep8E-00000006ZtJ-2jJz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 06:08:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F2525C57CE;
	Thu, 24 Jul 2025 06:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E60C4CEED;
	Thu, 24 Jul 2025 06:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753337320;
	bh=jnPA+iA9iLU7wadXEwXs4NfK0RtdyekHzyBGX5AWZsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EfynuZ5+9ifm4K+Q8RJf9Sc8h4rtAfwGv0gCHr2fvS4/5hlRSmSzyWCqdSeQFIdUv
	 epQpwWEsigEcs12RdptljlIbcrSzmQfzy80xDo7W0irii5/Ytz+AVy/gVz+aION58e
	 1NKWSAB4vMKZ2qk2Ba10DWpey7rUXVbAdjaiiqfS6z+9FsK9uyRQPfkCjGfvdVW7jm
	 Qgvc0UYoncG6e3iwlztNMLAhE3yv3hqqpaNckyQxlqPLsJLSYckcgfJCtvhAA5JsBz
	 PY13RW7hyRpf4H7n9nbf6DzqOgvgwZSG5jJt39SC0MhBWaGqfZksc2E4eN7L6n6XrP
	 Pd+e+HqYUSojQ==
Message-ID: <fd0770c8-e5e0-4bdb-a3da-b4b39f664e61@kernel.org>
Date: Thu, 24 Jul 2025 08:08:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] power: reset: macsmc-reboot: Add driver for
 rebooting via Apple SMC
To: Lee Jones <lee@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
 Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Hector Martin <marcan@marcan.st>, Conor Dooley <conor+dt@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sebastian Reichel <sre@kernel.org>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Zyngier <maz@kernel.org>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-7-556cafd771d3@kernel.org>
 <7297d4b1-84a2-4bb1-8a33-29c827247df7@gmail.com>
 <d6b778ee-02c0-4dd2-b33f-cec16c17807c@kernel.org>
 <20250723080615.GM11056@google.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250723080615.GM11056@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_230842_778897_D50E4B55 
X-CRM114-Status: GOOD (  19.28  )
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

On 23.07.25 10:06, Lee Jones wrote:
> On Sat, 21 Jun 2025, Sven Peter wrote:
> 
>> On 16.06.25 06:13, Nick Chan wrote:
>>>
>>>
>>> On 10/6/2025 23:29, Sven Peter wrote:
>>>> From: Hector Martin <marcan@marcan.st>
>>>>
>>>> This driver implements the reboot/shutdown support exposed by the SMC
>>>> on Apple Silicon machines, such as Apple M1 Macs.
>>>>
>>>> Signed-off-by: Hector Martin <marcan@marcan.st>
>>>> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
>>>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>>>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>> Signed-off-by: Sven Peter <sven@kernel.org>
>>>> ---
>>>>    MAINTAINERS                         |   1 +
>>>>    drivers/power/reset/Kconfig         |   9 ++
>>>>    drivers/power/reset/Makefile        |   1 +
>>>>    drivers/power/reset/macsmc-reboot.c | 290 ++++++++++++++++++++++++++++++++++++
>>>>    4 files changed, 301 insertions(+)
>>> [...]
>>>
>>> It seems that the reboot driver still probes even without the smc_reboot node in the smc node:
>>
>>
>> That's odd...
>>
>> Lee, is it expected that a mfd sub-device declared with
>> MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
>> is loaded even if there's no corresponding node in the device tree?
>>
>> I'll have to re-add the check that makes sure the sub-device is available
>> then.
> 
> Yes, that's expected.  MFD is orthogonal to DT with respect to device
> registration, unless you specifically disable the node in DT.  If the
> node is missing, the device will still be registered, but no link will
> be made from the (non-existent) node to the 'of_node' pointer.

Makes sense!

> 
> You have 3 choices; provide a DT node and explicitly set the status to
> 'disabled', optionally omit registration from MFD (i.e. do not call
> mfd_add_devices()) or check for (!pdev->dev.of_node) in the sub-device's
> .probe() and bomb out early if true.
> 

Alright, so everything's working as intended then and the series has all 
required Acks. I'd suggest that we take it as-is then  (either now if
you're still picking things up before the merge window or after -rc1 is
out otherwise) since it only adds support for M1 and later and those
have all subdevices added here.

Once Nick adds support for pre-M1 SMC we can do one of those three
things to disable the reboot sub-device then.


Best,


Sven


