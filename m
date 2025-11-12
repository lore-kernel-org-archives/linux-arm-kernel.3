Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA63CD3438
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwtNEkJgHpZA7uSkB2KW0BhrwBSS+RF9yXFAhkYY8kQ=; b=dPLxFouzPYIjhBXqvNcM9jW8ZU
	taT8q1tQryNxai/xcOH1Pn+dGjXSfDKZ3yUt0gWPOBCqbmAb5bfqdMoask9qCXWh4YpsyetGLiMs+
	XPxOhb4Sed9z5yNPCZtI43o+ul4zhkENCB+pLUBIzVOlovlcQrIetopOsuonuwmMmFelLzR4uwyRa
	J2B9Z06IMyZQCGQzeeYbrT3Xosk2CwtKW6yFkVm8AMD5uSlIp5LM5tTzScOX4eo4vnDI9SsANy2Fz
	VlIyq2Z85CMfkbSiFE6MVKJGkZSfBIfiwPJygiv7SGSYAPA6vSnFTAimS28wBX982TJ9ZHDKpbqzk
	PqGN6Tag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFNs-00000009Iy7-31zY;
	Wed, 12 Nov 2025 18:15:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFNr-00000009IxW-1LZu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:15:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 671091515;
	Wed, 12 Nov 2025 10:15:45 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA8783F63F;
	Wed, 12 Nov 2025 10:15:52 -0800 (PST)
Date: Wed, 12 Nov 2025 18:15:50 +0000
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 18/25] perf/uapi: Extend data source fields
Message-ID: <20251112181550.GC3243746@e132581.arm.com>
References: <20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com>
 <20251017-perf_support_arm_spev1-3-v2-18-2d41e4746e1b@arm.com>
 <20251112180309.GA3243746@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112180309.GA3243746@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_101555_405195_0BC0B38B 
X-CRM114-Status: GOOD (  10.30  )
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

On Wed, Nov 12, 2025 at 06:03:09PM +0000, Leo Yan wrote:
> Hi Peter.Z, Ingo,
> 
> On Fri, Oct 17, 2025 at 11:05:07AM +0100, Leo Yan wrote:
> > Arm CPUs introduce several new types of memory operations, like MTE tag
> > accessing, system register access for nested virtualization, memcpy &
> > memset, and Guarded Control Stack (GCS).
> 
> Do you mind review this patch for extending memory data source field?

I didn't include the perf core maintainers in the recipient list.

I'll resend this series for better visibility. Sorry for the spam.

Thanks,
Leo

