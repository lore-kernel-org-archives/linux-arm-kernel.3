Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9154C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 00:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXqeHgXUmXKp3ebnbfqH9ZLQzmTPLLBG8ssAtKzUzs8=; b=r2Nq7rAP9WwZo50cnBvVVrUVu5
	8moRG8o1+K/BBhhmynKNtyY6IOnpPHppBdJJ6HLhPh9AdeLKvf9BbyZK32NNU8xf7BjnR5LhJwnYO
	6aPJaydp0FbJODC47GH0sd3sT/bojt56+yf1+VwC8w7YOdptCvi3BF4lhw6daFmvOTlUAbx5IYh8y
	Ryrz8+g61ST7dDxnm7rC76io/QztmhDOflyDG8aYTx+Qi5O+QCcYuWSvziWKgzjKJ5fvbI5Z2VGQr
	bwr3aXbBRT6jOkUre3y0DdvpTkCLUFaGGvfQMpEb4o4vHAbtuLDgmBuSG7XSRjAffbRVnWxF9v6Tw
	XsrqmZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugv7j-00000000Pwl-3gai;
	Wed, 30 Jul 2025 00:56:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugv3K-00000000PYg-1dyA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 00:52:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6A59CA55022;
	Wed, 30 Jul 2025 00:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A10EC4CEEF;
	Wed, 30 Jul 2025 00:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753836737;
	bh=jkBmzSmPV94LC+ja+IPJ0d+EvqCY2J5S5RouHbBqu1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqLZvq7HqI12euM24CWcJEa6U0shJVZ6f5b+ORyJJpHm1fCWcisczNXjbJENKaSWj
	 AB7pp9gokr7/t8B9spmlxd3OTFtJSMPuhqmymFZqv0vWTNdEsjpg+ZXIeFYc3zcuLT
	 dYIAAAc9tngW9W9XTxXxWYjlF65vsCgqIEU5n6Lgspyr9hBcePqGLKXd3uIzSSApRo
	 Z0AfVfx5ZLtruj2j8QvtnZ4/UGNGE9oLwJpB+CivuHAWLbuLqWHVOdZlsJITEunG1J
	 2teScO4Cg6B20BOAazfK/7yHp+Lp/SM7neazBwUjveV82Ihc5TLKRe8rDpeZRxQkCk
	 3eZ5WbOKyVRYA==
Date: Tue, 29 Jul 2025 17:52:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: s5p-mfc: Always pass NULL to
 s5p_mfc_cmd_host2risc_v6()
Message-ID: <20250730005212.GB2984390@ax162>
References: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
 <9650d2e240a9170175069e3a4f6d6d9512d62aa3.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9650d2e240a9170175069e3a4f6d6d9512d62aa3.camel@ndufresne.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_175218_493962_2ACAA4B9 
X-CRM114-Status: GOOD (  16.82  )
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

Hi Nicolas,

On Tue, Jul 29, 2025 at 10:24:22AM -0400, Nicolas Dufresne wrote:
> Le mardi 15 juillet 2025 à 15:13 -0700, Nathan Chancellor a écrit :
> > From what I can tell, it seems like ->cmd_host2risc() is only ever
> > called from v6 code, which always passes NULL? It seems like it should
> > be possible to just drop .cmd_host2risc on the v5 side, then update
> > .cmd_host2risc to only take two parameters? If so, I can send a follow
> > up as a clean up, so that this can go back relatively conflict free.
> 
> It seems so yes. For this specific patch, I would probably rename "args" to
> "__unused" to make the reading faster. But does not matter so much if you later
> remove it.

Yes, after this change is picked up in a maintainer's tree, I do plan to
send a patch to remove the "args" parameter altogether. If you really
care, I can certainly rename the parameter in this change to "__unused"
as suggested but if you don't, I will just leave it as is to make
backporting this a little easier.

> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Thanks a lot for taking a look!

Cheers,
Nathan

