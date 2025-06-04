Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0C9C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 18:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cblBX32hBSMGN1bRDDUz9lTIgViFoNWr1i8Qx9BOzE8=; b=sZNKo+ag400nNs/R0NllxK0s7w
	agBegSc6DF9OBJ63Qt1BJk1ibNnbTnES+Mbd9qhnTKSfazezJYLvQAXk+tNxkFcvPiWBG3fkjYFt5
	5O2AEeIZ7DKpBxLra/mn2qKSLfshXnUhOmbeDUg/4iU8LKuQQt1BC5kVmzsv+CrKfIwjuKez2dg0O
	7aSCgkSVzyeQgHey4ZZ7qmCs1zUNotTwQT4BLpw29sw8A7BjBQ4bGjphpOSY0bc5Xw+6JFQJ+4DTM
	6RkAJUeRAxEGExyIy8yIDaQzC/FU+1Bz8/0bcudmxxVch4M0hwwIP8oy/CDtgQi8UjTHNsbi+rqde
	IRDJ51Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMt5P-0000000E2at-2CSq;
	Wed, 04 Jun 2025 18:43:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrxq-0000000DwtJ-2yUP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Jun 2025 17:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cblBX32hBSMGN1bRDDUz9lTIgViFoNWr1i8Qx9BOzE8=; b=TPzgT7y7yJWIkC6Qu5RTXYW3ne
	6qU4eYIoeZylnvjxFWQ9YplHIpLgv2vgC41BrN/gJiBIYqMkiY9lwi3XCw5ZQ5NyqLxE46FIucIZ1
	KOZLTTb/Gnpi665MrPIeTwGjIg7j7lTRybD6MluWX6lsnZpmg16mgQxBhrtmmM2oS18MfdKMMHpqE
	W2BaBi5qxXBFN5lQzy5Z6QoMihmhMOceZduRbmtOFn0AZS480uif5pAb8HXUjNCAxmkJfc4dG40NY
	c1bSnYpYh0/hDOXtsK1cvwwZEiHghVYg0awrRvxwgHk1aGgbLkylwCHUjkRaykM1dbbsseT+AC5H7
	+Vs+kHsA==;
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrxn-00000000wmU-3Ms3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 17:31:45 +0000
Message-ID: <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749058290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cblBX32hBSMGN1bRDDUz9lTIgViFoNWr1i8Qx9BOzE8=;
	b=WJQ/VWxP668jiRTd22ItARHZuzMoQhmaB3SO9vl1+6W071uWHgtq0WoRfz95O3x72EkcxN
	nK2Fw6Mj7kwzdJRBT7BaXuujz/MetlaBuXdFjGnGGXFy27OLanDhT1Kr6hd6AZ1ws9O/2i
	NQA4CGWnOHunrOES5pTIOxAnVt98148=
Date: Wed, 4 Jun 2025 10:31:02 -0700
MIME-Version: 1.0
Subject: Re: [Question] attributes encoding in BTF
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
 Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Florent Revest <revest@chromium.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 dwarves@vger.kernel.org
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <DADMLIVHMSSO.3AXSI5216WCT6@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <DADMLIVHMSSO.3AXSI5216WCT6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_183143_882799_6E48A3F4 
X-CRM114-Status: GOOD (  39.16  )
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

