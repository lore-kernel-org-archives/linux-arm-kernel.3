Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F4606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LiwiFRf7;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=M5BMlIdT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=drmG8Nei2eFEJ87SKq5m/aoRCFf+pZY8Bds28IJxne4=; b=LiwiFRf73lihBN
	fIOAzVxPQSPnq1b1Qm9Xjin54Ws6sj7fz3HF8EA85v4dRlNpjHeH0r/LIGGif6F21rfSgqQWoOCat
	7653GUyf0dWtJrrNQvdjlQoNTqeMgKCHwu5N9mibIjGb3OwwUms5s1axgCb0Nzff9NtnVhWFY67T6
	PCf/sQplF00qo6X8SUykW1wF+6qcjz8dezMX5CFI3mP9pTID/pmdTXIO69k/n2wHPQk6oShQaS6M5
	DlqNUzAY5gPXX1puxqWQLAwcJLQQzURnwPzMMamw231wTB66Ak1/iKhzX1Eqlub6+5L6928HxZj3z
	hRTOiNu8wLwKy4H1TDTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsKu-0000000E7Xn-2ZmP;
	Thu, 22 Oct 2026 12:56:00 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsKr-0000000E7W6-3TcX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:55:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 106A710AB2C;
	Thu, 22 Oct 2026 14:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792673751;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=drmG8Nei2eFEJ87SKq5m/aoRCFf+pZY8Bds28IJxne4=;
	b=M5BMlIdTRHNvNeZk/cfo4PdmWuE5r6IkremRUT+EYDRjPd0zBjn2ePQNEbTByN4XTAr1JA
	pSNnJIdahnZ0GHLptr5mUVHekmlmAQy3pdc+WlgFWaLfZVYkCfi5Zw0m3T5xAaHkITkmLK
	7xBlEjwqLp8vZ6wEuofKnrkDW4NkWGlK1poYoGVosi4jJAJS4YVryjfmoNwChlyN0XHGVg
	WNz5i6FparAqD25lgf8MzKw6lCNtiuwfpkjSxosN+S1kBc5j2fl8BVaZr6752l2zz2Er6G
	O4/HwhmMgopdQ8FXcfdr1Da025S8nQ2h85m8AwhEgtKikxPuVWWBxhkGRBa4HQ==
Message-ID: <948d901e-ee1c-45f3-9946-30cea28a6128@nabladev.com>
Date: Thu, 22 Oct 2026 13:34:24 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 kernel <kernel@dh-electronics.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
 <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
 <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>
 <20261022092536.GA232648@francesco-nb>
 <794745ff1c484257bef4f17917f3cf0e@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <794745ff1c484257bef4f17917f3cf0e@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055558_027451_108CB15F 
X-CRM114-Status: GOOD (  14.51  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 12:58 PM, Christoph Niedermaier wrote:

Hello Christoph,

>>>>>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>>>>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>>>>>> @@ -60,14 +60,6 @@ &ecspi4 {
>>>>>>>      pinctrl-0 = <&pinctrl_ecspi4>;
>>>>>>>      pinctrl-names = "default";
>>>>>>>      status = "okay";
>>>>>>
>>>>>> Drop "status = "okay"" too , since this controller will be unused ?
>>>>>
>>>>> you can instantiate a new device on the SPI bus from userspace. up to
>>>>> you, but if I was a user I would appreciate to have it enabled.
>>>> Good point -- Christoph, is this the (use)case here , can the user do that?
>>>
>>> I don't think that's the case, since there isn't currently an SPI device
>>> connected to this interface. Nevertheless, I'd be interested to know how
>>> to instantiate a new device from user space.
>>
>> Documentation/spi/instantiating-devices.rst
> 
> This is a relatively new document, I haven't seen it yet. Thank you very much.
> 
> I'm now leaning toward leaving the interface set to “okay” so that the existing
> SPI pins on X10 connector can easily accessed in the future.

If you connect anything more complex than a simple device, you would 
anyway need a DT overlay for this.

> @Marek: If you insist, I can also remove the status line.
Either way is fine by me, but consider the above.

