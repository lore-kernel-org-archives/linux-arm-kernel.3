Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681DDCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CKYfQjtEhPEn5INspAbOJ/i3oFgk2lPJEYov23En1I=; b=07vYR0w3v9bX8am7i2T5N79jo3
	FbyQGnDi0ApsdY89o0qClBzjNom5LVfX14S0PteX9wmcFy8o3y4bHhya+GNxwkUBzPJhsUaU0Me1r
	qznvVXVnBKCB6iSRa0OrykKn5VbZEZPsUeV3T7Q3mmQZJnDPLASBX3viVjNU7s1p6ijd1TijCZxSe
	Dm2drsA8pv5j4tk4qt4icv/rsc6kkkMErUmlEhqv6KC7V3B3WFpPrmoSNXbXnSttdiDe0K0sclDxB
	id+KFXFjCk0qJ9oM2czsrd80HNcGZoOit24rTakEf4AUZDRaR6IMnpP6Fnj8jLRL/GCYgPek4QdSI
	b1Y+RdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNmZ-0000000Cvj3-2uwT;
	Tue, 02 Jun 2026 11:59:43 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNmV-0000000Cvhq-2nJe;
	Tue, 02 Jun 2026 11:59:41 +0000
Message-ID: <376eec65-20ea-434b-a6ee-edbc12e6d7d9@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1780401571;
	bh=i/CLnyw+nMQ2TgMubNSEMNs34QegnKmLA2Cz5CageE4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=JGqojs/50utTbI7LUjY19Lnf8FUKDgj0EFRtclDac5XMgqfBGPS4/eqLsDCSFsbTa
	 HFF8w2+Etw02Rhc5kwyFq44Vb0gbVs3o3YKIuJkyEcNQMk6UJ107SKk91FP5Uu3DSl
	 7cxarQKmOI5M1zO0mgujXjXSEZ4rhKx12ioXpX/A=
Date: Tue, 2 Jun 2026 13:58:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
References: <20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr>
 <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
 <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
 <0c5033f7-1535-49e8-a502-426e54333496@oss.qualcomm.com>
 <59afecd4-7749-4be5-a261-a850634178b1@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <59afecd4-7749-4be5-a261-a850634178b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_045940_141476_86E05FF7 
X-CRM114-Status: GOOD (  13.91  )
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

On 6/2/26 11:57 AM, Daniel Lezcano wrote:
> On 5/31/26 21:58, Daniel Lezcano wrote:
>> On 5/31/26 19:49, Ronald Claveau wrote:
>>> On 5/31/26 10:41 AM, Daniel Lezcano wrote:
>>>> On 5/31/26 09:51, Ronald Claveau via B4 Relay wrote:
>>>>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> [ ... ]
>>
>>>>> +#if IS_ENABLED(CONFIG_MESON_SM)
>>>>> +
>>>>>    struct meson_sm_firmware *meson_sm_get(struct device_node
>>>>> *firmware_node);
>>>>>    int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32
>>>>> *trim_info,
>>>>>                       u32 tsensor_id);
>>>>
>>>> Do you really want to compile meson_sm as a module ?
>>>>
>>>>
>>>>
>>>
>>> I don't want, but if I send a patch to change tristate to bool, it will
>>> raise a warning because 'm' is not valid.
>>> If it is accepted to ignore this warning, I can send another patch.
>>
> 
> [ ... ]
> 
>> Compiling the firmware as a module means it must be loaded before the
>> amlogic thermal driver, right ? Where is the dependency declared in
>> the module ?
>>
>> If the sm_meson is in the platform, it should be selected as part of
>> the platform's component. No need to have an option for that, no ?
> 
> The questions remain and PR is approaching ...

Sorry for the delay.
The module issue was raised by the test robot here
https://lore.kernel.org/oe-kbuild-all/202605310154.bmdMBZHJ-lkp@intel.com/

If I understand correctly we can drop this stub change and only use a
"depends on MESON_SM" for the "AMLOGIC_THERMAL" config, is it correct ?

-- 
Best regards,
Ronald

