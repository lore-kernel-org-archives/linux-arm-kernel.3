Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6B2E6F09C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GX4mDr+nXowItm2/MhTrYzX8V5wN6Lbb3+Iqk3TUdPA=; b=Or/t+1bT3PCNKTQC2ZW7wyiIre
	j88VXvQU/5phaQCpP2mKyZR27MQK9RLyjeFuMC1wQsS3ITEhZWyDZQFjflKRfw8y7JjwQDXsJsk0v
	Oi2TkWp3b1w/OBhbMU1FK3qthQ0hKmRuldKp8RXbfTH3m+m/xiXdDGIgz+ennl35VQykDWzgKX7PS
	CTUGVx6DGjCKiQkOihUpdyhyPwa7FHP6mYV2My2I5apqxz2EKN0AQxyGneXdTsjwXPTI8YpvtMI2T
	hyLAY67EV1OvJBoeWkX2D5EU8NkTyP/jOu1Gva/pT9L+YhlvJUgZ8qgHjvHB95jSoVh/BGveYOOaG
	mqEeirjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4RX-0000000Fi9k-2KoT;
	Tue, 23 Dec 2025 15:36:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4RU-0000000Fi93-3ScA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:36:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4FBA339;
	Tue, 23 Dec 2025 07:36:45 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C8DB3F694;
	Tue, 23 Dec 2025 07:36:52 -0800 (PST)
Date: Tue, 23 Dec 2025 15:36:48 +0000
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/11] tools headers: Sync arm64 headers with kernel
 sources
Message-ID: <20251223153648.GG9788@e132581.arm.com>
References: <20251222225716.3565649-1-namhyung@kernel.org>
 <20251222225716.3565649-8-namhyung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222225716.3565649-8-namhyung@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_073656_916855_279B1AD1 
X-CRM114-Status: UNSURE (   8.40  )
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

Hi Namhyung,

On Mon, Dec 22, 2025 at 02:57:13PM -0800, Namhyung Kim wrote:

[...]

>  #define NVIDIA_CPU_PART_DENVER		0x003
>  #define NVIDIA_CPU_PART_CARMEL		0x004
> +#define NVIDIA_CPU_PART_OLYMPUS		0x010

Just remind, this is duplicated with patch [1], so you may decide
which one to pick for merging.

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

[1] https://lore.kernel.org/linux-perf-users/20251219231325.2742580-2-bwicaksono@nvidia.com/T/#u

