Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1EAC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3xyRM/wAlBwrs4J1zBbo6tL/K6FbpaVSr4RYy/4QHY=; b=wC6YPZV/Tk4yWUARGcCPy7Qmft
	rMG1auPWzCwmwJ0jNMHAaWIuVr1GhPbfNYBPgPYV69DQBYGMsOS2Bfr2agvSHfnUV9QIgn9//etNX
	tjqONCZr/soh69LWyDG8Szbh/Me1zTZOXIIVb8JhIqcwb6g2gWxL5w1/dn4ou5ybrv/G5xY2Iiv8A
	VJ5/AN1NFMhkk/O7fdg3puWDaD/FEN4MnKUgP+gucbTRIarwv6b9DyLbH76P04BAf1CxIWjK0kq9x
	ZI39yUVU/5SUoh89js48e/btdk/Hxo/ET48CMSJAFS3OXrGsBbZo6Xxi4S57kk5NKtKe+wXcmod+Z
	atDcFsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylF2-00000000GOx-2M0I;
	Tue, 25 Aug 2026 07:06:40 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylEx-00000000GOZ-0PSo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 07:06:38 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c207cb16cf5so689862966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641593; x=1788246393; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3xyRM/wAlBwrs4J1zBbo6tL/K6FbpaVSr4RYy/4QHY=;
        b=r9ApBGPI6FwaRKeupVpH5z/Dg7uqmT2g2UsmaiDicyV9dB0HiE3PJeieTLO9+8HFIk
         H51awosV28qKyfjweRn+hZbG5hr0SrtBmYuFd30WL4xfq6Z6PSj/QlNC40JzHpr+G3gf
         u1dmTM9VIA1K8vXJPaxroJnge3Dwtbo+rICOtptCVqOdBzelu3tenRoMIVC3MZy6Kx+x
         3g4QBObsa0qg7lF9ILBfVJXq5rZke5b/fxr5hmm5mzEKcGGHHxYf7AdesR5xVeKkCF1Q
         tE2c5C2f+sfSnnsth6AUipZsVXhO/0nfzy51Vjx8HH34ThZVxiDzdrRa0vSKafyHEqDc
         JuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641593; x=1788246393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3xyRM/wAlBwrs4J1zBbo6tL/K6FbpaVSr4RYy/4QHY=;
        b=T9MeCArs4VtHUwXj5E/zaRxmV8ecdx/ainEglmX2i0X0PpX9Gkgpf7J+KNT2fGgoJm
         JOMgeGUkZBdRztbWyqNEzlwd7hu3gD5O32G6RRkjTS1TEHcGsibnYBIkjQ5vWg5CHjAz
         B/16QFDmk2IkSKNUVhzwsjK8v3lN9m2gW2wcT271yBnPKXzfunj5M+k37CJL2bBpqY8n
         F/L0iw/WXR8hnYIuuMNGmM0mhWiah0PVCYHkl+Ciz7DwRT1wEFFKVxFQxwbdOa4rM4/V
         ABjy0CHRdCOCXQJ53OZCIsXErBDiRdwVR2Z5AUPISVwV+AsL0yO9OyoWgDjXSiPmvfL5
         EpGg==
X-Forwarded-Encrypted: i=1; AHgh+RqKkX6ry9LY86r+Qh8R/H4jsYmPAln9rPWcTdi8XBNI40UNZCQ3rRCFyFiOaPXeVd5+b9Qwtsbmk2l041j2kko3@lists.infradead.org
X-Gm-Message-State: AFuF++kdg3WLuqKHXIAo/EokyfZDoOWCyuRBe7Ka1dINhsESTBOsj/2q
	BVNvPKpdjs234rar+VnLRUzVfwy2yLqc32S7HD49/du5FyqpCwyrbmBT
