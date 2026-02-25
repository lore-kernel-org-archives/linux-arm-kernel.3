Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CCEFD3779
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vfPVzGsOpxFMqLnHbeOt97S7ASvz/dPPsmfURT55c2c=; b=LsdSFe+kuTCVgI
	IAyiriu9gBL2ruslqAE5TfllxL7Atn00Uqo1hJdNZ39p2kI3gJ+uDrv2tQw7kkhZ0w+n8OjEeW+B7
	HlWpmDhx15U1hcd9GmKGEsoWFC+Y9E/DH22jNpOIqDjS6d0eE0rPj48VC28Cnuoxv1rJqci5Wwk8X
	0rww6y025pmSrVkqnzmkqaCel85zbyJXnT8DaqbPCWQM9MpvSie3ax52ey7WU2BgYLQ5Azfhgf9TI
	nRkd8dPaql0Hiv7i8V+nQJRDJ93jJ9mwCqAX6RqVNT7YqFm34hEyM9h74OFEn2NGmXeXDtlVkS80L
	uInS0ozitcnYMg3EtGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIsf-00000004gD2-3BLT;
	Wed, 25 Feb 2026 17:41:01 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIsd-00000004gCI-0mjE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:41:00 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-7d4cb5810a0so46147050a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772041257; x=1772646057; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vfPVzGsOpxFMqLnHbeOt97S7ASvz/dPPsmfURT55c2c=;
        b=Fxstg84voo1xq8ZKL0cegtiWwQs+3YsjSrVKqfL16sbSEpQsfFd6vejmpHofItIyjC
         rvRSmnrYzIJnCvyo+4AOgnVMR4agyR/T8VaMLich6SbneDCsvINZKkxjFqrebw9oeWN1
         8zTA/Vp3GjDZXp8Q1S/NaXO5DygnbZc34ESHP13gKykfe2jxldiYe2FOVz3B2B/wO5AB
         T4/+EIZ+ObkXMS6Gnnfr3WrX0Gmj2NNBIEj0lzxCq3PkLFq50nLTCfLJ9aY9YjwcsGNS
         yIYh6eDVGCOVTcSYm9XCDkZ5zK5j05wdx0EhaLnMcZqOFouSnZ9yHk4R9AmIfXENm5t8
         e9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041257; x=1772646057;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfPVzGsOpxFMqLnHbeOt97S7ASvz/dPPsmfURT55c2c=;
        b=CKwjCHitC+Imut5ImE2YMqTEOrc149jLw+fF02AibatnQoOYOLZuqlfKDx4EbBi6NQ
         rtmrxktX+/ZFa0NoEqPsYGUCG1h/rZfA6LyrwiJuP5rPUSHP0sbpEUeVMKpcCAXAvRh2
         Uqa75XkQkxHHxIf1ApEqI6XU3+Ua33plKYkmtityfjifYP4C7oSK7V0sd/SzP8dgo4Bp
         aTEKj6KuOrPQ+TS5CoofMRFTTeGtl9zbeynb00buwgxRulTdnGENIte2kIiMhY+g2HE0
         tPi7W7j6r+nD/Hvhgs82+AwcnpVxRTLQRDW5ioQBn8PAGlrjRm4XB+DuwHldGt8R52vN
         ++jg==
X-Forwarded-Encrypted: i=1; AJvYcCXBRMOx4B0iuMqvPqnsUV6FAecYUDF0rkwIjdDeWhry2l50b0TtKw2rI8U7LVZRoIm5/6k2bFE1XBpqjvSarM8U@lists.infradead.org
X-Gm-Message-State: AOJu0YwgoLASiPYXUMLCo+zd77I7udBqALbJ3VxTXDe45FdvlaqTsV7S
	izcSUIvpGRbdTvy2u8werSmlLKJN1fe2+oFaLqeHeg76uKhseQWBrt4FN2UOxHpVNOZyakPt++C
	hPTn/0hBGAdEensPWPvRvhaWNsA==
X-Received: from iluj15.prod.google.com ([2002:a05:6e02:154f:b0:4d2:8640:5d64])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2019:b0:672:e67a:96cf with SMTP id 006d021491bc7-679c4684cbcmr8062877eaf.16.1772041256681;
 Wed, 25 Feb 2026 09:40:56 -0800 (PST)
Date: Wed, 25 Feb 2026 17:40:55 +0000
In-Reply-To: <86h5rlawru.wl-maz@kernel.org> (message from Marc Zyngier on Fri,
 13 Feb 2026 08:11:01 +0000)
Mime-Version: 1.0
Message-ID: <gsnty0kgoh5k.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v6 00/19] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_094059_269427_CA6EDC22 
X-CRM114-Status: GOOD (  19.19  )
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

Marc Zyngier <maz@kernel.org> writes:

> On Thu, 12 Feb 2026 21:08:36 +0000,
> Colton Lewis <coltonlewis@google.com> wrote:

>> Hey Marc, thanks for the review.

>> Marc Zyngier <maz@kernel.org> writes:

>> > On Mon, 09 Feb 2026 22:13:55 +0000,
>> > Colton Lewis <coltonlewis@google.com> wrote:

>> >> This series creates a new PMU scheme on ARM, a partitioned PMU that
>> >> allows reserving a subset of counters for more direct guest access,
>> >> significantly reducing overhead. More details, including performance
>> >> benchmarks, can be read in the v1 cover letter linked below.

>> >> An overview of what this series accomplishes was presented at KVM
>> >> Forum 2025. Slides [1] and video [2] are linked below.

>> >> IMPORTANT: This iteration does not yet implement the dynamic counter
>> >> reservation approach suggested by Will Deacon in January [3]. I am
>> >> working on it, but wanted to send this version first to keep momentum
>> >> going and ensure I've addressed all issues besides that.

>> > [...]

>> > As I have asked before, this is missing an example of how userspace is
>> > going to use this. Without it, it is impossible to correctly review
>> > this series.

>> > Please consider this as a blocker.

>> Understood. I remember you asking for a QEMU patch specifically.

> No. *any* VMM. QEMU, kvmtool, crosvm, firecrackpoter, whichever you want.

>> I had hoped that the use in the selftest was sufficient to show how to
>> use the uAPI.

> The selftests are absolutely pointless, like 99% of all selftests.
> They don't demonstrate how the userspace API works, now how
> configuring the PMU is ordered with the rest of the save/restore flow.

>> If not, I can send out an example QEMU patch to the QEMU ARM mailing
>> list.

Okay I sent one to you, qemu-arm, and everyone else I asked to review
this series.

