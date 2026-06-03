Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00D8CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRC5QZFYNr4zXx9kWIyvmMC0zvuEvBSSf0z+79uU89E=; b=USpERS/58/y2d23hhQLpI5n445
	xLyoJLbUqetgP0yAH6un4eaQhVWlydeE3ZUSEyIsP2RgV2C6iqIATeEn7tJXQvLbQp4IxbhdCdiJe
	Kn0af/Y6m6P2gC7JsBD4ESW3ofPAdjeflPhJ5R2bfnvE82Bmah+TmNMXdb/zg93EYZdZPnpEYvORe
	iIZAnfOzqY/SlaDPq6r8zYc5/IJR8wkiDUMx4OORloBwkz+OhwLVAxHpqaHR1cyrGDSQZhr9Geyff
	mKIVQLE6MWNdQBUqMFjma9jfXF1JxOzYnSI3rqh9sSAdrGPVAWJwTCA4LTxSWBlictLuz4mwY4Ksw
	lOLgYlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaB0-0000000E20N-1hAN;
	Wed, 03 Jun 2026 01:13:46 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaAx-0000000E1yD-03C4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:13:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gVV7l33TqzYQtfV
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Jun 2026 09:13:23 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 39A544056D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Jun 2026 09:13:29 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP1 (Coremail) with SMTP id cCh0CgAndzy0fx9q9xuvAQ--.52112S3;
	Wed, 03 Jun 2026 09:13:26 +0800 (CST)
Message-ID: <77b7ee79-65e5-0c81-664c-2b6777f583ff@huaweicloud.com>
Date: Wed, 3 Jun 2026 09:13:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
Content-Language: en-US
To: Will Deacon <will@kernel.org>
Cc: vladimir.murzin@arm.com, xuwei5@huawei.com, wangyushan12@huawei.com,
 yangyicong@hisilicon.com, maz@kernel.org, yeoreum.yun@arm.com,
 miko.lenczewski@arm.com, james.clark@linaro.org, corbet@lwn.net,
 skhan@linuxfoundation.org, kuninori.morimoto.gx@renesas.com,
 lucaswei@google.com, catalin.marinas@arm.com, broonie@kernel.org,
 lpieralisi@kernel.org, thuth@redhat.com, kevin.brodsky@arm.com,
 tongtiangen@huawei.com, oupton@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, Sascha.Bischoff@arm.com,
 linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, zengheng4@huawei.com
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
 <20260601112000.1145391-3-zengheng@huaweicloud.com>
 <ah78iIqAqzfofnIG@willie-the-truck>
From: Zeng Heng <zengheng@huaweicloud.com>
In-Reply-To: <ah78iIqAqzfofnIG@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgAndzy0fx9q9xuvAQ--.52112S3
X-Coremail-Antispam: 1UD129KBjvJXoW7JF18Xw1xZF45uFy7JFy5urg_yoW8Jr18pr
	4UAr1UJF4v9r1a934kZ3Z8X3ZYkFZ8Kr4Fka4qg3WSyws0qFy3AF10gw4jgan29rykW3y0
	vFn09F15Ja1jy37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUIF4iUUUUU
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_181343_415266_7C4658A5 
X-CRM114-Status: GOOD (  13.18  )
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

Hi Will,

On 2026/6/2 23:53, Will Deacon wrote:
> On Mon, Jun 01, 2026 at 07:20:00PM +0800, Zeng Heng wrote:
>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>> index b0db946568b7..02e0ee5c948c 100644
>> --- a/arch/arm64/kernel/cpu_errata.c
>> +++ b/arch/arm64/kernel/cpu_errata.c
>> @@ -608,6 +608,14 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
>>   };
>>   #endif
>>
>> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>> +static const struct midr_range cnp_erratum_cpus[] = {
>> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
>> +	{},
>> +};
>> +#endif
> Sashiko [1] points out that this means that
> CONFIG_HISILICON_ERRATUM_162100125 now affects NVIDIA parts and
> vice-versa for CONFIG_NVIDIA_CARMEL_CNP_ERRATUM.
>
> The easiest fix is probably to guard the entries in the array above with
> their respective config options? Otherwise, this all looks good to me.
>
> Will
>
> [1] https://sashiko.dev/#/patchset/20260601112000.1145391-1-zengheng@huaweicloud.com

Yes, that makes sense to me. Thanks for the reminder.

I'll apply the changes in v4.


Best regards,
Zeng Heng


