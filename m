Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD32E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wligOEfk1Hx9irR9JibUq3PPtODiEir7MRB/8u1Zdw=; b=x41D85ZtFaoDIRfmdwTMnUiMc/
	Bb2nN77+Y0r+ABnokaCWGxqpR3/fZdiuxvBDNEIUi/EUFwvqEDL+xdZxvzjTMDDwslgjdtdmw5NPh
	GccbryAcv2RVO/s2Amgx91DcfuCRI3ZLBS0meYt0E5Xk61Q5Ol5nAPrdX/z6pDg6nVoyDYb6+UAk2
	8qWR7lKzcsuTuaQZ1xnjnt3Y76rRfir32AXgEfmVRZprhHvBpzYLXvfQ7Pitnv+7HX8KsaVoBsIZt
	0xUSlXAi14FvYLtmxfefV3/MaTUMK5L2E0nVmg2dIiTfRQGHs+XLYm6oElKlhFu9gasx8hGX3sJZv
	W7NXUf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbAI-00000007f0z-38dD;
	Tue, 14 Jan 2025 07:16:42 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXb8n-00000007er2-2fus
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 07:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1736838905; x=1737443705; i=wahrenst@gmx.net;
	bh=6wligOEfk1Hx9irR9JibUq3PPtODiEir7MRB/8u1Zdw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=N15x8nloW6U/tHnSxakvy4lFyEdlHWZW1352kVcV6eXCCPLaaavmVdxuXJphFIey
	 1N62u61RxILmc8UZIYjYjeIpRcrwJw+Z4mbeI6JZ3y3kZTn/XlDDltxze/J4zIQ35
	 3P40xveXfHJGfnDnoJY5uKpwIFqRIcmXaaN5c14JcRr1h/e/+XSW0bz4BMy823ABG
	 tg3L96Apkp9gRa3MbcgEru2SfJKg42nYK0peNtGuasg4iKXexpcWOiPa9HsCP8QrI
	 g8DVlh3eeTml4E9UI+5Un740YCeBsaarTsZlJtFp1ri7yKaP3Jtx7I1NytNK3uoRU
	 2mefiNu28qwEg3Cb7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowGa-1tCK4F2dwc-00hEV4; Tue, 14
 Jan 2025 08:15:05 +0100
Message-ID: <ad2497ad-17fa-4cde-a83f-e1115f333272@gmx.net>
Date: Tue, 14 Jan 2025 08:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable pinctrl-based I2C mux
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
References: <20241217193356.111102-1-wahrenst@gmx.net>
 <20241217195010.GE23470@pendragon.ideasonboard.com>
 <2f67c714-bdc4-468c-a867-d77e8c61291c@gmx.net>
Content-Language: en-US
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <2f67c714-bdc4-468c-a867-d77e8c61291c@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o8bfqnBhYsJvl/5rdIDiXLN/cMME75aINFjeuD635LrpbpHQqxe
 TStgpxlYjqeHkMXDuoTZFJV0H+ig/JUeHiO4Yk4f3XxVy2/E9+EXAe307dppKidGhyiJaz/
 DGkmq8WpTSSaXZ/DGhVd/U15DNLzW2rzXzoSuIGWZ9/NJ/5FQoYfLKWGYVDsIeUfpRO0pXE
 z8RnTUd4yiNrjrng6Whfg==
UI-OutboundReport: notjunk:1;M01:P0:oOFv/PtA7dA=;EnpOaClc4qFVrI6L9plTNps86wq
 F0WATiGg6r6nTaKRzw0CjoJVbGg8NqjQGKzgpNvd1Ikd/L62bIOCALEZ9DgKfO3uzNx08wt/j
 tR7h7zImyJ6cuxxIx+8URQQmAVq1klUTsJhYkmiZKd5WNUmrf1AlKpR/PlvKf96gm6PSgwz27
 i2EGk3iNgAataeq5jCGVREqvf2LtokRt63fQzzYHlt/+ngJleBx1+X5qVdEnc47+BUoQwkbQv
 LEMtPgI/1udKOt9I4WFw4IVamzEzjRM3GSfiBvfLtIJSSBuDCS4iizhDAfiMvKTEJkqYVCWml
 5qlPpXa//euO2J/qpVlbj8aZcJGY40uHUsJkoQp+RAtJ2/w5rwfF22Hdli2e7S3VXXN8bn+QR
 BVK1I2z1Ft8rIBQfkO3CwjyjHRsb4J80cOVwqCiEZ8CL7+xW8tvOIIvcggZUG7upxZbZaNAwa
 DUjA7BWJOVNOKiXqiZGXABd8RM/cQdzjzuwryiPgw+KyE470oScG4fOdgM/VTY4tfdueDtVGx
 8brfYJZOVstBReWJcGIPYFePDXd1ssXA8TmXsNq+QPi2bgYBWQOZ8RdLX8gESS3cwwld5HS35
 w5qi/n1TC0OcRogXVVTOI7TsG/Xyc1AyKqVArZOk87QTjxlnrmfjIrMf/zQV0mXwexs2Nv89X
 NFIcE+Zv44z4rFlTeV/mUWFSvLdodOcvUHto+Y8xzvJfsHqwINVuOC2Pi9qE4f8fNRbEMdcXT
 pjRqayBe+aKp9dh/iF635HKDJk94QW+/AtdptcyCgWNn8zgnSTdSXYneebOMA/L9jxYXFTQrQ
 HxulYevU05wfgapYnRlhLmRxtl92UcELUHkdqhA7j4fA0l7ni3eXKaa2J3fX74DMEk9ZujliH
 Z9oyek4GBMiEbCq+UAJo2NyGeUDhMtsbbmIBw2gMaGRKzFQNxK44QRtx+f+7RSGmXj4ffZ8ql
 prl2lHOmzWrYznTskt0Risb16WWOY6UzedL1xGyUGg/VsLzP/m7TCRgP3700FPube4cnVFlIs
 VZI/UzkEcsBZypJYRu2PK52h7L2ncwUm5UjJd1CidxAxF47LpWliq1rY6oLCt24uNYeCX3S6w
 a501NfSINzrCwbMlQarAeAO4GYrMEk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_231510_044246_D831B34B 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

Hi,

Am 03.01.25 um 10:26 schrieb Stefan Wahren:
> Hi Florian,
>
> Am 17.12.24 um 20:50 schrieb Laurent Pinchart:
>> On Tue, Dec 17, 2024 at 08:33:56PM +0100, Stefan Wahren wrote:
>>> The commit 84b1d6cc3e4c ("ARM: dts: bcm2711-rpi: Add pinctrl-based
>>> multiplexing for I2C0") introduced multiplexing for I2C on
>>> BCM2711-based
>>> Raspberry Pi boards. Unfortunately we missed to enable the necessary
>>> driver in the defconfig.
>>>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Link:
>>> https://lore.kernel.org/linux-devicetree/961b3d43-b4c9-4573-82d7-844aa=
129d994@notapiano/
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> I wish you a happy new year. Do you plan to pick this up for 6.14?
Florian already send his pull requests for 6.14. Any chance to get this in=
?

Best regards


