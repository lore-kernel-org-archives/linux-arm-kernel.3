Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402D2CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AuHv2ylcVezR/vi7XrRIcEjiUPL9mtKb38cVL5qRBc=; b=kIDGGVphID2T+OykIoiW/Fc5KL
	x+XwvpEIAPYJQ15YyJCDab4rJ9XrJhiBUWnOKgShwsy3zlrkZPO5I9BCtNs2W9Aa0FH36jWCbtrBx
	8mDdHY+M2Kmr+0iWSQzQxwL1UW7eO9bqnDvf7flFDmD5PmBYmVIkgF0BMbgRc9QYcNSble8wainFn
	6fYb+rHYCsGkcNfoiBj/O9JQ6eVU50D1YZG97+wdNw3YDzedLbsEfBhpjSIbL2V0mdRKN32Xn7O4l
	dkpnX72bu255zrPKG732U7O8I6dv7kqMKx3pWmWVuxj7EtUu9cP67tHaCNouNKxKF8CNq75++B2/E
	SIM7i1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXp-00000005VwU-2aru;
	Sat, 06 Sep 2025 00:12:41 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubwf-000000044Jm-0EX7;
	Fri, 05 Sep 2025 19:18:02 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cJR2F5sCJz9tDy;
	Fri,  5 Sep 2025 21:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757099877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7AuHv2ylcVezR/vi7XrRIcEjiUPL9mtKb38cVL5qRBc=;
	b=C5a+ffISn5r4R4Dt1okCaUiNMJskcAYc3nK4MmwmbywC47MfKOnrHKcS2A67uCZ+pmMRgs
	/ACRnFdUb4YPqoPlfXB1RrDsrqqTzIjLawPCiQQ5+6nh+K8aGqgWBM9+LzQpDyNkSP5XMr
	dHXtih5o2apl/GwG2KKSIQC7eTS7M3ZoCnVWGz6fjDQPTUs7jD7cCgBGWyNuotpXs7YSrp
	rBSj7oSy5SI/HlJrN/FtTnR9Z0ENiUHaVD61/7mM5ODt5/42aHSmPVL0afDbFuVkZWDMvw
	FpWYvO2A6gsy7/NFFf90+Q0aiP5hqTxvmaVy8do912rACIGttpnEMploRUEGTQ==
Message-ID: <e4929fc7-d057-46a7-8603-68271e85b9b5@mailbox.org>
Date: Fri, 5 Sep 2025 21:17:54 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi
 720x1280 v2 binding
To: Conor Dooley <conor@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250904200036.168222-1-marek.vasut+renesas@mailbox.org>
 <20250905-humble-framing-3d9b786c87a2@spud>
 <3ba2de63-4282-4b1e-a576-0b4501e56a7b@mailbox.org>
 <20250905-imaginary-crazy-a5734cb794fc@spud>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250905-imaginary-crazy-a5734cb794fc@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 40b1347b2509e434e1b
X-MBO-RS-META: 4nawz5fb96azx54xwzyhdjacj1ddx7mw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_121801_242567_89292BDB 
X-CRM114-Status: GOOD (  10.51  )
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

On 9/5/25 9:03 PM, Conor Dooley wrote:
> On Fri, Sep 05, 2025 at 08:55:16PM +0200, Marek Vasut wrote:
>> On 9/5/25 8:46 PM, Conor Dooley wrote:
>>
>> Hi,
>>
>>>> +examples:
>>>> +  - |
>>>> +    i2c {
>>>> +      #address-cells = <1>;
>>>> +      #size-cells = <0>;
>>>> +      gpio@45 {
>>>
>>> ngl, seems strange to classify the device as a regulator in directory
>>> and name, but use gpio as the node name in the example.
>>>
>>> Otherwise, this seems fine - if you feel that the hardware is
>>> substantively differentially to what's in the "v1" regulator then
>>> keeping them apart is valid.
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> I can rename it to "mcu@" or "mfd@" some such ?
I called it a regulator@ and sent a V2. I didn't include the AB, please 
give it a once-over and provide one if still applicable.

Thanks !

