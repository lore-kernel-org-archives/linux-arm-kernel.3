Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D530C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 05:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=CVC9l//r/H8nNV4sbcaPxpojm6
	StsfH6lCPhm6AS8q2XtVsgkGZQAmHXNqlJw1Tk5WZBoMJZcxMB9Xk34tbw998F8KJnQlKwip0VSNu
	UmRsdDr5r0kgwNHkAzq/cQnFqRbAPVbIZsVtq20tFd6j7BZFYKS+Ues05Y3ZdVO8Ngdzw7OP0I0hV
	X+16cdoLou0RtjmZyGP049kT3kes9Xg/ZpCj7DQdk5uOoYPTEgRXoanB0eMfblUqZ4HmB1UzLZaDp
	2VN10merPRPZTnGngoFOE5l1cHhZPzfnXYnAaenLKv0RXPi0WMai1AB2s3Urnk/9OclOlnuaeEj1z
	c3rkdVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XN8-0000000DRtx-2b73;
	Thu, 10 Sep 2026 05:30:54 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XN6-0000000DRtB-0A98
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 05:30:53 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 99F3568D05; Thu, 10 Sep 2026 07:30:46 +0200 (CEST)
Date: Thu, 10 Sep 2026 07:30:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] lib/raid6: Switch to Linux's NEON intrinsics header
Message-ID: <20260910053046.GA27351@lst.de>
References: <20260909163319.2116279-4-ardb+git@google.com> <20260909163319.2116279-5-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909163319.2116279-5-ardb+git@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_223052_686661_6B2EEAED 
X-CRM114-Status: GOOD (  10.31  )
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


