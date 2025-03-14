Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5DAC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JLnCETxFJsnPhE+BfNEBBbq9n4NPDo2G48x8+5UEJs=; b=2oinMIJzNtAK1AxtT2Es1lbwoJ
	E78QlBWWLItEy7I6+sthr2qw9CbzmE3gIb4HzPzQBcGvo1z+Zf1yGThLRGQuxs4ULiZ0rInaMXAuC
	EUzLxN1q9TYW9kcQXwLPqecNR3PCh0sB05tcYCKlRtV0bvXFP4ezC77Yt6H9Ti970lOXL8K/jraQ0
	ciUpkglMXuPeeh8cnXwTumc7M5Rg6CE4qIPHGms2uwpzIE9K4xxGzHc/0fJBHkX9ZfMj1ocYKcOM2
	Az71BlG2YBrpmg7OWS/7lYNmBtT4rfbSAorMTzFhXPAAtDQJALUIhetAp+qXlOW18ywPP90RwFVBH
	lGQqwKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9RB-0000000Eyoy-2s1Q;
	Fri, 14 Mar 2025 18:07:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt94Q-0000000EvF3-2sj7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA7185C4A31;
	Fri, 14 Mar 2025 17:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E208BC4CEE3;
	Fri, 14 Mar 2025 17:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741974221;
	bh=UfJrm2yCFAgVvDAibstSIiqplSzCVgfdGZqcvC0TH/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MzdiXnLDnYiyc+IiiZC3WYzF3D4mo6tnnO1kek0ERsAdbr0I63piUX76szP1uEFQv
	 LQ3atwDzS6mIvsfhNVFwNjJSHdJlJ8drU9ZUbb+uUzptDyvGXqfi2WCWgHJYtM9m0x
	 Vk2ErzxebJgpJDcfbNdMD4ezLbwigmdt46NMXTk/Cip7PcgbIEwEHkQPQI+bDlgNB5
	 FaZZ3fTCNVEGaQ2plJXiHa+uVRfpz8g6tmXFN8+4G5J22yxw45hdXRSDKLtQoqTsJd
	 uKm9zP8mggbQscDuQ5vzyhbh7CWYR/BeGbb3erFFkc8qkqWfW4XMwgUqx9iv3hSLQJ
	 myOLVRANzrNkQ==
From: Namhyung Kim <namhyung@kernel.org>
To: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Yujie Liu <yujie.liu@intel.com>
Cc: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Ian Rogers <irogers@google.com>, James Clark <james.clark@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Olsa <jolsa@kernel.org>, 
 "Liang, Kan" <kan.liang@linux.intel.com>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, 
 Graham Woodward <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com
In-Reply-To: <20250312075636.429127-1-yujie.liu@intel.com>
References: <20250312075636.429127-1-yujie.liu@intel.com>
Subject: Re: [PATCH] perf script: Fix typo in branch event mask
Message-Id: <174197422088.4059945.167819241578952524.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 10:43:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_104342_784286_0A485189 
X-CRM114-Status: UNSURE (   5.06  )
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

On Wed, 12 Mar 2025 15:56:36 +0800, Yujie Liu wrote:
> BRACH -> BRANCH
> 
> 
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



