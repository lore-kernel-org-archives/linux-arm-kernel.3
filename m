Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AA260A260B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s/+xVg05;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=SeTyI79w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wnke4isQAC2KbakW7Z51PMBxU8bQTJ8BvEteBX/NbbU=; b=s/+xVg05AYR1XhjzWTisWlrvEV
	VNwDoQE/1vUTC3CdMkQst6Pfic3aRGpcw/e1/PygRKS7m5wyTOCRt1NDFnyvYI9FP1XyWgkBvv6pL
	0Xqhq/2OnXFs7LqYGg17rBd5MrY9goe5amWT4LdFyfFKCVJlkNS9456j4xbGsoelE66FaqBZXuh38
	9QyT31LM01KyTdO9t0tHGfKeL/W0jHLXzreceBKVB+qWA9mk0qqY8D4Bb6kVcZUnQ6vsm2Vm+zjcs
	JW2YhTrqQvthISMyHs3nqfFi89BA9wbYkQRgMzpNIaRq/mbVFrcVXBIuKiMIa5GfD2qgzOUBp6JUK
	6nE8LeAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpPz-0000000DsDO-1wfJ;
	Thu, 22 Oct 2026 09:49:03 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpPw-0000000DsCG-123B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792662540; x=1824198540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v+7k0hlcIHqfonCAXf98cPi0YLKf+NqqzYtImbz8iBw=;
  b=SeTyI79wnrR1sl0gx5Qz20b2FQXQpHbk0l46zwHq4dvdwlOSweornmDN
   Un74b991yazn/rAubinta2zZpnDA7UZrxhRq0ksKSiIcniHiq893XUTW9
   g2N4so3dyt390AaoAS9lajBoOBRgMCPRxLNRCLRHDrkxBlCNgYjhhq0NE
   /64dqV6E5Gc5Qy0bJl85HNUAjJwdp3VPt+Yizri4tkOmk3UOuRncXgYTi
   6bdoFe8IM0qrDov9cXpUptiJIcY5/xtDC7iKwJMX49tj5Lhc4f9cJqvgP
   +r6A352zS1SIpVji9NXAs+0d8ZCskVYaHDmAei72sCcA4CbE43c8ZHQah
   A==;
X-CSE-ConnectionGUID: MofsQ5JTSxGFXlUHI6eQxw==
X-CSE-MsgGUID: TEkIT74zQr+EC4keMTPYTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="259098448"
X-IronPort-AV: E=Sophos;i="6.27,172,1786978800"; 
   d="scan'208";a="259098448"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 18:48:56 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 156ED1C0168A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 09:48:56 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B2FDA896E36
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 09:48:55 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.199.185])
	by az2nlsmom4.fujitsu.com (Postfix) with SMTP id 14D4C2000AAB;
	Thu, 22 Oct 2026 09:48:50 +0000 (UTC)
Date: Thu, 22 Oct 2026 18:48:49 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Suzuki Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, 
	Sami Mujawar <sami.mujawar@arm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH RFC 1/3] firmware: arm_firme: introduce arm_firme driver
