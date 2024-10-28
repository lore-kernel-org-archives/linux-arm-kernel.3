Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF762D339A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+1pUpYpNPTK6G6Rr/j1s+QqeT3yQD0uFQiGrWOE6AU=; b=XseR/SctbMZXbyG3m8mO6ragI3
	7jWMzOV3wpSwFaAoyYdMJbP+MODwSD9MhF+T6E15qDLGb6BdMPv7YnSkhLH6MVVVwffrAPfQaQZip
	LvTKLDwhJi1sMouKO8rCLUEIsPbazq/JiW/BlOuQn1dmT/miCpadN/evKDruJVcJ9nqISDpNNp2cW
	78BEIK2DgzLqC5I8uUvUTE/GVOTEwOO+lRBMTrebz5x0IvlnnvEISJ5ckPNceRrjWJQjU8QKGwgSB
	mBdsam5OmO27wyisoXSU2uSvPVn7kjrLgOdq4Jd8sZdwaqOJbg8L/nDYXKjDQd+BkZPGvl0UzIYnR
	XfziGWcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Szl-0000000BZx6-22oh;
	Mon, 28 Oct 2024 16:53:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Sn3-0000000BXMO-0vt3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 16:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5D575C5947;
	Mon, 28 Oct 2024 16:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2195C4CEC7;
	Mon, 28 Oct 2024 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730133624;
	bh=OptEfkBlqnLUcNrZkw8zjO+SkzPv2Z++IFDjSLN66ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ooNScbAjyxpdu74JVGExx/m71ciQbe/1kU+MHXg0Xm+JT/vCgVpKenkCIkf1JGmVJ
	 9nkQvvvAPHyXcTvz5hMjTNxdw6U64zWj2JVUvllxeF43Fz52gSn8hRr80UZsYiIFnE
	 BpnbHdTJSzRauOJ0i6WaJExnzalfVoxs6PZGGD5+ZOe5m/6uQys0UFy4Ff7wPai2Hk
	 80iIJYYr8rTIeB3zD+F1EFCOn/NZQbGBtK50zhudN+FGepn7Pkmz8jcn8pIx/xvegf
	 79pJeMRZeIYxpowZwE8DM/09biIXtQdJHl0bE7mQ0ZIoPjzyfX13Y5GpyAgKHVhgMS
	 1Muk0FaRQMN8w==
Date: Mon, 28 Oct 2024 09:40:21 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Graham Woodward <graham.woodward@arm.com>
Cc: acme@kernel.org, mark.rutland@arm.com, jolsa@kernel.org,
	irogers@google.com, james.clark@linaro.org, mike.leach@linaro.org,
	leo.yan@linux.dev, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	nd@arm.com
Subject: Re: [PATCH v1 0/4] perf arm-spe: Allow synthesizing of branch
Message-ID: <Zx--dTqaZPjeWA2I@google.com>
References: <20241025143009.25419-1-graham.woodward@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025143009.25419-1-graham.woodward@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_094027_084379_AC4FD6B5 
X-CRM114-Status: GOOD (  12.17  )
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

Hello,

On Fri, Oct 25, 2024 at 03:30:05PM +0100, Graham Woodward wrote:
> Currently the --itrace=b will only show branch-misses but this change
> allows perf to synthesize branches as well.
> 
> The change also incorporates the ability to display the target
> addresses when specifying the addr field if the instruction is a branch.
> 
> Graham Woodward (4):
>   perf arm-spe: Set sample.addr to target address for instruction sample
>   perf arm-spe: Use ARM_SPE_OP_BRANCH_ERET when synthesizing branches
>   perf arm-spe: Correctly set sample flags
>   perf arm-spe: Update --itrace help text

It doesn't apply to perf-tools-next cleanly.  Can you please rebase?

Thanks,
Namhyung

> 
>  tools/perf/Documentation/itrace.txt       |  2 +-
>  tools/perf/Documentation/perf-arm-spe.txt |  2 +-
>  tools/perf/builtin-script.c               |  1 +
>  tools/perf/util/arm-spe.c                 | 31 ++++++++++++++++++-----
>  tools/perf/util/auxtrace.h                |  3 +--
>  tools/perf/util/event.h                   |  1 +
>  6 files changed, 29 insertions(+), 11 deletions(-)
> 
> -- 
> 2.40.1
> 

