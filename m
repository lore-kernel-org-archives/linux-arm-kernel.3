Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959BBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9NDEPDXjkrbpkY+XAi1XZmU3zjoh3h61m1bobC2jlA=; b=JEf2ZJtj5Bw6g1Tj4pYkwi5sZw
	VrTts4Jq9aD2wH3FcdvOe46GYjBDz2dS14U2DBHQfINESqpWAnzpI1o/3wN6eg1izQt2Ge2WcF2k/
	CEJRpwzqWjw0pAfml1YthGpt1r8J8bX65g9hK80hqrtd9Vh3mwToJLd+n7RXFDmjb0vOgLOhXjtqv
	o7mdaE+01y7qV+cZgMWkUnemCrxfJGkYprryuP1T52UI8WQFVIbOuBP7qtmxQZMIf3kJmN4jaJHa7
	bI9A6S/PVckv7uduf+kvjTXz7whB5pMR75F4ONc7cRFe73LgD915c7oKpdziUhr6zy9fScgcRTDxV
	1P6QwMuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsM4-00000008mLw-08VH;
	Wed, 05 Mar 2025 17:16:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsKT-00000008mAQ-2UjL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 17:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=K9NDEPDXjkrbpkY+XAi1XZmU3zjoh3h61m1bobC2jlA=; b=gwlM5Bif0OQMjn8KHPGCRPUtkd
	CRFsxroACYJ/oX0iTtWvVAPYPKdN5R91vD6vM/Ot1y8/7hGtQrBMss6mB969u/SUHKZ4ADN9h4VpZ
	GBpsOGBTFF7aiaXXmBMNDE3ntBGUey669VvOfNs2KUppK+W5wwi1AGmDkos5XuJe4u4aAqvu7lcPR
	ImvTb8XqnYrqM/VVKDqh5GgX8k6Lxx4nqQy+JiLIGFbZjCJvTonrA4VH26idGNgklahTTcItprNWd
	+N0+xsHdLx5eZxqOuVLVXSJkicvGjR7bWnLMcWrGTvQhi+4aP2SXNZS904i9bOZhPKOkAOPgDNDo8
	LPLsHK5w==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsKQ-00000000edv-3LNH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:14:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F4195C6B58;
	Wed,  5 Mar 2025 17:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D45C4CED1;
	Wed,  5 Mar 2025 17:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741194878;
	bh=L4xfJvdQZxjN7GJl4EA9k+rwWwG3IwPZQ6f+e6Vswds=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=JFMllJPlmKRsG1YfpOozpo0/3Zc0/cVt1qp1ygVxotPLgqNc8MPOpZimb3PHYLidc
	 j6TaCIWi8pQZCtoBGd17QqbxgOMzVvL45FXrWM3O0kZ/5ZZ5j6wQz5Zh51hbCJlOig
	 s8UpU+fFYxtdYVZwh8BtsOFIB239v8GHG2HPyQUYI5IvDdFCkUGvfYbLMOVeS9Iw3l
	 mYjxW+/toULIbthp6p3c6Pkv7mOaEVBmQAuXOmif5uT39R+f3bRG2IPvoF39DLILMD
	 Mpuyga/kzhrO6eanjf7EF2xw+naSh975u7h2IA0213YzVwZKoBxOtPoMD+odnvg5OQ
	 lOewjlM90xmlw==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Ian Rogers <irogers@google.com>, James Clark <james.clark@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Olsa <jolsa@kernel.org>, 
 "Liang, Kan" <kan.liang@linux.intel.com>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, 
 Graham Woodward <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@arm.com>
In-Reply-To: <20250304111240.3378214-1-leo.yan@arm.com>
References: <20250304111240.3378214-1-leo.yan@arm.com>
Subject: Re: [PATCH v4 00/12] perf script: Refactor branch flags for Arm
 SPE
Message-Id: <174119487820.3243158.8048766791168980891.b4-ty@kernel.org>
Date: Wed, 05 Mar 2025 09:14:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_171443_019947_34BB30F3 
X-CRM114-Status: GOOD (  10.65  )
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

On Tue, 04 Mar 2025 11:12:28 +0000, Leo Yan wrote:
> This patch series refactors branch flags for support Arm SPE.  The patch
> set is divided into two parts, the first part is for refactoring common
> code and the second part is for enabling Arm SPE.
> 
> For refactoring branch flags, the sample flaghs are classified as branch
> types and events.  A program branch type can be conditional branch,
> function call, return or expection taken.  A branch event happens when
> taking a branch.  This series combines branch types and the associated
> events to present a sample flag.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



