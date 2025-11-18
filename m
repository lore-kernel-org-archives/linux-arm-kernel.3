Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AA4CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFvpwnIBXk6/SfJojjGBr4Pm95AOa5Yd9irGKpoKo9Q=; b=jc6c8p2+wc9b9TkoscTE8EeBv3
	b5EoVno6EH0Pfu0Yqiq7cdtUFZ/KRfCUYzyEp1vTyJkO2VvQnd6X9t7ko1IrLDIKF7nBYKPCkh+C4
	RQX6Y7yF/w9tZSBry9WdrOg8UceHzXLUXstprbyRYT+tGKNj7aXtrbD1sQmEY5rRc33uPgifmqEiy
	/FxYW18gQOmn8DlvQTd/7zUPSh0NXZ/tO6cIevRhLnTFKZe3JJqme9KQZuegStXSPh0cR0NGvovJ0
	fm+B1MXdS20IjufPxb8d3TSsKYk55j1wqb9//l/CQ499hcSKC7WvEJGAytuGh+f4cSH4eJJv8eyaF
	ptzAqseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9qB-0000000H3Z0-1fOW;
	Tue, 18 Nov 2025 00:45:03 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9q7-0000000H3Xh-0wVO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:45:01 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251118004448epoutp01d06dcae3d57141ec2ed2d952812fb3cf~48zsHtt7T2667626676epoutp01m
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:44:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251118004448epoutp01d06dcae3d57141ec2ed2d952812fb3cf~48zsHtt7T2667626676epoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763426689;
	bh=kFvpwnIBXk6/SfJojjGBr4Pm95AOa5Yd9irGKpoKo9Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=IdWr7dr8ERXGjQJKx5XvJ4TvTa/S7mI+ewUMatrez1pidMfb8hLWomNL6l39ufrfy
	 cRdpHLGJ7DvW0+ov5Ctsz5pU1zQKZl0z3Tc93Qn5+e8xxeUrrsyqIl7HdTmN/wl+n9
	 zrN68+ahEMrdVHbgOHqzLz8NDV1EPS4Bh7YE3t/M=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251118004448epcas2p4990b7cc628c8f69b0aa4417e053b68ba~48zrWrmCK2473624736epcas2p4U;
	Tue, 18 Nov 2025 00:44:48 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.211]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4d9Qqg5CF3z6B9m6; Tue, 18 Nov
	2025 00:44:47 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251118004446epcas2p2de701b1d9607623cff5a06d241db6285~48zqQBOaB0462004620epcas2p2_;
	Tue, 18 Nov 2025 00:44:46 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251118004446epsmtip1c2afdb5c4f1268c6a0ea1147c09edb43~48zqJnd592500525005epsmtip1d;
	Tue, 18 Nov 2025 00:44:46 +0000 (GMT)
Message-ID: <f960540a-e5d5-40e3-a2a5-6a775a17fbee@samsung.com>
Date: Tue, 18 Nov 2025 09:46:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 2/5] pinctrl: samsung: fix incorrect pin-bank
 entries on Exynos2200/7885/8890/8895
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, krzk@kernel.org,
	s.nawrocki@samsung.com, alim.akhtar@samsung.com, linus.walleij@linaro.org,
	peter.griffin@linaro.org, semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <15549ffd-9ae6-428a-a9b0-73676fc252fa@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251118004446epcas2p2de701b1d9607623cff5a06d241db6285
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117073603epcas2p1366028012403591bd297764f91694181
References: <20251117074140.4090939-1-youngmin.nam@samsung.com>
	<CGME20251117073603epcas2p1366028012403591bd297764f91694181@epcas2p1.samsung.com>
	<20251117074140.4090939-3-youngmin.nam@samsung.com>
	<15549ffd-9ae6-428a-a9b0-73676fc252fa@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_164459_581770_48EC177E 
X-CRM114-Status: GOOD (  25.32  )
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

Hi Ivaylo,

