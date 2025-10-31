Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88213CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 19:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdmExGQU8oYZP7zUs41s3CLG2FBRGXWDqxrKYEUKXQc=; b=sh+DQPSIWkEnOyp2pWzcdSVf8k
	DxpdaYxMFLk18IQlXVSveH9HFivU3WlZ+RLfU1ZXECOL7YlrfyrpqK9iWYE5I5+f551qjV5x/fd8w
	smtcu0ZPT/AbbWBn6WBVOMx6PJOlOFRnCwXPNdP8wKqUhvMLfjD/vkIE/1Rr1VyrPYgFcj3OXIUwv
	kGPjDG/v8pGNqkd3yD3QugG5NQFLKw2h07PaldVEaSGiezpUNkAFq4KSHJ9hAPF0Q9NZWddIP5ZCi
	UnhIl4iCo55J07+y+XqIUGRm55J/S2sNxpmVFw8a0zAuOfdzKuLlhxMCFGiyxADrWH8g5OXmudHiA
	PqdY9bJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuph-00000006i6U-1Fks;
	Fri, 31 Oct 2025 19:30:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEupf-00000006i6H-44Ac
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 19:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F39E06020B;
	Fri, 31 Oct 2025 19:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051DCC4CEE7;
	Fri, 31 Oct 2025 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761939042;
	bh=+XgHrn9U650ljmHAEWvfOR9F+8NjatIr0SZFYNe2vAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVw6UYJyPWyG5b4wz8CTsf+W0ZXun4vQ+cV93rK5SRIJTsv+yhYgTdBgUSEW42PEv
	 g1K3x0oeLrEkX2ti6s5WcGhDxc83JNUOEP1XChJbjiPmVpP0G+5ZZwJnkDcDvnu3MA
	 Lp/SpVelUWE05LI3ZsDGAQb0MSsujdRqRQ8QV+yUXVOm0KM97Ex3Uc6HIKEnS/6kuP
	 B8RV2/ymk8ZAReYhAwRz0pL4KX0tx2dnlC2MB5OGAjLjYV4kyhPiqkC05eu3ycEXI9
	 JumSJgMN+WGgmCgxO0VRi62pFL6Hfi3lJXCV0Nri0JfvSUKR4Z7IkFijgEe4WZxEI7
	 bcBsUmaG1fFmw==
Date: Fri, 31 Oct 2025 12:30:40 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Chu Guangqing <chuguangqing@inspur.com>, john.g.garry@oracle.com,
	will@kernel.org, james.clark@linaro.org, mike.leach@linaro.org,
	leo.yan@linux.dev, peterz@infradead.org, mingo@redhat.com,
	acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: Fix typo error in json file
Message-ID: <aQUOYLDrxBGIvKaM@google.com>
References: <20251031031729.2304-1-chuguangqing@inspur.com>
 <0016eecf-e261-a16e-461e-5f7c40705060@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0016eecf-e261-a16e-461e-5f7c40705060@os.amperecomputing.com>
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

On Fri, Oct 31, 2025 at 12:25:37PM -0700, Ilkka Koskinen wrote:
> 
> On Fri, 31 Oct 2025, Chu Guangqing wrote:
> > Correct instruction spelling errors.
> > 
> > Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> 
> 
> Thanks for the patch. Just one comment, would you mind changing the subject
> line slightly. Something like
> 
> "perf vendor events arm64: Fix typo in Ampere eMag json file"
> 
> 
> With that change
> 
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Thanks, I'll handle the both changes.
Namhyung


