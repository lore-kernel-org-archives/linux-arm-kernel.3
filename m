Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79CDCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvMHqeul4yJpYPhjshMmU34NDaQCCC4iU4yRyM6TihU=; b=4HWj0rUwCz4aLBplBLp9xZD9ah
	w/o9tIbu8Rq7tpHpwEjmp6N5HZyXOnArl+72HaXDK4+BxMFXQ5KXMqDo+JPrUz6jpRY1nq1QTCDBI
	FyvRNhnzMycvXClUnNFX0dp/CMfG7CjgKvc6k+E2/1yfaAv4GfdRYkrDrjhOOeSGY3zs0IfFKH01d
	gw8SoW0HQXWAE8cqEFbcNLUfIwCL3JOj4vP+GMgVl8yjkMjeGcHjkdDpOKUxInea61XXQowmMK9bC
	KfMlhKyAq4xxcpKbuc4e2YGuHoh3OM1jer7PPIpZT0ZlyS/63m+UTlXfhS5HBz3RDweXmdrEf3f3z
	nRHMwX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApEk-0000000Dbs7-2Y5r;
	Mon, 20 Oct 2025 12:43:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApEh-0000000Dbrf-37VN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:43:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0211A1007;
	Mon, 20 Oct 2025 05:43:30 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 950243F63F;
	Mon, 20 Oct 2025 05:43:32 -0700 (PDT)
Message-ID: <bd20ac74-40ef-4504-9c33-f4b3e2378d82@arm.com>
Date: Mon, 20 Oct 2025 13:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/29] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-8-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251017185645.26604-8-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_054339_871937_71E2023D 
X-CRM114-Status: GOOD (  29.38  )
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

Hi James,

On 10/17/25 19:56, James Morse wrote:
> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
> only be accessible from those CPUs, and they may not be online.
> Touching the hardware early is pointless as MPAM can't be used until
> the system-wide common values for num_partid and num_pmg have been
> discovered.
> 
> Start with driver probe/remove and mapping the MSC.
> 
> CC: Carl Worth <carl@os.amperecomputing.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v2:
>  * Comment in Kconfig about why EXPERT.
>  * Dropped duplicate depends.
>  * Fixed duplicate return statement.
>  * Restructured driver probe to have a do_ function to allow breaks to be
>    return instead...
>  * Removed resctrl.h include, added spinlock.h
>  * Removed stray DT function prototype
>  * Removed stray PCC variables in struct mpam_msc.
>  * Used ccflags not cflags for debug define.
>  * Moved srcu header include to internal.h
>  * Moved mpam_msc_destroy() into this patch.
> 
> Changes since v1:
>  * Avoid selecting driver on other architectrues.
>  * Removed PCC support stub.
>  * Use for_each_available_child_of_node_scoped() and of_property_read_reg()
>  * Clarified a comment.
>  * Stopped using mpam_num_msc as an id,a and made it atomic.
>  * Size of -1 returned from cache_of_calculate_id()
>  * Renamed some struct members.
>  * Made a bunch of pr_err() dev_err_ocne().
>  * Used more cleanup magic.
>  * Inlined a print message.
>  * Fixed error propagation from mpam_dt_parse_resources().
>  * Moved cache accessibility checks earlier.
>  * Change cleanup macro to use IS_ERR_OR_NULL().
> 
> Changes since RFC:
>  * Check for status=broken DT devices.
>  * Moved all the files around.
>  * Made Kconfig symbols depend on EXPERT
> ---
>  arch/arm64/Kconfig              |   1 +
>  drivers/Kconfig                 |   2 +
>  drivers/Makefile                |   1 +
>  drivers/acpi/arm64/mpam.c       |   7 ++
>  drivers/resctrl/Kconfig         |  13 +++
>  drivers/resctrl/Makefile        |   4 +
>  drivers/resctrl/mpam_devices.c  | 190 ++++++++++++++++++++++++++++++++
>  drivers/resctrl/mpam_internal.h |  52 +++++++++
>  include/linux/acpi.h            |   2 +-
>  9 files changed, 271 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/resctrl/Kconfig
>  create mode 100644 drivers/resctrl/Makefile
>  create mode 100644 drivers/resctrl/mpam_devices.c
>  create mode 100644 drivers/resctrl/mpam_internal.h
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index c5e66d5d72cd..004d58cfbff8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2025,6 +2025,7 @@ config ARM64_TLB_RANGE
>  
>  config ARM64_MPAM
>  	bool "Enable support for MPAM"
> +	select ARM64_MPAM_DRIVER if EXPERT	# does nothing yet
>  	select ACPI_MPAM if ACPI
>  	help
>  	  Memory System Resource Partitioning and Monitoring (MPAM) is an
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 4915a63866b0..3054b50a2f4c 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -251,4 +251,6 @@ source "drivers/hte/Kconfig"
>  
>  source "drivers/cdx/Kconfig"
>  
> +source "drivers/resctrl/Kconfig"
> +
>  endmenu
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 8e1ffa4358d5..20eb17596b89 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -194,6 +194,7 @@ obj-$(CONFIG_HTE)		+= hte/
>  obj-$(CONFIG_DRM_ACCEL)		+= accel/
>  obj-$(CONFIG_CDX_BUS)		+= cdx/
>  obj-$(CONFIG_DPLL)		+= dpll/
> +obj-y				+= resctrl/
>  
>  obj-$(CONFIG_DIBS)		+= dibs/
>  obj-$(CONFIG_S390)		+= s390/
> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
> index 59712397025d..51c6f5fd4a5e 100644
> --- a/drivers/acpi/arm64/mpam.c
> +++ b/drivers/acpi/arm64/mpam.c
> @@ -337,6 +337,13 @@ static int __init acpi_mpam_parse(void)
>  	return 0;
>  }
>  
> +/**
> + * acpi_mpam_count_msc() - Count the number of MSC described by firmware.
> + *
> + * Returns the number of of MSC, or zero for an error.
> + *
> + * This can be called before or in parallel with acpi_mpam_parse().
> + */

This comment can be added in the patch where you add the function,
acpi_mpam_count_msc().

>  int acpi_mpam_count_msc(void)
>  {
>  	struct acpi_table_header *table __free(acpi_table) = acpi_get_table_ret(ACPI_SIG_MPAM, 0);
[...]
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 9d66421f68ff..70f075b397ce 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -231,7 +231,7 @@ static inline struct acpi_table_header *acpi_get_table_ret(char *signature, u32
>  		return ERR_PTR(-ENOENT);
>  	return table;
>  }
> -DEFINE_FREE(acpi_table, struct acpi_table_header *, if (!IS_ERR(_T)) acpi_put_table(_T))
> +DEFINE_FREE(acpi_table, struct acpi_table_header *, if (!IS_ERR_OR_NULL(_T)) acpi_put_table(_T))

Ah, you did make this change. Just ended up in the wrong patch.

>  
>  int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
>  int __init_or_acpilib acpi_table_parse_entries(char *id,

-- 
Thanks,

Ben


