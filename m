Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE637F8E497
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 01:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rexyT2iehtBU3zUQ4xS3C+FH42ieixAKEaurXUl26T8=; b=g8Of06QSYkjDftJJ2klPDbwC4g
	bBZfIL4+Km+VYfLWVWmsBr0hkv0kROpM+PHiUi+B50vPC6STKypTbXHn3l4SaEwM6/uTlJKXKt/T2
	n81ikP1Ph34L8+TFgNnQBEJg30X0hJtEl0V/OTrLn3X795DwcfxyDFhI1tCquP7vAbgbD0zztmaf/
	RwZcfHjnMR8CRUcizdgHrBuOPaoCW26nnBi/cWpyq5ENUC0n4jXkYFDWmevmpka5ZLwIqVgXyc9UC
	kXeZy+JLljYW/t05hoi3/BGElJp4a19++sKlOjjUMErnU0uT/ZmVyIIC4JELCpI/XNYSsqRnu2e48
	V+e06O1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDXjh-00000003GhS-0KRc;
	Fri, 17 Apr 2026 01:11:09 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDXjd-00000003Gge-0ugR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 01:11:07 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776388258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rexyT2iehtBU3zUQ4xS3C+FH42ieixAKEaurXUl26T8=;
	b=sUBToCGQ1iXmIap+JS4K/AzIK1YlVeuLGoCFhuDd89LlSMm5Isyk01MvFNjFRXiZEABGII
	Zn0sJQZeq0p5aVA87wveRR2iDbnrmpkl2gBF4zquNQUA08NPoMIS+X78YfVBfSaBocmGDO
	FJnjRqtjVwg7zzx0RwG+wMRq08RwJaPJT7YCJ/GmEMW97dYZH1OZDzzDN7RwoSRMUBxfdA
	DH+Z9pMUu43iMmoT4euXm9WHRqImWMQpOTbI1YJg7m8/sPLzA8dlldFITNVEBY2K6dAK8O
	MlRcN1dRVy0YI/9mkry1U4cWJMVLWKsds9ktvHGXPiy/s0DCegWuLUZHy19EPQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 18:10:45 -0700
Message-Id: <DHV12UBOCLQR.1QIPQVFI10VDB@postmarketos.org>
Cc: <craftyguy@postmarketos.org>
Subject: Re: arm64: Supporting DYNAMIC_FTRACE_WITH_CALL_OPS with CLANG_CFI
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Clayton Craft" <craftyguy@postmarketos.org>
To: "Puranjay Mohan" <puranjay12@gmail.com>, <catalin.marinas@arm.com>,
 <ast@kernel.org>, <daniel@iogearbox.net>, <mark.rutland@arm.com>,
 <broonie@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
References: <mb61ph6hsxj94.fsf@gmail.com> <mb61pedcvxdhw.fsf@gmail.com>
In-Reply-To: <mb61pedcvxdhw.fsf@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_181105_898010_0DDB2D92 
X-CRM114-Status: UNSURE (   7.62  )
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

On Thu Feb 29, 2024 at 11:43 AM PST, Puranjay Mohan wrote:
> puranjay12@gmail.com writes:

> I hacked some patches and tried the above approach:
>
> Here are the patches(RFC) that I created:
>
> LLVM Patch:

Hi Puranjay,

Did this LLVM patch ever make it upstream? I'd like to use CFI together
with BPF LSM on arm64 and wondering what the current state of this
effort is.

Thanks,
Clayton


