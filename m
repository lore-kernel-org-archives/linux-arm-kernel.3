Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5ADEB48F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkGWUPE4kbgIrGU7OKLJU4AZXsAD3UfwYSHh1C3eZ8s=; b=ew3OiBg92tMXyQ5T6FqJl6jf2C
	kCRgQbTiSJYatqgYRMD6brJkAmXWsmVXIzOmd9SCintNkmOfli4E2QU5mQ77BNX8T7fDeYnIkCZWT
	L8EoFfNH2ARDF4JruwY3w8yGgqCioCKxn1i84pX0+g/pN7KO+98afwL3IxW9xpDU3YP6r/+QA2RGa
	UE+lE7LTBIenfwcJnvw2z87S5vXqcJWFf/4lwc89MgaKaRXXazdFhxV5jF+Jz4ZY+5ziMW0oxwXW0
	Yi7gItoScB0wA3izOtTPzpjcCdjQxE+Jnf4YisIdn5+cMUUGfIepFx5Gn8zPbsKie7ED6K1j4Kvve
	Y9ydRJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTST-00000001sS3-2U2O;
	Thu, 12 Feb 2026 09:58:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTSR-00000001sRV-2QB0;
	Thu, 12 Feb 2026 09:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770890277;
	bh=iI/SDCfh9dwezKTtvQ5Eybbk3cWcaOxqf8BgHUVGu8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qx7j6msvSlwIPvhIdnaGJURYQJkiClQGtAQfeUMjbThdUhwbtD9koTFe30N5bQIdI
	 FfIWh7nHzqo4b6RTawfBl4XbzBXO7IlCFn9K91gB03B4F+oTBpVfcD7P/7Bhvs5h5r
	 1Io7K5e/NB+IfMj3SMejAhjBQV+qSb3CQBW8b/+VfhMep11NCKOU1fQbYgi72ydSLY
	 SY+ebUYoCvIlL3FbRcV0wHnbjoDQMM1SBZPwQfUlMYpe85yXmIqofgRx8151AmQb1E
	 yqrXotGuKvxk8Rwb5DY6jC3bYANmqGMlbuahyp60zjeZV+jg5TdiMLly2mFtkRgV01
	 /qihAKdQ/E9dw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93A7917E1305;
	Thu, 12 Feb 2026 10:57:56 +0100 (CET)
Message-ID: <01682ecb-b3bc-41de-94e0-83271ba121a4@collabora.com>
Date: Thu, 12 Feb 2026 10:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: mt8167: Add the mmsys reset bit to reset
 dsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
 <CAORyz2LRkVcOss3vFS3Y3FtZfn_s-Um8G9JLgedXEeySorr0=w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAORyz2LRkVcOss3vFS3Y3FtZfn_s-Um8G9JLgedXEeySorr0=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_015759_767652_53E75F98 
X-CRM114-Status: GOOD (  14.11  )
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

Il 12/02/26 09:01, Luca Leonardo Scorcia ha scritto:
> I apologize for the mistake, I did not notice that the dsi node is not
> present upstream yet, so this specific patch won't apply. Any comments
> are appreciated though!
> I will send a separate patch to add the display nodes to the dts and
> the required compatibles to the bindings.
> 

Initially, I didn't notice either.

P.S.: resets goes after phy (alphabetical order)

Cheers

> Il giorno mer 11 feb 2026 alle ore 20:06 Luca Leonardo Scorcia
> <l.scorcia@gmail.com> ha scritto:
>>
>> DSI hardware reset is needed to prevent different settings between
>> the bootloader and the kernel.
>>
>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8167.dtsi | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> index caf51f203dd3..ee2792d53b2c 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> @@ -8,6 +8,7 @@
>>   #include <dt-bindings/clock/mt8167-clk.h>
>>   #include <dt-bindings/memory/mt8167-larb-port.h>
>>   #include <dt-bindings/power/mt8167-power.h>
>> +#include <dt-bindings/reset/mt8167-resets.h>
>>
>>   #include "mt8167-pinfunc.h"
>>
>> @@ -189,6 +190,7 @@ dsi: dsi@14012000 {
>>                                   <&mmsys CLK_MM_DSI_DIGITAL>,
>>                                   <&mipi_tx>;
>>                          clock-names = "engine", "digital", "hs";
>> +                       resets = <&mmsys MT8167_MMSYS_SW0_RST_B_DISP_DSI0>;
>>                          phys = <&mipi_tx>;
>>                          phy-names = "dphy";
>>                          status = "disabled";
>> @@ -295,6 +297,7 @@ mmsys: syscon@14000000 {
>>                          compatible = "mediatek,mt8167-mmsys", "syscon";
>>                          reg = <0 0x14000000 0 0x1000>;
>>                          #clock-cells = <1>;
>> +                       #reset-cells = <1>;
>>                  };
>>
>>                  smi_common: smi@14017000 {
>> --
>> 2.43.0
>>
> 
> 


