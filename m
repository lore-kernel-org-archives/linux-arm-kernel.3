Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5BACA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMx5zpWKDtSIizVoX7qO1HTvG8b/bpMheHX3q1LsHSA=; b=pueyF+7viM4zd2RM3lEaJZ45Ma
	iRHERYvGkpZYV/nI+K3tOPZyieh+GgkZ+Y5gyYSrNhjIjwAFooe0M+j+a9gOmHNq/u3WjZLEF4SnN
	PCqqo6Za+kTdJ1fsLJPu4jNYvW5Jdyp1gSf41pIGzBH1JuP9URMRC9JXgpTZHFoqHpZUCXdlj4wOn
	FO+Cgbv6IWX8yAHUgJYlkwsap8iz+RAAWjrV5QHZNXV40NgBVKvAP5ij+efOqkBsihqHPjtc8c+Vw
	cXb33zWAFBMMAOU+JIpuC40vCjvqiT6KhThenW3OnKEn88CC2I81ZmNnHqAdq0RFZp7cqWYY3RCrP
	0J85xsFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYvD-0000000B1vn-3oLm;
	Fri, 02 Oct 2026 08:47:15 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYvA-0000000B1up-3Foz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:47:14 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3E3BE7A0142
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 04:47:11 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 02 Oct 2026 04:47:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790930814;
	 x=1791017214; bh=TMx5zpWKDtSIizVoX7qO1HTvG8b/bpMheHX3q1LsHSA=; b=
	RzCOc46SyeXngTkCqKEz05ya2MZWY0A48H46yqPYymljdj71RkK86z43qSs2g4qV
	GhGg4r1agzNGAcrj4J0My9QOG5Z8S9NVuCMgmTQASJJ4CHXTXXxvQp+WVUIgAaYO
	Gn08kO1TYX1070P39XP64G0k1U8k0EVXk0VwTyPG/GEXOrHDJjLDmMCMkkZ4XHKL
	spdShfn1J1DmX+60bFaf7YQOCHxBPqX2s29zYyFKB+DOa8PK26Cj0/1VK0GIMUcG
	b5QAr7pOc0eogHfD2SqLGazj+rUEiYzuhTIupjVcpYyK102VXxJkruevg46IqsWW
	pfK18SMyj5a8gLLIo+RILw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790930814; x=
	1791017214; bh=TMx5zpWKDtSIizVoX7qO1HTvG8b/bpMheHX3q1LsHSA=; b=j
	1WYQgBjuYBybCLSkou5V1nl/XXjr/3s8sa4Zr3N7Aeru9VblUgtCXnpVoLwvKM/J
	coV8KAXmAWL2Uc5ric1DJFoPfgSm9YBXgGdW/m/y+3BmzDMZN0T1XiaS09L9Hjdn
	VtTekv4byWX3YHtSnEtZPNSdjIA2Jp1FsuuhZG+VHD6v2inp/cY9nJt9YKyHaUVq
	y3uRyB2jLOlp1qIzjp+C/foeop2va2vkXbYZlZisuQxhGTfMmoMfZQzeG5fkp9m8
	ZfarrG/dPVVSVhPTOnWupOcP3OTyr/aZgSSRvOJJ4btpLuScnFuCSc9eOWCZ8ZXC
	tmMinmi5v7NQ/qEMDx37A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790930814; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:T9Ow+Jh0S2ECyc7H7cuvXBA+UyYe9TbBjaUxBeNV4f/tQak
	xDM9YwYNfohA5XrGIN+mXbSmu6f6uE8J+qD62jAkjUSVnpmmFGlzchDKFsiaDZQO
	Y7+zXcx02drucruZ5NdU25UE5+xQHpn/oDoAA00+Of5cqZLks+OWof22ntyEQyDL
	q6DJVr7p0TfCeb5hRaVBvxO1mY0gIWFUfrVOuIyXmKnvpm3tSZkX2f1yKvzzUhMC
	LjmpSMBcUetM3Z6kWVqQiQmZJIW9z5VGpUqfeyJtCxHBWWtJwS4srqWla12q2yfM
	S1gvu6b55tHCAaE7fI6TLuWxk+POZ/5WiZttA7A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zp9p2M12DDOV6tsxuuPUsY4VYzCSp1NgYJfIjQroFvw=:hXFV5+WELtxKEz0g2EtbxcScY/hQNVTx3m+Uv8fbO9U=;
