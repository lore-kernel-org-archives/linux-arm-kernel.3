Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F75C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttdCheo2ggrWYc5AfXbMLW3x5iUmEU3SoinUwhJvb+4=; b=dZyXbsGQQEKJ2ezSbu6ptchC6R
	U54EketQEl3IcRosMKiilZ/I/2MVJswU3TE6vP2bcvceP6pcBeJhTI2TYRxuFn7XQyNlrg5P7PKtu
	IlfaB9o8O98dWgM8tZPxDbmRrljCuwiJiCMey7Zl/IBjHpEiqqwAo3PU5bAh//qqU9G7snDTsCnwo
	hrVet1sb15Pp4gV9UaQfo427f0SFRZsEWhaLMqa9bktXaXCxzsQQ6bUuKpdluSAIF2xwqDXk2ixbh
	KL0cymzR4/NPohlT1OfSqkjsQLG6wsPHJW01sOTPVQLaeZTN/CEIwgfTKHhebs0KRseB6PZvrpZuW
	TBfDO6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMjg-00000008ecI-2LsC;
	Wed, 12 Mar 2025 14:07:04 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMi0-00000008eKo-05ah
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 14:05:21 +0000
Received: from pobox.suse.cz (unknown [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EAD6C2118E;
	Wed, 12 Mar 2025 14:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1741788312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttdCheo2ggrWYc5AfXbMLW3x5iUmEU3SoinUwhJvb+4=;
	b=zBCuePuxTdL15mtda27hxhA44U5PtfaieYwLwbODqm5KLJjEwAVScmfhtq2JVBOftJnocU
	MSSM0I2AcrsGcrqUHua+ss9OdmT3+E8jW2deuazu+Bqm65uMhxXg8RgtK/JmRFSMx5hNCJ
	nGJy4aN8hPYPOpxxFED8A6JYb5LoZG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1741788312;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttdCheo2ggrWYc5AfXbMLW3x5iUmEU3SoinUwhJvb+4=;
	b=vLPwFMwJwDhkQsUjgJlUKcs+MY+fb2GER5VC48PCCGFbiGeZl1fzkAwQhVuvLGkggeGpQC
	ZBINYQH50ls20XBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1741788306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttdCheo2ggrWYc5AfXbMLW3x5iUmEU3SoinUwhJvb+4=;
	b=knxQnRBsUB0eEuotZGQwivI4oVYfb1WhrWBcZ9mbITiIUpQhVA8nRAYNRVxCSqg01Wx3LB
	kwUfe6xwVcBsxntre6sMb3eCWF3doyrKDvmZWrBWaMyTFzsjTUggoBXDAYRl9goNqwd3MC
	9m0FsBvoJPGanOey4HH1raatlPnRkWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1741788306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttdCheo2ggrWYc5AfXbMLW3x5iUmEU3SoinUwhJvb+4=;
	b=G+RdLoCAe+HmkHrEpPsk7rA7GoPimKWfHbiC+29hoSniJwhP34hdGI8Yb8X8GhBkenF9fH
	/a8Wofq2UY2qERBA==
Date: Wed, 12 Mar 2025 15:05:07 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Song Liu <song@kernel.org>
cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
    indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com, 
    irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org, 
    mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev, 
    rostedt@goodmis.org, will@kernel.org, kernel-team@meta.com, 
    Suraj Jitindar Singh <surajjs@amazon.com>, Torsten Duwe <duwe@suse.de>
Subject: Re: [PATCH 2/2] arm64: Implement HAVE_LIVEPATCH
In-Reply-To: <20250308012742.3208215-3-song@kernel.org>
Message-ID: <alpine.LSU.2.21.2503121503340.12980@pobox.suse.cz>
References: <20250308012742.3208215-1-song@kernel.org> <20250308012742.3208215-3-song@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[suse.cz:server fail,test-kprobe.sh:server fail,suse.de:query timed out];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[test-kprobe.sh:server fail,suse.cz:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_070520_203892_7EE32EE2 
X-CRM114-Status: GOOD (  10.34  )
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

Hi,

On Fri, 7 Mar 2025, Song Liu wrote:

> This is largely based on [1] by Suraj Jitindar Singh.
> 
> Test coverage:
> 
> - Passed manual tests with samples/livepatch.
> - Passed all but test-kprobe.sh in selftests/livepatch.
>   test-kprobe.sh is expected to fail, because arm64 doesn't have
>   KPROBES_ON_FTRACE.

Correct. The test should take into account and bail out.

> - Passed tests with kpatch-build [2]. (This version includes commits that
>   are not merged to upstream kpatch yet).
> 
> [1] https://lore.kernel.org/all/20210604235930.603-1-surajjs@amazon.com/
> [2] https://github.com/liu-song-6/kpatch/tree/fb-6.13
> Cc: Suraj Jitindar Singh <surajjs@amazon.com>
> Cc: Torsten Duwe <duwe@suse.de>
> Signed-off-by: Song Liu <song@kernel.org>

Acked-by: Miroslav Benes <mbenes@suse.cz>

Also as mentioned in the other thread, parts of this patch will go once 
arm64 is converted to generic entry infrastructure.

Thank you,
Miroslav