Message-ID: <atnVCFWZLKR8GthP@FCCLS0092175.localdomain>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019-firme_interface-v1-1-27895c9cebaa@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-firme_interface-v1-1-27895c9cebaa@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_024900_959726_C8430FD3 
X-CRM114-Status: GOOD (  38.53  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19 15:14, Yeoreum Yun wrote:
> The Realm Management Extension (FEAT_RME) is part of Arm Confidential
> Compute Architecture (CCA) and enables support for dynamic, attestable
> trusted execution environments ("Realms") on Arm systems.
> 
> Realm management flows depend on EL3 firmware for operations such as
> Realm construction, resource allocation and isolation, and attestation
> of initial Realm state.
> 
> The FIRME defines standard interfaces provided by EL3 firmware to
> satisfy these dependencies. These interfaces include:
> 
>   - Granule Protection Table management
>   - IDE key management for PCIe and CXL Root Ports
>   - Memory Encryption Context management
>   - Attestation token management
>   - Integrated device management
> 
> Each group of interfaces forms a FIRME service. A base FIRME service
> is also defined to provide common concepts, service discovery, and
> feature discovery across services.
> 
> FIRME interfaces are implemented at the EL3 boundary between the
> Non-secure, Realm, and Secure states. They may also be used on systems
> without FEAT_RME, for example to provide firmware-based attestation or
> security services.
> 
> arm_firme driver provides the common FIRME framework and service discovery
> support for client drivers using below FIRME services:
> 
>   - Base service.
>   - Attestation token management.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Does this series assume that the kernel is running in EL2 implicitly?

The FIRME spec says:
  An implementation of one or more FIRME services at a valid Exception level boundary between EL3 and the
  highest Exception level in a different Security state is called a FIRME instance.

and I think only NS-EL2 can call FIRME interfaces as a NS FIRME
instance, right?

> ---
>  drivers/firmware/Kconfig            |   1 +
>  drivers/firmware/Makefile           |   1 +
>  drivers/firmware/arm_firme/Kconfig  |  34 ++++++
>  drivers/firmware/arm_firme/Makefile |   5 +
>  drivers/firmware/arm_firme/attest.c | 172 ++++++++++++++++++++++++++
>  drivers/firmware/arm_firme/base.c   | 145 ++++++++++++++++++++++
>  drivers/firmware/arm_firme/driver.c | 134 +++++++++++++++++++++
>  drivers/firmware/arm_firme/firme.h  |  45 +++++++
>  include/linux/arm-smccc.h           |   1 +
>  include/linux/arm_firme.h           | 234 ++++++++++++++++++++++++++++++++++++
>  10 files changed, 772 insertions(+)
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index f1a76d482429..e0c1babea1f8 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -297,6 +297,7 @@ config TURRIS_MOX_RWTM_KEYCTL
>  endif # TURRIS_MOX_RWTM
>  
>  source "drivers/firmware/arm_ffa/Kconfig"
> +source "drivers/firmware/arm_firme/Kconfig"
>  source "drivers/firmware/arm_rmm/Kconfig"
>  source "drivers/firmware/broadcom/Kconfig"
>  source "drivers/firmware/cirrus/Kconfig"
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 54755db0cf6e..4ae1550ed73c 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
>  obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
>  
>  obj-y				+= arm_ffa/
> +obj-y				+= arm_firme/
>  obj-y				+= arm_rmm/
>  obj-y				+= arm_scmi/
>  obj-y				+= broadcom/
> diff --git a/drivers/firmware/arm_firme/Kconfig b/drivers/firmware/arm_firme/Kconfig
> new file mode 100644
> index 000000000000..7e7a826879f1
> --- /dev/null
> +++ b/drivers/firmware/arm_firme/Kconfig
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config ARM_FIRME
> +	tristate "Arm Firmware Interfaces for Realm Management Extension (FIRME)"
> +	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
> +	default n
> +	help
> +	  The Realm Management Extension (FEAT_RME) is part of Arm Confidential
> +	  Compute Architecture (CCA) and enables support for dynamic, attestable
> +	  trusted execution environments ("Realms") on Arm systems.
> +
> +	  Realm management flows depend on EL3 firmware for operations such as
> +	  Realm construction, resource allocation and isolation, and attestation
> +	  of initial Realm state.
> +
> +	  The FIRME defines standard interfaces provided by EL3 firmware to
> +	  satisfy these dependencies. These interfaces include:
> +
> +	    - Granule Protection Table management
> +	    - IDE key management for PCIe and CXL Root Ports
> +	    - Memory Encryption Context management
> +	    - Attestation token management
> +	    - Integrated device management
> +
> +	  Each group of interfaces forms a FIRME service. A base FIRME service
> +	  is also defined to provide common concepts, service discovery, and
> +	  feature discovery across services.
> +
> +	  FIRME interfaces are implemented at the EL3 boundary between the
> +	  Non-secure, Realm, and Secure states. They may also be used on
> +	  systems without FEAT_RME, for example to provide firmware-based
> +	  attestation or security services.
> +
> +	  This driver provides the common FIRME framework and service
> +	  discovery support for client drivers using FIRME services.
> diff --git a/drivers/firmware/arm_firme/Makefile b/drivers/firmware/arm_firme/Makefile
> new file mode 100644
> index 000000000000..dccac0a2b50e
> --- /dev/null
> +++ b/drivers/firmware/arm_firme/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_ARM_FIRME) += arm-firme.o
> +
> +arm-firme-$(CONFIG_ARM_FIRME) := driver.o base.o attest.o
> diff --git a/drivers/firmware/arm_firme/attest.c b/drivers/firmware/arm_firme/attest.c
> new file mode 100644
> index 000000000000..aa57b3b9e623
> --- /dev/null
> +++ b/drivers/firmware/arm_firme/attest.c
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Arm Ltd.
> + */
> +
> +#define DRIVER_NAME "ARM FIRME"
> +#define pr_fmt(fmt) DRIVER_NAME ": " fmt
> +
> +#include <crypto/sha2.h>
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +
> +#include "firme.h"
> +
> +static DEFINE_STATIC_KEY_TRUE(attest_service_disabled);

