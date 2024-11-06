Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24B7D35E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 01:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1yoKzgo8+wbpL0mDUyPIejCTWSCHY6sxQ3QEw31KAs=; b=wPWnQRL3KkejqgxW/5TWdybn5E
	nkRXagHQ9gwf1V7vrcFfwpSGpQfsGsXFMUuiaTzT95imdcoBWgq0kEv7/bhulVujqwCo6E7w9oo7Y
	2qKvdUbwkV/G3SRGutnYF/H3Q1Cpr9o/Lp89gQv7A9GtK9drziCyZI2p0cTqZqWB1sP7hu1JFclwV
	MwD36xAnGpobTK5Am+A3QFbmO+DxH7PlLJu68L8LW1cKLSNuKN5UBYC4K9T6dqzBciECv6X86JCTs
	D6CGg4WmLFWQeTmVijmetCD9z605EpW6eGMasUK2p9YSJQc7VpTYMlFSg676vJQTP/zzMRpAYD49F
	Gbhnc1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UqA-00000001JlF-1xTk;
	Wed, 06 Nov 2024 01:28:10 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Unk-00000001JU1-3pi2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 01:25:42 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 78B3388D8D;
	Wed,  6 Nov 2024 02:25:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730856339;
	bh=Z1yoKzgo8+wbpL0mDUyPIejCTWSCHY6sxQ3QEw31KAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mYivpvwalNGXewCotlReMZWG1dRdUf1S1ohdtCbhS1fxo4ihlzs9T6d5R/MNBQ6AS
	 wUZg2iduzOO0MalQemqPOVhRec8AiaDU8G4DYFtzq2iCFo8bYuYetiypuN30WjmHnU
	 fHoaIYHmB0BE0vmVzSh+Ca3f8ZDxUrIg9crHRQxz/hDc1+daXd+f+aUeeIQRNzx0Lc
	 pWmbTgQas5CWMwnaM+uXci77LmiFoVaznHl9Hiw2N83FSqyH3BmQzgkbFLY67nADZ5
	 0TSCqxwQGO2liQh6vwn0qGU5bzfysD821pASO4NnzeUUe880EwBmLQn1cVufRbuPV3
	 gmgvOdxUzSHcg==
Message-ID: <35a05978-a83f-4746-92cd-108b6586ac08@denx.de>
Date: Wed, 6 Nov 2024 01:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: stm32: Describe M24256E write-lockable page
 in DH STM32MP13xx DHCOR SoM DT
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20241017190933.131441-1-marex@denx.de>
 <b616628b-f9e3-42dd-b5dd-e7aa0235daae@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b616628b-f9e3-42dd-b5dd-e7aa0235daae@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_172541_303534_1BFF433B 
X-CRM114-Status: GOOD (  16.28  )
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

On 10/29/24 4:28 PM, Alexandre TORGUE wrote:
> Hi Marek
> 
> On 10/17/24 21:09, Marek Vasut wrote:
>> The STM32MP13xx DHCOR SoM is populated with M24256E EEPROM which has
>> Additional Write lockable page at separate I2C address. Describe the
>> page in DT to make it available.
>>
>> Note that the WLP page on this device is hardware write-protected by
>> R37 which pulls the nWC signal high to VDD_3V3_1V8 power rail.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>> V2: Fix up the M25256E in Subject
>> ---
>> DEPENDS:
>> - https://lore.kernel.org/linux-i2c/20241017184152.128395-1- 
>> marex@denx.de/
>> - https://lore.kernel.org/linux-i2c/20241017184152.128395-2- 
>> marex@denx.de/
>> ---
>>   arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/ 
>> arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
>> index 5c633ed548f37..07133bd82efa6 100644
>> --- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
>> @@ -202,6 +202,12 @@ eeprom0: eeprom@50 {
>>           pagesize = <64>;
>>       };
>> +    eeprom0wl: eeprom@58 {
>> +        compatible = "st,24256e-wl";    /* ST M24256E WL page of 0x50 */
>> +        pagesize = <64>;
>> +        reg = <0x58>;
>> +    };
>> +
> 
> You could have sorted nodes by I2C addresses.
Fixed in [PATCH] ARM: dts: stm32: Sort M24256E write-lockable page in DH 
STM32MP13xx DHCOR SoM DT

Sorry.

(I also wrote me a sorting tool in the meantime, but it still isn't too 
good)

