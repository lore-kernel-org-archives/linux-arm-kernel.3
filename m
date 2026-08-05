Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF92EC56201
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9bnOh6M3Bsb/zcqLOAeb7ppFeVGT3UsgRFnzDOfzZc=; b=O+/U/01Mrltr0Njyfd9TQloQun
	Ls7JmQwZKU7A/9bd4ZlWr/89W5lqU4cF8jJADp1LqsNuUD8V4LtncEGIeDFzUMxTZyxFga/bhRhQh
	0h0wdXBq7C++mzZOKlVe5kfZ7HKUPNX5KMmw2pa9nGQBkMTt3/IhQCbQyr8hCnhjB0Vx18M8zr60k
	l2xABqjLRsVm7xheCfoHmiSRxEAsMYnXG5RR+mC4FfzYgEFqfnqsAkYmjuDvb0/VPguxiKGpkWmVM
	xCgzT3uCcCop7UAupqvsOBcnBCxbAXToORqLT7deUzFdfuReNXKaKkp54lMolr0jD3nJHnYv6mL94
	gYreKnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPoC-000000030w5-3FEE;
	Wed, 05 Aug 2026 00:48:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPoB-000000030uO-0rbC;
	Wed, 05 Aug 2026 00:48:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 363B243E3D;
	Wed,  5 Aug 2026 00:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F681F00A3A;
	Wed,  5 Aug 2026 00:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785890914;
	bh=w9bnOh6M3Bsb/zcqLOAeb7ppFeVGT3UsgRFnzDOfzZc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=oVTfEnvwkErL5oBz3FZvF2Z41vznZz+0orAyMZGepRhjG8wcuzjvsWQnkFaFeaNt4
	 pRf4y4IQld7se5c4omTHlD0RRtGtzDQDu843g+xqembIm5r386ocpmLYshlXHMEplI
	 jFa6f+hHDwkUr40qMRe71l7UCoBsakZkXPPzU4CPpnrPRv4rFah1ApAAgoDjTS3E+U
	 fhRrreSgmbWVQcOnrShe9Ikz8a5D+BQrIQK+vsJ9R9+pGOvWzNa6EdiUhvCLCyobTF
	 cY/XHZviG4b4r+wdQ9JxurzqF/6pDuM2zwGBeeg7l1Qzjviih/+328KD+Zjn94ApJq
	 MzYt7kSKUD4LQ==
Date: Tue, 4 Aug 2026 18:48:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
    Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 10/22] dt-bindings: riscv: add Counter delegation ISA
 extensions description
In-Reply-To: <20260701-counter_delegation-v8-10-7909f863a645@meta.com>
Message-ID: <b5e736ec-1a61-95a0-970f-e9f4eb6b62a8@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-10-7909f863a645@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 1 Jul 2026, Atish Patra wrote:

> From: Atish Patra <atishp@rivosinc.com>
> 
> Add description for the Smcdeleg/Ssccfg extension.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks, queued for v7.3.


- Paul

