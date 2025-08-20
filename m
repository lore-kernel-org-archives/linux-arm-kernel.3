Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D013CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0BclcMgUFEkeFJPqOWj8PTPfLGgg0UOUTepEo6JjYU=; b=OQTLrmfGagOnNvwrkSdEhjr8Hx
	BpVcKAlQmJsaJOG7A7IILNIn4nKM8YbI3P6xQn53oUwdqI2r2Rrq9mopFmBOM1EM81sya+5kBw+ym
	OHaGQvhhEJ4R+BEF0cituEkfTCZlXTryyCIQYYBrr9Zk4N+KP5Ny3onfN0L7SqrzTbKWy1kROIL+N
	1Z22mTPHiVfiWhIdIfPKoWbaDmTKg71R2j1Og+uv0EqXuQLrRv9Pl+DOSs6aMCwVlEC8FTYnnVWPe
	6EIiJbQr/YKrv9+KRUwHte5LGy5akWfBAvI1azX4d4rLfjkOeJzGfrJdrizGgeYEXlqGA7LSe8R50
	IigQ9nqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokXR-0000000EDXb-11xa;
	Wed, 20 Aug 2025 15:15:45 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojN2-0000000DvJ1-2xFI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:00:58 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 035682D5;
	Wed, 20 Aug 2025 16:00:45 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 16:00:45 +0200
Message-Id: <DC7B5N92V9KZ.34OXBFYOIEWBO@kernel.org>
Cc: "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Tero Kristo" <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "s-vadapalli" <s-vadapalli@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-main: add legacy PCIe
 interrupts
X-Mailer: aerc 0.20.0
References: <20250819111317.1082515-1-mwalle@kernel.org>
 <ae898bf0-705f-4e36-9664-37c401f5fee7@ti.com>
In-Reply-To: <ae898bf0-705f-4e36-9664-37c401f5fee7@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_070056_887092_FC8EB113 
X-CRM114-Status: GOOD (  16.46  )
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

Hi Siddharth,

On Wed Aug 20, 2025 at 3:52 PM CEST, s-vadapalli wrote:
> On Tue, Aug 19, 2025 at 01:13:17PM +0200, Michael Walle wrote:
>
> Hello Michael,
>
>> The kernel will try to map the legacy interrupt pins, but the
>> interrupt mapping is missing from the device tree and thus that
>> fails with:
>>=20
>>    pcieport 0000:00:00.0: of_irq_parse_pci: failed with rc=3D-22
>>=20
>> Add the node for the legacy PCIe interrupts to fix that. This is just
>> compile-time tested.
>
> INTx is not supported by the driver as explained at:
> https://lore.kernel.org/r/be3e3c5f-0d48-41b0-87f4-2210f13b9460@ti.com/
>
> The patch to fix the error displayed in the logs was posted at:
> https://lore.kernel.org/r/20240726135903.1255825-1-s-vadapalli@ti.com/
> but wasn't accepted as-is. A different approach will be required to fix
> of_irq_parse_pci() instead as pointed out at:
> https://lore.kernel.org/r/20240729080006.GA8698@thinkpad/

Thanks for the pointers.

I've just checked the J722S errata sheet and there is no such
erratum. So, is that sheet outdated or was it fixed?

-michael

