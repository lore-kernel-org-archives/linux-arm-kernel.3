Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA790EDA68A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=kmkH4G18SnO+q1p5Hb2MsXQo5O
	A3Ia27gKqIh4FMbR2eBrt6s53fJJgTJaiNiz+hIJ5gakJCN2WsQrJ32Nf8fIPQbhGSlFjvvo1ICb3
	E0TmdrSI4tmMT0PK6ZeQu8UBhbFkJQu0ZZlA9pxe5sW6OtB8+wyVSnr30D/Z1yoK9Y399kXJjRaly
	ekqGhLuZI+qrMv2isodqfNUMQlzTgDCD63bsiaNIOzLxTsB2S/dZpzf/P4fua938XXt3Uy7PQ0P1B
	aBrREln13fa3wGtnLrzwoImtzZlN3RD88+FwkVkrEiONDYvQZKiJx+tCMQo58TE9HlS0hYkOorVGI
	NjCUUJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRYe-0000000FPy8-36s2;
	Tue, 03 Mar 2026 15:21:12 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRYb-0000000FPwz-3JkA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:21:11 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id A880B68BEB; Tue,  3 Mar 2026 16:21:00 +0100 (CET)
Date: Tue, 3 Mar 2026 16:21:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] arm64: Silence sparse warnings caused by the type
 casting in (cmp)xchg
Message-ID: <20260303152100.GA5281@lst.de>
References: <20260227155142.1332743-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227155142.1332743-1-catalin.marinas@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_072109_970901_FA89C721 
X-CRM114-Status: GOOD (  10.54  )
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


