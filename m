Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB9ACA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ouk5IL+iTtW2cG9N5ZDLd72zIzLq+KLHHUfELQzw6Ws=; b=2+rCP4gpgq7WW3RsuTIXqhR5Sp
	pJf7xFWGqprFUEPLA0jlCWpBveWmqIiuT8uQqTLeNU8Q7dGHHTQb/6xsJ4lHfkIA83hr/NR8v6ebC
	WqPVjtt7UgjKmhR0U0h6JqMDVLdkmQCZp+pVUeq/WQN3B3BKWuvIPz9vtdjDBy+loVmB4csIApZ4I
	+0GMKlXBBkQaPepGqt6imXm/mm0MqBLU5DE7ujYyRhADoCWimbgGUhEdeipk1hn+HNlGTaV8ufaS5
	4eQFdx2Zu8ZOLEPjK8Zd2Sw88ey2ZCtEtynhz140wQ50iTrroSWoLWCbJfPzNXyXsGUej0BlyU4iC
	rZYeh5BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzRA-00000008FVp-3qKm;
	Thu, 04 Sep 2025 02:10:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utvVU-00000007k9e-3QFI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 21:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB8594042B;
	Wed,  3 Sep 2025 21:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C411C4CEE7;
	Wed,  3 Sep 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756936747;
	bh=0GKVuSXSJlSkzp6pFM2J9RqAsra+LJOjM8sTloa5vZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZQdJBc8vH6UcWmXya2a2zyHBrnnDAfbC0OahIBH+9TlWOzp6Z680MfwRZjjs8ZSa
	 SvegDfNOMcPQKzc4LKAXanPl3lGiWKWPfJJeMNIBepZrsNVOzS9z93y5g3a0yT6uxE
	 YSFdBxnUNk8wz459J42nWKuhwXQCQcM9EdY+UYX5DsgtAuHbUUanAa7L49VdOoizOH
	 4x/rX6A7JWPc7qXStA1TDjzGuj6dFFXxDAjMxIKGi75gAJlzcpfKwftRjjeM79gopj
	 PXSguAysaUH3+APtXo2HwaiY+xqqz2pr0MNhrDmZ7lp6EfUFFe0lZkSjrBAfsxX6vn
	 b3g3T1X2uwN0A==
Date: Wed, 3 Sep 2025 16:59:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v6.17-rc1
Message-ID: <lvpubhge5dfyokvnsuhupus4kocroeb2dmlngl6efxplmwe7h6@raldw456w6r5>
References: <20250811145613.120917-1-andersson@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811145613.120917-1-andersson@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_145908_876647_AAC2D6F9 
X-CRM114-Status: GOOD (  14.47  )
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

On Mon, Aug 11, 2025 at 09:56:11AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.17
> 
> for you to fetch changes up to 25daf9af0ac1bf12490b723b5efaf8dcc85980bc:
> 
>   soc: qcom: mdt_loader: Deal with zero e_shentsize (2025-08-10 21:02:14 -0500)

Arnd, could you please pull this for v6.17-rc?

Regards,
Bjorn

> 
> ----------------------------------------------------------------
> Qualcomm driver fixes for v6.17-rc1
> 
> The recently extended sanity checks for the Qualcomm firmware files
> turned out to be too restrictive, preventing a variety of firmware
> images from being loaded. Adjust the checks to allow section header
> sizes of 0 when sections aren't used.
> 
> ----------------------------------------------------------------
> Bjorn Andersson (1):
>       soc: qcom: mdt_loader: Deal with zero e_shentsize
> 
>  drivers/soc/qcom/mdt_loader.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

