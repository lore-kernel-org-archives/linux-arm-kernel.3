Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FA4E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avT8sCPNh7sFRj+FBqxStI57oHP5ZUEtBKxa7gJHFZw=; b=uFrGWgoANzzUp+emytrnoDwxzj
	gcBakWV9q7Uj0OHPw9M4ZSTCNcYC90J7JgWDWuwsVTzMwh6Ow+iQ9G//xdmRhGPaRNKRold/4psSr
	/QzoORGSFhMjmwlbeeqDlItC/2DVYq5ZXJb0YVLrCUs8xCJaUNlNtMv5fGZipZ3QEwqUSyPKQu8Sw
	Ljrnv0agcWA3a3a/ZmECoKKLjZwJgeDAwQhjcvthJ6+B8t/osb+aaeUkdLHe+y9PGs5y5HpC3Kzwh
	pfv8IcNZgeSmjBhYS6FyXVcRx5L/UhrWlGOXOxOmIGruVq6ltdIOjp0pB6G4XcJvAvAlzoUAA7feO
	G+R/4mzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImYF-0000000CC52-3eZt;
	Wed, 04 Dec 2024 10:24:11 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImVr-0000000CBlS-3qYC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:21:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA09E6000B;
	Wed,  4 Dec 2024 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733307700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avT8sCPNh7sFRj+FBqxStI57oHP5ZUEtBKxa7gJHFZw=;
	b=ChbWaFvNQ1XrD7sl6Uf+fcuNS/6xV+IJMdTHXnbtTVh2nMUCA5yN9w5FZ5WbtI9WORhE3v
	/mFgbhFLH6z0A3woWTbnR2dt4eu1Uc9Q8MPZdDvn18vVBMf41vg+UR0BXOqQJdWgX7y4Y4
	rCzseGALJEIX2IrzGL04PnAxF9uY6JE1Wf2GMLrWPE08jjmecFZlqxHcHtZJf/XRd+9fI+
	GL8LW9sWmZqomuWVaQyzjMHB0ADihQrZMts4QiK3F8b0mJqFk+2KfAmz+JK8usMG5OyWxZ
	lvKmD1vt/3Z8HtHMPp3LpifIdvpxw/bfbqkNXvGCR1p3qGVzafD6G/UKeEYwyw==
Message-ID: <e405b65e-e9b7-451b-9b40-64d5d9cafa98@bootlin.com>
Date: Wed, 4 Dec 2024 11:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4: use ti,j7200-padconf
 compatible
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 u-kumar1@ti.com, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 gregory.clement@bootlin.com, thomas.petazzoni@bootlin.com,
 richard.genoud@bootlin.com
References: <20241113-j784s4-s2r-pinctrl-v1-1-19aeb62739bc@bootlin.com>
 <20241119190106.GA70080@francesco-nb>
 <6e47e420-84c4-4539-ba54-5e1e939a37a5@bootlin.com>
 <Z1An9_auC3dRyPln@gaggiata.pivistrello.it>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Z1An9_auC3dRyPln@gaggiata.pivistrello.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_022144_097791_8B932A25 
X-CRM114-Status: GOOD (  17.70  )
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

On 12/4/24 10:59, Francesco Dolcini wrote:
> Hello Thomas,
> thanks for the update.
> 
> On Wed, Dec 04, 2024 at 10:08:43AM +0100, Thomas Richard wrote:
>> On 11/19/24 20:01, Francesco Dolcini wrote:
>>> Hello Thomas and TI folks,
>>>
>>> On Wed, Nov 13, 2024 at 11:43:05AM +0100, Thomas Richard wrote:
>>>> Like on j7200, pinctrl contexts shall be saved and restored during
>>>> suspend-to-ram.
>>>>
>>>> So use ti,j7200-padconf compatible.
>>>>
>>>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>>>> ---
>>>> Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
>>>> suspend-to-ram.
>>>> ---
>>>>  arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi       |  6 +++---
>>>>  arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi | 12 ++++++------
>>>
>>> Do j784s4 supports any kind of low power mode and/or suspend to ram? My
>>> understanding was that this was not supported, but maybe there is some
>>> details that was lost when I was told this information.
>>
>> We are working on suspend-to-ram support for j7200 and j784s4.
>> During suspend-to-ram the SoC is fully powered-off (thanks to the PMIC
>> which powers off all the power rails except the DDR which is in
>> self-refresh), like on j7200.
>> Please let me know if you want more details.
> 
> ok, that's quite different from the common suspend-to-ram we use to have
> implemented on other SoC. You would have some boot firmware (likely U-Boot)
> code executing during resume, taking some different code path, in a similar way
> to what it is being done for the partial-io support on am62p. It's going to be
> more similar to hibernation from some point of view.

If you want more details you can have a look to this presentation [1]
(from my colleague Gregory CLEMENT).

[1] https://www.youtube.com/watch?v=sN4krurp8bM

> 
> Do you expect to have this feature nicely integrated within the standard
> suspend/resume "framework" in Linux?

Yes.

Regards,

Thomas

