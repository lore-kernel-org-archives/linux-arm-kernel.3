Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EA5D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nrFXsW1NgI5tnBiaJMdSAx9phJ6I8Pr8VdwFuaXVL8=; b=uiJ00AtXbcbRMTmCsAsa7+KHzF
	me+Y1VscTpKlpPi8Aj0O5S9adZovrj6JRj4FJW6gLXuZvIQuqy/+lvPgHM5OcRF9EOIashJ8TN/0c
	dXMp3bNcqFUrYx/OASSGfDtfx1/oVVNjpJ6m7ZncpO5S8kmmlLGmsrJ/mySmsBxkMgU8DRDnt7Rkf
	nFwx3liFtcNAum7eevr5SjXW0h6nf+7/fEUyeLJrHRMhsjYnNROcGEfwTCEeysY0TAo9zW7VIrxvP
	4SuuczeN2StQc8gGZ6aPWZauE8JHT5CzTfJi8W+kowgWgeV0H8vPPYF3vimD0MzRCOgP8SA79JX0X
	qDc+QIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9AO-00000006pBv-13S1;
	Mon, 02 Dec 2024 16:20:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8vB-00000006m7M-0sNl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6C20A40F17;
	Mon,  2 Dec 2024 16:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C737C4CED1;
	Mon,  2 Dec 2024 16:05:10 +0000 (UTC)
Date: Mon, 2 Dec 2024 16:05:08 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Keir Fraser <keirf@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Quentin Perret <qperret@google.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add CCA and pKVM CoCO guest support to
 the ARM64 entry
Message-ID: <Z03atBO7Q18AVepI@arm.com>
References: <20241202145731.6422-1-will@kernel.org>
 <20241202145731.6422-3-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202145731.6422-3-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_080513_310752_1FE22BE2 
X-CRM114-Status: GOOD (  10.97  )
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

On Mon, Dec 02, 2024 at 02:57:30PM +0000, Will Deacon wrote:
> Commits 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for
> realm") and a06c3fad49a5 ("drivers/virt: pkvm: Add initial support for
> running as a protected guest") added arm64 guest-side support for
> running in CCA and pKVM confidential computing environments
> respectively.
> 
> Unfortunately, these changes were not accompanied by a MAINTAINERS
> entry and so aren't automatically picked up by the get_maintainer.pl
> script. Since the initial support was merged via the arm64 tree, extend
> the ARM64 entry to cover the two new directories.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

