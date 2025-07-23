Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AF5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iljOGjrPzGa5Xl5zL1SamY3F0PRIyn+syuOINP7pnrQ=; b=1ZPvzZKTETXTlcAFpMKbe1u3sZ
	VeSyKN+2rQNGnUcibhW7ziRXxvEuOB5f1t/iiwt115D2jGUoT0OGJVEQx4GKBUTBsZvzZOx7sRPOz
	WjIGURc/DzZxHAVLqdrQzsTSTjW5qLXYbY9g+DzjbOFFLA4yucw0kz78+WoBOoqvPoFiMb9U2WXa3
	oQEQdG68JKcxGuAxV/KK7Gu/ZtbYxT2mcCUt23qoLQGvZwDAeQ9Mx0ewdZen2UwmgetJyYtGlhVoB
	bRQKvcs5umdKb/ffOdus2qUs0Ht9NgScrf16CMJEbgfzU5mnT4Whnn5pIsb8YmcqP43RV9H5Pj2u8
	cBVr6bDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWhJ-00000004gfz-25Jx;
	Wed, 23 Jul 2025 10:27:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWQT-00000004dK2-1w9U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 10:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 952985C501F;
	Wed, 23 Jul 2025 10:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1946C4CEE7;
	Wed, 23 Jul 2025 10:10:12 +0000 (UTC)
Date: Wed, 23 Jul 2025 11:10:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] arm64: Kconfig: Remove GCS restrictions on UPROBES
Message-ID: <aIC1AvCRQ7Ok9pxZ@arm.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-8-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719043740.4548-8-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_031017_537387_0E5441C6 
X-CRM114-Status: UNSURE (   7.56  )
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

On Fri, Jul 18, 2025 at 11:37:39PM -0500, Jeremy Linton wrote:
> Now that the uprobe paths have been made GCS compatible
> drop the Kconfig restriction.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

