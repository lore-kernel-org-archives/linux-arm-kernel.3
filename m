Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35557F3C997
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lnZZRC5vix+mX0t37jzo8LD6pmOFq4/J832n125LfM=; b=Eq0Ti3g0m9oofGNJOfSO0T8KV7
	P7lVT2JGlqe466YtMh10SAH3l9XHJFEE7G8IjRp8xiR0haj2TIhrkNWnRx4dSydPW1p9KMcuaW+kw
	niO9rXLXluFm6lGnP366AiMHfs7ZdcejAz2+nDAPsN0NVL5d8kjWPfbCYrIYr/ZjSHu3NQeeAI1qQ
	xLRZwo7RmuvdAabBYRpQuPga3deoxxa8DUI0gOaedU3ySUdP/lpLAI6tZgFmWYgGYuLmt/SUnpteH
	PWElZy91MUNfeSuNN7eX8MXZbOxen38BusVdEEaG+D8n3lGRxevzzIYpX+fty3byRbuISvyGbXa67
	f1D3yfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuIC-00000002JDs-1zYn;
	Tue, 24 Feb 2026 15:25:44 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuI9-00000002JCn-2cIk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:25:42 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fL1k03LybzHnHWN;
	Tue, 24 Feb 2026 23:24:56 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A2B740570;
	Tue, 24 Feb 2026 23:25:36 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 15:25:35 +0000
Date: Tue, 24 Feb 2026 15:25:34 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>
CC: <devicetree@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<Dmitry.Lamerov@arm.com>, <catalin.marinas@arm.com>, <bp@alien8.de>,
	<robh@kernel.org>, <rafael@kernel.org>, <will@kernel.org>,
	<conor@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <krzk+dt@kernel.org>, <Michael.Zhao2@arm.com>,
	<tony.luck@intel.com>
Subject: Re: [PATCH v2 02/11] ACPI: APEI: GHES: add ghes_cper.o stub
Message-ID: <20260224152534.000040b6@huawei.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-2-347fa2d7351b@arm.com>
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
	<20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-2-347fa2d7351b@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_072541_971697_CD204F6C 
X-CRM114-Status: GOOD (  17.82  )
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

On Fri, 20 Feb 2026 13:42:20 +0000
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Introduce a dedicated ghes_cper translation unit so that follow-on commits
> can move helpers out of ghes.c without touching the build logic twice.
> This keeps the object in the tree while remaining functionally identical.

I'd probably do this with the first move patch not as a separate patch.
That would resolve the question of headers etc below.

> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  drivers/acpi/apei/Makefile    |  2 +-
>  drivers/acpi/apei/ghes_cper.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/apei/Makefile b/drivers/acpi/apei/Makefile
> index 1a0b85923cd4..b3774af70883 100644
> --- a/drivers/acpi/apei/Makefile
> +++ b/drivers/acpi/apei/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_ACPI_APEI)		+= apei.o
> -obj-$(CONFIG_ACPI_APEI_GHES)	+= ghes.o
> +obj-$(CONFIG_ACPI_APEI_GHES)	+= ghes.o ghes_cper.o
>  # clang versions prior to 18 may blow out the stack with KASAN
>  ifeq ($(CONFIG_COMPILE_TEST)_$(CONFIG_CC_IS_CLANG)_$(call clang-min-version, 180000),y_y_)
>  KASAN_SANITIZE_ghes.o := n
> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> new file mode 100644
> index 000000000000..63047322a3d9
> --- /dev/null
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *

As below.

> + * APEI GHES CPER helper translation unit - staging file for helper moves
> + *
> + * Copyright (C) 2026 ARM Ltd.

As before. If there isn't significant new content copyright doesn't make sense yet.

> + * Author: Ahmed Tiba <ahmed.tiba@arm.com>
> + * Based on ACPI APEI GHES driver.
> + *

No obvious benefit in this blank line so I'd drop it.

> + */
> +
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/ratelimit.h>
> +#include <linux/slab.h>
Build includes up as they become relevant. That way we can see whether
they are needed or not.  Right now none of them are..

> +
> +#include <acpi/apei.h>
> +
> +#include <asm/fixmap.h>
> +#include <asm/tlbflush.h>
> +
> +#include "apei-internal.h"
> +
> +/* Helper bodies will be moved here in follow-up commits. */
> 


