Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10989E64AAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vipYl8OMCsQxnZufHGtofiUF4Z2+hpq2hYwJztq2ER8=; b=RXhHLJE7QpFVI5wLU+wuyfcCRR
	+Two+qk/b630LcZ73agBg9AMflmtGYCka9bNLdhp624/g/RzjZFof3YZIbaxPy+5aq93TR65iQkQn
	pkdwD+JPKtF/SyT7mEA0FTyN5eEUnV+OvIo+R+KFpP/TOmrpB2NxUOiXRfaLi4drLcjgq9Yy4w/Ye
	tm2azYbgtRFRRERO5LjJCORydw2AqlRjZp4DtcFvPcxeDZZmK6oRjmHIRzUc3epBW4t6woNLS9pF6
	bNNKZazRbWoqBeV4gBPIr8jQJdnK1Y398VUaBdt77Ty4rGpfOK+0oG4Rkt5QKuSMfbXflkJR9O2iG
	kqLNg8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITWe-00000009iwb-1lIg;
	Tue, 03 Dec 2024 14:05:16 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITVd-00000009iog-2fHC;
	Tue, 03 Dec 2024 14:04:14 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 070F01014AA;
	Tue,  3 Dec 2024 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733234647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vipYl8OMCsQxnZufHGtofiUF4Z2+hpq2hYwJztq2ER8=;
	b=f/f9I4fq5LUsvvQpJUc3j1tOct81A9BEm3uROVGNsp3TLmmXbO9sFsRSKeUvdcL8UaGN+O
	taLldzn55kEQ8I6u5N1hdFcMb7sX+tlqFTFHXU5trIAUErQc/M2tu5IgbOBvMsHkACZu7i
	PbzSPZJLA3nEMAOAFuDHJgiDa7Y5ZME=
Received: from [127.0.0.1] (fttx-pool-157.180.225.184.bambit.de [157.180.225.184])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 4E8E0360048;
	Tue,  3 Dec 2024 14:04:06 +0000 (UTC)
Date: Tue, 03 Dec 2024 15:04:07 +0100
From: Frank Wunderlich <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 14/18] arm64: dts: mediatek: mt7988: add pmic on bpi-r4
User-Agent: K-9 Mail for Android
In-Reply-To: <a0137698-43d7-4cb6-a69c-98a5e90b13f8@collabora.com>
References: <20241202122602.30734-1-linux@fw-web.de> <20241202122602.30734-15-linux@fw-web.de> <a0137698-43d7-4cb6-a69c-98a5e90b13f8@collabora.com>
Message-ID: <9CCD2C57-7632-482F-80A1-8786403243B7@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: cfe3b074-989a-4be9-864f-32e0d9121ec1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_060413_832510_8696CE7E 
X-CRM114-Status: GOOD (  12.92  )
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

Am 3=2E Dezember 2024 10:40:35 MEZ schrieb AngeloGioacchino Del Regno <ange=
logioacchino=2Edelregno@collabora=2Ecom>:
>Il 02/12/24 13:25, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>
>arm64: dts: mediatek: mt7988a-bpi-r4: Add MediaTek MT6682A/RT5190A PMIC
>
>The BananaPi R4 board has a MediaTek MT8862A PMIC, a rebrand of the
>Richtek RT5190A chip, connected to the I2C0 bus=2E
>
>Add the relevant node and, while at it, also configure the regulators
>from this PMIC that are used on this board=2E
>
>> Bananapi R4 Board contains a MT6682A pmic which is compatible to rt5190=
a=2E
>> Add its node to the i2 controller=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>   =2E=2E=2E/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts  | 51 ++++++++++=
+++++++++
>>   1 file changed, 51 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts=
 b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts
>> index 13ca016d6a67=2E=2Ebc1ec73b8ddd 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts
>> @@ -2,6 +2,8 @@
>>     /dts-v1/;
>>   +#include <dt-bindings/regulator/richtek,rt5190a-regulator=2Eh>
>> +
>>   #include "mt7988a=2Edtsi"
>>     / {
>> @@ -65,6 +67,55 @@ &i2c0 {
>>   	pinctrl-names =3D "default";
>>   	pinctrl-0 =3D <&i2c0_pins>;
>>   	status =3D "okay";
>> +
>> +	rt5190a_64: rt5190a@64 {
>> +		compatible =3D "richtek,rt5190a";
>> +		reg =3D <0x64>;
>> +		vin2-supply =3D <&rt5190_buck1>;
>> +		vin3-supply =3D <&rt5190_buck1>;
>> +		vin4-supply =3D <&rt5190_buck1>;
>> +
>> +		regulators {
>> +			rt5190_buck1: buck1 {
>> +				regulator-name =3D "rt5190a-buck1";
>> +				regulator-min-microvolt =3D <5090000>;
>> +				regulator-max-microvolt =3D <5090000>;
>> +				regulator-allowed-modes =3D
>> +				<RT5190A_OPMODE_AUTO RT5190A_OPMODE_FPWM>;
>
>Does it work like that?
>
>regulator-allowed-modes =3D <RT5190A_OPMODE_AUTO>,
>			  <RT5190A_OPMODE_FPWM>;

It seems working, dtbs_check accepts it and i can boot up with this change=
 and see no errors caused by it=2E

>If yes, please write it like that - if not, I'm sad - but regardless
>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino=2Edelregno@coll=
abora=2Ecom>
>


regards Frank