X-ME-Sender: <xms:dW-_agusuepAi1TSg6P0cZbMq6bONU0mJnV5qYZ_xBByjdDJy3AjVw>
    <xme:dW-_aoT2UsGTSQ--mCA7YworcmRtciFLMr769nKOwM7O1D2VakXsgtkgOz0bLsul_
    aJHTFhghTgjvK5XXOp-sycUGfy49izSJa4Gw6ST7CRG4bypF5_-J0sf>
X-ME-Proxy-Cause: dmFkZTGNYYpzKNIFSp2MsS9/36+tAXSwRx47gvy54pHP33s1WUvxXaS28wpNy7Hm2Ts1Rh
    zZw7uvnk+hpKrKGxj4+kvsbLNRD6gTKf64CKt757tPDDBL7EwMeIbRDUyRxaM4N7HNR4Vq
    RkxPWch4Ae+qllTQ6TsIpJR+i5kGdkdIBzlaPi3LrREjLX2n/z2nvAaza2tcMZQ5Uz40u6
    RGQ1HfZ4nhdiI7bYVJsZQBqvkwNODykZdg2pOw5YGpwcBkuA7wgEXxQH3GueTgYGC1Ahma
    ar4jdoY03AIr64+L2lM4JbgWU2tTJNw0jG63PnHGUOd0iTqmE5xQJoYe7l9G5iYZgBoXjt
    p7bHvnU8aaVutTeHIAWm1GjzZBOjm8bXaXQE/5/iyDh9rHSr1Gj1rOGIixZu2j2jGKEU+k
    xuuH++OKFg53/GgQRn7CxFBWrQZKH80moKzvw7MNJ6QG5h/HQx/X02tXNMDd/wBH+g87Go
    Gfk+tNXx7MeBWdE+vNE7acLshNIzsK4JhAgoWp41paDoVbB3TfSAeQscrBavbGZNrC4/Mi
    tw3cBfDJfuuqCRvfqZnKWFBN6z2yFtcsuflZWt93O87+Nnj5J4DYNHFvfGHghY2WAJQd6w
    N3pMgs97wkWYIlh8uBGvigMSWYqngUpvG9pyIwVxBQwc/2lL+oiHTelCibPA
X-ME-Proxy: <xmx:em-_ajPxutY8cOb6N7-iQ3nyYZlsJVt_yX2GGJtZbj51JHAdcm6GMQ>
    <xmx:em-_ahTJKUwpHeLTCyjjynuqtk99OZmHMg4MgOiwWyQyCIoO_ktdoA>
    <xmx:em-_auGDdKUSvOaYjy03IayCr_EQGyzHoQO165umaUU5FKViSOVhlw>
    <xmx:em-_aq72u-DUQFc4MPR1IIMDZPnhpeeuK1okwjvZ2CKHFWJ46xKrgg>
    <xmx:fm-_avkcku59M01ZHSOjUANaFaj7ZR25wo33Y2l7dGtFPFuKsbzwIkFn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AEDC232A008A; Fri,  2 Oct 2026 04:46:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AompHzTHtn-7
Date: Fri, 02 Oct 2026 10:46:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Steffen Eiden" <seiden@linux.ibm.com>, "Marc Zyngier" <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Andreas Grapentin" <gra@linux.ibm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Claudio Imbrenda" <imbrenda@linux.ibm.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Friedrich Welter" <fritz@linux.ibm.com>,
 "Gautam Gala" <ggala@linux.ibm.com>,
 "Hariharan Mari" <hari55@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Hendrik Brueckner" <brueckner@linux.ibm.com>,
 "Ilya Leoshkevich" <iii@linux.ibm.com>,
 "Janosch Frank" <frankja@linux.ibm.com>,
 "Joey Gouly" <joey.gouly@arm.com>, "Nico Boehr" <nrb@linux.ibm.com>,
 "Nina Schoetterl-Glausch" <oss@nina.schoetterlglausch.eu>,
 "Oliver Upton" <oupton@kernel.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Sean Christopherson" <seanjc@google.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Ulrich Weigand" <Ulrich.Weigand@de.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>, "Will Deacon" <will@kernel.org>,
 "Zenghui Yu" <yuzenghui@huawei.com>,
 "Fuad Tabba" <fuad.tabba@linux.dev>
