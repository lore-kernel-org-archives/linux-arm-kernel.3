Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3217C61DB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWzWWNS42exc7ZHN0500c9MV5vEAEMaWiWpVREU3tJ0=; b=JihYVlTTUJv1rPkyaybc9QNtvT
	dUieQu53MPXrc5udp1tID8adx6aZyxsbN7Egu1wpknHrREs+L78MlQMKhYiU6Lsroq6AG9xzCnGHM
	Un42bKexqquWTHgdxgUPQzvoud5TJ2l9N4PfMelpgKRAmP5G0jiW+B3FJjSq880ASiqi5afNKv658
	hA3nooHBQmH7gziOHXMEh9Ku04S1Kgh+Aeyfdk0vHS0ZivKGhSQa4xNQr/QI5xvLkjP36PBSsmiCp
	qx5RLRuGgVf+mRgFzIOhpw9AwUZuCqf3QbVd1b178FCMQMoxtc/+8LuDQmNImwASVhpIEecwx26jP
	kPZvprfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynl5-00000000WUO-1Y5y;
	Tue, 25 Aug 2026 09:47:55 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynl2-00000000WTA-42MN;
	Tue, 25 Aug 2026 09:47:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 879F911CBA7;
	Tue, 25 Aug 2026 11:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787651259;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qWzWWNS42exc7ZHN0500c9MV5vEAEMaWiWpVREU3tJ0=;
	b=KA41FsLojocrPYcAPQ5ThUy7TmZo41kwn3HTeEpM3yq9L9aybF5GosZV+tHWUWNxBGFKzw
	TpJ0BPMsvZ+3AO62YXUCEXwEZipbVfJXnFIvwuexTFpsNpU8VgyLRhSt8idP/V2ySY9FLG
	xldTKRU2LSnYLrqKot9/CtG2GkQED4xj3mETtSFq920LoQztVtUA/tym0aWimuSS7UJeSh
	MPK29nwryWqkv14eupeLr4h8ORuKk7v4lZ9kXGCrb3Ip/sgd7DF4OUY3tswdTLNVgffWmw
	3d7qxqAVB++fBBBu8lrxpqjL19gYcl7irm1t8nuyMZpe/g7uio7CQlBO2HBozw==
Message-ID: <ec43c68d-7f68-4ad0-9bfc-2b6dc0c5ec14@nabladev.com>
Date: Mon, 24 Aug 2026 16:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] arm64: dts: st: Add USB nodes on stm32mp231
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Francois Choleau <francois.choleau@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-9-marex@nabladev.com>
 <a77b459f-5b08-453a-a247-c320617beee6@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <a77b459f-5b08-453a-a247-c320617beee6@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_024753_222925_C04C8DE2 
X-CRM114-Status: UNSURE (   7.15  )
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

On 8/24/26 3:18 PM, Fabrice Gasnier wrote:

[...]

>>   		syscfg: syscon@44230000 {
>> -			compatible = "st,stm32mp23-syscfg", "syscon";
>> +			compatible = "st,stm32mp23-syscfg", "syscon", "simple-mfd";
>>   			reg = <0x44230000 0x10000>;
>>   			#clock-cells = <0>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			usb2_phy1: phy@2400 {
>> +				compatible = "st,stm32mp25-usb2phy1";
>> +				reg = <0x2400 0x24>;
> 
> Hello Marek,

Hello Fabrice,

> The size 0x24, covers the PHY control, trimming and vbus control logic
> for PHY1 (USBH). So this allows to later extend the driver for that, right ?

Correct.

>> +				#phy-cells = <0>;
>> +				#clock-cells = <1>;
>> +				clocks = <&rcc CK_KER_USB2PHY1>;
>> +				resets = <&rcc USB2PHY1_R>;
>> +				status = "disabled";
>> +			};
>> +
>> +			usb2_phy2: phy@2800 {
>> +				compatible = "st,stm32mp25-usb2phy2";
>> +				reg = <0x2800 0xc>;
> 
> Then here, I guess the size should cover also trimming regs ? e.g. 0x10 ?
> 				reg = <0x2800 0x10>;
Uh, yes, fixed in V4, thanks !

