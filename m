Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB7BCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOLaMVFpmYVh1bKEOwH+Y/nXUsErlVSXLPMaBCSyCq8=; b=C0vCqHlot+BjoiBgMmEMDJehqN
	lCCZWAulyxZhB4QxY7CBzRYQiH5QN9dM7L1V7SiZ9G3/W76DCYvm6pdXdzldG+uMWT7dCiJKbR9H3
	W3earxz9obJp7hyAReGdRjeELLfqxZbVmNx6ff6dmCgIca1FNKItl1pCC4hefCYVwzOVoSJV6fuUe
	xgyV720EeHk2Eoj1wUfOZtFOZIl4jE9hy/70npOBOPG054RzCAK7ot1W2cX80aOzi60FdhQu1Sl0x
	3fu9lLSlOoUwKy6ptJVdiEeGC9boSZWpC1B6G7pI4Z0xFtuwlktzpPrqDfkJCn1t0uq5vm3UtOSPu
	c5K+mzkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6VGq-000000043N1-3b3U;
	Wed, 08 Oct 2025 14:36:00 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6VGn-000000043ML-2bwq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 14:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1759934061; x=1760538861; i=wahrenst@gmx.net;
	bh=SOLaMVFpmYVh1bKEOwH+Y/nXUsErlVSXLPMaBCSyCq8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Cwil4agjyC0s92drucBXx7CJAt9aiepygJlyT7P7IEaoLlEAfoytSycCYtw5YxbZ
	 SlvVbhULG++tY065lSK+W55pxwjz0cBI+9jct/G5Fbx4m5Z6ZaN2CjvjnMC+ZFDKE
	 seLDEiqF7rrIpGrQDBlukmfaad6YJIGIRlASeZluIxU6bIXCpvlGIWkCUNO2i1iP+
	 IfBKL5vdzCLoHb0VxYVGV6ZEwuWr22ElIGrvqtur9BYJxE6kZOe/iq2Byam7nknHA
	 aJTTRwDQ/yZjIqsiSvqfDTOWMRwMSXlac6icVReFksMjLk/m5VcT7qemSO3vdt3hH
	 4KTzNEaSFQUEILM7Yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([79.235.128.112]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDJX-1uTou33Jy3-00pOaT; Wed, 08
 Oct 2025 16:34:20 +0200
Message-ID: <236bcb89-203f-4524-9512-cd77a558faab@gmx.net>
Date: Wed, 8 Oct 2025 16:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Rob Herring <robh@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Scott Branden <sbranden@broadcom.com>, Melissa Wen <mwen@igalia.com>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd
 <sboyd@kernel.org>, kernel-dev@igalia.com, kernel-list@raspberrypi.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20251005113816.6721-1-wahrenst@gmx.net>
 <20251006203509.2056322-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20251006203509.2056322-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:EyC4Fzsb683ikwexkeENPxMttDHX3g15NDbT9s4LM7tfAaS1APH
 wsheSjkbtNCDfbKhy9nrpjP2M0PNBKsSuNY7JcvKhyCcmzC34uDyqDtlGM0K2+td3GWUkWo
 y/akN9z/PjsEVU1DZnPie2gWzEJcOtAzcZu4qJO304MsOSYkODsYBLLBJChw4Ni9wXXxNPn
 KBrjFaeMbDRQJoukIkg7w==
UI-OutboundReport: notjunk:1;M01:P0:rV9oOL4i0ig=;tDLKhVd87gWEXY3og+0uqGODdzm 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 LyY/pjWQhtSVHEOx9qWvpCM8c8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_073557_962174_3A177DFD 
X-CRM114-Status: GOOD (  12.20  )
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

Hi Florian,

Am 06.10.25 um 22:35 schrieb Florian Fainelli:
> From: Florian Fainelli <f.fainelli@gmail.com>
>
> On Sun,  5 Oct 2025 13:38:16 +0200, Stefan Wahren <wahrenst@gmx.net> wrote:
>> Until commit 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off
>> when preparing/unpreparing") the clk-raspberrypi driver wasn't able
>> to change the state of the V3D clock. Only the clk-bcm2835 was able
>> to do this before. After this commit both drivers were able to work
>> against each other, which could result in a system freeze. One step
>> to avoid this conflict is to switch all V3D consumer to the firmware
>> clock.
>>
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Closes: https://lore.kernel.org/linux-arm-kernel/727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com/
>> Fixes: 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off when preparing/unpreparing")
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> Co-developed-by: Melissa Wen <mwen@igalia.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
> Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
could you please check if it's pushed?

Best regards
> --
> Florian


