Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B8CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1X3Oo0F7ZazkobIm/Iu5w1QZ5XxlZasbYHOAWVzqGgY=; b=fAwrjia2jenD9EvoNJUsf9EXwg
	3R4tasm0hcdNwPeREKNcMn5zNxpLXjK+gHzecKMEsrTTZ0Yvh26vfmmQQcERFG+Pkofbwqekmd8Ii
	MkOKZVs+fmhm9enXjWsdZl0Gb+saRn9n69WywrSDi8WuWOEpx/Z004VRWE16mX+t8kCk5gyDKNUc+
	9bttwMkGf3SAOH+CpL9CWfHPJfwUYvuDB/EmK34W6pc8BTRZ5WfyqpsfS0eHL9+l1eN0c/RhXH/6T
	ueURLgP2Gw0cx9qZYuBFMqSxs/eL12AHSDtOptT6KC0J7+bDveUXq83dMh0JzgJawTHXGH32Hah3n
	ByzgnlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJF7-00000004nAQ-2VQd;
	Thu, 02 Jul 2026 15:22:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJF4-00000004n9s-3wZ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:22:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78EFA359D;
	Thu,  2 Jul 2026 08:22:13 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66F2D3F85F;
	Thu,  2 Jul 2026 08:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783005737; bh=NYbihWDKKCohPY024cQbgeKXDce8LgNjGLJ4aJLae8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbDuVKBGeHbMYVv/naEwChcn29xRiX4Ol2tUMeWWRuVidfjuFnHRmJ8A14eAsKqod
	 85tmCaQazRpD1pTrok5FpIvxeEfAsd0N+yoOBrkx2kr0qqO2rfAlVk4FR7jyopAzPg
	 9BMVr+ziBNmk20z0jzsrXt9dD7HrqAqOJtynnNRc=
Date: Thu, 2 Jul 2026 16:22:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: Sort registers in cpu-feature-registers.rst
Message-ID: <akaCJvZkdqigcQUZ@arm.com>
References: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
 <20260522-arm64-cpu-ftr-regs-v1-3-19775b40faf0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-arm64-cpu-ftr-regs-v1-3-19775b40faf0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_082219_075818_4E597F44 
X-CRM114-Status: GOOD (  10.75  )
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

On Fri, May 22, 2026 at 06:58:39PM +0100, Mark Brown wrote:
> -  ID_AA64PFR0_EL1 - Processor Feature Register 0
> +  ID_AA64ISAR1_EL1 - Instruction set attribute register 1
>  
>       +------------------------------+---------+---------+
>       | Name                         |  bits   | visible |
>       +------------------------------+---------+---------+
> -     | DIT                          | [51-48] |    y    |
> +     | LS64                         | [63-60] |    y    |
>       +------------------------------+---------+---------+
> -     | MPAM                         | [43-40] |    n    |
> +     | I8MM                         | [55-52] |    y    |
>       +------------------------------+---------+---------+
> -     | SVE                          | [35-32] |    y    |
> +     | DGH                          | [51-48] |    y    |
>       +------------------------------+---------+---------+
> -     | GIC                          | [27-24] |    n    |
> +     | BF16                         | [47-44] |    y    |
>       +------------------------------+---------+---------+
> -     | AdvSIMD                      | [23-20] |    y    |
> +     | SB                           | [39-36] |    y    |
>       +------------------------------+---------+---------+
> -     | FP                           | [19-16] |    y    |
> +     | FRINTTS                      | [35-32] |    y    |
>       +------------------------------+---------+---------+
> -     | EL3                          | [15-12] |    n    |
> +     | GPI                          | [31-28] |    y    |
>       +------------------------------+---------+---------+
> -     | EL2                          | [11-8]  |    n    |
> +     | GPA                          | [27-24] |    y    |
>       +------------------------------+---------+---------+
> -     | EL1                          | [7-4]   |    n    |
> +     | LRCPC                        | [23-20] |    y    |
>       +------------------------------+---------+---------+
> -     | EL0                          | [3-0]   |    n    |
> +     | FCMA                         | [19-16] |    y    |
> +     +------------------------------+---------+---------+
> +     | JSCVT                        | [15-12] |    y    |
> +     +------------------------------+---------+---------+
> +     | API                          | [11-8]  |    y    |
> +     +------------------------------+---------+---------+
> +     | APA                          | [7-4]   |    y    |
> +     +------------------------------+---------+---------+
> +     | DPB                          | [3-0]   |    y    |
>       +------------------------------+---------+---------+

The patch is fine but I just realised that we are really inconsistent
with the non-visible things. We exposed a few hear, I guess in the early
days, and then we stopped, just adding the occasional visible fields.

Shall we drop the 'visible' column altogether and only document the
visible fields here?

-- 
Catalin

