Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF53BCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDajhi6Fb7B/9ddxwqmq7iWoEhUI/yDS71gUVky48fc=; b=xN3xVGVtvl10PB/NxfwIwuSR+m
	RS2G7WIR5K580PPVwiMTOsR2h9dMoCsnjhCiBzppmUhPwV3Kk1441ps/AMjcMRO70/oomcDBTlgEE
	/veUd4Uw9SvbpjTNSUtXSxDviPYQJtEqEzODJ3RjKEp7ZOnsnsksOTUbfEqUOFcV9y+ZJiBGop5AC
	0XQpiB5YiLGXyiON+ymkcDKZPpU/UD0HVTxp0IDLMVYJPBcD8d4QxdCp8HgHU3LGgvp7vxYXP2p00
	QkF6j93NT4YN1D2jhh4wVMJi45ggvKig5Px4NPVsy9Ia2yngZquIcSY8ZJqOC70ghmJek6+vRPDpL
	tGaSv9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMio-00000008Bkk-2gwu;
	Wed, 10 Jun 2026 17:28:10 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMik-00000008Bj3-2aoD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 17:28:09 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2DA4340E0177;
	Wed, 10 Jun 2026 17:27:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YtZhZAtAs2sO; Wed, 10 Jun 2026 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781112452; bh=oDajhi6Fb7B/9ddxwqmq7iWoEhUI/yDS71gUVky48fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUxmx/7g1ot2UYJfOagMzE+/QlF+rCjIEFibSXjZMY1IgOripjq3PriFPKD8hgVEe
	 hVOHb4PZ+3z9LLnE2H1uh90DytaasBoqNqo9gOVjD7LpRQqtOvWZ/c3Efs3yF6yiTS
	 bfLkaZdkXn1SipnXjIT7E2JcqMrJ5BffhlJFbXCZ81GqM650cRMuocSl6T/+eOh8qc
	 ZUjiKlGgInPX9TVwp8eYc2RtdvbyWh6cvfHUWPBWECPHHZ031EBoOgaPi7JkSCJpNp
	 mRW76Z0BFo3LCOMw2KZ2MRNJB0nDudE1bVkZ1sbWYXK2Od4LIVN/EyzLXaWbSADiwT
	 hlp7PxaOENJvBhFnPrIO5KAqDQ5ElXANdli2zVaFhPI2QcErX4iUDlUYPD0gpgg5nI
	 AySi3TVbrFLDgED5dEx/dKFsKl1/iCsPpXOhWXXrH50zC3A2kLqPAlzIGVK+wnlujD
	 piq43MO4MB78oFqxAIrZX1RPrL3WjTKqWgjjCIKy+mn0bH9VRPqZZ5WpJrrtc/U6Cj
	 +Orh1qgCTzOC+dUGHcHZgap+yuxkC+7T3uobEIH15QotYnlrR8rWbv9gH2ZZsqUhXi
	 nzF9TIoAKu+LJNbaStuoTCTgF5h9l0PTCTKezM3C7vnaqgap7lw5srA8xd0jUk0kVV
	 ut39jKQXvLq9mTJtu8r92qiw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C129240E0184;
	Wed, 10 Jun 2026 17:27:25 +0000 (UTC)
Date: Wed, 10 Jun 2026 10:27:22 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, Michal Simek <michal.simek@amd.com>,
	linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/synopsys: Fix cleanup on injection sysfs failure
Message-ID: <20260610172722.GAaimeeuKj2aAgUJ9Y@fat_crate.local>
References: <20260605125417.2348115-1-dbgh9129@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260605125417.2348115-1-dbgh9129@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_102806_836126_2D525215 
X-CRM114-Status: GOOD (  14.18  )
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

On Fri, Jun 05, 2026 at 08:54:17AM -0400, Yuho Choi wrote:
> edac_create_sysfs_attributes() creates inject_data_error before
> inject_data_poison. If the second file creation fails, the first file is
> left behind.
> 
> The same failure path runs after edac_mc_add_mc() has registered the
> memory controller with the EDAC core. Jumping directly to edac_mc_free()
> skips edac_mc_del_mc() and leaves the registered controller state
> unwound incorrectly.
> 
> Remove inject_data_error when inject_data_poison creation fails, and
> route the probe failure through edac_mc_del_mc() before freeing mci.
> 
> Fixes: 1a81361f75d8 ("EDAC, synopsys: Add Error Injection support for ZynqMP DDR controller")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
> Changes in v2:
> - Remove the CONFIG_EDAC_DEBUG-guarded del_mc label.
> - Call edac_mc_del_mc() inline before jumping to free_edac_mc when
>   edac_create_sysfs_attributes() fails.
> 
>  drivers/edac/synopsys_edac.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

https://sashiko.dev/#/patchset/20260605125417.2348115-1-dbgh9129%40gmail.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