On 6/4/25 2:02 AM, Alexis LothorÃ© wrote:
> Hi all,
> a simpler version of this series has been merged, and so I am now taking a
> look at the issue I have put aside in the merged version: dealing with more
> specific data layout for arguments passed on stack. For example, a function
> can pass small structs on stack, but this need special care when generating
> the corresponding bpf trampolines. Those structs have specific alignment
> specified by the target ABI, but it can also be altered with attributes
> packing the structure or modifying the alignment.
> 
> Some platforms already support structs on stack (see
> tracing_struct_many_args test), but as discussed earlier, those may suffer
> from the same kind of issue mentioned above.
> 
> On Wed Apr 23, 2025 at 9:24 PM CEST, Alexis Lothoré wrote:
>> Hi Andrii,
>>
>> On Wed Apr 23, 2025 at 7:15 PM CEST, Andrii Nakryiko wrote:
>>> On Thu, Apr 17, 2025 at 12:14 AM Alexis Lothoré
>>> <alexis.lothore@bootlin.com> wrote:
>>>>
>>>> Hi Andrii,
>>>>
>>>> On Wed Apr 16, 2025 at 11:24 PM CEST, Andrii Nakryiko wrote:
> 
> [...]
> 
>>> I'd suggest looking at btf__align_of() in libbpf (tools/lib/bpf/btf.c)
>>> to see how we calculate alignment there. It seems to work decently
>>> enough. It won't cover any arch-specific extra rules like double
>>> needing 16-byte alignment (I vaguely remember something like that for
>>> some architectures, but I might be misremembering), or anything
>>> similar. It also won't detect (I don't think it's possible without
>>> DWARF) artificially increased alignment with attribute((aligned(N))).
>>
>> Thanks for the pointer, I'll take a look at it. The more we discuss this
>> series, the less member size sounds relevant for what I'm trying to achieve
>> here.
>>
>> Following Xu's comments, I have been thinking about how I could detect the
>> custom alignments and packing on structures, and I was wondering if I could
>> somehow benefit from __attribute__ encoding in BTF info ([1]). But
>> following your hint, I also see some btf_is_struct_packed() in
>> tools/lib/bpf/btf_dump.c that could help. I'll dig this further and see if
>> I can manage to make something work with all of this.
> 
> Andrii's comment above illustrates well my current issue: when functions
> pass arguments on stack, we are missing info for some of them to correctly
> build trampolines, especially for struct, which can have attributes like
> __attribute__((packed)) or __attribute__((align(x))). [1] seems to be a
> recent solution implemented for BTF to cover this need. IIUC it encodes any
> arbitratry attribute affecting a data type or function, so if I have some
> struct like this one in my kernel or a module:
> 
> struct foo {
>      short b
>      int a;
> } __packed;
> 
> I would expect the corresponding BTF data to have some BTF_KIND_DECL_TAG
> describing the "packed" attribute for the corresponding structure, but I
> fail to find any of those when running:
> 
> $ bpftool btf dump file vmlinux format raw
> 
> In there I see some DECL_TAG but those are mostly 'bpf_kfunc', I see not
> arbitrary attribute like 'packed' or 'aligned(x)'.
> 
> What I really need to do in the end is to be able to parse those alignments
> attributes info in the kernel at runtime when generating trampolines, but I
> hoped to be able to see them with bpftool first to validate the concept.
> 
> I started taking a look further at this and stumbled upon [2] in which Alan
> gives many more details about the feature, so I did the following checks:
> - kernel version 6.15.0-rc4 from bpf-next_base: it contains the updated
>    Makefile.btf calling pahole with `--btf_features=attributes`
> - pahole v1.30
>    $ pahole --supported_btf_features
>    encode_force,var,float,decl_tag,type_tag,enum64,optimized_func,consistent_func,decl_tag_kfuncs,reproducible_build,distilled_base,global_var,attributes
>    This pahole comes from my distro pkg manager, but I have also done the
>    same test with a freshly built pahole, while taking care of pulling the
>    libbpf submodule.
> - bpftool v7.6.0
>      bpftool v7.6.0
>      using libbpf v1.6
>      features: llvm, skeletons
> 
> Could I be missing something obvious ? Or did I misunderstand the actual
> attribute encoding feature ?

Hi Alexis.

The changes recently landed in pahole and libbpf re attributes had a 
very narrow goal: passing through particular attributes for some BPF 
kfuncs from the kernel source to vmlinux.h

BTF now has a way of encoding any attribute (as opposed to only bpf 
type/decl tags) by setting type/decl tag kind flag [1]. So it is 
possible to represent attributes like packed and aligned in BTF.

However, the BTF tags need to be generated by something, in case of 
vmlinux by pahole. Pahole generates BTF by parsing DWARF. And, as far as 
I understand, attributes are not (can not be?) represented in DWARF in a 
generic way, it really depends on specifics of the attribute.

In order to support packed/aligned, pahole needs to know how to figure 
them out from DWARF input and add the tags to BTF. And this does not 
happen right now, which is why you don't see anything in bpftool output.

[1] 
https://lore.kernel.org/bpf/20250130201239.1429648-1-ihor.solodrai@linux.dev/

> 
> Thanks,
> 
> Alexis
> 
> [1] https://lore.kernel.org/bpf/20250130201239.1429648-1-ihor.solodrai@linux.dev/
> [2] https://lore.kernel.org/all/CA+icZUW31vpS=R3zM6G4FMkzuiQovqtd+e-8ihwsK_A-QtSSYg@mail.gmail.com/
> 


