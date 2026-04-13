Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4C0EBFD30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p60ZF8uyb79+Ykgtg/12snM5QxvAC14rn0F6TjeaFq4=; b=ZOYuYTDKFlhC7JTsqzjK6HgJTc
	TA6pGhVQ2ri5KfJbyAz4kv6D9yrth6xtdY2tOhfr5zpfsteU0bjfejv7Bjk9Y8lOsAcTEPbeZsFO5
	z8RnYDCNL3dRHSixFqMyk/0JlPa0jTyAqy4jIYo8jy6sik+JjsF9FbMDB53yaEpZSabr461Y22b3H
	65GgYPoqNpgTrJUDadw5UKOFcv86gpt15Rl0KspZU0fAhF1+AeUhNp8WCunR7tfQA0azSBkOrt8S9
	w8EGjizEzlgiahiXSmPdGb3EDTZAfDk/NoS/Rb1P+GQ/jZwfWh8krvQjBbidToX41SzcrPeL6dmcQ
	NwYejQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEaU-0000000FUqd-339M;
	Mon, 13 Apr 2026 10:32:14 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEaQ-0000000FUpu-3duY;
	Mon, 13 Apr 2026 10:32:12 +0000
Message-ID: <451ba56f-83cd-456c-81bc-c09e2594df1a@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776076318;
	bh=ZqPutyXfURY4JqAzvot3E4VaS+HrR8bVUot2j45xsQg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=VW4zImkQz89KLlouelDsZND4ph6bmMU0+d0qca5XJBMBjxMbUvxn6n0PXW1tWhMTX
	 kjD3GTvokQ001Fcj0A8STZTQ0ZC5LKE0o89NclXOWONePbxi/XQ4eUoNOABQg8+NEm
	 e7rotYrheKjtu5qvYBubSQUreNZkJ227bWbb+gxc=
Date: Mon, 13 Apr 2026 12:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 3/8] firmware: meson: sm: Add thermal calibration SMC call
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
 <20260410-add-thermal-t7-vim4-v1-3-19f2b8da74d7@aliel.fr>
 <6200b372-149f-48f7-ae91-a5364562058c@kernel.org>
Content-Language: en-US
In-Reply-To: <6200b372-149f-48f7-ae91-a5364562058c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_033211_654043_B09A94AD 
X-CRM114-Status: UNSURE (   6.36  )
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

On 4/12/26 12:47 PM, Krzysztof Kozlowski wrote:
> On 10/04/2026 18:48, Ronald Claveau wrote:
>> @@ -245,6 +246,14 @@ struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
>>  }
>>  EXPORT_SYMBOL_GPL(meson_sm_get);
>>  
>> +int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
> 
> Exported functions should have kerneldoc.
> 

Thanks for your feedback, I will add it.

>> +			       u32 tsensor_id)
>> +{
>> +	return meson_sm_call(fw, SM_THERMAL_CALIB_READ, trim_info, tsensor_id,
>> +			     0, 0, 0, 0);
> 
> Best regards,
> Krzysztof


-- 
Best regards,
Ronald

