Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C763CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMeEYpjjpA7xSB3dL5DbQE5oC6CzwdRXcqekDnNXNGA=; b=JJRMp7Q2SJLUokzZeo9zzXSDKT
	05bZU6CcZxf8Ox/0VROW7k4S+UOgy73YBuotIqooMLjbzJxEPOsQPxCvQvpYuJf+GZ0XL5FpDss0/
	X6Q058YiWfZOSUR/eOkDy+/5hLHq/qVXkommfFp7aXN4pE4rzdcZXWxE1qIxPIScNwOnO8xB1x5+A
	oQQT0bdaMNsG+AQlEe68sq8F46wnZEE7twm2Dn5bXTe8pyCDLHgq+u9Veqnn/yF5y04GHAeZu2Q35
	BalgebTT/APutgikxnDClGywrsMKptOkibBYBWqa025JIkpJDPvfC0Qjb0QPYGX+h1/UmQBVawAVv
	k0B+HtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgTn-00000002npi-2EyG;
	Fri, 16 Oct 2026 11:52:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgTl-00000002np4-1Up1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 11:52:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 403E914BF;
	Fri, 16 Oct 2026 04:52:00 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 829943F673;
	Fri, 16 Oct 2026 04:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792151523; bh=9oLt4k0yVG4pSkU/NV7m6aM4jq0+mfviic4Sf4D4cz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jV16h8Rc7BeWT5F78lALDJYh/DElPXM6sce1x1m+hoI6BuDMfTH4IZ7w3BRzR8jJ3
	 NxAKZLUPf/4OfQahSHLbAb01qvG4Pieh+f9m9YYMIXpjAC0ROLZLGjtpvQpwQfvqdA
	 60XbyRpbRzv7kkL8H/w4VcfLgUuVV0y1C/gCwdq0=
Date: Fri, 16 Oct 2026 12:51:58 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Kohei Enju <enju.kohei@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 1/4] arm64: cputype: Add FUJITSU MONAKA definition
Message-ID: <atIP3ub81suIRX2g@J2N7QTR9R3.cambridge.arm.com>
References: <20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com>
 <20261016-monaka-fix-for-upstream-v2-1-fc7ede7f9f48@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-monaka-fix-for-upstream-v2-1-fc7ede7f9f48@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_045205_444493_228DCE29 
X-CRM114-Status: GOOD (  12.91  )
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

On Fri, Oct 16, 2026 at 07:00:45PM +0900, Tomohiro Misono wrote:
> Add cpu part definition for FUJITSU-MONAKA.
> 
> Signed-off-by: Tomohiro Misono <misono.tomohiro@fujitsu.com>

FWIW, this looks fine, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

I assume that Will and Catalin pick up along with the other patches,
when folk are happy they're all ready.

Mark.

> ---
>  arch/arm64/include/asm/cputype.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index 1fa29616e586e..3f648cb10e61c 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -138,6 +138,7 @@
>  #define NVIDIA_CPU_PART_OLYMPUS		0x010
>  
>  #define FUJITSU_CPU_PART_A64FX		0x001
> +#define FUJITSU_CPU_PART_MONAKA		0x003
>  
>  #define HISI_CPU_PART_TSV110		0xD01
>  #define HISI_CPU_PART_HIP09			0xD02
> @@ -235,6 +236,7 @@
>  #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
>  #define MIDR_NVIDIA_OLYMPUS MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_OLYMPUS)
>  #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
> +#define MIDR_FUJITSU_MONAKA MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_MONAKA)
>  #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
>  #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
>  #define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)
> 
> -- 
> 2.43.0
> 

