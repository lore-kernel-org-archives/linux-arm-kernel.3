Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F9ECD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj20klKT6tYvnLVAc0GPKZ+khHycyF7T1fRfZse9B+A=; b=vpVjXEP0IG+9Z6Ul9RvDz/UGX+
	+DPGLHT6T5v3SBDFC5NsjwoWl2GC9o0Cxrm+84jXKd1dVNylNC4gSx4H1aj/JuFiDwgyWgQ3mMLcH
	X8i/EI/fp32KNQiwvXnK8TAxpy7w9qmtc4QXuOf+jCa5m92rpMD/nSp+GTeNUgzdiIZnlPKnoy5Gp
	vbUBLjmgpcnoM5sie49/m3us4uj/LBjbngMO89qI38Q9RInaPQDDFw38V0gCSNPeZ4rfiz7PDe7Ty
	RjNsGHXiu2fzUZF+iEE69GjDEboeKnEKNrjvOY9upIcyKZrSuFyAqUXuI/xyp7dtI0vN4OLgCOeTV
	eeAu6TVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5rD-00000008Qx1-3E4j;
	Thu, 21 May 2026 16:02:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5rA-00000008QwM-3eUO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:02:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C971168F;
	Thu, 21 May 2026 09:02:37 -0700 (PDT)
Received: from [10.57.33.205] (unknown [10.57.33.205])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C816C3F632;
	Thu, 21 May 2026 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779379362; bh=XM29D7iPUunyxNUrBD0yY0EWuJn4Z+yCZPfjI3A0bwQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VCraftv2925M7X6jExStT/wSW5s5JX0NWpAiBizlmsBSFQP1dLO0EEXjldGprAiTA
	 j74scLLrDd1tQrCydJ7Mm1PggCuIZ2DWHlu66eMzw+ajFhtHbWCMZAFqcmoI/wHiVW
	 VD26xbG6VTfBt9dQd4i1e2kGg61pFYIt5M3JgIb4=
Message-ID: <dd188101-5edd-4787-8217-4edf4bde094a@arm.com>
Date: Thu, 21 May 2026 17:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
To: Aviv Bakal <avivb@amazon.com>, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, zeev@amazon.com, blakgeof@amazon.com
References: <20260503155118.16191-1-avivb@amazon.com>
 <20260504133923.23373-1-avivb@amazon.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260504133923.23373-1-avivb@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_090245_004819_E6E48037 
X-CRM114-Status: GOOD (  32.31  )
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

