Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF873C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjW6me5aey9H48hEN1KtzxQxnDbPM7NZTegKHKqDCWs=; b=qM1QEZIEwE2ewrFxGUicRqxlqQ
	CvMzZfw5NvBeVzg69dAUoW6xGtlgMYCweQ2O/37Ry3c4WnLK1y8Y1O/JH3XScfyrUfVa1grZPx8FW
	qF6Fy0pfaU5M+DrIcqzFtn31YFe9iM+/k3qDNLzngPizd+o2F9PhxjvI/f1Br1zea4GaomO2qre4P
	wvXZvKd1C6XmVHt6nme6dr3ArjFdmFsN0nfFdo3vOKS8+ZJhxYyPUgjp+zxyWG+KWRDK08nR40l+t
	rcoQnib7SK25PyNGqj3hEgY/gsjpJweWXV9UaPwvBSXVGJIkI2CIwJS9v/3ekzZ4W94rDGx5Sw8eX
	ocX+ijBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrDS-0000000F3nR-33qD;
	Wed, 19 Feb 2025 21:02:46 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrBC-0000000F35F-3xQ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 21:00:28 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3034E40E01B2;
	Wed, 19 Feb 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YHqz74H1AW0s; Wed, 19 Feb 2025 21:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1739998820; bh=rjW6me5aey9H48hEN1KtzxQxnDbPM7NZTegKHKqDCWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVaSHjwW22P+vF1AXfgkrBhlqKcMY6aPZjkYzyb3Unn8wSfHBuGpF82KiHzKcs4rD
	 RDgZ5NMMlqYe7usuGitbOeZfiy0LnFMAG62t1TmjMOGJWLabXTN+fDd3EkQOMnIcgz
	 2+WnZC0xl5sQyvk6K8DWKM+qaBoyDFlPc6qEDFXVI9XdvN2NWV7MvREVFd0fHJIy/Z
	 WnCv00w94vrVDjP4gtCAiEaXTcxqs3DBPSti9J9SsjALQJnPFdT6DyTcSN59tm90vt
	 E0HYdr/quNZQGlyGhtu+kD0yMY0//XgLYKJAqgzgV9EiTjZxcZkH6pk1P9lWsu4taV
	 D4zie+Afwgyto4ZhBITYkFdUdv5NwKBu2K0VOj1nvFQNFBwopzE9quJJ9Tdji8iC5F
	 tKidpAX1COfflmtwTh6rNfD0hcVR9CBeY9vVgMUlIYFbvkCJIJH/Ek5aXbPScoxGMj
	 tE5fS4e8Gg2kRytdJLcZFsPFoEKk/D0bZPCwDX/Vj34PWrI36wjIpXw7ot5+dBEfu+
	 Bluv0CdgiJ0SXPqLkhq7Rli/xZ5AILx+FCLEWT5cD9OKWJRFP99WeJrNUI54UhDnzq
	 SVI0x2SXGK6iLvrWcvyuUel83sC5J7mNvJ5wXSOKu+PkzttmWsuZO9psynAwdch3Ja
	 V6oZ+n7VGPb+FQCC2FcPNvIE=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6459040E015D;
	Wed, 19 Feb 2025 21:00:05 +0000 (UTC)
Date: Wed, 19 Feb 2025 22:00:04 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: catalin.marinas@arm.com, will@kernel.org, lpieralisi@kernel.org,
	guohanjun@huawei.com, sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com, baolin.wang@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	lenb@kernel.org, tony.luck@intel.com, yazen.ghannam@amd.com
Subject: Re: [PATCH v3 4/5] RAS/ATL: Unified ATL interface for ARM64 and AMD
Message-ID: <20250219210004.GTZ7ZGVHn9h5h88_fJ@fat_crate.local>
References: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
 <20250115084228.107573-5-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115084228.107573-5-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_130027_134633_65FFCA9F 
X-CRM114-Status: GOOD (  16.58  )
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

On Wed, Jan 15, 2025 at 04:42:27PM +0800, Ruidong Tian wrote:
> Subject: Re: [PATCH v3 4/5] RAS/ATL: Unified ATL interface for ARM64 and AMD

The condensed patch description in the subject line should start with a
uppercase letter and should be written in imperative tone.


> Translate device normalize address in AMD, also named logical address,
> to system physical address is a common interface in RAS. Provides common
> interface both for AMD and ARM.

This needs a lot more explanation.

> Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
> ---
>  drivers/edac/amd64_edac.c      |  2 +-
>  drivers/ras/aest/aest-core.c   | 12 ++++++------
>  drivers/ras/amd/atl/core.c     |  4 ++--
>  drivers/ras/amd/atl/internal.h |  2 +-
>  drivers/ras/amd/atl/umc.c      |  3 ++-
>  drivers/ras/ras.c              | 24 +++++++++++-------------
>  include/linux/ras.h            |  9 ++++-----
>  7 files changed, 27 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index ddfbdb66b794..1e9c96e4daa8 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -2832,7 +2832,7 @@ static void decode_umc_error(int node_id, struct mce *m)
>  	a_err.ipid = m->ipid;
>  	a_err.cpu  = m->extcpu;
>  
> -	sys_addr = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
> +	sys_addr = convert_ras_la_to_spa(&a_err);

No, this is not how all this is done. You don't rename functions and make them
generic - you *extract* generic functionality into generic functions and have
other functions which use them, call them.

And you do that when there are users, not before.

Ok, that should be enough feedback for now.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

