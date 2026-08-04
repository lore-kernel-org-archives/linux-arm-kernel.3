Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196DBC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5k9rLi6Y4cEeDMpbEI3YvRHaDY4GzlgCar/spptmlYU=; b=DTLC7yqdSYvBS9nZiEddnHtV6c
	QvsSJFPKY8kBhRvzbqxWmLOcEXQggY7gDAtkTPPwNqvhE6JZf0ZaLmBFVxgdKwXRtQGEMQOc3AayH
	X7xRGBNFECHQ0SlMREUckYk/fgMnxhMO/ETQH0rHv8NGkSVb3aMxJIOB91TMtZnuDuLni9k4kAznO
	ABqnQqrU8cUsM828jUwj6RWhb2Q2pEjfDoUuyKoMaKPMb+3XcViAVp+QaPl0uCxv4F0+KAS4TurQf
	FhniRIX0G/8SGtbMaAhWpD4OWpTCF0A/LCgmrTUemilQKmRSvG04dONk0lbxe8Otv7hDUnyoYQf41
	JvjkZP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGXg-000000028jF-1hn0;
	Tue, 04 Aug 2026 14:54:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGXd-000000028iV-3VWM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:54:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8181F165C;
	Tue,  4 Aug 2026 07:54:48 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24AB53F86F;
	Tue,  4 Aug 2026 07:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785855292; bh=vSjR5AqxQ551ckZeN73h0yGoafgYWapM33DoJPsqOao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZCJgbtIwJMkYLCT4rWqtu+3R6nK83j8Md6i/iYUv9pQxyJBe9Ymoss4IrMZeoiII
	 rmTkU8KpkKefMqajdWMdU8G5ajXdyQZNmY2ehHYFiBwHuM6QdrxLDFQ6TiKoM+F1Tt
	 Twxj2aVYPkbDbFTj38I8CKpB8Gzgg6jFeOD3d3FA=
Date: Tue, 4 Aug 2026 15:54:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: arm64: Add Mark Rutland as an official
 Reviewer
Message-ID: <anH9MEAxWSQ9QDav@arm.com>
References: <20260803164230.25172-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803164230.25172-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_075453_919848_87E98745 
X-CRM114-Status: UNSURE (   9.93  )
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

On Mon, Aug 03, 2026 at 05:42:30PM +0100, Will Deacon wrote:
> Mark has been part of the arm64 furniture for as long as the code has
> existed in mainline and is consistently one of the most active and
> knowledgeable reviewers that we have.

100%

> Make it official.
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks for sending this!

