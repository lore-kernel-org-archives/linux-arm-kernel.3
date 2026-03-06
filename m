Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AF1FC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EuyHHVP1ezysh+DOMChYpQ6YLA93nDMuTUQuNAbUKI=; b=wFobHbGopdxnMavgS5EJIgv3+y
	Jg3aZa3mJKXu8Zh6jRK9N0MbYVqqcg5836v/CzV4N286AXAvTHH9IvRxSuYhLCpthK+8cX5vyDN4C
	2Vu2VtQ/NUJL9Y+BLePzMuuhbBIKlAMbULJo23U8/xjkAl1eWpVAJbxZQwWToLXVANTopF6bfj6Af
	coP/ha315qdC8Xq1h8zMeFjk87nPVwI0GdxIhNRW0UOy/VqbR4MkgDJoIcTAnBI4L+J9bk2Cdu4vv
	615AWau8s1f8Fe4UpnRTj3W4zWpLA0sN7Sf4WUzocVYfwFsV01oSc2zohidM5kFbDYqO05tvM/YKT
	1+yA0F1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeuO-00000004gCw-1CKZ;
	Fri, 06 Mar 2026 23:48:40 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeuK-00000004gCK-0ze8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:48:39 +0000
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 626NVQj92208026
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 6 Mar 2026 15:31:58 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 626NVQj92208026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772839922;
	bh=+EuyHHVP1ezysh+DOMChYpQ6YLA93nDMuTUQuNAbUKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PioK8n1GDOCMylG5Zt2121yBqaQjmuAgAG8ArmoqbSGk+AY2HjiUf0EtOT1DsexRY
	 3XzpMhpcVWr9RPSEgwVE9ESR7uck6X+0Brpr8WoubZ+TlXmlH4lDGa0CVViVEYVOPr
	 a2U1eLnne4Jq8YkGPdE7tatxcJ2Gd+LMg66XDUlWERyyYKh8whYexkpditNEyz4ILx
	 yckiGOkMmhcxGYFKzQD0ff8pydvHcvjyUktvDHaVTIquZDk64YCElixBnK+5hWClOa
	 uRJidGVd5gvOOIeokQ5EcbFwoFLXBWjUIyo+ZDse7szoWgdzIXdm2JW1VkFzyB6i6x
	 eQ3pvQwa4welw==
Message-ID: <75d0ca29-b227-49c1-8204-b305f64b009b@zytor.com>
Date: Fri, 6 Mar 2026 15:31:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] kbuild: Switch from '-fms-extensions' to
 '-fms-anonymous-structs' when available
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
        llvm@lists.linux.dev
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <01433066-eb9b-4a96-8d7f-794af941d365@zytor.com>
 <20260306231705.GD2746259@ax162>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260306231705.GD2746259@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_154838_140692_DA2EE289 
X-CRM114-Status: GOOD (  17.70  )
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

On 2026-03-06 15:17, Nathan Chancellor wrote:
> On Thu, Mar 05, 2026 at 03:43:29PM -0800, H. Peter Anvin wrote:
>> Question: does clang allow this with __extension__, or only if the option is
>> on the command line?  It would be desirable in the long run if both clang and
> 
> It looks like only on the command line:
> 
>   https://godbolt.org/z/zrE766obe
> 
>> gcc would allow this with __extension__, as that would be required to use it
>> in uapi headers (at least without some doable-but-nontrivial preprocessing,
>> which might be worthwhile to do anyway...)
> 
> I agree that would be desirable but wouldn't that change how
> __extension__ works? As far as I can tell from reading GCC's
> documentation [1], __extension__ just supresses warnings from -pedantic
> and such, it does not actually enable a used extension if it conflicts
> with whatever -std= value is passed?
> 
> [1]: https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html
> 

Maybe it does, but it's explicit purpose is to allow code to be compiled with
a -std= setting lower than the system libraries.

I was a little surprised to see that -std=c90 doesn't actually enforce C90
compatibility; even with -Wall -Wextra it requires -pedantic to issue
warnings; the same seems to apply to -std=c99 for at least some features that
were included in gnu* standards like anonymous structures and unions.

The latter is probably a particular indication about the desirability of this,
since the extension we are talking about is a relatively obvious extension of
the anonymous struct/union construct!

It is an incredibly useful thing in ABI headers, because it lets you avoid the
"copy/macro this entire structure definition into another."

	-hpa






