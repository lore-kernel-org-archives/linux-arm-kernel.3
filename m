Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC454CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0opkD7metv+/4ugOzWfDk/j9lP77iEQcIdpzwQFyPPs=; b=TwgiwcBWMLBKUcy5pIwL1sW2Rf
	CUCuolaJ4hfUd038jBx4mSsR6NgR5ONQPDEnhnxTSmJa6OsozoeG5/SkhMJiPJ4XNFyNB3agsgHbH
	I+bBBeX2NPvr+78xd6tdPt2NrxRx18v+w/nlOdC+521q9kG9IcrjKXeERFLFf36eRSF+nEWWBZGoj
	EgMjzrFIkt93r2MrqEuZ7Y81Ydrzw7cIWpFmNDlaHxcIItbCF1uVtQlgmK8llPCIlo+NMSY35jB3h
	HmQ0OpBkvJFuDrYojjBIflWaIVMDKyfEbsnSnpOtPjCfpsslCTIOMXQR7ccAUVewIlbI6cECb73h4
	iWElz8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP7W-0000000D66L-15Hy;
	Tue, 02 Jun 2026 13:25:26 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP7T-0000000D60l-08pn;
	Tue, 02 Jun 2026 13:25:25 +0000
Message-ID: <5ed28c81-1991-4cf9-9e28-3b0b03111dd7@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1780406718;
	bh=6zf0eOKWNxjE261YjrYLsiJDe7cUIoUxU90Ju/2Al1I=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Wfu2Hw/Ip/PzJUqBUs73DgMBgRc+u8BefBHRdIeNe2Bg1TCA6fa8OfxPai450B5ut
	 +giIaE88OXk7olYp7WJXnpEKkWQd37EMhEkGV6OUwXDMCzXYUVymt4vHi0cjkRmkGe
	 Ar6s8J7akKMFNJo20GZsv7+QWGIsdXvORvOrpMPI=
Date: Tue, 2 Jun 2026 15:25:17 +0200
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
 <376eec65-20ea-434b-a6ee-edbc12e6d7d9@aliel.fr>
 <49dcaade-4927-40e6-9864-9d4f3a8412d8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <49dcaade-4927-40e6-9864-9d4f3a8412d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062523_521860_7C79F9F6 
X-CRM114-Status: GOOD (  12.94  )
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

On 6/2/26 2:15 PM, Daniel Lezcano wrote:
> On 6/2/26 13:58, Ronald Claveau wrote:
>> On 6/2/26 11:57 AM, Daniel Lezcano wrote:
>>> On 5/31/26 21:58, Daniel Lezcano wrote:
>>>> On 5/31/26 19:49, Ronald Claveau wrote:
>>>>> On 5/31/26 10:41 AM, Daniel Lezcano wrote:
>>>>>> On 5/31/26 09:51, Ronald Claveau via B4 Relay wrote:
>>>>>>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>>>
>>>> [ ... ]
> 
> [ ... ]
> 
>> Sorry for the delay.
>> The module issue was raised by the test robot here
>> https://lore.kernel.org/oe-kbuild-all/202605310154.bmdMBZHJ-
>> lkp@intel.com/
>>
>> If I understand correctly we can drop this stub change and only use a
>> "depends on MESON_SM" for the "AMLOGIC_THERMAL" config, is it correct ?
> 
> Yes, that is the simplest solution for now
> 
> Indirectly related, where is the mod dependency telling meson_sm must be
> loaded before the amlogic thermal driver ?

I think depmod should detect the symbol usage and add it to the
modules.dep file to give the correct order. Do you think it would not
work here ?

-- 
Best regards,
Ronald

