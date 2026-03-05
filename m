Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9852F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 23:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+08PYjDQhAaObzzVmi0H3Jb7j0xETdylBL3/4YZEk8=; b=ieithfGhLVSt6rmZBbxz/x0And
	lwmWNnXTO4zIjlks4O0XB623zU6ECsG1b50ti83Mpi59k9ZXUQ08pufVQXVEfAaaAmb3wbyAsxk5m
	ip7sJNQ1XgGCxvMESwnSKl/KfVmVEfGwQ2iRmYboqmDHdFUqvHbR7fGDRyNs+1O7OQGzwHomK88so
	JmYX1mj+ZErmnkJK9veKYn2nhoziIz9SIjlfPaY64DUqdfzw2QL1NoeHvQo/E45Sz7C78qFyO5lk6
	CYwoO+/TtTWsM0fhpSkH7u/dAq9AsjtsqtcnI2FRlo9OZEUN0Oh0CUm0skXSx/bI0Zyt73RWSCagj
	r6lLiwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIMg-00000002k4K-3OMO;
	Thu, 05 Mar 2026 23:44:22 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIMe-00000002k3r-2q62
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 23:44:22 +0000
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 625NhY3o4127751
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Mar 2026 15:43:35 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 625NhY3o4127751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772754218;
	bh=W+08PYjDQhAaObzzVmi0H3Jb7j0xETdylBL3/4YZEk8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NiuHMNofaKp4X3OTkTE4sx+ETMmwUFwgJjU83eBnK2/BqKkOamVxH8/VjJ6FOT+rj
	 cX8EORzUxiaeuPL/1KqpN374d4Fv+bjiIc9qbH2fAFX6suJ7cqLLdsFwbLkHnOb4e/
	 4rbho2As0pJPemgWwc3J3VEGg1b0DHzc5RkY8zixe6iRpSUQIEDHsEBxGqiEhzlUvB
	 SdoTrvFmB+3vG9ZsjdkJ/n76P3jMN/BwJ0h8M1f7ogLYnkjnS0DdO4PbTJCc0rLtsz
	 xxrlilrcBpzg9J0XWBj/4aaFK7REjIiRGJ0ywiqx438ZCLfQPfIZNO74P6Ue7O7SPu
	 4MLF4w7uvkNjQ==
Message-ID: <01433066-eb9b-4a96-8d7f-794af941d365@zytor.com>
Date: Thu, 5 Mar 2026 15:43:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] kbuild: Switch from '-fms-extensions' to
 '-fms-anonymous-structs' when available
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_154420_772449_DB556337 
X-CRM114-Status: GOOD (  20.71  )
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

On 2026-02-23 11:10, Nathan Chancellor wrote:
> Hi all,
> 
> The kernel enabled '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
> enable -fms-extensions") in 6.19 to gain access to a Microsoft
> (originally Plan 9) extension around including a tagged structure/union
> anonymously in an other structure/union. Since then, Clang 23.0.0
> (current main) has added a flag to enable only that extension, rather
> than all Microsoft extensions, '-fms-anonymous-structs' [1]. Using this
> narrower compiler option would have avoided the build error fixed by
> commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
> '-fms-extensions'"). While these errors are not expected to be common,
> using the narrower option when available has no drawbacks because the
> kernel only cares about this extension in '-fms-extensions', no others.
> While this could result in build errors for folks using
> '-fms-anonymous-structs' if a developer uses another extension in
> '-fms-extensions' (either intentionally or unintentionally), flagging
> these uses for further scrutiny seems worthwhile.
> 
> This series converts the build system to use that flag when it is
> available. The first patch consolidates all of the C dialect flags into
> a single variable to make future updates to the dialect flags less
> painful, as updating the logic in every place that uses their custom
> built C flags is getting cumbersome (and C23 is looming). The second
> patch makes the actual switch.
> 
> I would like Nicolas to carry this in the Kbuild tree for 7.1, please
> provide Acks as necessary.
> 
> [1]: https://github.com/llvm/llvm-project/commit/c391efe6fb67329d8e2fd231692cc6b0ea902956
> 

Question: does clang allow this with __extension__, or only if the option is
on the command line?  It would be desirable in the long run if both clang and
gcc would allow this with __extension__, as that would be required to use it
in uapi headers (at least without some doable-but-nontrivial preprocessing,
which might be worthwhile to do anyway...)

	-hpa


