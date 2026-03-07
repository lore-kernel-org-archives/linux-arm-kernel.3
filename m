Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA8FFC9EDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uO/7x1mKXgItzdyCiS372PCikfzpIVhgGhN++3lTYuc=; b=VEIDnkBHPSh3lA/tYqWLY9tDTF
	k7o2uRurMr/IAhO3a6LynxWzpZ0v6z0dIi0bK5vUXmC3LxC4EUlHG8BCUe1r1qp1UngMVVx6+xAFB
	IMYvGCQwpC1kfWc3uQ1jDLEHDrCICrRaFB3+wDMbK0ogy3BklHJJjYIpPvW7Apso2yt7no1hR1Ye1
	2pdX92tegJ5BE7emBxTzveIxL3oDPu7mm4S026EJMjwh46ZIJFvSsBS2cYE3/t63Xr3imaWpL/byK
	5HPOYCd4th3ds6PynhGk3SviQred4s7ppto/ARNPdoaPeQ/VNiICe617jiZ37aShpdScp7sCFcMfN
	sTabNt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymNF-00000004zD8-08D5;
	Sat, 07 Mar 2026 07:46:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymNC-00000004zCn-0134
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 07:46:55 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ae3a2f6007so53231675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 23:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772869613; x=1773474413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uO/7x1mKXgItzdyCiS372PCikfzpIVhgGhN++3lTYuc=;
        b=ePvpzfTuFbskdC4t3XDc/rnoOM/udg0MreBNBUx77cG4IKN7p4uy655D5jf6HBlmKd
         aZ+zkhOwT94LiNRlTV7lx6LYSttY0S9+WRwrZaNb68vSnTJRIAJXVScU9fLmYF0yureF
         i/+lLX2Nb79jQ2++xqQmYBiLxIkPlO0KVgyIpV8FJI9dYRZKHNxynIEoURnoIdEVV/ke
         E8VbiNHEREvvhfWGj+IBhDWuFXAfXuNNOiHz1fmkhk/hWCgYbwFSRk1cOM2Wcpxn/m1Q
         1+YNDwoZK/f7d4Q4KCBdg/dLX9L+MUdTYaMeLHqkuWmJb651pjCTRdhDd2sEhF7lc3Gl
         9enA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772869613; x=1773474413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO/7x1mKXgItzdyCiS372PCikfzpIVhgGhN++3lTYuc=;
        b=nMvqV2jTHEOfhq5eHIQJ9kxg1rCOVFBi0fiPvO6Oz7iHozp0vYBOxA9I/yi7rvD5eF
         /gOMHtSmDEvDTQBnb9wqgJOaMHDnra+1yf6E2ONiV6ILUZIwUEo6wXbE0JWgTdHIaF+A
         4SpVPxs26+/oZaIi5Wv2sF0gqSt5Zvg48UhVAMcqhZkJNJ3tLCNPB9Q8M5u1lQQ0m3jp
         0xaJnDvuTlrq6vhX1xDYz7N068p8xOFTHMJUeseWPvD8wkTREjv9c2lFPCKOb81ThhK4
         yvNULapP3m+W7qSssMK6aQkFGHO4Cil6IJyLEG49ObbM2usBokeg7MDVqFFEugWMxd6t
         11sA==
X-Forwarded-Encrypted: i=1; AJvYcCUgVov2JxWFTmzaiaXVNjHwV5dMmOJF2WrxNbJUOB5QqZtPzS0imvRM7cbx90NBZdTGLZ0CEnorU4QFy3tTgvTb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwhbp0erBi6FoqHh9lMQdjRQKEdc1vZOvNBzUKCjzjh1od0G8P
	V+ai9eByHRxrnMsR3n1dKkw7ydTARRYgM70V/J0pSCO4/R0tV+OspjSwGglfHw==
X-Gm-Gg: ATEYQzyU6FI3xla4QRiaUruBqpDkdBKLlTEuPSNcQmZasw4KiZeN16s4uFp61xfqSVP
	vekDFXpnm6ypAYh578G+1HWnOqSIeX84pG5x0oIzB8QZQN5TlXmse3uh0UN6wqhT6jnQNYslYZ0
	XpiG3dtMy2EId6TiaAghUiL3ED1IzLg9EiMyMWx7/WlgT4Yioitcv8snFMACRtP+2KNaDkZ96Bs
	7cjqPcPEToF0vFqZ+nwbQBaCeleTtSJ3da0yfboS18Nc5+3GfYh52fXfXG38NfCSDNNNLuLoB+u
	lxPc+Mw0/71byBuZBr/NJbxr2CMp/q6pmWD+ybFIuX4xiNJnkQonKaS+Wb6oWPZIyGhcz17JOE4
	PQ8fGkH43gZ43d3g7kW078pABw1XHDOwoimnuZxffEyzxQPjw7gusylI1axdQMhb6200rWUl1BW
	QOfNS0EiHuykuwQ3d04RdT+Fh2KoVJrrqz7ZtPex2S27T9
X-Received: by 2002:a17:903:244f:b0:2a7:6aa5:68f3 with SMTP id d9443c01a7336-2ae824eb3d1mr48380995ad.34.1772869612670;
        Fri, 06 Mar 2026 23:46:52 -0800 (PST)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f9d4d3sm41634435ad.69.2026.03.06.23.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 23:46:52 -0800 (PST)
Message-ID: <924b7631-0b75-4ecc-bae2-162abb4bdc31@gmail.com>
Date: Sat, 7 Mar 2026 13:16:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] dt-bindings: usb: atmel,at91sam9rl-udc: convert to
 DT schema
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Herve Codina <herve.codina@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-4-6d6a615c9c47@gmail.com>
 <20260306004931.GA875708-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260306004931.GA875708-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_234654_050055_910F7CC8 
X-CRM114-Status: GOOD (  10.82  )
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



On 06-03-2026 06:19, Rob Herring wrote:
> On Tue, Feb 24, 2026 at 01:13:01PM +0000, Charan Pedumuru wrote:
>> Convert Atmel High-Speed USB Device Controller (USBA) binding to DT schema.
>> Changes during conversion:
>> - Include "#address-cells" and "#size-cells" in the properties since they
>>   are required by existing in-tree DTS definitions.
> 
> The DTS files are wrong unless there are child nodes and there aren't.

Yes, there is no child node but these properties are defined in sam9x60.dtsi for the compatible "microchip,sam9x60-udc" and the yaml fails dtbs_check if I remove them, can I send an another patch for removing these properties from sam9x60.dtsi?

> Drop those.

-- 
Best Regards,
Charan.


