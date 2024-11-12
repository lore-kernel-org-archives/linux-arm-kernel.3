Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B96D42BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCXhrAJEmTt/SweXQxzBMWLHHADxsj5ZsngMEfwzYQk=; b=MMCrx6fGldMBycLs4klq1XGBeb
	8qpqRLAIqDwj/JEKBl2G9dyYdEPYsNRGbUV1OyXbl4ObqSNsIvomLoErAxW8UGpJpy5g85KAU2I06
	kN7JxNeFrKXRlaRCi72xaM5af4z9iMhm9hD2Os6gxoc3A+OOSAB9av4yJ2araLBkHNEhnxnTMf3wK
	jLduk1YFhqcsZKuYpxb5DhPEGHew5nNcNZNblUy4gdThO7dnDNYSR/pdTDXSU3V8e0RbNikYa9Pgo
	MlffFOD/224zJUlR3KUox0sSle2jlL6RGLoPgSsM1znvrT2b+URnz4uIWCObSR6ksoq6UVqhAntzl
	MPtHbtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtVR-000000045zN-03YK;
	Tue, 12 Nov 2024 16:12:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtQh-000000044wA-0LTo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7C88A41E40;
	Tue, 12 Nov 2024 16:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2109C4CED5;
	Tue, 12 Nov 2024 16:07:43 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Check that SVCR is 0 in signal handlers
Date: Tue, 12 Nov 2024 16:07:31 +0000
Message-Id: <173142698241.893467.12887782665454097847.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106-arm64-fpmr-signal-test-v1-1-31fa34ce58fe@kernel.org>
References: <20241106-arm64-fpmr-signal-test-v1-1-31fa34ce58fe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_080747_203422_3BEC328A 
X-CRM114-Status: UNSURE (   6.83  )
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

On Wed, 06 Nov 2024 17:07:51 +0000, Mark Brown wrote:
> We don't currently validate that we exit streaming mode and clear ZA when
> we enter a signal handler. Add simple checks for this in the SSVE and ZA
> tests.
> 
> 

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Check that SVCR is 0 in signal handlers
      https://git.kernel.org/arm64/c/116e50d6474e

-- 
Catalin


