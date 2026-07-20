Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F50C44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BreNlZNT5ZTae8ushLrJu7lRuJzqIG3wpbhbbx2mYvM=; b=j1haKGoIxgGG31HPep0CHy8CpT
	iB7IpBGKcRhIZ1ddq1HNBWnKqBFYjASgvtGTvrpAZBxgYSlo1QUuBo7yUdPc6LYIc5V2GFrJwSoZ8
	61H0+rdDyymtp70/7clH5bhDXLKskKVetRautYRhCzbPYopkniphBvfjfV2Oi89Mmb07vAT2HmlM9
	QpaVvLa3/MDp+c79ALSZ8vn/1x1O7zkbKBEpg6KOmrvg7IPQUDh9g3PnknpX0H/W2+B36VvpBjEN8
	5HYE1E+YE6sTWrGR8zshK1p6xVHAmCMAwEs+1GkpMEFzvOKYdLKT7NrD4lMfU1C4sreDSrmj/q8mL
	pwH1GtZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliOd-0000000658u-00CC;
	Mon, 20 Jul 2026 07:26:39 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKd-000000063Kw-2zFH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:35 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38e88b60121so154260a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532151; x=1785136951; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BreNlZNT5ZTae8ushLrJu7lRuJzqIG3wpbhbbx2mYvM=;
        b=SCYotGmCBddzBRfKjozlcogJNH75Sr3Rjh4oXS4HpWDjKoONvFSGI/pR+ru6HCcD7e
         gge+/Rpiry6rEV2uOfLgmfY7Q8KdMJcHqa1SY4GqxucGCrTLt+2Rl0PR/doTh9v7BgHo
         BTkYOE6tWAtaYkZzB7FKId4dAQbYa45+Xvbx6XWgpaOPfKVecRxXyTQ6zhgxXcs+QFZD
         JrJbevwhop28/CeSW0QDkm6ff/oqLhyZknQrKy+zMRMVG6Ov/DQ+QhVo6xG/VOg8rztr
         N3IswnXo0CHQQX3F9krFGd0tMJ9sLBw73MfnyRwgilzyHRjcs/Qjw1s9V8M6NRNK5Uec
         n5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532151; x=1785136951;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BreNlZNT5ZTae8ushLrJu7lRuJzqIG3wpbhbbx2mYvM=;
        b=elX+ZT+sdBUzOsMsANP7Lh3LXZjGbeMtvr4kJ9/pBNTRPH5MtQ89oZOGNIa2+niGBd
         SxsDVEgCvXeYj6a0+lTg6IQ8x5mj+PTS1HJS7n4y/zVMmSNvNu15eKT7ELVduw724E4B
         r2vmYrwPemz6EOMd89GkdZo6oWzYGBuwidQSiAO0zMY9vHab5v7Uu34cJ8xLyR0vacYH
         LmX/Tn3tDhdjdiawOEfHAXyF9DVN0njEjj5hiWe8VY26lgEezeTWKFPn1cJ9yT/YZmtD
         hRWjvUbXu592Z5UMs+60R4ZRM+D8U5nhDEl22gPyQAzqukxPnHq0p/A6ysMBGp+ZV9VT
         R9IA==
X-Forwarded-Encrypted: i=1; AHgh+RpEV4HsuHw2N+c3X5GRWYnJgdg5xjCr3mTfQ/tG0Y36xbRTlfelbCYp7CFCwEWecOG5IHvzHA2r3fp/KWaQtZed@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8yIEFJxgUSLNZYsy4yYfFsRLOvF1eBwgjA7IQ7Hi9XjHGVSc0
	21gSO4CBXiZ/A5wNa/G5nfOJRUH9cqEuRnzVRkeb8iIXPmVQfn0SMmKk
X-Gm-Gg: AfdE7clFpwQBSC84Dli4IUXUFi7kw1AbleZfXERgACgMLfCwr8JjkChfFx/zPS1Bf0v
	NehPl4ICerfyFEHIwjmHJ5WFEnzA323cDR5UxjgdkXfX5eqNBEUNon8enNWDFoZr1D5Zy9PagXN
	ZdZ7efacNwabRkmawZW73UtxnuoLvFTc6YDvX1Kacq9edRR9j4M/frIgdw206eVgFht0QTB7md2
	4GqzUhwLk25J/7xs0s/W5X/X2XKiD3IxQ08yv5RNxk8mXkxl6VbUcWEIrUE6sn8en8OoM6waHNf
	pZVPgcUdJIQOyBP8jYMGGcnJDy7MMIU3SwaWSI2AVU9249JaYK6T4Zlk8ocmiD+L9/dO+vC2klS
	I0xzJLG1hR/bXUJKsdtnAFOrIcpNvJX0bNWbdIR3g6EwTTZ9EeeqwMY3WgfI+wyZWnJLlYQsQp8
	n5w0yNtr/k8UeCDJMOu8+oKZEUQ/zm
X-Received: by 2002:a17:90b:5288:b0:38e:3542:212 with SMTP id 98e67ed59e1d1-38e4b4462f1mr13603782a91.13.1784532151069;
        Mon, 20 Jul 2026 00:22:31 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:30 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 18/22] RISC-V: perf: Add Qemu virt machine events
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-18-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-18-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211941.543975.9634559400279652785.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=763;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=vDMk1wbG7BpjO3r0gVy/Hpmtm/NTf4pFWtYcM8bSSl0=;
 b=dmChx5rGUuDAMnuQtfGv9m5CW9Vq2JsgbQMCPFYlQwlS3eI3VeyPYIFdDGrGWQEMegLQ9tc8z
 K8oWm1FcKBQCC0SbvGetMGFrcPiKGQMa9ah+iJXURfEGhOJ6+spv4/0
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002232_157265_E21256EC 
X-CRM114-Status: GOOD (  11.29  )
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

On Wed, 01 Jul 2026 01:47:06 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Qemu virt machine supports a very minimal set of legacy perf events.
> Add them to the vendor table so that users can use them when
> counter delegation is enabled.
> 
> Qemu is identified by its marchid. Older Qemu reports all-zero
> mvendorid/marchid/mimpid, while newer Qemu reports the marchid 0x2a (42)
> allocated to it in the RISC-V ISA manual [1]. Register the events for
> both ids so they are available across Qemu versions.
> 
> [1] https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md

Thanks for doing this.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


