Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B55CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 02:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CQiZoAkKnBrmHzjwfjOfcRl2oGn50xKlECwPsQSc+g=; b=ZuqoPL5NZlzKC3+/Ib7MYq/O1B
	dE9iIw1w2Zu6XnXbOhTLaqzAgTOdOWHeuEEqX4FyH5HzaCLgLuvrL/HPwZdA8vFocKT3kHy9ZlS/G
	/KpMVBz/U7hbadqA4zhSSs+agILCG+gJh/pYD94ZEqOFlzNzzWoQ0A3SEYlun+GRWPICz/JD/oKE7
	pO4ifhANhevs6fnkRnExLDnW89VKZdDJzFZO0YQR5+wROXTtXOYaPjerLYz4DKgM19tH9EZEpSawP
	yq38ycQC/Io83/N1OYOFtQ52o1jTuu8F2+TUf39A7Ps11qpAODfaPeyf9MuBMavuzeNYeJhdFG1Lv
	aiLhDC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF0Hk-00000005HPX-07Aa;
	Fri, 09 Oct 2026 02:24:36 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF0Hg-00000005HLG-1KUm;
	Fri, 09 Oct 2026 02:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791512664; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=/CQiZoAkKnBrmHzjwfjOfcRl2oGn50xKlECwPsQSc+g=;
	b=NG2+s5UfOrLDrl1CK+R70NzEjacmAHR5A3HFjDzDnN0/Ju75PdlNbnjBS7eUpCY3WlMx0NWiGv9U4C0Z9qd7wNARhFTqmNLKt8GZx8p7vKtBVg2pqDEXU3ma5x8TmJ3nYJyf8hLm2MUesfu+EzhmRSA+ckgUeo5YYwp2rhEeLkE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XCRtTJG_1791512656;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCRtTJG_1791512656 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 10:24:20 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: adrian.hunter@intel.com
Cc: acme@kernel.org,
	alexander.shishkin@linux.intel.com,
	guoren@kernel.org,
	irogers@google.com,
	james.clark@linaro.org,
	john.g.garry@oracle.com,
	jolsa@kernel.org,
	leo.yan@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mark.rutland@arm.com,
	mike.leach@arm.com,
	mingo@redhat.com,
	namhyung@kernel.org,
	palmer@dabbelt.com,
	peterz@infradead.org,
	pjw@kernel.org,
	will@kernel.org
Subject: Re: [PATCH v2 2/2] perf tsc: Declare TSC support from the build system
Date: Fri,  9 Oct 2026 10:24:22 +0800
Message-ID: <20261009022424.2604-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <66136aa8-adbe-4fdf-9b7c-d44ea0e5cf1e@intel.com>
References: <20260929034133.2153-1-cp0613@linux.alibaba.com> <20260929034133.2153-3-cp0613@linux.alibaba.com> <66136aa8-adbe-4fdf-9b7c-d44ea0e5cf1e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_192432_945291_E4C15386 
X-CRM114-Status: UNSURE (   7.08  )
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

Hi Adrian,

On Tue, 6 Oct 2026, Adrian Hunter wrote:
> Perhaps with #include <tools/config.h> the following is tidier:
>
> 	if (!IS_BUILTIN(HAVE_RDTSC)) {
> 		pr_debug("Test not supported on this architecture\n");
> 		return TEST_SKIP;
> 	}

Thanks for the review.  I'll change it as suggested and post v3.

Best regards,
Pei