X-Gm-Gg: AR+sD13YrglGt95TrKWMvOEArbP4jNfkZLXeny6b+7ONMLl52g6K3CnHsZLhi7iGyCg
	MnWn771dPP6a0j6JBItcq+lyvZMJdDve+Nb0uyTmZ6Z4rngRXf1KDH2B7wnLahxlrD83R9kd0yl
	uBTg7rskBYfGH8q1pdM0n14MWi9zC1BwfOVtioZsfihYxdDDMaHWg3SME4/NwBBbgi/b531LRHc
	3bvi6mxwxbttbrhBm1QCN7FqhFKb5OMONqHsQy6XT2iVuzP7qUSGWQjd3dpUCOT/UhuzXXR4sFo
	q5fyHnpR69e24oF6UoWDjlyf7tqwTk4BpGpUaZtPbpUBqzXIbWptnp1WQaAw7+rPEWc5wtyvK2/
	x/t2yH/Nrbg8PZz3oF2f6Jmes6GkZe5D2arc+GJAEaxrxK6GaTttfNOAHUkF8nd4i00NhzakcIf
	sgjyXdb8JZdg9cLVxwWqx2TijSht92tk1LvlLcxeWffVpUd6Iz+f1pcEEbmJ6Vfr/uceaFFpb6y
	uqjplQVf6fXAO5flOp32CrlEQIq93rif8bDHegh2rxPIiPY+rl9ldCiJsks3D0XkRDhz8d6AgvN
	dOBP8Bb51hMZGzZruhW8EtdmBBXC248re4U=
X-Received: by 2002:a17:906:a353:10b0:c1c:5c90:1bb0 with SMTP id a640c23a62f3a-c246a353d2emr2513381166b.8.1787641592969;
        Tue, 25 Aug 2026 00:06:32 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm1565087966b.15.2026.08.25.00.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:06:32 -0700 (PDT)
Date: Tue, 25 Aug 2026 09:06:31 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	Francesco Dolcini <francesco@dolcini.it>, Frank Li <frank.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] arm64: errata: Add NXP iMX8QM workaround for A53
 cache coherency issue
Message-ID: <f5nfbi2lmc73wtxxmzs4damrjtd67p4eb4p2zy5ssqrc3wohne@cjcxqua5dps6>
References: <20260824-imx8qm-cache-coherency-v4-v4-1-b2e528c7d05e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-imx8qm-cache-coherency-v4-v4-1-b2e528c7d05e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_000635_155236_B4467CFE 
X-CRM114-Status: GOOD (  16.45  )
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

On Mon, Aug 24, 2026 at 12:02:04PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> According to NXP errata document IMX8_1N94W[1], the i.MX8QuadMax SoC
> suffers from a cache coherency issue (ERR050104). The upper bits, above
> bit 35, of the ARADDR and ACADDR buses within the Arm A53 subsystem
> have been incorrectly connected. This causes some TLBI and IC
> maintenance operations exchanged between the A53 and A72 core clusters
> to be corrupted.
> 
> The workaround requires:
> 
>   - Downgrading targeted TLBI operations to broadcast-all variants.
>     Instead of patching the low-level __TLBI_1 macro (which interferes
>     with the REPEAT_TLBI workaround and causes excessive over-
>     invalidation), redirect high-level TLB flush functions
>     (flush_tlb_mm, __do_flush_tlb_range, flush_tlb_kernel_range,
>     __flush_tlb_kernel_pgtable) to use VMALLE1IS via static key checks.
> 
>   - Upgrading IC IVAU to IC IALLUIS for both kernel (via ALTERNATIVE in
>     invalidate_icache_by_line) and EL0 userspace (via trap-and-upgrade
>     in user_cache_maint_handler with SCTLR_EL1.UCI=0).
> 
>   - Disabling KVM since correct TLB maintenance cannot be guaranteed
>     for guests.
> 
>   - No need to touch SMMU Broadcast TLB Maintenance (BTM) since i.MX8QM
>     does not support broadcast TLB.
> 
> SoC detection uses devicetree compatible string "fsl,imx8qm" or
> "fsl,imx8qp" since the boot CPU MIDR_EL1 (0x410fd034) and AIDR_EL1 (0)
> are not unique to this SoC.
> 
> [1] https://www.nxp.com/docs/en/errata/IMX8_1N94W.pdf

Hi Peng,

I tested this on our HW and the random crashes that occured when both
the A72 and A53 clusters were enabled no longer happen.

Tested-by: Franz Schnyder <franz.schnyder@toradex.com> # Toradex Apalis iMX8QM

Thanks

Franz

