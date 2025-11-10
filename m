Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644ACCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60XE0n4ktcWn8stcg6+J2/wZdP/C+HhifbPKQu61aC4=; b=SW1h96yYaqUC27MKPSU9KvZ467
	rul1kmInI8vZNssrOcWHfRI4QN32rnHRIu0oZdyEN1+cy71irFwQUB55JjQWikTnLgUnfgsk4Vkfg
	eh8gx/0v8X64uRH3+ZYD7/QQSrp2Wn2m4GWwwjxufGRBeqW3AFCLEo9zXiCplctSlz0uU+U5ctncU
	DD+cF7igk4vKOdrS3aPn0qwVFZNrNVrJ50RgeJuOpiKu2Fg+tI+k6e8faqLWWhjt8eLB354NturCl
	WK2Aw7Rd8rjnBLB0vieN5YslTZ6R/3Tk6tJlvxKdf/uh79LiCTVWfNQ+nEHcgRp87g0Scylex6dVi
	BQXIDdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIXsH-000000062gy-3Zhr;
	Mon, 10 Nov 2025 19:48:25 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIXsE-000000062gW-35rt;
	Mon, 10 Nov 2025 19:48:23 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8B21F40AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1762804099; bh=60XE0n4ktcWn8stcg6+J2/wZdP/C+HhifbPKQu61aC4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZtdsBlIkYOVn8oc/8L7e4N1UD8nrN0Z4mHSPFi2UB39PrXOzy7PFL1lZTbk+CS3Zt
	 iQK7p44VcFbqboFkBseYpjOxk1tMwuRKYgmbzuYR7ulgvNpxHL64EOlT+WKEfqoDG7
	 /O3J7GKEGc06rLLWdiOshAdtvn9qaKC8bSummX9dWKLPhIkVcVhRRhlgmgC4sso5B9
	 HqC1idyjFyYCeEhZtu2I8eMzdHHRLZw63GWMORxzZ7VnQXDjtaCGe2M9JyE1gmANQy
	 ANkYG40AaWHNQD2opJAGWRfwQ2+i9R93E6X04+j8VsKMop4KvMg7e9v5JP9XU/VL9X
	 KFOnaxhh+5Y6A==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8B21F40AFB;
	Mon, 10 Nov 2025 19:48:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, linux-actions@lists.infradead.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Andreas =?utf-8?Q?F?=
 =?utf-8?Q?=C3=A4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH] Documentation: parport-lowlevel: Separate function
 listing code blocks
In-Reply-To: <20251105124947.45048-1-bagasdotme@gmail.com>
References: <20251105124947.45048-1-bagasdotme@gmail.com>
Date: Mon, 10 Nov 2025 12:48:18 -0700
Message-ID: <87ecq5y8hp.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_114822_779894_825C4530 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Commit be9d0411f1608a ("parport-lowlevel.txt: standardize document
> format") reSTify parport interface documentation but forgets to properly
> mark function listing code blocks up. As such, these are rendered as
> long-running normal paragraph instead.
>
> Fix them by adding missing separator between the code block marker and
> the listing.
>
> Fixes: be9d0411f1608a ("parport-lowlevel.txt: standardize document format")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/driver-api/parport-lowlevel.rst | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

jon

