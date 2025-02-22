Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58123C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9e8ogMT9xD66Jdg2PzJMoU6CRteyFiUqZDvtmpgyEM=; b=T6vOS1TGrSYcQjvsCh1SB9xALX
	1b+DUhtqg/QOzkSyC/Zti0XhJaUYgDs+mRhofW+ESoTZDhob3J9KQdwbg00X7SJWlTBA1sQi8Gpv4
	6gzX8U0bCYLrzsGAxnYhUY+64o2wYPP/Opub0YoJYs8Fjg9VTWbh4wtSk6Xbjz91FkXbMlJ+ilWaZ
	OZi6H/GQbfBzogKlaks1nsfIZzNVb33CXDkHRuqBy8DcpJBl/CgOvMR8AlhDdnfeb5OvEblkiA7Ld
	5ZsIiayiHkEpS2cSJB5G4krKdyGZL9LuN8xS81ySu4kZbhtcWsrNz/1UMxdKEKy6bxC5eJIscCphX
	Bs0zKigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllog-00000007jIX-2iYS;
	Sat, 22 Feb 2025 09:28:58 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tllnC-00000007j8c-2Lsy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:27:28 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Z0M8D0DWBz4f3jXL
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 17:26:52 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id B4A1D1A0D72
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 17:27:13 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP1 (Coremail) with SMTP id cCh0CgB32npumLlnSw0GEg--.53229S2;
	Sat, 22 Feb 2025 17:27:11 +0800 (CST)
Message-ID: <7853efad-6158-420e-aba6-65afbcbaea79@huaweicloud.com>
Date: Sat, 22 Feb 2025 17:27:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 6/9] arm64: insn: Add load-acquire and
 store-release instructions
Content-Language: en-US
To: Peilin Ye <yepeilin@google.com>, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: bpf@ietf.org, Eduard Zingerman <eddyz87@gmail.com>,
 David Vernet <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Shuah Khan <shuah@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 Yingchi Long <longyingchi24s@ict.ac.cn>, Josh Don <joshdon@google.com>,
 Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>,
 Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
References: <cover.1740009184.git.yepeilin@google.com>
 <e2eb5c6912f292ed229aa4fb14e42d7f4c2f8571.1740009184.git.yepeilin@google.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <e2eb5c6912f292ed229aa4fb14e42d7f4c2f8571.1740009184.git.yepeilin@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgB32npumLlnSw0GEg--.53229S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWxZr4UJFW7uryDKF47twb_yoWrCF17pw
	s8Ar1rGF48WryfCF93tF1UZFs0gF409a9xWryUGw1Ikw4DAFy3Jr42grnFqF4Uur1jgF15
	tr1j9r4F9r40yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8
	Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	j6a0PUUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_012726_963090_97BCD929 
X-CRM114-Status: GOOD (  15.09  )
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

