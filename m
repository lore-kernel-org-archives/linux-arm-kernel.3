Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B5DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 11:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhfIrecQiItqrSB2aOuqCNc5vkqD2/I9JImcIvXRw1s=; b=Q0R77+N+oxLOOvDZprjbY5xhDm
	kcW44ia+NfTdztpLNonnwj8e2pi+Yys1n1Pzn6OewA45yGV55wAqM3dDEgMkHOdWpMI9uSO24uhHA
	fYAIbKVKS1U+nf/Oi93yv5m65jzg23ZPo8BxHlMcqH9nLZa2wzha7wA7pU8CpBQg7aDPP7RhWjh/U
	JcL8ijsJYnIr4JKyfdRNjkmwf0j6G+i6Vp23Zh4FG1hqCeeiTIj0WBemyyTgnAWd/9lfUrDSGYPVP
	/qImKqzz+i2P7LTx0RWJ5Rw1+yGOCiIOcctk8qlYAuSBJvjHcl0OqNtqb72YuTe3uG7yrUK+PYp+F
	ZgekeGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVaM-00000008fQo-0nlk;
	Mon, 26 May 2025 11:01:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVWZ-00000008f6b-31Cs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 10:57:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CB1C12FC;
	Mon, 26 May 2025 03:57:27 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979B23F5A1;
	Mon, 26 May 2025 03:57:41 -0700 (PDT)
Date: Mon, 26 May 2025 11:57:38 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] kselftest/arm64: Specify SVE data when testing VL
 set in sve-ptrace
Message-ID: <aDRJIjTOAAe0U8or@J2N7QTR9R3>
References: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
 <20250523-kselftest-arm64-ssve-fixups-v1-3-65069a263b21@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-kselftest-arm64-ssve-fixups-v1-3-65069a263b21@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_035743_800557_977CE937 
X-CRM114-Status: GOOD (  17.49  )
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

On Fri, May 23, 2025 at 04:27:14PM +0100, Mark Brown wrote:
> Since f916dd32a943 ("arm64/fpsimd: ptrace: Mandate SVE payload for
> streaming-mode state") we reject attempts to write to the streaming mode
> regset even if there is no register data supplied, causing the tests for
> setting vector lengths and setting SVE_VL_INHERIT in sve-ptrace to
> spuriously fail. Set the flag to avoid the issue, we still support not
> supplying register data.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  tools/testing/selftests/arm64/fp/sve-ptrace.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
> index 7e259907805b..7f9b6a61d369 100644
> --- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
> +++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
> @@ -170,7 +170,7 @@ static void ptrace_set_get_inherit(pid_t child, const struct vec_type *type)
>  	memset(&sve, 0, sizeof(sve));
>  	sve.size = sizeof(sve);
>  	sve.vl = sve_vl_from_vq(SVE_VQ_MIN);
> -	sve.flags = SVE_PT_VL_INHERIT;
> +	sve.flags = SVE_PT_VL_INHERIT | SVE_PT_REGS_SVE;
>  	ret = set_sve(child, type, &sve);
>  	if (ret != 0) {
>  		ksft_test_result_fail("Failed to set %s SVE_PT_VL_INHERIT\n",
> @@ -235,6 +235,7 @@ static void ptrace_set_get_vl(pid_t child, const struct vec_type *type,
>  	/* Set the VL by doing a set with no register payload */
>  	memset(&sve, 0, sizeof(sve));
>  	sve.size = sizeof(sve);
> +	sve.flags = SVE_PT_REGS_SVE;
>  	sve.vl = vl;
>  	ret = set_sve(child, type, &sve);
>  	if (ret != 0) {
> 
> -- 
> 2.39.5
> 

