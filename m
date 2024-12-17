Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F026E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T84BfIv9ZQrwXvSai1RwDq3LHAIyaWckBwXjKbfuWyY=; b=UPmOSR6sdXtC5lM3Rz7RiJSeTx
	rRxkTjxYkI6niHCmm+CRMawwzzF4Vbjf3NhEYOKLqZfNgl9PZ7iXKJOm0X7E0wX11oXLNO7QgjMEH
	Nq87txATEXczzK+jRX6nlS6Oqh5BCw0QOIfSW1rKW+pIFp5rf+y441GplZ+uDRyTrBtRd1M0wH/Cy
	O2YR4VaKmzZ4WRFRZF19aHldrSRLpRI87DQ5xRdutWWEXPcx9eHfDbVYLNCLrlnCi8Yzh/ef7IQyQ
	OmHUV9qN25ox+zX9+JWpKHf6XQW9Pt2kjo6L/7n8jf0UzBCzhSl3UAqTiledp2A3sLiXzf7aErngz
	zOUWMtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYzJ-0000000DqeY-1CgY;
	Tue, 17 Dec 2024 14:55:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYyB-0000000DqKl-3sP8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:54:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531831063;
	Tue, 17 Dec 2024 06:55:11 -0800 (PST)
Received: from [10.57.71.247] (unknown [10.57.71.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8EB33F528;
	Tue, 17 Dec 2024 06:54:41 -0800 (PST)
Message-ID: <fb0b26ca-8c0a-49ee-ad72-095c60070067@arm.com>
Date: Tue, 17 Dec 2024 14:54:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] coresight-tpdm: Add support to select lane
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
 <20241105123940.39602-3-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241105123940.39602-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_065444_005184_80A8BD0A 
X-CRM114-Status: GOOD (  10.37  )
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

On 05/11/2024 12:39, Mao Jinlong wrote:
> From: Tao Zhang <quic_taozha@quicinc.com>
> 
> TPDM MCMB subunits supports up to 8 lanes CMB. For MCMB
> configurations, the field "XTRIG_LNSEL" in CMB_CR register selects
> which lane participates in the output pattern mach cross trigger
> mechanism governed by the M_CMB_DXPR and M_CMB_XPMR regisers.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  8 +++
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 51 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
>   3 files changed, 62 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index bf710ea6e0ef..e833edfec79e 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -257,3 +257,11 @@ Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
>   Description:
>   		(RW) Set/Get the MSR(mux select register) for the CMB subunit
>   		TPDM.
> +
> +What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_trig_lane
> +Date:		Nov 2024
> +KernelVersion	6.13

6.14



Suzuki



