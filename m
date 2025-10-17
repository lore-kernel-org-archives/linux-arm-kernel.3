Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6407ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 01:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1M75Nlutscy3JavUjhT2HpBaeTPvnlg0L59BlAbo1o=; b=I9+xQ5HH/vq61jEX2pYU9E7y3t
	Y2eNPgebzuGdBclo6YIInJFRjI0HPsKZ8inQyntAAo1o4ghIiaE9k6+GHhL+N5eqNQPehELvfv+BS
	sLr/zDJFGdnxvIuo3nt/R86uBwgHqB16NNxb4hCUJjqls+vmcxqZEFG9e+WlGBi0l6X4g+Ia1oaAJ
	hgBWg7sXS0qIBGbvSsL9ZAUKYB9i90FdFXM1k/hqfLm+cx+983L3B3yAP5kNFH9hoFoQCitlAxmm6
	/5fXQh+m+NDCBENmImr3Bk+FFgtMw59zcwgBdDJg9WbD4ijU8rHlmwWxmqcR4evXCvAvmtGWUU3Yr
	BODGUbyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ywv-00000006KD4-3V1v;
	Fri, 17 Oct 2025 01:08:05 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ywt-00000006KCN-0Up2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 01:08:04 +0000
X-UUID: b465655caaf511f0a38c85956e01ac42-20251017
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:2f2e8ba2-5c60-45aa-ae63-070d415bc94a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:289a51bb8247b7db942f975af1a07bf0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b465655caaf511f0a38c85956e01ac42-20251017
X-User: tanze@kylinos.cn
Received: from [10.42.20.57] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1265818417; Fri, 17 Oct 2025 09:07:51 +0800
Message-ID: <d0020748-1738-4b83-bcad-ad12f122e4e4@kylinos.cn>
Date: Fri, 17 Oct 2025 09:07:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] perf arm_spe: Add a macro definition to handle offset
 value
To: Leo Yan <leo.yan@arm.com>
Cc: james.clark@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 graham.woodward@arm.com
References: <20251016083019.27935-1-tanze@kylinos.cn>
 <1760620322251982.15.seg@mailgw.kylinos.cn>
Content-Language: en-US
From: tanze <tanze@kylinos.cn>
In-Reply-To: <1760620322251982.15.seg@mailgw.kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_180803_452611_EF9DB880 
X-CRM114-Status: GOOD (  12.72  )
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

Hi, Leo Yan
Thank you for your advice,I should have done better.

在 2025/10/16 17:09, Leo Yan 写道:
> On Thu, Oct 16, 2025 at 04:30:19PM +0800, tanze wrote:
>> Add a macro definition SPE_SYNTH_ID_OFFSET to handle the offset value
>> and improve readability.
>>
>> Signed-off-by: tanze <tanze@kylinos.cn>
>> ---
>>   tools/perf/util/arm-spe.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
>> index 71be979f5077..645048ac7708 100644
>> --- a/tools/perf/util/arm-spe.c
>> +++ b/tools/perf/util/arm-spe.c
>> @@ -36,6 +36,7 @@
>>   
>>   #include "../../arch/arm64/include/asm/cputype.h"
>>   #define MAX_TIMESTAMP (~0ULL)
>> +#define SPE_SYNTH_ID_OFFSET (1000000000ULL)
>>   
>>   #define is_ldst_op(op)		(!!((op) & ARM_SPE_OP_LDST))
>>   
>> @@ -1732,7 +1733,7 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
>>   	attr.sample_period = spe->synth_opts.period;
>>   
>>   	/* create new id val to be a fixed offset from evsel id */
>> -	id = evsel->core.id[0] + 1000000000;
>> +	id = evsel->core.id[0] + SPE_SYNTH_ID_OFFSET;
> 
> If really want to improve a bit for this, I'd define a macro in
> util/synthetic-events.h:
> 
>    #define PERF_SYNTH_EVENT_ID_OFFSET    (1000000000ULL)
> 
> Then, apply the new macro in files:
> 
> $ git grep "core.id.*1000000000"
> util/arm-spe.c: id = evsel->core.id[0] + 1000000000;
> util/cs-etm.c:  id = evsel->core.id[0] + 1000000000;
> util/intel-bts.c:       id = evsel->core.id[0] + 1000000000;
> util/intel-pt.c:        id = evsel->core.id[0] + 1000000000;
> util/powerpc-vpadtl.c:  id = evsel->core.id[0] + 1000000000;
> 
> Thanks,
> Leo

Thank you,
Ze Tan

