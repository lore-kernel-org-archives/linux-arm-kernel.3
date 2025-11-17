Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23276CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 20:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSAzX7ywxIZ9bg3pm7xWBrootWbOpv2N3nEXTeyP0Io=; b=IjrKyRaDIg6qYi6mTWN9g9+6JR
	GS2A1uC3Owb+Y9iq5uYnABvu7vcYMbYnly+XBeg6JEcZFk5UhBLxH4Xcxrekze59KqDWm02IHmbHW
	MqujqpU4W/xsSBqifYbeRvB3rScmQkI+hEUHHj89lmHaIG+RTYJzUjd9S2y+2N00Q+im7dErcbB0z
	fdLvHIbCxqwf6mAVE9u+0dCwbVAxbEF2hHWi2RQi/jYCmjkEbNrN00ZO966CzYzKhcFtrP8WX7XxO
	fTzXIg/daEYcGArQVLuxmvv4KdAiPzJaLqFZ6Yh7FGLv32piAil4BXBQs6hgbUaX1CtPQXblutVKn
	TQWbdkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5Qn-0000000Gnud-3WLt;
	Mon, 17 Nov 2025 20:02:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5Qk-0000000Gnty-3W7j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 20:02:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BB3BFEC;
	Mon, 17 Nov 2025 12:02:19 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEAFD3F63F;
	Mon, 17 Nov 2025 12:02:21 -0800 (PST)
Date: Mon, 17 Nov 2025 20:02:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: gregkh@linuxfoundation.org, Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>
Cc: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com,
	amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com, dakr@kernel.org, dave.martin@arm.com,
	david@redhat.com, dfustini@baylibre.com, fenghuay@nvidia.com,
	gshan@redhat.com, guohanjun@huawei.com, jeremy.linton@arm.com,
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
	lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org, peternewman@google.com,
	quic_jiles@quicinc.com, rafael@kernel.org, robh@kernel.org,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
Subject: Re: [PATCH v5 34/34] MAINTAINERS: new entry for MPAM Driver
Message-ID: <aRt_S7HUIifgJF6W@arm.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-35-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117170014.4113754-35-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_120230_917752_94A9608A 
X-CRM114-Status: GOOD (  17.03  )
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

On Mon, Nov 17, 2025 at 05:00:13PM +0000, Ben Horgan wrote:
> Create a maintainer entry for the new MPAM Driver. Add myself and
> James Morse as maintainers. James created the driver and I have
> taken up the later versions of his series.
> 
> Cc: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46bd8e033042..ec9b2b255bef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17463,6 +17463,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
>  F:	drivers/video/backlight/mp3309c.c
>  
> +MPAM DRIVER
> +M:	James Morse <james.morse@arm.com>
> +M:	Ben Horgan <ben.horgan@arm.com>
> +S:	Maintained
> +F:	drivers/resctrl/mpam_*
> +F:	drivers/resctrl/test_mpam_*
> +F:	include/linux/arm_mpam.h

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Greg, are you ok with the above maintainers entry? Happy to queue
patches for this via the arm64 tree (or at least the initial drop).

Reinette, Tony, I now realised you haven't been cc'ed on this series:

https://lore.kernel.org/r/20251117170014.4113754-1-ben.horgan@arm.com

While it doesn't touch fs/resctrl/, it's going to be a user of that API.
Are you ok with this maintainer setup? I wouldn't mind at all if you
want to be a co-maintainers or reviewers of drivers/resctrl/* (e.g.
adding this under the RDT entry) but I guess you would not be looking
forward to more email traffic.

Thanks.

-- 
Catalin

