Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867F5C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vN8B4zcL7sxKbmrxTU59ciDhqojgnYO46LbZD+HQNQ=; b=IyhNsa8vgaUuVFKoYBTow4QGeB
	d+V/bLhodY5Zhh+6uQUXbjiC0RA51HsQ5zFpjbQkLoTAjmX3IChg2+nCX38e/d8tmmE0+kPwdBuIi
	DQkb1ENH08iHPgNrOtYCTswM1A91KEZMx4xLU8C0c0uwz+6RObz5By8CKzRXyVWy7Q6XyWVIMTXcJ
	RcEYdO6P+y6FLzkEcFm8B6d+CoGRkq/K5T1tIb5lKn1qk4tXVINj3HKzf/CXihbPIQEaZE4ej7nWI
	4t8Hf3W+hsVuDWEYzyg1WhDEmmj6L3tas24SuzmOmQXWtmzjidTxAEj4UvC5WR6lNIOZQDJKZbyvn
	/ZybP+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3J-0000000Ea9p-3K7g;
	Thu, 24 Apr 2025 16:03:53 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vG2-0000000Dwm5-0lUI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:00:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zjvg35lJkz4f3k68
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 20:00:15 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 6CD441A1504
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 20:00:34 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP4 (Coremail) with SMTP id gCh0CgCnVlveJwpoXVW4KQ--.17342S2;
	Thu, 24 Apr 2025 20:00:32 +0800 (CST)
Message-ID: <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
Date: Thu, 24 Apr 2025 20:00:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
Content-Language: en-US
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Florent Revest <revest@chromium.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCnVlveJwpoXVW4KQ--.17342S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw4DtFy5WF18uFW8Wr4xXrb_yoW5CF4fpF
	WFgF95KF4kGr18Za1vv3W0qrWav34fKry5JrWrtr1rZryDK3Z7JryjgF4Y9FWfCrn7Gw1j
	vF42qayfur93ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	4xRDUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_050046_529979_7294E060 
X-CRM114-Status: GOOD (  24.62  )
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

On 4/24/2025 3:24 AM, Alexis Lothoré wrote:
> Hi Andrii,
> 
> On Wed Apr 23, 2025 at 7:15 PM CEST, Andrii Nakryiko wrote:
>> On Thu, Apr 17, 2025 at 12:14 AM Alexis Lothoré
>> <alexis.lothore@bootlin.com> wrote:
>>>
>>> Hi Andrii,
>>>
>>> On Wed Apr 16, 2025 at 11:24 PM CEST, Andrii Nakryiko wrote:
>>>> On Fri, Apr 11, 2025 at 1:32 PM Alexis Lothoré (eBPF Foundation)
>>>> <alexis.lothore@bootlin.com> wrote:
> 
> [...]
> 
>>> Indeed I initially checked whether I could return directly some alignment
>>> info from btf, but it then involves the alignment computation in the btf
>>> module. Since there could be minor differences between architectures about
>>> alignment requirements, I though it would be better to in fact keep alignment
>>> computation out of the btf module. For example, I see that 128 bits values
>>> are aligned on 16 bytes on ARM64, while being aligned on 8 bytes on S390.
>>>
>>> And since for ARM64, all needed alignments are somehow derived from size
>>> (it is either directly size for fundamental types, or alignment of the
>>> largest member for structs, which is then size of largest member),
>>> returning the size seems to be enough to allow the JIT side to compute
>>> alignments.
>>
>> If you mean the size of "primitive" field and/or array element
>> (applied recursively for all embedded structs/unions) then yes, that's
>> close enough. But saying just "largest struct member" is wrong,
>> because for
>>
>> struct blah {
>>      struct {
>>          int whatever[128];
>>      } heya;
>> };
>>
>>
>> blah.heya has a large size, but alignment is still just 4 bytes.
> 
> Indeed, that's another case making my proposal fail :)
> 
>> I'd suggest looking at btf__align_of() in libbpf (tools/lib/bpf/btf.c)
>> to see how we calculate alignment there. It seems to work decently
>> enough. It won't cover any arch-specific extra rules like double
>> needing 16-byte alignment (I vaguely remember something like that for
>> some architectures, but I might be misremembering), or anything
>> similar. It also won't detect (I don't think it's possible without
>> DWARF) artificially increased alignment with attribute((aligned(N))).
> 
> Thanks for the pointer, I'll take a look at it. The more we discuss this
> series, the less member size sounds relevant for what I'm trying to achieve
> here.
> 
> Following Xu's comments, I have been thinking about how I could detect the
> custom alignments and packing on structures, and I was wondering if I could
> somehow benefit from __attribute__ encoding in BTF info ([1]). But
> following your hint, I also see some btf_is_struct_packed() in
> tools/lib/bpf/btf_dump.c that could help. I'll dig this further and see if
> I can manage to make something work with all of this.
>

With DWARF info, we might not need to detect the structure alignment anymore,
since the DW_AT_location attribute tells us where the structure parameter is
located on the stack, and DW_AT_byte_size gives us the size of the structure.

> Thanks,
> 
> Alexis
> 
> [1] https://lore.kernel.org/bpf/20250130201239.1429648-1-ihor.solodrai@linux.dev/
> 


