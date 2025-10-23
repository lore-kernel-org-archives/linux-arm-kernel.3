Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E660CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZG9mO41qdraguNJdS/6+Qp6H8j9kWox/Hp446T4ci5o=; b=RfL0qQt+a3L7NqI6qnBDOTRcaS
	xRYsDy0a18z1fkx6F1/Nk8J0ZfTXvicRivnXTyx+Ced/CK4cev2qaPvjB9Oo8ReykE2BEt4Rw90nd
	FIbdHUogIqg6VAcj56cUa/uh7I/O6TzQKRaQ5+V61D4ga1eKpgkSzCBStdMydnAb6IEUVUCcflDL1
	WVApdu6UPHGP1SiTRVFYEAQukgz8HN99kZ9e1VBklNJfPvztwCbGe7Ysj3/9APPe6ixbnsnxxkTqz
	ORnpP5Ys/TJLqM9bIi0/BhMjwNM8SXnIoqH3+z4W9bevfYu9n8IA7mV9Rex6XUVXgfQG6FcA3czTb
	/TCX2nxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwb3-00000006dmU-1nf9;
	Thu, 23 Oct 2025 14:47:21 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwb0-00000006dkp-0Tqh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:47:19 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4csplj3rxkz9v3V;
	Thu, 23 Oct 2025 16:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761230833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZG9mO41qdraguNJdS/6+Qp6H8j9kWox/Hp446T4ci5o=;
	b=bDGojmZbAN1nkACD7qeCBpRai7STixWjnUxtqLh9lHwtnlUuXkoYxz0t3vCuED50EVne9v
	oSvT5qU3rE91TMaTfFuyxm2A7FBVBubt2gG1xRrwLpGIb/4V0q+20scSzlg+lAR+KlyJQ7
	tMDsJ+2WRAAOnW8fXcuDiRhTksBZ+bkvjGslHkGdp4FCX9NlvWwt9wy3MPH5FmCFo1dS+E
	5vSQh+pRMO2mCVhxPWSr/Gmg07z5N4RgLrkgnOLS1elTnGY3ZQykShBpOTGMgNWUb2vxjf
	/I0e5PJOAVkxK8wESeRh8FfSnFlSa596VanP/5sOk7MuXk+efksasnSms7185Q==
Message-ID: <9164261a-56fa-458b-851c-6c8e59c73a22@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761230831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZG9mO41qdraguNJdS/6+Qp6H8j9kWox/Hp446T4ci5o=;
	b=pTWrJXBhpx87q1dsl5+0CHogbjgL2PNRmbH5tW/bX/o0Vnl/LR8kyaHEz3i0OfaPfB7v9n
	Rklejf4FFq6J1Vzm4GY8ImIRkOs8oalzINTRpyPhR4dx3kJe0BpVWthv7AwGk5dZr21VXc
	HwL+cgCWrUTjKzcOIBkh7pGoAHYQg29SSwWOT9Yhpfup9iUFi73eUnSUMZ88Iq4me8lC8i
	ZzFnKjaq+sy/yTkcRKhxwdNMBVkDb0tquZgB8yKIrACQxCk07cXqXMdbBoB01JmuAg/bid
	PVWRUtpvPEBAkcEHjoezX8xjLTsSdAX6X3A7lT4imH4oha0bOtoIipq3siD5Zw==
Date: Thu, 23 Oct 2025 16:47:06 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
 <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org>
 <20251023-illustrious-almond-catfish-5010eb@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251023-illustrious-almond-catfish-5010eb@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fr4zt5cqw3fgfmafahmjticiqdqzajek
X-MBO-RS-ID: dc816153aad6230af32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_074718_304395_9AA1775D 
X-CRM114-Status: GOOD (  10.88  )
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

On 10/23/25 4:36 PM, Sudeep Holla wrote:

Hello Sudeep,

>> This is not platform-specific issue. SCMI provider which fails to generate
>> interrupts can appear on any platform, using either transport, that is why I
>> made the property generic.
>>
> 
> Good point, but ideally this is property of the transport itself. For example,
> what does this "arm,poll-transport" can possibly mean for SMC/Optee transport ?

It actually is a property of the transport, except it applies to all 
transports (mailbox, smc, virtio). For Optee transport, this is 
implicitly true, since Optee transport always uses polling in any case, 
so the property has no effect.

> I understand this is a valid request, just not sure if this is the right way
> to solve( i.e. Adding this property in the SCMI node in the proposed form).
> 
> Let me think and give others a chance to express their opinion.

Sure, thank you !

-- 
Best regards,
Marek Vasut

