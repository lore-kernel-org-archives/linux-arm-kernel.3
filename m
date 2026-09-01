Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864C6C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFNuTjkbtgnV9Ee/Kr+rLLTzNG3wuc+NXilxwd6ZxSc=; b=feJWZ2Cr2LBg2WnLQQ1mLUav6M
	KFe1VAX0noRvDfTJ2bQ7lUfXcXwOPpIBXCpPDvAiS0SfgHPPEnmOx+GQZOrh/QoPBZjDtOSDwEEfz
	9+2ys+w2yQtQNyVIXl0uYZF1BlSh+EQMbRStb0+C8QzN4MDZRgYR31SkVUV00xNG3R4R2+9X/Xe/r
	ekbe9zsCmLOGpgXjZOtH7rz2/6p8BuZPXMvQP3kcVs8fEEzUZJzaurj9JReh31KoqFGwXoRDAQIVO
	iI3Q1Y/031mvEncS2AR9TSEXLMK5GG4kxY9fwKhnoRvHdpFcuknB6ppnkjPh5avRSmFsBDYut8qzd
	OxQYZ72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RXU-0000000Cguy-279u;
	Tue, 01 Sep 2026 16:40:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RXS-0000000CguM-2Cmp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:40:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56F7A1756;
	Tue,  1 Sep 2026 09:40:42 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6C9F3F85F;
	Tue,  1 Sep 2026 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788280846; bh=phnRUbVE70oVuIQH/cr8MeODjJbWljXef1k1i13/I7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4dVtvP0hAN14T/hSk8Qv2GRDF6PBoyWWXfwid9uJ6Xyd4WngOIyXCWV/s38lWX1F
	 P6GZU5fMRAJFISCZI/+y+5g2hvZUx54spko+fOs9iueK4YFGydjvAHXh3u9s6HM7QE
	 9w3re8uMmq3B+pU2MxScx2SKSBO/0ifoK9fbA0Yk=
Date: Tue, 1 Sep 2026 17:40:43 +0100
From: Leo Yan <leo.yan@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4] coresight: coresight.h: add '*' to kernel-doc lines
Message-ID: <20260901164043.GR8904@e132581.arm.com>
References: <20260831030912.3399089-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831030912.3399089-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_094046_602882_D039EF85 
X-CRM114-Status: GOOD (  12.87  )
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

On Sun, Aug 30, 2026 at 08:09:12PM -0700, Randy Dunlap wrote:
> kernel-doc reports 2 (kernel-doc) lines in coresight.h that don't have
> a beginning '*' in them, so fix these lines.
> 
> Also convert struct coresight_trace_id_map to kernel-doc format to
> remove another warning.
> 
> Warning: include/linux/coresight.h:173 bad line:
>   connected to @src_port. NULL until the device is created
> Warning: include/linux/coresight.h:177 bad line:
>   needs to be filtered.
> Warning: include/linux/coresight.h:236 This comment starts with '/**',
>   but isn't a kernel-doc comment.
> 
> Fixes: ec9903d6cc34 ("coresight: Add support for trace filtering by source")
> Fixes: d49c9cf15f89 ("coresight: Rename connection members to make the direction explicit")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

