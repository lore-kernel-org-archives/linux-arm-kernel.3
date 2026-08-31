Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38DAC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oz2iYW11PJCarVGxxvigdGDmNXonQff7obHjaFc1C2Q=; b=I3zfifZmMSYX+BeGe9FFnh/BiS
	MXJqrFAoAizY7sngkDNc6c2VmwnSZYW/a0TIpXcKzoM/tZAW18W1PrnVfuec5K3A/AkrkdS8phlKB
	yggW7NFZkAZOMGWIlXuUKK35JsyhydB2VtFQH75OxKE20Uxb5422+qi3/GbyoAvCqFzrH/xHbNqWi
	jUGa16aK/ckPk8+acoGnorfAapGD/fFstLfPE3R5VlTLQc0iV28S2nWdZSpk2Dz3xjUcC/4b99SD6
	L55xHTq4WDST/WdjY3IVCpHGOe1bs4xcv1Gh0Wn5NbnRjqxy+ZSMH0i1DU6ztYNJm8pN1a6+nJM56
	7eNLgSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19N5-0000000AW6J-3hAE;
	Mon, 31 Aug 2026 21:16:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19N4-0000000AW5q-1d36
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:16:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A83660053;
	Mon, 31 Aug 2026 21:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30521F000E9;
	Mon, 31 Aug 2026 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211009;
	bh=oz2iYW11PJCarVGxxvigdGDmNXonQff7obHjaFc1C2Q=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=ZNFtUoIkaJG9P6nVESZEqo0cw8CCz5EJVPRvJs8ZVXNKdKz4IJjg1camWm197RZlz
	 MDR7hlatcAzYrTWAvZrWX2yCuCTAZwSoxDPbLDSBfcz3q8oIeJLVEsttZTKtP46CB6
	 pRqT/Av541c2nbRGp0TfQRdCWSslD3K6TXhzBIDFq47Mg7VpP2HgKLzrjsi0P9r7ps
	 1nQO0jBWSQ3zxKCO8OmwCisJDJirzVb5DDtbDD5omEK+CgsDZsYJeCkqcElO08XB/P
	 bICqL3GGTmPdvi1Zm9dhVN3pPoDw/UbQ/B4pZsEg8UVAQC6FzHavrz/9kDSOoN3SFY
	 E/FLiLwVknf7w==
Content-Type: multipart/mixed; boundary="===============7237600942549384120=="
MIME-Version: 1.0
Message-Id: <91b81ddb118dbeab295077ade10f2fdc9a6d4f09e5c5b07aff05a086215c7f90@mail.kernel.org>
In-Reply-To: <20260831202251.305046-8-ankur.a.arora@oracle.com>
References: <20260831202251.305046-8-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v15 07/16] atomic: Add atomic_cond_read_*_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,boqun.feng@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 31 Aug 2026 21:16:47 +0000 (UTC)
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

--===============7237600942549384120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> atomic: Add atomic_cond_read_*_timeout()
>
> Add atomic load wrappers, atomic_cond_read_*_timeout() and
> atomic64_cond_read_*_timeout() for the cond-load timeout interfaces.
>
> Also add a short description for the atomic_cond_read_{relaxed,acquire}(),
> and the atomic_cond_read_{relaxed,acquire}_timeout() interfaces.

The changelog states it will "add a short description" for these interfaces,
but looking at the actual changes, the documentation hunks only list the
function names under a new heading and insert the words "or conditional" into
an existing sentence.

Nothing in the patch explains what these operations do (spin-wait on a pointer
until a condition is true), what the timeout parameters mean, that the timeout
variants can return with the condition still false, or what ordering guarantees
the _relaxed vs _acquire variants provide.

Should the changelog be updated to say it lists the new operations in the API
section, or should a description matching what the changelog promises be added
to the SEMANTICS section of Documentation/atomic_t.txt?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33438155296
--===============7237600942549384120==--

