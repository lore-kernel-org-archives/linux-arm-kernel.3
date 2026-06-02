Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947ADCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s05O4OoFcgMwrJVM6iNq1/iV7JgKLVa4E+Pjbd7gBr0=; b=aBnlCFXpprkyVQiumM8Fb6tudR
	3mEOIz3Hsz/aKNA9pZjW4qAbKFotU47JUdXFiZQA4rzcaes78G1jLPNjQZ3KtEp156+Yr1exuCYmZ
	YNbP0TDGtrvHvWNzb/FC/AhotIqcavAJUCskWjPtomkpevm/Efosgd/1hNv4smosyWHPYz6tq4SMA
	ETDhpYCCnk4OpXaX4DfcaIIlDt1cVQPGR0+UUHpR47cAbIq1WRamy8hwaN3c5ATuPWJUPJPMfa33C
	oOuzEbwpMUd46o8gA62QAa0C4JHPZwQwnHCJpkfmFCxK8fawCw0ciSGJLzddr3eWZImaP0nzyes1N
	DYItD1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURwR-0000000DRGY-18wq;
	Tue, 02 Jun 2026 16:26:11 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURwN-0000000DREZ-2M64;
	Tue, 02 Jun 2026 16:26:10 +0000
Message-ID: <60aa3f88-e8de-4594-9c07-832aa6d97b23@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1780417561;
	bh=3PpZSCOhrX5Fo3r9Inj3yvrlHVLpHLHBcy3c4inz8f8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Zt5cuLdllnhn6/RSFBvGVLVkHSYH0N/2m2xi0TnPS3BHc+i4DxP61s3qzdCh8m/k6
	 OhVN0kVWi9Z9f3m33lO2WNyhgDP/z4LgZQqCcaswTzwyIg1/YgvEQryErkU8gzolfT
	 0MkGNAR/9VNXcRMdVW60B/goXUDqg/EfYe8/3f74=
Date: Tue, 2 Jun 2026 18:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v3] thermal: amlogic: add missing dependency on MESON_SM
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
References: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
 <9adbe3cb-d42e-4b89-b6d7-62dd58b98e15@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9adbe3cb-d42e-4b89-b6d7-62dd58b98e15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_092608_038390_E35E6B7E 
X-CRM114-Status: UNSURE (   9.65  )
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

On 6/2/26 6:01 PM, Daniel Lezcano wrote:
>> ---
>>   drivers/thermal/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
>> index 1c4a5cd5a23ee..810eeccedfbab 100644
>> --- a/drivers/thermal/Kconfig
>> +++ b/drivers/thermal/Kconfig
>> @@ -436,6 +436,7 @@ config AMLOGIC_THERMAL
>>       tristate "Amlogic Thermal Support"
>>       default ARCH_MESON
>>       depends on OF && ARCH_MESON
>> +    depends on MESON_SM
>>       help
>>         If you say yes here you get support for Amlogic Thermal
>>         for G12 SoC Family.
> 
> Did you forget to remove the stubs ?

The commit for the stub as already been removed from the
thermal/bleeding-edge branch, so I think there is nothing to remove
anymore, and I dropped it on my side too.

-- 
Best regards,
Ronald

