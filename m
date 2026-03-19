Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455EC1075270
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fltMQB3jCUL+STupFS1SyUaktuuiybtq2Zl80nXrQNo=; b=Us7wdHj9kjstMDf8DQsLzpp5Jx
	DK/vVWlHVMDzoGRcwD96OeTWvz8EVrtsEkrIngeY8BntLWQrNkyMpG0pTAQOLIenwdq7nlnBrL76E
	APQpnB7k8A/Q/nVKDEM0lbHCsGk2mnBxO/3tOytSC7uEirj/ro/KAfOISFM3gHibWx7YErAFXUpDR
	DQzfF3HLr0rhTqQHfKSXJRdkYRmUdz4ut5N/RG3vE6JFuhaBPfswsWcqlZzvtHFGDZih8B63DJQlS
	H+07wKSi/u3E11ECNHz1jRziJd+s3/Y7JDnfLbV7QI8TRtPK30pASaK2BCu8cd5HnalhlfF+/GQIK
	W2cFs4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H6x-0000000BC7l-25q9;
	Thu, 19 Mar 2026 17:24:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H6w-0000000BC71-24Xh
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 17:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fltMQB3jCUL+STupFS1SyUaktuuiybtq2Zl80nXrQNo=; b=foD5jQ5l7zasvCl3I92eKHdaDj
	jk0SeBSwX7rARsgyZlOkKWuWox2SJOvNLm6LLKSnbt4aS42rfALQmd12kX2Ia9x3oEZ8RE2BmguPy
	WSKl0aWEZiaYXwWGcOQECQCC0XDsprK6ad/UhtOAGGYqjCBJ2EymbLBrZUepP335AbuX9kpHioTbs
	HQnGBe4agqblTYepWmVgqBA0CKgLoxATjsaIiQ4+ADunM5ACmyXOqe6ikmM6O8oECySadvXVXjRkw
	jZZmOZtqIs9KqixcjkFOChyXt9MlLarKsbwVGbGYCkuTg4no6srD4wTAY4QPUWVKyhn3AlaTNfl7T
	OhpZXTEw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H6s-0000000E6T5-1j4w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 17:24:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2A9B43B46;
	Thu, 19 Mar 2026 17:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0829C19424;
	Thu, 19 Mar 2026 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773941076;
	bh=JvTLHSOBhUF/6vqMPnvIVIvuJSrupAXFYpy7t/Os+hA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jmk5gZFUCxSCovnK7nD+Jsq2UsCVCC0wI771FK/M/zf6A2N2FEa2gUV5/sSOih+cY
	 tZHkeSkauFuzbgJox7Ev51Bu7wuTdYxZLlHlOgVr1Mr4psOa4o4qzZY0AAKiXBCvUU
	 nTNz0QuQJPA6VB1jj9smFPMv3H4yq6FdWPpq3kdssCjq26kdZbnquOrRrkS4tJieTC
	 ehkw9/VGF6trhzDrbAPLcAizLjzesT5A1/0aTk5GECHjkpO3kQqqO2sKENujThZbGb
	 g40tWfLQkvZkTgyQGsKoH8OABVKsRDLFNQBct7WwLjvCYP5xMTz2JEJSuW/7S7QLy4
	 4FLeSO84DdC5g==
From: Namhyung Kim <namhyung@kernel.org>
To: linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org, acme@kernel.org, 
 Mike Leach <mike.leach@arm.com>
Cc: suzuki.poulose@arm.com, leo.yan@arm.com, james.clark@linaro.org, 
 peterz@infradead.org, mingo@redhat.com, will@kernel.org, 
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com, 
 irogers@google.com
In-Reply-To: <20260318103640.464982-1-mike.leach@arm.com>
References: <20260318103640.464982-1-mike.leach@arm.com>
Subject: Re: [PATCH v2 1/2] perf: tools: cs-etm: Fix print issue for
 Coresight debug in ETE/TRBE trace
Message-Id: <177394107584.14914.545377108953674625.b4-ty@b4>
Date: Thu, 19 Mar 2026 10:24:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-02735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_172438_736207_64541A52 
X-CRM114-Status: UNSURE (   6.18  )
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

On Wed, 18 Mar 2026 10:36:39 +0000, Mike Leach wrote:

> Building perf with CORESIGHT=1 and the optional CSTRACE_RAW=1 enables
> additional debug printing of raw trace data when using command:-
> perf report --dump.
> 
> This raw trace prints the CoreSight formatted trace frames, which may be
> used to investigate suspected issues with trace quality / corruption /
> decode.
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


