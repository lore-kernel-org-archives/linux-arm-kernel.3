Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ED5CA5FA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CI5SE+LUSvjJSX0aqGNQC6lIvCqrkT18UYLahH5fG9c=; b=wuX2DbD8gQ2S3MzLC9qo5t9hZI
	7S2iYicN9KtyC3mW+gk4PIMXpvdywdkAxkHFbd7GPZO8D355kSFrBwJ4ytN/yjP6yd+4HbxoutG+H
	SCn9qK2qjgWgDit6l53IlL5XN99FnMWFrBzqjUHgX/knlL+Gs8WCEzUFnKL00hqmn5MLrVL1rX/TW
	eMAzA2lzw6F0evYBFVDw85wZS1yzeqCHoz2hW1Y900Dq1C63fTX0u+EGbJDTw+orBtGbss+dIvUS0
	kRlGdfPnFeDw1ibEyu+qBmCTrcdghsM/rGK26zNK8Y63IvLiymRBRyi0xbeWH6mnNfs9QCo3HBuGw
	ZEYG6Hfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6y2-000000008Cc-1DcQ;
	Mon, 28 Sep 2026 08:44:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6xz-000000008BX-3G1K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:44:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 638DB1570;
	Mon, 28 Sep 2026 01:44:03 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68F223F86F;
	Mon, 28 Sep 2026 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790585046; bh=FZshP+iIYFrnFz9pDPBaGrQWfYo9TKVKuzBKuEedW4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tnPRLtXpCVeTSL2ijeUMxzxxfrEkXapzD+971i8GGw4V4o21ElcHWDgt4zfRsp6us
	 qdzo7yX9H2bux7DcqgOm9uipy9b+7dh/NvxZlk455VoMyb4NkHzt54pIDMN0ufHq1Q
	 mNphyGf4Sb8UwgDG9xDRpUpEBoU3Spv42MkwtYs8=
Date: Mon, 28 Sep 2026 09:44:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Kees Cook <kees@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] coresight: cti: Add const to con_groups allocation type
Message-ID: <20260928084404.GD14479@e132581.arm.com>
References: <20260917211428.i.947-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917211428.i.947-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_014408_197666_EC450533 
X-CRM114-Status: UNSURE (   9.11  )
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

On Thu, Sep 17, 2026 at 02:14:29PM -0700, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>

> ... As there is no general way to
> safely add const qualifiers, take the size from the assignment target
> instead. No change in allocation size results.
> 
> Build tested ARCH=arm64 allmodconfig with GCC aarch64-linux-gnu 16.1.0:
> drivers/hwtracing/coresight/coresight-cti-sysfs.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

