Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172A9CFC526
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0CF4lZ+jifDCXnDHaRPIm69RahNaZRjwQ8dsfCkA68=; b=snsV95qhwM46WBlekbnYel8nTh
	VbTIrjAEaP4FlJC73HmXmzQp8dhR6vePXUAuu25kNVM7oi4sj3Q70W7eFEDq4MlRBSzZempzOdqFA
	0ro48Oiu/w8psIS0ll2ky948RQZbBFody2hjybj9HdbsW3puAp3RqqorB1d2V7xbaj9Flhz+e7POU
	iaUHeGSrdk9xRT8GS9fZoGOvam+LoAFgKxLFq8wwB8NT7lzzW8cZOME9L0/SKdQBqmWMa8InWHEeI
	fl3Fn2yCvpdAq8qIJ6ZBhA5XktZxKTJ5rtkQRyo8g4nMNjENb9wioR6UnsqkuQeBVmUSQYARu1+9X
	32WlSW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMllv-00000009Urz-0V2x;
	Sat, 22 Nov 2025 11:27:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMllt-00000009Uro-39jW;
	Sat, 22 Nov 2025 11:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=F0CF4lZ+jifDCXnDHaRPIm69RahNaZRjwQ8dsfCkA68=; b=lAHpKSuPs4pmkcXgGHkua6WQIB
	l3Hdxl5isBVnVDS5ejlD/UMa2QT5vHno+3es+l6/ROtDWIKZeIgMf1/iL8gcmsx+SYGYQVOiK9bU9
	9/y+vw0qMJQ0Ko+jq+pJqx7GuG4a8GM3RTto93Or6OSls4jk1NOtdjkfTFI6Rezhwk2gXKIfBMmvE
	ITDRiMsouu9vkNttNGSF8ZkgPGzdEPr7xlwUn74kBBFvJ+xDn1IAbSLd+nB5W0VmG0SM9vGqvH+Ge
	2a+nS38tv5ssjEnT2cqPrD6N1wpTsOiW9EAuz50iwwDm+IG+bAF5jaAOoRm87hc8wbAqNbA4KB5Mm
	0r1HjNZQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMllo-00000004GkW-0bIC;
	Sat, 22 Nov 2025 11:27:16 +0000
Received: from loongson.cn (unknown [36.44.121.68])
	by gateway (Coremail) with SMTP id _____8Bx39MEniFpMe4mAA--.13414S3;
	Sat, 22 Nov 2025 19:27:01 +0800 (CST)
Received: from [192.168.0.111] (unknown [36.44.121.68])
	by front1 (Coremail) with SMTP id qMiowJAxvsH8nSFpm+g7AQ--.53718S3;
	Sat, 22 Nov 2025 19:26:57 +0800 (CST)
Message-ID: <7f179e5f-610c-6468-cb3f-17d25d096a8f@loongson.cn>
Date: Sat, 22 Nov 2025 19:26:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1] kbuild: Add KBUILD_VMLINUX_LIBS_PRELINK
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251119042708.27658-1-yangtiezhu@loongson.cn>
 <20251122013551.GA3928114@ax162>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <20251122013551.GA3928114@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qMiowJAxvsH8nSFpm+g7AQ--.53718S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFWxury5KFWUGFW7Gr17Jwc_yoW8GFW5pa
	1vyr4jvFsrJw4vqan7C345Xa1YqF95XrWxWFyDKa98Z3yDXr10vrZFgF43ZF9FvFyDAF4S
	gFs7XF9xCry7K3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4Z2-UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_112712_713633_3337256E 
X-CRM114-Status: UNSURE (   8.44  )
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

On 11/22/25 09:35, Nathan Chancellor wrote:
> On Wed, Nov 19, 2025 at 12:27:08PM +0800, Tiezhu Yang wrote:
> ...
>> index 433849ff7529..e72d3254b93f 100755
>> --- a/scripts/link-vmlinux.sh
>> +++ b/scripts/link-vmlinux.sh
>> @@ -61,12 +61,11 @@ vmlinux_link()
>>   	shift
>>   
>>   	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
>> -		# Use vmlinux.o instead of performing the slow LTO link again.
> 
> Why is this comment getting removed?

When using KBUILD_VMLINUX_LIBS_PRELINK or KBUILD_VMLINUX_LIBS_FINAL,
drivers/firmware/efi/libstub/lib.a needs to be linked to the final
vmlinux with vmlinux.o, so I thought the above comment is not proper,
it I misunderstood it, I will keep the comment as is.

>>   		objs=vmlinux.o
>> -		libs=
>> +		libs="${KBUILD_VMLINUX_LIBS_PRELINK}"
>>   	else
>>   		objs=vmlinux.a
>> -		libs="${KBUILD_VMLINUX_LIBS}"
>> +		libs="${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PRELINK}"
>>   	fi
>>   
>>   	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then

FYI, the previous patch is still under discussion yesterday [1],
I do not know whether this patch is necessary and what is the next
step [2].

[1] 
https://lore.kernel.org/loongarch/CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com/
[2] 
https://lore.kernel.org/loongarch/39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn/

Thanks,
Tiezhu


