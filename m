Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34DED42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhmDXVwemijjOGfMq6sgcWNT97G/9xGLMWo+ChoGNWA=; b=kLsJm+wszEVNQuKLBd8/lpjAYo
	v/APB2yfiwoGonO+ZQn4SucweIkfJoNKm1kY4Pdft9h13SCoXRircdzKPLwFh2P+S7+mN36X5kODV
	8wle9b5o40b9eqfKk+uqf5EklwBCJ+3vhHaHLLMZCf1OsLAGoAb4rS66QxyKYSEkmwvhTlRKuKs7a
	qC6rmsTUwHo9pOpFY7Lbo1j/7Dlj73ndlvfwJK/FfTPfNvOJQkQaKHjWuPuBxIPVbFFM6Sr6b0Rmn
	3Tyf1SoGJrG8pOhSws7bUtAab23QZR3kMV/H0tif9vDVe1yE7oRt4ul20cJD/n+VbS8EKXJXwKqii
	mu29OlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDWP-00000006w6j-1AN9;
	Wed, 13 Nov 2024 13:35:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDQR-00000006ufD-2iHM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 13:29:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60D7A1655;
	Wed, 13 Nov 2024 05:29:18 -0800 (PST)
Received: from [10.1.29.78] (Suzukis-MBP.cambridge.arm.com [10.1.29.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E5D43F66E;
	Wed, 13 Nov 2024 05:28:46 -0800 (PST)
Message-ID: <c002b839-310e-4c68-acc3-c3433c16e1fe@arm.com>
Date: Wed, 13 Nov 2024 13:28:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Coresight: Narrow down the matching range of tpdm
Content-Language: en-GB
To: Songwei Chai <quic_songchai@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241009091728.1638-1-quic_songchai@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241009091728.1638-1-quic_songchai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_052851_772726_14F7811A 
X-CRM114-Status: GOOD (  14.88  )
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

On 09/10/2024 10:17, Songwei Chai wrote:
> The format of tpdm's peripheral id is 1f0exx. To avoid potential
> conflicts in the future, update the .id_table's id to 0x001f0e00.
> This update will narrow down the matching range and prevent incorrect
> matches. For example, another component's peripheral id might be
> f0e00, which would incorrectly match the old id.
> 
> Fixes: b3c71626a9333b0b29f9921a39ce ("Coresight: Add coresight TPDM source driver")
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index b7d99e91ab84..3230d76aed90 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1308,8 +1308,8 @@ static void tpdm_remove(struct amba_device *adev)
>    */
>   static struct amba_id tpdm_ids[] = {
>   	{
> -		.id = 0x000f0e00,
> -		.mask = 0x000fff00,
> +		.id	= 0x001f0e00,
> +		.mask	= 0x00ffff00,
>   	},
>   	{ 0, 0, NULL },
>   };
> 


Looks good to me, will queue this for v6.14. Apologies for missing the 
v6.13 cycle

Suzuki