On 2026-05-04 2:39 pm, Aviv Bakal wrote:
> Graviton5 uses a customised CMN-S3 implementation where certain
> discovery registers report zeroed fields. Add the following workarounds:
> 
>   - Introduce a dedicated ACPI HID to identify the Graviton5 CMN variant.
>   - Derive the DTC domain from the XP node ID, since the unit info
>     register reports it as zero.
>   - Set the DTC logical ID from the computed domain ID, since the node
>     info register's logical ID field is also zeroed.
> 
> Signed-off-by: Aviv Bakal <avivb@amazon.com>
> ---
> v2:
>   - Use computed domain ID (xp->dtc) instead of XP logical ID for DTC
>     logical ID assignment.
> 
>   drivers/perf/arm-cmn.c | 32 +++++++++++++++++++++++++++++++-
>   1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index f5305c8fdca4..8ee3f8638602 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -31,7 +31,8 @@
>   #define CMN_CHILD_NODE_ADDR		GENMASK(29, 0)
>   #define CMN_CHILD_NODE_EXTERNAL		BIT(31)
>   
> -#define CMN_MAX_DIMENSION		12
> +/* Some implementations use a mesh larger than the architectural max of 12 */
> +#define CMN_MAX_DIMENSION		14
>   #define CMN_MAX_XPS			(CMN_MAX_DIMENSION * CMN_MAX_DIMENSION)
>   #define CMN_MAX_DTMS			(CMN_MAX_XPS + (CMN_MAX_DIMENSION - 1) * 4)
>   
> @@ -214,6 +215,8 @@ enum cmn_part {
>   	PART_CMN700 = 0x43c,
>   	PART_CI700 = 0x43a,
>   	PART_CMN_S3 = 0x43e,
> +	/* Synthetic part number, overridden to PART_CMN_S3 during discovery */
> +	PART_GRAVITON5 = 0xa5,
>   };
>   
>   /* CMN-600 r0px shouldn't exist in silicon, thankfully */
> @@ -2221,6 +2224,18 @@ static unsigned int arm_cmn_dtc_domain(struct arm_cmn *cmn, void __iomem *xp_reg
>   	return FIELD_GET(CMN_DTM_UNIT_INFO_DTC_DOMAIN, readl_relaxed(xp_region + offset));
>   }
>   
> +static unsigned int arm_cmn_graviton5_dtc_domain(u16 xp_id)
> +{
> +	unsigned int x = (xp_id >> 7) & 0xf;
> +	unsigned int y = (xp_id >> 3) & 0xf;
> +
> +	/*
> +	 * The unit info register reads as zero; derive the DTC domain from
> +	 * the XP's mesh coordinates over the 10x14 mesh.
> +	 */
> +	return (x / 5) + (y / 7) * 2;
> +}
> +
>   static void arm_cmn_init_node_info(struct arm_cmn *cmn, u32 offset, struct arm_cmn_node *node)
>   {
>   	int level;
> @@ -2266,6 +2281,7 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>   	u64 reg;
>   	int i, j;
>   	size_t sz;
> +	bool graviton5_workaround = false;
>   
>   	arm_cmn_init_node_info(cmn, rgn_offset, &cfg);
>   	if (cfg.type != CMN_TYPE_CFG)
> @@ -2276,6 +2292,13 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>   	reg = readq_relaxed(cfg_region + CMN_CFGM_PERIPH_ID_01);
>   	part = FIELD_GET(CMN_CFGM_PID0_PART_0, reg);
>   	part |= FIELD_GET(CMN_CFGM_PID1_PART_1, reg) << 8;
> +
> +	/* Graviton5 has a customised CMN-S3 which needs some fixups */
> +	if (cmn->part == PART_GRAVITON5) {
> +		cmn->part = PART_CMN_S3;
> +		graviton5_workaround = true;
> +	}
> +
>   	/* 600AE is close enough that it's not really worth more complexity */
>   	if (part == PART_CMN600AE)
>   		part = PART_CMN600;
> @@ -2365,6 +2388,8 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>   
>   		if (cmn->part == PART_CMN600)
>   			xp->dtc = -1;
> +		else if (graviton5_workaround)
> +			xp->dtc = arm_cmn_graviton5_dtc_domain(xp->id);
>   		else
>   			xp->dtc = arm_cmn_dtc_domain(cmn, xp_region);
>   
> @@ -2443,6 +2468,10 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>   
>   			switch (dn->type) {
>   			case CMN_TYPE_DTC:
> +				if (graviton5_workaround) {
> +					/* Node info logical ID is zeroed; use the domain ID */
> +					dn->logid = xp->dtc;

No, this really should be xp->logid - other than DTC0 whose logical ID 
is always forced to 0, but if it naturally lines up that way anyway then 
all the better - since that is consistent with how the tooling generates 
a regular hardware configuration. The cmn->dtc array ends up sorted by 
logical ID as that is a guaranteed stable order for all CMN versions (as 
the domain numbers themselves aren't always known), and it is the 
interrupt order defined by the firmware bindings which we need to match. 
If it's not guaranteed that the actual domain numbers are in the same 
order then we have an existing bug in general (I'll have to check...)

Otherwise, this looks OK to me - in fact surprisingly pleasant and 
unobtrusive given that it's a pretty horrible hardware issue to work 
around. I guess we get lucky that it's an easy topology to compute.

Thanks,
Robin.

> +				}
>   				cmn->num_dtcs++;
>   				dn++;
>   				break;
> @@ -2658,6 +2687,7 @@ static const struct acpi_device_id arm_cmn_acpi_match[] = {
>   	{ "ARMHC650" },
>   	{ "ARMHC700" },
>   	{ "ARMHC003" },
> +	{ "AMZN0070", PART_GRAVITON5 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(acpi, arm_cmn_acpi_match);