Message-Id: <d03bc12e-be69-4c2e-bc5e-f587763e2594@app.fastmail.com>
In-Reply-To: <40dd808c-bddf-4a7a-be81-53c64de2707d@app.fastmail.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
 <179085262878.3865846.5787241839391727949.b4-ty@b4>
 <20261001132715.108643-A-seiden@linux.ibm.com>
 <40dd808c-bddf-4a7a-be81-53c64de2707d@app.fastmail.com>
Subject: Re: (subset) [PATCH v9 00/24] KVM: s390: Introduce arm64 KVM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_014713_363751_AD966F66 
X-CRM114-Status: GOOD (  13.04  )
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

On Thu, Oct 1, 2026, at 15:39, Arnd Bergmann wrote:
> On Thu, Oct 1, 2026, at 15:27, Steffen Eiden wrote:
>
>> I can send the two fixup patches as a reply here for this tomorrow or 
>> later today if you want. 
>
> My build bot is churning away looking for more corner cases.
> I initially had the wrong base, but with this one and the other
> two I sent, things are starting to look good. I'll keep it
> running over night, but if you don't hear from me for any additional
> build regressions in the next hour, it's probably fine.

No more build failures overnight, but after changing to gcc-10.5.0,
I get link failures for the namespaced module:

`__s390_indirect_jump_r1' referenced in section `.text' of arch/s390/kvm/arm64/kvm-namespaced.o: defined in discarded section `.text.__s390_indirect_jump_r1[__s390_indirect_jump_r1]' of arch/s390/kvm/arm64/kvm-namespaced.o
`__s390_indirect_jump_r4' referenced in section `.text' of arch/s390/kvm/arm64/kvm-namespaced.o: defined in discarded section `.text.__s390_indirect_jump_r4[__s390_indirect_jump_r4]' of arch/s390/kvm/arm64/kvm-namespaced.o
`__s390_indirect_jump_r14' referenced in section `.text' of arch/s390/kvm/arm64/kvm-namespaced.o: defined in discarded section `.text.__s390_indirect_jump_r14[__s390_indirect_jump_r14]' of arch/s390/kvm/arm64/kvm-namespaced.o
`__s390_indirect_jump_r1' referenced in section `.text' of arch/s390/kvm/arm64/kvm-namespaced.o: defined in discarded section `.text.__s390_indirect_jump_r1[__s390_indirect_jump_r1]' of arch/s390/kvm/arm64/kvm-namespaced.o
`__s390_indirect_jump_r4' referenced in section `.text' of arch/s390/kvm/arm64/kvm-namespaced.o: defined in discarded section `.text.__s390_indirect_jump_r4[__s390_indirect_jump_r4]' of arch/s390/kvm/arm64/kvm-namespaced.o
`__s390_indirect_jump_r14' referenced in section `.text' of arch/s390/kvm/arm64/kvm-namespaced.o: defined in discarded section `.text.__s390_indirect_jump_r14[__s390_indirect_jump_r14]' of arch/s390/kvm/arm64/kvm-namespaced.o

See https://pastebin.com/raw/pJYu8UAb for the .config that triggered it.
Later compilers get CONFIG_EXPOLINE_EXTERN=y, which avoids the problem,
so an easy workaround would be to make the module depend on that symbol:

--- a/arch/s390/kvm/Kconfig
+++ b/arch/s390/kvm/Kconfig
@@ -19,6 +19,7 @@ if VIRTUALIZATION
 config KVM
        def_tristate y
        prompt "Kernel-based Virtual Machine (KVM) support"
+       depends on !EXPOLINE || EXPOLINE_EXTERN
        select HAVE_KVM_CPU_RELAX_INTERCEPT
        select KVM_ASYNC_PF
        select KVM_ASYNC_PF_SYNC

      Arnd

