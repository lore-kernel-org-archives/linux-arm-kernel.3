Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C20AC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgqpUsYSoK4Dnj5/HM8wBVKcJrsP4yo0Bbi3+Q66KPQ=; b=em57duu3qKSCthTP9PqIdzCx48
	ExevcMKFNSn4y5qS5vlKofk0QqPN0bxLi0H5y7htMDbAjUnE0ZkusElY7U42XWc8fJkX2uqICGXzm
	fTO98gDDZhMokQopF18ye864jWj6RYsIBip2uqRHdArSZiz1E9lazfWHkAOdGcYoA39jpSNv0tB1+
	ntMjC01Rpk36beBdk3QvkUzIrbevRZ3AQmBA8Sjzsd8+cV12n2sbfk0THUM4Ous5+sM4aRR6fjkIj
	YQpHSA3aCSmclfEUnG+zN3urVSozVRBtbjo8EGNvLkG0hs/zHZlAApAMAKdTm/Wk214NSPt6d/RyN
	FNrkHXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CSu-00000000Nt2-0jYA;
	Thu, 03 Sep 2026 18:47:12 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CSr-00000000Nsd-2xE6;
	Thu, 03 Sep 2026 18:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1788461222; x=1789066022; i=wahrenst@gmx.net;
	bh=mgqpUsYSoK4Dnj5/HM8wBVKcJrsP4yo0Bbi3+Q66KPQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NvqjXcylHtpnp86PIvggGrL5S+Hsk6Mge0NqTKNrec/V3tTxBuzMyRysREvvBXdW
	 EXTe50hetuZ4Ej+uzVvI4s+zxC+dTmDnlKH6ROlR2dc+P6hZZVVnFlA8bys5E8b0n
	 uE/nkn9ZiUw2WO2TN1JtJBnbImGSORvsRMfg0yLtVaaapqClS+59ZASPqkyzXO32C
	 i8XGx6Av1VbEIYEJWlvuK3l0one0E9zH8HFY7llCkccLoQZK63DIF7X9/s0508qIJ
	 E7KYKAeBHJelO8qjQkcb2/QhyKrdpflTgMO8kyx0lZ41XZ8sN878zgSj9889mgwfl
	 eQ1UKJfWt5ZWqAeCiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mv31W-1wkOWr3BRY-00t9nq; Thu, 03
 Sep 2026 20:47:01 +0200
Message-ID: <8f948621-fbeb-4807-a4c2-0214ce5d3bc3@gmx.net>
Date: Thu, 3 Sep 2026 20:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
To: Peter Robinson <pbrobinson@gmail.com>,
 Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Phil Elwell <phil@raspberrypi.com>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-3-pbrobinson@gmail.com> <apl6RddLcPz8Q2-O@apocalypse>
 <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
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
In-Reply-To: <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:H4OlE08/Lsa2UN7wigGEcbM39KpKXnDhCyQ1cUd34uE3P2HP7wW
 y4Q0aba8IenW9JmNVF8OjkTriz/NPVDK86BBGX6kU287R3uRj7LhUYrQVfXYyLC5SvubZZn
 lX7Yklf8F3E/xtknnRStGOZXU3okw5CxHZrOvNQzYmQU4fyaW7JevV8enMrPrLnfCuxIpXM
 0MqwTS+T3FbrRz5drNCLg==
UI-OutboundReport: notjunk:1;M01:P0:c/WiuyrRayo=;mDa1almqdewEi1tXJBqBudQQF3Y 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 92LPKEJQaLEKz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_114710_041196_5D4E4906 
X-CRM114-Status: GOOD (  10.78  )
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

Am 03.09.26 um 20:42 schrieb Peter Robinson:
> Hi Andrea,
>
>>> The thermal sensors on the bcm2712 (rpi5) are the same
>>> infrastructure as on the bcm2711 (rpi4) so add those
>>> details so we can get thermal monitoring on the device
>>> as it can get quite hot.
>>>
>>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
>>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
>>> ---
>>>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 32 +++++++++++++++++++++++
>>>   1 file changed, 32 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>>> index ae1fc9d728c00..c73ed9e066662 100644
>>> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>>> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>>> @@ -508,6 +508,18 @@ hdmi1: hdmi@7c706400 {
>>>                        ddc = <&ddc1>;
>>>                        status = "disabled";
>>>                };
>>> +
>>> +             avs_monitor: avs-monitor@7d542000 {
>>> +                     compatible = "brcm,bcm2711-avs-monitor",
>>> +                                             "syscon", "simple-mfd";
>>> +                     reg = <0x7d542000 0xf00>;
>>> +                     status = "okay";
>>> +
>>> +                     thermal: thermal {
>>> +                             compatible = "brcm,bcm2711-thermal";
>>> +                             #thermal-sensor-cells = <0>;
>>> +                     };
>>> +             };
>>>        };
>>>
>>>        axi: axi {
>>> @@ -724,4 +736,24 @@ hvs: hvs@107c580000 {
>>>                interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
>>>                status = "disabled";
>>>        };
>>> +
>>> +     thermal-zones {
>>> +             cpu_thermal: cpu-thermal {
>>> +                     polling-delay-passive = <1000>;
>>> +                     polling-delay = <1000>;
>>> +                     coefficients = <(-550) 450000>;
>>> +                     thermal-sensors = <&thermal>;
>>> +
>>> +                     thermal_trips: trips {
>>> +                             cpu_crit: cpu-crit {
>>> +                                     temperature     = <110000>;
>>> +                                     hysteresis      = <0>;
>>> +                                     type            = "critical";
>>> +                             };
>>> +                     };
>>> +
>>> +                     cooling_maps: cooling-maps {
>>> +                     };
>>> +             };
>>> +     };
>>>   };
>>> --
>>> 2.55.0
>>>
>> Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?
> It should apply cleanly against Florian's next branch here:
> https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next
this branch based on 7.2-rc1, not sure this is intended.

