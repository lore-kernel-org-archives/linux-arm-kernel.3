Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FE8C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q2hB1LBw3E9PZKThVBEpkPRCV1GJdxtutqVr0TxPrc=; b=xLGgmBP8JGzaR+wgutp0LUnPG3
	xl1q7VIXcfr7J3Tcu/RKEpHEzZjqgwfAfSDtdgm8RzyZFDGpC4vwqjANX84Esrgt46yQ8m/Swwz6+
	nP8jloP0SW4EaaAHT1E08Oeonw+aw3BztzaveOA0ryxwLm0YfRRe4+s83p6LH2TgsfYro3chf8UlC
	uzINbP3ZUCZgMMFlXIHLlGXdo0omDebBTMWHHHIGC09OFl5NaSQ4KhaVk6Cly4nt7LUfWpCmmHmo+
	4uY/y0VrDDlgvx3nUksAvBn8j76pyi4Cp8TJb8pPGzVimSNe5YMHy7OxZvLK6xeoUGLED6/NzVF9B
	NCjJ/nCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjve9-0000000EH0v-18gR;
	Wed, 15 Jul 2026 09:11:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjve3-0000000EGyb-3H9M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:11:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A4271477;
	Wed, 15 Jul 2026 02:11:06 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65C813F915;
	Wed, 15 Jul 2026 02:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784106670; bh=NWRGhRQrsMTVwpVRHjf73I+9DQBOHVtwuNXynKGyA/M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VkCtGFX9fHLkn8ZF/ukOGPFLNQK99tA0c50s0cXnzxHb4NbVKWN2aIuEyJsrLh8Zv
	 Pej5WNdfk3oQEXQoLM5RQrQknoOzPKHv/VQiJJyFXLwFuhubiEZTH435P95u8EHn9q
	 ltN9Gp1L8Pln4FDaxgeXf3ixDNMgDqsQoqMqGnIM=
Message-ID: <81b32767-442f-498a-bf85-d448b5cdece3@arm.com>
Date: Wed, 15 Jul 2026 10:11:08 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v1 03/11] arm_mpam: Set mpam_feat_msmon_mbwu_31counter
 when there are bandwidth counters
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: "james.morse@arm.com" <james.morse@arm.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "andre.przywara@arm.com" <andre.przywara@arm.com>
References: <20260710115546.29644-4-ben.horgan@arm.com>
 <OS9PR01MB1692066CAAC8AAB6AD3362EBF8BF82@OS9PR01MB16920.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <OS9PR01MB1692066CAAC8AAB6AD3362EBF8BF82@OS9PR01MB16920.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_021111_917352_3DEAA782 
X-CRM114-Status: GOOD (  17.87  )
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

Hi Shaopeng,

On 7/15/26 07:34, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> If there are memory bandwidth counters then there are 31 bit counters even
>> if there are also 44 bit counters or 63 bit counters.
> 
> Although 31-bit counters are always exist, aren't they never used simultaneously with 44-bit or 63-bit counters?
> If the `mpam_feat_msmon_mbwu_31counter` feature is set to always be enabled, could that potentially cause a bug?

Sure, potentially, any change of meaning of a feature flag can be a source of confusion and so bugs
but based on my analysis this patch causes no change of behaviour in the driver other than in the
lines it changes. I do, however, think it's clearer to have feature bits just indicate whether the
feature is present or not rather than adding extra meaning.

In a mismatched system, a class may end up using 31 bit counters even if some of the RIS support
long counters.

Thanks,

Ben



> 
> Best regards,
> Shaopeng TAN
> 
> 
>> Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
>> counters.
>>
>> Fixes: fdc29a141d63 ("arm_mpam: Probe for long/lwd mbwu counters")
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>  drivers/resctrl/mpam_devices.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index acfa9a4dc2fc..11b10c3bc334 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -930,9 +930,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>>                                                  mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
>>                                          else
>>                                                  mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
>> -                               } else {
>> -                                       mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>>                                  }
>> +
>> +                               mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>>                          }
>>                  }
>>          }
>> -- 
>> 2.43.0
>>