On 11/17/25 22:42, Ivaylo Ivanov wrote:
> On 11/17/25 09:41, Youngmin Nam wrote:
>> This patch corrects wrong pin bank table definitions for 4 SoCs based on
>> their TRMs.
>>
>> Exynos2200
>> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
>>   'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
>> - Per the SoC TRM these banks must use the 'alive' layout
>>   (.fld_width = {4,1,4,4}).
>> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
>>
>> Exynos7885
>> - etc0, etc1: update bank type to match the SoC TRM.
>> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
>>
>> Exynos8890
>> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>>   a non-external interrupt bank.
> 
> Interesting, so there are disparities between vendor kernel drivers and
> TRM?
> 
>> - gpi1, gpi2: update bank type to match the SoC TRM.
>>   exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
>>   exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
> Vendor kernel [1] points to these being bank_type_4 (4, 1, 2, 3, 2, 2)
> 
> [1] https://protect2.fireeye.com/v1/url?k=4f17b83f-2ff52562-4f163370-000babd9f1ba-2f14da64e4262efc&q=1&e=e88c07b3-b735-4e09-975b-82266d6f3d7b&u=https%3A%2F%2Fgithub.com%2Fananjaser1211%2FCronos_8890%2Fblob%2F0460c258d6910628410263dc838a81be8bda6776%2Fdrivers%2Fpinctrl%2Fsamsung%2Fpinctrl-exynos.c%23L1281C24-L1281C35
> 
>> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
>> - apply lower case style for hex numbers.
>>
>> Exynos8895
>> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>>   change EINTW -> EINTN. (The bank_type itself was correct and is kept
>>   unchanged.)
> 
> Also differs here [2]
> 
> [2] https://protect2.fireeye.com/v1/url?k=5498d3ae-347a4ef3-549958e1-000babd9f1ba-ad745ff8945d06a1&q=1&e=e88c07b3-b735-4e09-975b-82266d6f3d7b&u=https%3A%2F%2Fgithub.com%2FNeternels%2Fexynos8895_kernel%2Fblob%2F5eb1b4159bc466602e7634b1f7a4f471f4c027e2%2Fdrivers%2Fpinctrl%2Fsamsung%2Fpinctrl-exynos.c%23L1799
> 

I'm not sure why the vendor driver differs from the TRM,
but since we've identified the mismatch, we should follow the TRM.

>> - apply lower case style for hex numbers.
>>
>> This aligns the pin-bank tables with the documented bitfield layouts and
>> wakeup domains. No DT/ABI change.
> 
> I suspect the changes are valid, unless trms also don't contain false
> information. In any case, this makes me wonder if there are more
> instances of such errors for older SoCs.
> 
> Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> 

Thanks for the review.
I believe the TRM is correct and should be treated as the source of truth.
I checked Exynos 2200, 7870, 7885, 850, 990, 9810, Exynos Auto v9, 8890, and 8895,
and found no issues other than the four SoCs addressed in this patch.

>>
>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
>> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
> I wonder, what was this tested on?

Tested on Exynos850(E850-96 board).

> 
>> ---
>>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 40 +++++++++----------
>>  1 file changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> index d11b2d4ca913..b4a7d86b82fe 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> @@ -95,9 +95,9 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
>> -	EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
>> -	EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
>> -	EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
>>  };
>>  
>>  /* pin banks of exynos2200 pin-controller - CMGP */
>> @@ -768,12 +768,12 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
>>  
>>  /* pin banks of exynos7885 pin-controller 0 (ALIVE) */
>>  static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
>> -	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
>> -	EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0"),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1"),
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
>>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
>> -	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0", 0x0c),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0"),
>>  };
>>  
>>  /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
>> @@ -1502,7 +1502,7 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst =
>>  /* pin banks of exynos8890 pin-controller 2 (CCORE) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
>>  	/* Must start with EINTG banks, ordered by EINT group number. */
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0", 0x00),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 2, 0x000, "gpb3"),
>>  };
>>  
>>  /* pin banks of exynos8890 pin-controller 3 (ESE) */
>> @@ -1520,8 +1520,8 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst =
>>  /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
>>  	/* Must start with EINTG banks, ordered by EINT group number. */
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1", 0x00),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2", 0x04),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04),
>>  };
>>  
>>  /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
>> @@ -1544,15 +1544,15 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst =
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1", 0x14),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2", 0x18),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0", 0x1c),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0a0, "gpb1", 0x14),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpb2", 0x18),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0e0, "gpb0", 0x1c),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1", 0x34),
>> +	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1a0, "etc1"),
>>  };
>>  
>>  /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
>> @@ -1563,9 +1563,9 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst =
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2", 0x14),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3", 0x18),
>> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4", 0x1c),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0a0, "gpe2", 0x14),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0c0, "gpe3", 0x18),
>> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0e0, "gpe4", 0x1c),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24),
>>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28),
>> @@ -1647,7 +1647,7 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst =
>>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
>>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
>>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
>> -	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
>> +	EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
>>  };
>>  
>>  /* pin banks of exynos8895 pin-controller 1 (ABOX) */
>> @@ -1695,15 +1695,15 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst =
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
>> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C),
>> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0c),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
>> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C),
>> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1c),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
>> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C),
>> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2c),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
>>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
>>  };
> 


