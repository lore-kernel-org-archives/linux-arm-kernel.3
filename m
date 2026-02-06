Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45939EE6B4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxiHgQCfgkP7HdfdYNkvgGlKEpkPoB6tNuKIE1lHc88=; b=qJJB7fG1o0knlCN82Pq4UagmqP
	yIdpnM8FC/KZ0KYICAbElXrbp7Z/g2zFwhAC9bG3at7rvjwqSBUigjGMPSKzKozlWyiBbNOkwnJRX
	q7sXYMnfxb0Fv1gEK01dLtRRLzGYRXEbcoU/6Hd2qq2mVyLWGKaUb2+KO0sAVmdwZGXvAoTN2F4TO
	ijtqCsYcuIiYQoft9NNqQcXb2aABiYJX+Yl23WjeweY0jbBnk2O1jDkhhXp1nx3/2t5erBKZhZVRr
	i1TthIalNDvqJuosYwqTYU5B35eCvnp2CEqrchXUd/WPujDXbvExr+3EGhG75mlGvVmHjqN/TCKyX
	cfmn+UBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQmt-0000000Bhet-31H5;
	Fri, 06 Feb 2026 18:42:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQmq-0000000BheT-0kPk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:42:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E90B7339;
	Fri,  6 Feb 2026 10:42:26 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 333FE3F632;
	Fri,  6 Feb 2026 10:42:30 -0800 (PST)
Date: Fri, 6 Feb 2026 18:42:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	broonie@kernel.org, oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Subject: Re: [PATCH v12 2/7] arm64: cpufeature: add FEAT_LSUI
Message-ID: <aYY2CyHWtplQ-fuS@arm.com>
References: <20260121190622.2218669-1-yeoreum.yun@arm.com>
 <20260121190622.2218669-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121190622.2218669-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_104236_276037_4E5859D8 
X-CRM114-Status: GOOD (  11.90  )
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

On Wed, Jan 21, 2026 at 07:06:17PM +0000, Yeoreum Yun wrote:
> +#ifdef CONFIG_ARM64_LSUI
> +static bool has_lsui(const struct arm64_cpu_capabilities *entry, int scope)
> +{
> +	if (!has_cpuid_feature(entry, scope))
> +		return false;
> +
> +	/*
> +	 * A CPU that supports LSUI should also support FEAT_PAN,
> +	 * so that SW_PAN handling is not required.
> +	 */
> +	if (WARN_ON(!__system_matches_cap(ARM64_HAS_PAN)))
> +		return false;
> +
> +	return true;
> +}
> +#endif

I still find this artificial dependency a bit strange. Maybe one doesn't
want any PAN at all (software or hardware) and won't get LSUI either
(it's unlikely but possible).

We have the uaccess_ttbr0_*() calls already for !LSUI, so maybe
structuring the macros in a way that they also take effect with LSUI.
For futex, we could add some new functions like uaccess_enable_futex()
which wouldn't do anything if LSUI is enabled with hw PAN.

-- 
Catalin

