Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7358C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAGdYdPyxK5uvH5j4LNdDeNPl26Am99THch1ObpP7X4=; b=A8n5OSL6knGu6gXv6o+knVCM8R
	/TGwyxF+mTQBNEy58gzZLaWFHad5r/e1qnh7lnqGzNns5OXLdr9PvAG8DY5jMH/vhgIvJvucjre9A
	dGIwG0pB7cxA5n4WIAKmRci+f0qayFaIg+WBsLs+NuOtQ6MBmcbXVJCLx8VbSLKyu2p5sEs45v3Dk
	lR/qAvk9WvNlSDbeZQuir+5sywIZ3U39Swgav61a4EC1kpCoz0fNSrSzNIVs3hVGkJ6gAk7p0SDPS
	U/HG5aTdLq3ygfIemFWOuf9aCSNNUu3xdCeZ4/j1J9dw+TtY4w+HiWbjYIU6yVbozbmJJZcvv2GS5
	Avyj+R0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6l-00000002eki-02uK;
	Fri, 02 May 2025 17:23:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtzV-00000002d6y-3EC6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37A1AA4AF6F;
	Fri,  2 May 2025 17:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28702C4CEEF;
	Fri,  2 May 2025 17:15:57 +0000 (UTC)
Date: Fri, 2 May 2025 18:15:54 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 3/3] tools/kselftest: add MTE_FAR hwcap test
Message-ID: <aBT9yiaLF9LisLR6@arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
 <20250410074721.947380-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410074721.947380-4-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_101601_869796_4DB6B863 
X-CRM114-Status: GOOD (  13.29  )
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

On Thu, Apr 10, 2025 at 08:47:21AM +0100, Yeoreum Yun wrote:
> diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
> index 35f521e5f41c..a539eeb0bfc0 100644
> --- a/tools/testing/selftests/arm64/abi/hwcap.c
> +++ b/tools/testing/selftests/arm64/abi/hwcap.c
> @@ -1098,6 +1098,12 @@ static const struct hwcap_data {
>  		.sigill_fn = hbc_sigill,
>  		.sigill_reliable = true,
>  	},
> +	{
> +		.name = "MTE_FAR",
> +		.at_hwcap = AT_HWCAP3,
> +		.hwcap_bit = HWCAP3_MTE_FAR,
> +		.cpuinfo = "mte_far",
> +	},
>  };

This is all good but I'd also like to see a test to check the FAR_EL1
bits are actually exposed to the signal handler when the hwcap is
present.

-- 
Catalin

