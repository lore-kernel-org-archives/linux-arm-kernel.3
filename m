Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E992AC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 00:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHrCOmfykmwhsfpjLoWxVs/ONP9eg9iJQVNEHDvHi1s=; b=qVP9TB0ssm1evGzNuibE/bTC66
	vNfN3kJz6WoBXqsWEfaYkwPGKeKDKj1QnQnqTqgEVo87+6ha574YZNfipQ/ZXyDTpU1H1vJhlit4v
	eIyJ1URe/WpipGKwMbOuD+bcfVFjLNdQpvXbn5W8KNkKk+o9UAp649s5MJgMz6UrjLrZMfJfKvPME
	E2HUcxecaHw+MhO+qF8Nt/ik3uWWrg40rCD1AZXv2btcdvinH3QsWs9xv1suAngqLrTrs2hfX4IDc
	9rjsxg0h65KdnGLvG2zLKYylA7tulKG0BUHMxrD79F1iIlxEQ81pruxcH+NINlPbthULL3P3iotZc
	Fma7IB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkB40-00000006IMl-1Es1;
	Tue, 18 Feb 2025 00:02:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkB2V-00000006IEB-2UZF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 00:00:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ACD41692;
	Mon, 17 Feb 2025 16:00:55 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C34F3F59E;
	Mon, 17 Feb 2025 16:00:30 -0800 (PST)
Date: Tue, 18 Feb 2025 01:00:20 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, rafael@kernel.org,
	viresh.kumar@linaro.org, sumitg@nvidia.com,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 0/4] Add support for AArch64 AMUv1-based average freq
Message-ID: <Z7PNlFv2995pDARQ@arm.com>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
 <173982791748.4020779.2848639862581042284.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173982791748.4020779.2848639862581042284.b4-ty@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_160039_679434_B5352CCF 
X-CRM114-Status: GOOD (  18.88  )
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

On Mon, Feb 17, 2025 at 09:32:06PM +0000, Catalin Marinas wrote:
> On Fri, 31 Jan 2025 16:24:35 +0000, Beata Michalska wrote:
> > This series adds support for obtaining an average CPU frequency based on
> > a hardware provided feedback. The average frequency is being exposed via
> > dedicated yet optional cpufreq sysfs attribute - cpuinfo_avg_freq.
> > The architecture specific bits are being provided for AArch64, caching on
> > existing implementation for FIE and AMUv1 support: the frequency scale
> > factor, updated on each sched tick, serving as a base for retrieving
> > the frequency for a given CPU, representing an average frequency
> > reported between the ticks.
> > 
> > [...]
>
Thank you for that.

There is still a (not so) small issue with patch
[3/4] arm64: Provide an AMU-based version of arch_freq_get_on_cpu.
It did not come up while testing, sadly.
No idea how I could have missed that, nor why I made the mistake
in the first place.

The fix is pretty straightforward:

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 6f0cab8e746b..4bac26d8e29c 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -268,7 +268,7 @@ int arch_freq_get_on_cpu(int cpu)
 
                        do {
                                ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
-                                                           start_cpu, false);
+                                                           start_cpu, true);

Please let me know if you want me to send new version with the fix applied.

Apologies for the inconvenience.

---
BR
Beata

> Applied to arm64 (for-next/amuv1-avg-freq), thanks!
> 
> [1/4] cpufreq: Allow arch_freq_get_on_cpu to return an error
>       https://git.kernel.org/arm64/c/38e480d4fcac
> [2/4] cpufreq: Introduce an optional cpuinfo_avg_freq sysfs entry
>       https://git.kernel.org/arm64/c/fbb4a4759b54
> [3/4] arm64: Provide an AMU-based version of arch_freq_get_on_cpu
>       https://git.kernel.org/arm64/c/dd871ac1237f
> [4/4] arm64: Update AMU-based freq scale factor on entering idle
>       https://git.kernel.org/arm64/c/96b335620c59
> 
> -- 
> Catalin
> 

