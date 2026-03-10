Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91090EA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPQhIGiGqBVDVnXXbunM1anSUb0IsreU0z6O2XR9ayg=; b=c2sARuyj9REoAsaHKuG14efBLC
	02wiW73/aWTJFbql3M5bxRa9f+sIG/DqjHgWXsZ2u7M2LxdiThoMpxFZm3DkiQDk/ND3Cbw3KaPZU
	w1wa0+F8Z3YRusj8pFj6Erruk10ZG9guIFfeK9ya11AztaVTdroc7M9dccCjb93knOLnZfi6zfMx8
	QnCX/dvF68BJYr4GLqOO9ljLf+BYlP2smN6PFkLFXz4IMa4dol+CMUzOR3dGUe/fIOL6xaL830/dE
	K2KGKYKyN3yxM+2VokmPz4CgJNKV8YhN+3CO6eRShxMJqez2Eh3azjHaVJ6IYpt/0mwUO4DywDYKG
	9EdS32jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt5p-000000092kX-3CwN;
	Tue, 10 Mar 2026 09:09:33 +0000
Received: from mail-m49242.qiye.163.com ([45.254.49.242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt5n-000000092jl-2w2R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:09:33 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3664f2b99;
	Tue, 10 Mar 2026 17:09:24 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: Re: [PATCH v6 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Tue, 10 Mar 2026 17:09:21 +0800
Message-ID: <20260310090921.4169475-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <12058c14-67c7-4b43-bbbc-ef0ccb813e61@kernel.org>
References: <12058c14-67c7-4b43-bbbc-ef0ccb813e61@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd70218ed09cckunm07955a0de6421
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh5CVh0dTB5MTR8aTh4aTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=iNaZVBebjz3EszJNwtv7aY7ooLN4wZLSoy58GkcC9kHQkow/uxIre8iPVjpr+h3Rbx/SwKwd78EH8Ij/FUp5SyFYEMR6KtXy4Lk7eeoze7o0COOLkdZGqGDA/4v/eJisJj4Hlz49E+6V5PqfNc3u/Uero4gyz9ZsXZy80OChwIE=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=cPQhIGiGqBVDVnXXbunM1anSUb0IsreU0z6O2XR9ayg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020931_910774_2BAD7D22 
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

On Sun, 01 Mar 2026 14:12:03 +0100, Krzysztof Kozlowski <krzk@kernel.org> wrote:
 
> Please do not send patches to soc@ for review. It is explicitly
> documented - read:
> 
> "The main SoC maintainers can be reached via the alias soc@kernel.org
> only in following cases:
> 
> 1. There are no platform-specific maintainers."
> 
> So are you claiming now that BST is unmaintained? Because if so, we will
> mark it for removal.
> 
> First you send patches for review to the mailing lists. Only then,
> AFTER THE REVIEW, you send them to soc@ list.
> 
> Please read maintainer soc profile.
> 
> Best regards,
> Krzysztof

Understood. BST is maintained. Will resend v7 to the lists for review
first, without soc@.

Best regards,
Albert

