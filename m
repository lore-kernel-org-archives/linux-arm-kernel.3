Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8A0CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 12:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuBqjrA+4CbFK4ErXDXb9ZuknO62vCqVQDVclmOAx9Q=; b=xi/o34R2uVinTRHLEa9kUTFM0H
	VgLvBkSVC3viRGZ+CGxv3wI5KvIBL+gbRWlkF0bzfCSjyL/thuGiFXO7MD19f6W4dOf405vs/NhYN
	+aM/tZVdAzihiYYhuJ37BlaoKEjdzxSPW+JyoShaMFWfKxKU+F4lBaPrBTr+ljLxybkTjVVPAXvi7
	jPvIDYiV6+ajEvgEb/OiMAcVygYFxu5GHEr2Wvxp+XmFKm+dV9qo+1GSZyJvgu8FmXp1iJsc1oQjJ
	AibTpGb53SNkAs96gIDEtFL3vljo2xWzBi/X7KZ4Xp5icAuCHJOdy6AWUsTVxsvA1RZNmUQygTRUY
	0PmPu38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6q5N-0000000695Q-2Xh9;
	Thu, 09 Oct 2025 12:49:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6q5L-0000000695I-43UO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 12:49:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45DAA60395;
	Thu,  9 Oct 2025 12:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305BCC4CEF8;
	Thu,  9 Oct 2025 12:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760014171;
	bh=4o67N+5muSrhDMynCVeCRqgka2MTM/1TesakMxevxuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9nFG0mJdWVIIiQRfBT/gO332Y+WpK6xSEMOl/MsxyXIM7Bcyi6788wM0vxpFjBc1
	 xqN7/R9QVMhssrXXF3Lg7sA7pi8qEC7w7SAWa6jWaogukSYop0S9JgnTpKxyHX8bPm
	 xg582shf5IbSTsBjDrP9wVENxe+61UNmpMz2gsrGnW1mWLVgEFRibdC+UiD14a0saJ
	 Fuwv9vEknXYlpA9TakfXLma/pzcamRwbZeAKgUbNk2aDBIkk5iWJrWfHIL+Vn04Hra
	 wH91vvBVloENHSgJrYfbKIcjVzFQ3NdS+oETx5BrmFkxJIEi7uHSjtlzm4OmWNDCLz
	 n+qgs9UOms+Aw==
Date: Thu, 9 Oct 2025 09:49:27 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 20/25] perf mem: Print extended fields
Message-ID: <aOevVyDVBj_oKvlR@x1>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-20-1150b3c83857@arm.com>
 <10332b1f-f73c-4bfb-a4d4-74e1953b75ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10332b1f-f73c-4bfb-a4d4-74e1953b75ff@linaro.org>
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

On Thu, Oct 09, 2025 at 11:02:35AM +0100, James Clark wrote:
> On 29/09/2025 5:37 pm, Leo Yan wrote:
> > Print the extended operation types and affiliate info.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   tools/include/uapi/linux/perf_event.h | 28 +++++++++++++++--
> >   tools/perf/util/mem-events.c          | 58 +++++++++++++++++++++++++++++++++--
> 
> Minor nit: I would separate the commit to update the header and the tools
> change. That way you can describe that it's a straight header copy, rather
> than something else.

Agreed.

- Arnaldo

