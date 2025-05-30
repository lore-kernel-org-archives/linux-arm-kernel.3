Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAD0C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSFyTYUgxQ9ulN36hABpmpERB1KVLKjF7DW8D0u3oMo=; b=R0gwYBUNyWi6//eCyiqCLl9oP0
	i7r05ahAEIon1dJxOzwqoyhu3jfpTK/Kon6K2eHeLZaF8uOItwDy/UuQ0zXUH/EdE3WvJaHp0VBi6
	V5emtYIp1oMbmcTzbsrxnyvkAXvNhWt5EXRY6qHl8Kh1miztHdhqr7WDiiq8UA3Jwl4L2GE2z/Arx
	bNMupWaCV70iuzUisQ0jOFYoqRZ/eoPKh3hiXtDOAELdNEhOzxqKeH7LSBBzVt9xf+E2sspCMlpDN
	WlowuUYS2HdrcX8IZyQZPHNZ6UxPm6giD4xThEBJqDulCVFou6tywVhvNz5gx6e/RcRsXnA/2xdR3
	rP/yeHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL37t-00000001JdH-2aLa;
	Fri, 30 May 2025 17:02:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2qT-00000001Dth-0CGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 968A15C583B;
	Fri, 30 May 2025 16:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12162C4CEE9;
	Fri, 30 May 2025 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748623475;
	bh=W5OpwwUyJIIM5VqI45VotpF5enCBTC5BSFX/2o6LIuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1LkJqF7WWdLxXgE6GXThQxaANeHlK2/YO+4RzDNtgNYnx3C+q6JJV6xO6BzxkDSr
	 rbmBm6Ds4EnWVMylvEy66N0V/cah6rL98swZNnty9fnd/nAQyNoZdWzLRq7ZhsHj7O
	 iXGOS0Pksrut4PgAlL2LECTnwUo6Q18qZdqUQJs3M9EBEkhH6NMc3JGZRYuQaTAQvz
	 n6mKpG3oShMiwwAMwUmrx/u4jqh9h1+nJkeFbXqK4hbvA8ieGj4U7cfguADG8B5u6z
	 LizuhbySsVIo8dDXJk7wJvkNCQ0vHVy9Y4KQgcrsLLhNXgPrGmDWRFTKAwa5qMTsQw
	 5ayriPv8tcAhw==
Date: Fri, 30 May 2025 17:44:31 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mfd tree
Message-ID: <20250530164431.GB7758@google.com>
References: <20250526140400.54ac8a6c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526140400.54ac8a6c@canb.auug.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_094437_129638_2A4FA3B8 
X-CRM114-Status: GOOD (  12.32  )
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

On Mon, 26 May 2025, Stephen Rothwell wrote:

> Hi all,
> 
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
> 
>   0ffcf5f1e41c ("dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018")
> 
> This is commit
> 
>   1d2c5d5f3f44 ("dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018")
> 
> in the arm-soc tree.

Why is this patch in the arm-soc tree?

-- 
Lee Jones [李琼斯]