Regarding the attest_service_disabled naming, it seems a bit
counter-intuitive to me. Wouldn't it be clearer to invert the logic
with:
DEFINE_STATIC_KEY_FALSE(attest_service_available)?

Or is there any reason to choose the naming here?

> +
> +int firme_attest_service_init(struct firme_service_info *info)
> +{
> +	firme_value_t ret;
> +	u8 max_pat_pgcnt;
> +
> +	if (!test_bit(FIRME_ATTEST_SERVICE_ID, &info->service_list)) {
> +		pr_info("Attestation service is not supported\n");
> +		return 0;
> +	}
> +
> +	invoke_firme_service((firme_value_t) {
> +			     .a0 = FIRME_SERVICE_VERSION,
> +			     .a1 = FIRME_ATTEST_SERVICE_ID,
> +			     }, &ret);
> +	if (ret.a0 == FIRME_RET_NOT_SUPPORTED)
> +		goto err_out;
> +
> +	info->attest_info.version = (u32)ret.a0;
> +
> +	invoke_firme_service((firme_value_t) {
> +			     .a0 = FIRME_SERVICE_FEATURES,
> +			     .a1 = FIRME_ATTEST_SERVICE_ID,
> +			     .a2 = 0x1,
> +			     }, &ret);
> +	if (ret.a0 != FIRME_RET_SUCCESS)
> +		goto err_out;
> +
> +	max_pat_pgcnt = FIELD_GET(FIRME_ATTEST_FEAT1_MAX_PAT_PG_CNT_MASK, ret.a1);
> +
> +	/*
> +	 * According to Realm Management Monitor specification, S-PNCRK,
> +	 * maximum chanllege size should be 64 bytes (SHA512_DIGEST_SIZE).
> +	 * If less than, pad with zero.
> +	 */
> +	info->attest_info.max_challenge_size = SHA512_DIGEST_SIZE;
> +	info->attest_info.max_pat_size = (max_pat_pgcnt + 1) *
> +					 info->shared_buf_info.min_size;
> +
> +	pr_info("FIRME attest service version %d.%d\n",
> +		FIRME_MAJOR_VERSION(info->attest_info.version),
> +		FIRME_MINOR_VERSION(info->attest_info.version));

The FIRME specification defines versioning semantics so we can negotiate
the required version of a specific service here. Is this intentional to
omit negotiation here?

The same applies to firme_base_service_init().

> +	pr_info("Maximum challenge size: 0x%lx\n",
> +		info->attest_info.max_challenge_size);
> +	pr_info("Maximum PAT size: 0x%lx\n", info->attest_info.max_pat_size);
> +
> +	static_branch_disable(&attest_service_disabled);
> +
> +	return 0;
> +
> +err_out:
> +	static_branch_enable(&attest_service_disabled);
> +	clear_bit(FIRME_ATTEST_SERVICE_ID, &info->service_list);
> +	return firme_status_to_errno(ret.a0);
> +}
> +
> +static int firme_get_attest_info(struct firme_attest_info *info)
> +{
> +	if (static_branch_unlikely(&attest_service_disabled))
> +		return -EOPNOTSUPP;
> +			
> +	if (!info)
> +		return -EINVAL;
> +
> +	memcpy(info, &firme_service_info->attest_info,
> +	       sizeof(struct firme_attest_info));
> +
> +	return 0;
> +}
> +
> +static int firme_get_platform_attestion_token(void *challenge,
> +					      size_t challenge_size,
> +					      void *token, size_t *token_size)
> +{
> +	firme_status_t status;
> +	firme_value_t ret;
> +	struct firme_instance *fi;
> +	struct firme_attest_info *attest_info;
> +	struct firme_shared_buf_info *shbuf_info;
> +	void *buffer;
> +	size_t alloc_size, buffer_size, buffer_pgcnt;
> +	size_t read_size, total_size;
> +
> +	if (static_branch_unlikely(&attest_service_disabled))
> +		return -EOPNOTSUPP;
> +
> +	shbuf_info = &firme_service_info->shared_buf_info;
> +	attest_info = &firme_service_info->attest_info;
> +
> +	if (!token || !token_size || (*token_size < attest_info->max_pat_size))
> +		return -EINVAL;
> +
> +	if ((challenge_size > attest_info->max_challenge_size) ||
> +	    ((challenge_size > 0) && !challenge))
> +		return -EINVAL;
> +
> +	fi = firme_get_instance();
> +	if (WARN_ON_ONCE(IS_ERR (fi)))
> +		return -EOPNOTSUPP;
> +
> +	buffer_size = min(attest_info->max_pat_size, shbuf_info->max_size);
> +	if (WARN_ON_ONCE(buffer_size & (shbuf_info->min_size - 1)))
> +		return -ENOBUFS;
> +
> +	alloc_size = buffer_size;
> +
> +	buffer = fi->ops->base_ops->alloc_shared_buffer(&alloc_size,
> +							GFP_KERNEL | __GFP_ZERO);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	if (alloc_size < buffer_size)
> +		buffer_size = alloc_size;
> +
> +	buffer_pgcnt = buffer_size / shbuf_info->min_size;
> +
> +	if (challenge_size > 0)
> +		memcpy(buffer, challenge, challenge_size);
> +
> +	guard(migrate)();

I don't think disabling migration is required here.

> +
> +	total_size = 0;
> +
> +	do {
> +		invoke_firme_service((firme_value_t) {
> +				     .a0 = FIRME_ATTEST_PAT_GET,
> +				     .a1 = virt_to_phys(buffer),
> +				     .a2 = 0,
> +				     .a3 = buffer_pgcnt - 1,
> +				     .a4 = challenge_size,
> +				     .a5 = 0,  /**< binding size must be 0 for normal world. */
> +				     }, &ret);
> +		status = ret.a0;
> +		if ((status != FIRME_RET_SUCCESS) &&
> +		    (status != FIRME_RET_INCOMPLETE))
> +			break;
> +
> +		challenge_size = 0;
> +		read_size = ret.a1;
> +		memcpy(token + total_size, buffer, read_size);
> +		total_size += read_size;
> +	} while (status == FIRME_RET_INCOMPLETE);
> +
> +	if (status == FIRME_RET_SUCCESS)
> +		*token_size = total_size;
> +
> +	fi->ops->base_ops->free_shared_buffer(buffer, alloc_size);
> +
> +	return firme_status_to_errno(status);
> +}
> +
> +struct firme_attest_ops attest_ops = {
> +	.get_attest_info = firme_get_attest_info,
> +	.get_platform_attestion_token = firme_get_platform_attestion_token,
> +};
> diff --git a/drivers/firmware/arm_firme/base.c b/drivers/firmware/arm_firme/base.c
> new file mode 100644
> index 000000000000..b9ffb214cca4
> --- /dev/null
> +++ b/drivers/firmware/arm_firme/base.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Arm Ltd.
> + */
> +
> +#define DRIVER_NAME "ARM FIRME"
> +#define pr_fmt(fmt) DRIVER_NAME ": " fmt
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +
> +#include "firme.h"
> +
> +int firme_base_service_init(struct firme_service_info *info)
> +{
> +	firme_value_t ret;
> +	unsigned long service_list;
> +	u8 shbuf_min_pgs;
> +	u16 max_pgcnt;
> +	size_t min_size;
> +
> +	invoke_firme_service((firme_value_t) {
> +			     .a0 = FIRME_SERVICE_VERSION,
> +			     .a1 = FIRME_BASE_SERVICE_ID,
> +			     }, &ret);
> +	if (ret.a0 == FIRME_RET_NOT_SUPPORTED)
> +		goto err_out;
> +
> +	info->version = (u32)ret.a0;
> +
> +	invoke_firme_service((firme_value_t) {
> +			     .a0 = FIRME_SERVICE_FEATURES,
> +			     .a1 = FIRME_BASE_SERVICE_ID,
> +			     .a2 = 0x1,
> +			     }, &ret);
> +	if (ret.a0 != FIRME_RET_SUCCESS)
> +		goto err_out;
> +
> +	service_list = FIELD_GET(FIRME_BASE_FEAT1_SERVICE_LIST_MASK, ret.a1);
> +
> +	/* Base service is always supported */
> +	info->service_list = (service_list << 1) | 0x1;
> +
> +	shbuf_min_pgs = FIELD_GET(FIRME_BASE_FEAT1_SH_BUF_MIN_SZ_MASK, ret.a1);
> +	max_pgcnt = FIELD_GET(FIRME_BASE_FEAT1_SH_BUF_MAX_PG_CNT_MASK, ret.a1);
> +
> +	switch (shbuf_min_pgs) {
> +	case FIRME_PGS_4K:
> +		min_size = 1UL << 12;

nit:
I'd like to use SZ_4K, SZ_16K, SZ_64K here.

> +		break;
> +	case FIRME_PGS_16K:
> +		min_size = 1UL << 14;
> +		break;
> +	case FIRME_PGS_64K:
> +		min_size = 1UL << 16;
> +		break;
> +	default:
> +		pr_err("Invalid minimum shared buffer size: 0x%x\n", shbuf_min_pgs);
> +		return -EINVAL;
> +	}

