Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BB0CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWowQ5QX/OOxHa8vEg4j0wTIcyU/NF/w6QRhH8XGonQ=; b=NyjSSjiL929fHkB7qDBb557FRO
	esfuDIauxr7n+TlTetC9ewYhrQ0bZrFGeI88ksckwNG5QrzGzfTgghiiQ6Dsod3tMlt8hQVZaHZG5
	9772AcFOBvBeRd1WYsQwQBixZ8fOW3AqhQnFuWUr7h8ezFMxDYJqq+X6i09mGtgCC7y1zrSbTKqVS
	SZCVwELIRGvKNiOaQG7WQ/RGNUU7YZCEVM7PeXrNo8rZCZ+ALmW8rWirX7SWuvozuNJ1NABgbprh2
	MjJFWd4wVxa8r59ta8wa4V3KpQ0LmyDcVKKk8tCFNmei44O7Lk0aGdQ1b8CsTBMP1/YSbVt+ocxNe
	djjNYIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dJf-0000000G7aw-2sgm;
	Tue, 14 Oct 2025 11:35:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dJd-0000000G7a6-0L11;
	Tue, 14 Oct 2025 11:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760441738;
	bh=h4RfT8BW5uglHP1wgDRzO4OhIAmDCeHY9g1PjPS2PTQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VVabfhq7ySgeQWE5YFVpMC15pBUMza3xxclEaC8rofCUOdhDa1fPFMXSahF59tAt/
	 PlscaPeGH6puZRXSh6XtUdnz+6CF9Foificw1MOmFKh4t3a4oTta5+rOFKdNhW3H+Q
	 XUaAdk+wzy5wenoOHpkJhmM5eZ70dpnkv4bCgV3LN459Q+UWo/+TGav8F5A4WOsx/S
	 8dkoYVDPd0mQ+K3sv2RhVKBxsTdmrTyQsqw/GltdW4EFW9qQY1OT+ehE2YAkxfW/M2
	 4E7JHPGCHYOr1A6gBUY6KCGgy4uWUVGuo0rGLqJlv8f7eswHLugQuJw1fo7qIn4pL+
	 IF5aEfRAvMyFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FB2517E055D;
	Tue, 14 Oct 2025 13:35:38 +0200 (CEST)
Message-ID: <ac809179-7192-4218-8b13-86b9252652f4@collabora.com>
Date: Tue, 14 Oct 2025 13:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, igor.belwon@mentallysanemainliners.org
References: <20251003091158.26748-1-angelogioacchino.delregno@collabora.com>
 <20251003091158.26748-5-angelogioacchino.delregno@collabora.com>
 <5635636.31r3eYUQgx@workhorse>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5635636.31r3eYUQgx@workhorse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_043541_330002_E23E1485 
X-CRM114-Status: GOOD (  20.35  )
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

Il 09/10/25 16:41, Nicolas Frattaroli ha scritto:
> On Friday, 3 October 2025 11:11:53 Central European Summer Time AngeloGioacchino Del Regno wrote:
>> Add a driver for the regulators found on the MT6363 PMIC, fully
>> controlled by SPMI interface.
>> This PMIC regulates voltage with an input range of 2.6-5.0V, and
>> features 10 buck converters and 26 LDOs.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/regulator/Kconfig                  |  10 +
>>   drivers/regulator/Makefile                 |   1 +
>>   drivers/regulator/mt6363-regulator.c       | 935 +++++++++++++++++++++
>>   include/linux/regulator/mt6363-regulator.h | 330 ++++++++
>>   4 files changed, 1276 insertions(+)
>>   create mode 100644 drivers/regulator/mt6363-regulator.c
>>   create mode 100644 include/linux/regulator/mt6363-regulator.h
>>
>> [...]
>> diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
>> new file mode 100644
>> index 000000000000..812775072eb5
>> --- /dev/null
>> +++ b/drivers/regulator/mt6363-regulator.c
>> [...]
>> +
>> +static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
>> +				     unsigned int mode)
>> +{
>> +	struct mt6363_regulator_info *info = rdev_get_drvdata(rdev);
>> +	struct regmap *regmap = rdev->regmap;
>> +	int cur_mode, ret;
>> +
>> +	if (!info->modeset_reg && mode == REGULATOR_MODE_FAST)
>> +		return -EOPNOTSUPP;
>> +
>> +	switch (mode) {
>> +	case REGULATOR_MODE_FAST:
>> +		ret = mt6363_buck_unlock(regmap, true);
>> +		if (ret)
>> +			break;
>> +
>> +		ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
>> +
>> +		mt6363_buck_unlock(regmap, false);
>> +		break;
>> +	case REGULATOR_MODE_NORMAL:
>> +		cur_mode = mt6363_regulator_get_mode(rdev);
>> +		if (cur_mode < 0) {
>> +			ret = cur_mode;
>> +			break;
>> +		}
>> +
>> +		if (cur_mode == REGULATOR_MODE_FAST) {
>> +			ret = mt6363_buck_unlock(regmap, true);
>> +			if (ret)
>> +				break;
>> +
>> +			ret = regmap_clear_bits(regmap, info->modeset_reg, info->modeset_mask);
>> +
>> +			mt6363_buck_unlock(regmap, false);
>> +			break;
>> +		} else if (cur_mode == REGULATOR_MODE_IDLE) {
>> +			ret = regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
>> +			if (ret == 0)
>> +				usleep_range(100, 200);
>> +		} else {
>> +			ret = 0;
> 
> Just initialise ret to 0 at the start of the function scope when
> you declare it. You've already missed an uninitialised use once,
> and playing these branch games is just asking for more trouble
> in the future. There's no micro-optimisation you're doing here,
> clang produces the same assembly for both zero initialised and
> the else branch version you're doing here.
> 

It's not about micro-optimization. Double initialization is a bad coding practice.

Cheers,
Angelo

>> +		}
>> +		break;
>> +	case REGULATOR_MODE_IDLE:
>> +		ret = regmap_set_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	if (ret) {
>> +		dev_err(&rdev->dev, "Failed to set mode %u: %d\n", mode, ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> [...]
> 
> Kind regards,
> Nicolas Frattaroli
> 
> 