On 2/20/2025 9:21 AM, Peilin Ye wrote:
> Add load-acquire ("load_acq", LDAR{,B,H}) and store-release
> ("store_rel", STLR{,B,H}) instructions.  Breakdown of encoding:
> 
>                                  size        L   (Rs)  o0 (Rt2) Rn    Rt
>               mask (0x3fdffc00): 00 111111 1 1 0 11111 1  11111 00000 00000
>    value, load_acq (0x08dffc00): 00 001000 1 1 0 11111 1  11111 00000 00000
>   value, store_rel (0x089ffc00): 00 001000 1 0 0 11111 1  11111 00000 00000
> 
> As suggested by Xu [1], include all Should-Be-One (SBO) bits ("Rs" and
> "Rt2" fields) in the "mask" and "value" numbers.
> 
> It is worth noting that we are adding the "no offset" variant of STLR
> instead of the "pre-index" variant, which has a different encoding.
> 
> Reference: Arm Architecture Reference Manual (ARM DDI 0487K.a,
>             ID032224),
> 
>    * C6.2.161 LDAR
>    * C6.2.353 STLR
> 
> [1] https://lore.kernel.org/bpf/4e6641ce-3f1e-4251-8daf-4dd4b77d08c4@huaweicloud.com/
> 
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>   arch/arm64/include/asm/insn.h |  8 ++++++++
>   arch/arm64/lib/insn.c         | 29 +++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index 2d8316b3abaf..39577f1d079a 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -188,8 +188,10 @@ enum aarch64_insn_ldst_type {
>   	AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX,
>   	AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX,
>   	AARCH64_INSN_LDST_STORE_PAIR_POST_INDEX,
> +	AARCH64_INSN_LDST_LOAD_ACQ,
>   	AARCH64_INSN_LDST_LOAD_EX,
>   	AARCH64_INSN_LDST_LOAD_ACQ_EX,
> +	AARCH64_INSN_LDST_STORE_REL,
>   	AARCH64_INSN_LDST_STORE_EX,
>   	AARCH64_INSN_LDST_STORE_REL_EX,
>   	AARCH64_INSN_LDST_SIGNED_LOAD_IMM_OFFSET,
> @@ -351,6 +353,8 @@ __AARCH64_INSN_FUNCS(ldr_imm,	0x3FC00000, 0x39400000)
>   __AARCH64_INSN_FUNCS(ldr_lit,	0xBF000000, 0x18000000)
>   __AARCH64_INSN_FUNCS(ldrsw_lit,	0xFF000000, 0x98000000)
>   __AARCH64_INSN_FUNCS(exclusive,	0x3F800000, 0x08000000)
> +__AARCH64_INSN_FUNCS(load_acq,  0x3FDFFC00, 0x08DFFC00)
> +__AARCH64_INSN_FUNCS(store_rel, 0x3FDFFC00, 0x089FFC00)
>   __AARCH64_INSN_FUNCS(load_ex,	0x3FC00000, 0x08400000)
>   __AARCH64_INSN_FUNCS(store_ex,	0x3FC00000, 0x08000000)
>   __AARCH64_INSN_FUNCS(mops,	0x3B200C00, 0x19000400)
> @@ -602,6 +606,10 @@ u32 aarch64_insn_gen_load_store_pair(enum aarch64_insn_register reg1,
>   				     int offset,
>   				     enum aarch64_insn_variant variant,
>   				     enum aarch64_insn_ldst_type type);
> +u32 aarch64_insn_gen_load_acq_store_rel(enum aarch64_insn_register reg,
> +					enum aarch64_insn_register base,
> +					enum aarch64_insn_size_type size,
> +					enum aarch64_insn_ldst_type type);
>   u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
>   				   enum aarch64_insn_register base,
>   				   enum aarch64_insn_register state,
> diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
> index b008a9b46a7f..9bef696e2230 100644
> --- a/arch/arm64/lib/insn.c
> +++ b/arch/arm64/lib/insn.c
> @@ -540,6 +540,35 @@ u32 aarch64_insn_gen_load_store_pair(enum aarch64_insn_register reg1,
>   					     offset >> shift);
>   }
>   
> +u32 aarch64_insn_gen_load_acq_store_rel(enum aarch64_insn_register reg,
> +					enum aarch64_insn_register base,
> +					enum aarch64_insn_size_type size,
> +					enum aarch64_insn_ldst_type type)
> +{
> +	u32 insn;
> +
> +	switch (type) {
> +	case AARCH64_INSN_LDST_LOAD_ACQ:
> +		insn = aarch64_insn_get_load_acq_value();
> +		break;
> +	case AARCH64_INSN_LDST_STORE_REL:
> +		insn = aarch64_insn_get_store_rel_value();
> +		break;
> +	default:
> +		pr_err("%s: unknown load-acquire/store-release encoding %d\n",
> +		       __func__, type);
> +		return AARCH64_BREAK_FAULT;
> +	}
> +
> +	insn = aarch64_insn_encode_ldst_size(size, insn);
> +
> +	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT, insn,
> +					    reg);
> +
> +	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn,
> +					    base);
> +}
> +
>   u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
>   				   enum aarch64_insn_register base,
>   				   enum aarch64_insn_register state,

Looks good to me

Acked-by: Xu Kuohai <xukuohai@huawei.com>


