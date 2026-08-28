Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C33C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 18:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5uLOuQaPiHt9dSpbY0OeGfbDrrRTGfvqoBro2SNT4c=; b=RT6lk0d20K6FNyZt5+Ecj9CGq/
	wRPRl+eCpvN137X6l9f98CsGYv6z7qJ+XzWZk8JyZomf4sCmqDAprcfnNlPS+cFkGdH97ULEz/il5
	TrjmE6VxJ63X6xAabcVaT1A3eNklv10zzZCYOH2qqiUht98PEu0oK1khb7E9qqF+VUmDcpqYkeotA
	QIpARhQhmu3Sd4fNb4VEyVYzk5aYmaJW/FShfyLlVBe5/YLC9C1M1p+BP1/5KL0dB1DRGIRtbmGQK
	7eL+/FFZVAdXZr/Tga2/dorWOyD2ABkEQ6ZgRopfxXdY0lB3TJibThZ5ab7r+7ySVOSKfblyE7g+0
	qZcBQF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x01cA-00000006JzT-0ITB;
	Fri, 28 Aug 2026 18:47:46 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x01c8-00000006Jyq-03ZN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 18:47:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF8B910A240;
	Fri, 28 Aug 2026 20:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787942858;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=w5uLOuQaPiHt9dSpbY0OeGfbDrrRTGfvqoBro2SNT4c=;
	b=Nm16mUVmjNmz0GCwKa4mmE/uA73TtkYVHgOyLgdzS80wm1YrRt/tqBeGVjq5slt50ZwLxz
	MW3Tw2H1O3JsVah0SckroXyQtLw7JACjWCAchyxgwUMYcTbWdrLvVTvI9OzB8hGNEF41C0
	srAOyoU3D69C4gYGx7nLx8EDLdio5rvKW7XXk1b6CPoElplaXQnaGlb0gCkQ6VI8RFkuqR
	IHQT8aVqqG8bK/YryQ8ECf3LG8UrQWje5AnEVtPQOqAz79vAnK8lS8CdIZdlMLfxcjKDuv
	eQV6+PH6gLTGxEf5hi6RqN3yCp6eFYATs03bmq3Jfhd8xUelztos3wlELeXMvQ==
Message-ID: <7f6f7df9-55c7-4393-a4bb-42c6cc170df1@nabladev.com>
Date: Fri, 28 Aug 2026 18:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: usb: Document ST UCPD
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260819163410.119755-1-marex@nabladev.com>
 <db62c29a-7260-4e19-9279-e38323353c30@foss.st.com>
 <225f1704-399d-47d0-8bca-73a27a59bbd4@nabladev.com>
 <42bb4c3c-1dbd-4902-9765-01687b74cb39@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <42bb4c3c-1dbd-4902-9765-01687b74cb39@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_114744_221066_8B0A4896 
X-CRM114-Status: GOOD (  24.50  )
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

On 8/26/26 3:24 PM, Fabrice Gasnier wrote:

Hello Fabrice,

>>> I've sent a series for the complete case. Please check and review here:
>>> https://lore.kernel.org/linux-usb/20260821-ucpd-host-fusb340-v7-2-rfc-
>>> v1-0-c5e27cbc0795@foss.st.com/
>>
>> What is the difference between this driver and the ^ driver ?
>>
> 
> Hello Marek,
> 
> That includes the TCCP I2C driver (and an example on ST boards).
> 
>> Why is this driver not covering "the complete case" , what is missing
>> here and not missing there ?
> 
> I intended to show a complete case, e.g. UCPD controller driver and
> external TCPP I2C protection chip driver. The TCPP is a companion,
> complementary, e.g. provider/consumer relationship.
> 
> You've pointed some "horribleness" there. I guess you talk about the
> straight forward approach e.g. EXPORT_SYMBOL() macros. That's an
> on-going work, a prototype. I could have sent as an RFC.

Yes please.

> I wanted to be transparent, so the correct level of APIs gets used.
> 
> You propose to turn the TCPP into a GPIO chip ?

I think yes, it is after all four flip switches on I2C.

> That seems smart, at least for the CC lines switches.
> What about Vbus and Vconn, it could also fit regulator API ?

It would, but, aren't those also flip switches ?

It seems to me, that TCPP02/03 can enable/disable Vconn on CC1/CC2 (that 
sound like two GPIOs), enable/disable gate driver (GPIO?) and 
enable/disable gate source (GPIO?) .

> There are various functions, the bindings should be extensible enough
> for later use of additional functions. I'm thinking of:
> - Over-current events for Vbus & Vconn
>    Could be represented as interrupt controller ?
>    Or could benefit from a regulator notifier (if used) ?
> - Vbus sensing

Could extcon cover those ?

> My point is that, that can impact the dt-bindings or functionality.
> Sending UCPD driver only, without the TCCP binding & driver, I find it
> is a bit hard to review or test at my end without having a more complete
> view.
> 
> I'm not sure which way you'd like to proceed ?
I am wondering whether maybe we should slow down a bit, get USB sorted 
out and upstream first, and focus on UCPD/TCPP as the second step (not 
in parallel to USB) ?

