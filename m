Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72FAEFCD6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8f4yxLs/Y7kpRmZcJ8QxX+hVobTyzyC44ogj1CzeEU=; b=P8x3Y91fBZkkHiy1LP9xb1nXJN
	flk4T8XCQ3cTQRQcfR67V4QG9DY6n2jkSMZNRcR+/DVHbbpw/uT+a8+seEBJvnzUWuSoQkLQjsAqo
	b5NHyKEjCxRHKL5DfM67qn3QIgnWeNLlTQog7yykt2S+K+ctXdsGLRcHWIePAnPYrSpD5yhmCbbML
	EAIitQQUoWQTC+Qskta0/u14Py2QGPVWSggUqf3t3PBPmxbi70VmIkwQhXjOlJQ31+cSZDYw2Nr7h
	VGQK8Y0D0x/G0q9CeVTkQKhUG1Wns2hwCXAw1RdsvScoDKmpyYmzYpJORbFOAY+gdoUiwixD5SHo9
	fKfgnnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWny-00000006xcU-01cV;
	Mon, 09 Mar 2026 09:21:38 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWnt-00000006xYq-0E3A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:21:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fTs1c58l5zYQts2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 17:20:36 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 85A2740573
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 17:21:20 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP4 (Coremail) with SMTP id gCh0CgDXr0oOka5pHwUTAQ--.64074S2;
	Mon, 09 Mar 2026 17:21:19 +0800 (CST)
Message-ID: <b3b56b5c-7d42-4943-a81a-ed3f942e4ffd@huaweicloud.com>
Date: Mon, 9 Mar 2026 17:21:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bpf-next v7 3/5] bpf: Add helper to detect indirect jump targets
Content-Language: en-US
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, yonghong.song@linux.dev,
 puranjay@kernel.org, a.s.protopopov@gmail.com, list+bpf@vahedi.org,
 linux@armlinux.org.uk, yangtiezhu@loongson.cn, hengqi.chen@gmail.com,
 johan.almbladh@anyfinetworks.com, paulburton@kernel.org,
 hbathini@linux.ibm.com, chleroy@kernel.org, naveen@kernel.org,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org,
 pulehui@huawei.com, iii@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 davem@davemloft.net, udknight@gmail.com, martin.lau@kernel.org,
 clm@meta.com, ihor.solodrai@linux.dev
References: <20260307103949.2340104-4-xukuohai@huaweicloud.com>
 <ca484ba53c9ce4dac51c7ae3e8888cfe561b31c3826880c6fc89d5581c6de2fa@mail.kernel.org>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <ca484ba53c9ce4dac51c7ae3e8888cfe561b31c3826880c6fc89d5581c6de2fa@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgDXr0oOka5pHwUTAQ--.64074S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW8GF47Xry8uFW8tw43Wrg_yoW5Jw1xpF
	W7Wr47CF4qyFWktr17CFyqkr1agws8Wr90yFWDW3yxAw1YgFn5XFWagw4IyFy5tryYk3W3
	JF4j9ry7uanxArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8
	Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	j6a0PUUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_022133_552838_EE3240D7 
X-CRM114-Status: GOOD (  20.12  )
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

On 3/8/2026 1:14 AM, bot+bpf-ci@kernel.org wrote:
>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
>> --- a/kernel/bpf/core.c
>> +++ b/kernel/bpf/core.c
>> @@ -1475,11 +1475,30 @@ int bpf_jit_blind_constants(struct bpf_verifier_env *env)
>>   		insn = prog->insnsi + i + insn_delta;
>>   		insn_cnt += insn_delta;
>>   		i        += insn_delta;
>> +
>> +		/* bpf_patch_insn_data() calls adjust_insn_aux_data() to adjust insn_aux_data. The
>> +		 * indirect_target flag for the original instruction is moved to the last of the new
>> +		 * instructions, but the indirect jump target is actually the first one, so move
>> +		 * it back.
>> +		 */
>> +		if (env->insn_aux_data[i].indirect_target) {
>> +			env->insn_aux_data[i].indirect_target = 0;
>> +			env->insn_aux_data[i - insn_delta].indirect_target = 1;
>> +		}
> 
> This fixup handles the displacement caused by
> bpf_jit_blind_constants() itself, but adjust_insn_aux_data() has
> the same displacement behavior in every caller of
> bpf_patch_insn_data(). Several patching passes run before
> bpf_jit_blind_constants() in bpf_check():
> 
>    convert_ctx_accesses()      ->  bpf_patch_insn_data()
>    do_misc_fixups()            ->  bpf_patch_insn_data()
>    opt_subreg_zext_lo32_rnd_hi32() -> bpf_patch_insn_data()
>    fixup_call_args()           ->  bpf_jit_blind_constants()  <-- only fixup here
> 
> All of these call adjust_insn_aux_data() which does:
> 
>    memmove(data + off + cnt - 1, data + off, ...)
>    memset(data + off, 0, ...)
> 
> This moves indirect_target from data[off] to data[off + cnt - 1].
> Meanwhile, bpf_insn_array_adjust() preserves xlated_off == off:
> 
>    if (insn_array->values[i].xlated_off <= off)
>        continue;
> 
> So after an earlier pass patches an indirect target instruction,
> the insn_array still says the target is at off, but
> insn_aux_data has indirect_target set at off + cnt - 1.
> 
> If an indirect jump target is also, say, a helper call that
> do_misc_fixups() replaces with multiple instructions, would
> bpf_insn_is_indirect_target() return the wrong result for that
> instruction? It seems like the fixup might need to be in
> adjust_insn_aux_data() itself rather than only in
> bpf_jit_blind_constants().
> 

OK, will move the fixup to adjust_insn_aux_data()

> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22803043949


