Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448E3C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 05:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg3VTAgetDrYjEdpec6GupSh0sezUAXd/NAVg+bRKpA=; b=sOdwrHgZXoC3Xw1FM89qQRer3P
	7qRZAB+vDdIAm/GFi5l/p0Ppm/NskfpTxc7YFN9DnW1x61HqIRR5v1IJJ6U+BMkHgjboGVdN8MFUI
	N98TiVB6WjsqKiQELW+7+mQQG7FWzMUEPsBaftu0SOzzY2fSQpDm4yfS9xX44ZCZWnjOIMv9b1GLO
	MFm/XYbAK5pYYbe+vHcOWs2SaWclzsQNkbPGI/xwaLes91MihoEozkeOJ8WLcygcYN37B68D7CdVd
	EMcvg7OgfIqo3pu7FvEaismXjzIWy5BQjUbbmyu+rqMWy378o445kFv1Y+RC2yhH+9PnG7X2MxR1q
	EZ0hFEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woaPQ-00000004TJ2-31o8;
	Tue, 28 Jul 2026 05:31:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woaPO-00000004TIL-0wG1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 05:31:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7D411BF7;
	Mon, 27 Jul 2026 22:31:10 -0700 (PDT)
Received: from [10.163.132.30] (unknown [10.163.132.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C243F86F;
	Mon, 27 Jul 2026 22:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785216675; bh=wZU3W8LAigLkfKN16wWeaWgjzhW/ZAOdYKsv5xxz06w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nD8HglJquxYzvFHJocPd+oIV4PetDZzAsBUP5cFHnlMbOMJI1iH7zxbeUjT0wEWLa
	 QAS1DCaMjyLidU1YnQ4SyG5znimgW7i7R3vWLnI26nE44tqG+nqAVrnpdXf7kGsktp
	 Z6a2q6MLaRX69P3vNNn195T4JY0UzU1Fr7rK3Mv0=
Message-ID: <15b45589-b93a-4814-ae27-76480254a4e8@arm.com>
Date: Tue, 28 Jul 2026 11:01:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: coresight.h: add '*' to kernel-doc lines
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: James Clark <james.clark@arm.com>, Tao Zhang <quic_taozha@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Danilo Krummrich <dakr@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260719222456.2831456-1-rdunlap@infradead.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260719222456.2831456-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_223118_434497_C34D1749 
X-CRM114-Status: GOOD (  21.03  )
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



On 20/07/26 3:54 AM, Randy Dunlap wrote:
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
> ---
> v2: rebase & resend
> v3: rebase & resend
> 
> Cc: James Clark <james.clark@arm.com>
> Cc: Tao Zhang <quic_taozha@quicinc.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: coresight@lists.linaro.org
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Mike Leach <mike.leach@arm.com>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  include/linux/coresight.h |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> --- linux-next-20260717.orig/include/linux/coresight.h
> +++ linux-next-20260717/include/linux/coresight.h
> @@ -177,11 +177,11 @@ struct coresight_desc {
>   * @dest_port:	destination's input port number @src_port is connected to.
>   * @dest_fwnode: destination component's fwnode handle.
>   * @dest_dev:	a @coresight_device representation of the component
> -		connected to @src_port. NULL until the device is created
> + *		connected to @src_port. NULL until the device is created
>   * @link: Representation of the connection as a sysfs link.
>   * @filter_src_fwnode: filter source component's fwnode handle.
>   * @filter_src_dev: a @coresight_device representation of the component that
> -		needs to be filtered.
> + *		needs to be filtered.
>   *
>   * The full connection structure looks like this, where in_conns store
>   * references to same connection as the source device's out_conns.
> @@ -234,7 +234,7 @@ struct coresight_sysfs_link {
>  #define CORESIGHT_TRACE_IDS_MAX 128
>  
>  /**
> - * Trace ID map.
> + * struct coresight_trace_id_map - Trace ID map.
>   *
>   * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
>   *		Initialised so that the reserved IDs are permanently marked as
> 

But still there are more warnings left in the documentation file
even after the patch applied. Should they be fixed as well ?

./scripts/kernel-doc -none include/linux/coresight.h
Warning: include/linux/coresight.h:216 struct member 'src_dev' not described in 'coresight_connection'
Warning: include/linux/coresight.h:216 struct member 'src_refcnt' not described in 'coresight_connection'
Warning: include/linux/coresight.h:216 struct member 'dest_refcnt' not described in 'coresight_connection'
Warning: include/linux/coresight.h:248 struct member 'cpu_map' not described in 'coresight_trace_id_map'
Warning: include/linux/coresight.h:248 struct member 'lock' not described in 'coresight_trace_id_map'
Warning: include/linux/coresight.h:312 struct member 'perf_sink_id_map' not described in 'coresight_device'
Warning: include/linux/coresight.h:216 struct member 'src_dev' not described in 'coresight_connection'
Warning: include/linux/coresight.h:216 struct member 'src_refcnt' not described in 'coresight_connection'
Warning: include/linux/coresight.h:216 struct member 'dest_refcnt' not described in 'coresight_connection'
Warning: include/linux/coresight.h:248 struct member 'cpu_map' not described in 'coresight_trace_id_map'
Warning: include/linux/coresight.h:248 struct member 'lock' not described in 'coresight_trace_id_map'
Warning: include/linux/coresight.h:312 struct member 'perf_sink_id_map' not described in 'coresight_device'

