Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF86DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fZKPZYug4c8w9BrRGO8SiYaeGV7AUSF78ZxE6iWYOM=; b=KlmyA0SUBK1WeJMewzbjmqtBmK
	rbBq1tulX/4iLC0TAKUY8z4O0nTBPjVLpr9z8bvEeiJvpgWOQBDn8DX9e84qsH5yI31SRRe/0i39a
	5exGN4NaJoadnF2C5iikBPtBFYqZxWWkXarsaBrPWbipR+sUIpYJeiCTXAzia+DSkZeEhit/XBKyR
	sYjgnKNweO86lrkGnY1wvZivdbxeRkSuFTGFsBm7BZnTAAXcV0hZ2hgTueY8/UBHQl9KYmlqwxVOS
	3AsYypgVHtNUQAka1Mg8iJBCE10WtFRKJOKGbJEzXZTBMVmIB6POUEZjc+w7ydb7ktSZqzRHoDyFm
	/l+nbKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8YU-00000004PTd-0p8l;
	Fri, 13 Dec 2024 16:30:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8XP-00000004PME-1TH9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:29:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 637725C5B7D;
	Fri, 13 Dec 2024 16:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D871BC4CED2;
	Fri, 13 Dec 2024 16:29:08 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Weizhao Ouyang <o451686892@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: abi: fix SVCR detection
Date: Fri, 13 Dec 2024 16:29:06 +0000
Message-Id: <173410734417.60926.833029036075275376.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211111639.12344-1-o451686892@gmail.com>
References: <20241211111639.12344-1-o451686892@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_082911_427286_CAA9DF8E 
X-CRM114-Status: UNSURE (   7.50  )
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

On Wed, 11 Dec 2024 19:16:39 +0800, Weizhao Ouyang wrote:
> When using svcr_in to check ZA and Streaming Mode, we should make sure
> that the value in x2 is correct, otherwise it may trigger an Illegal
> instruction if FEAT_SVE and !FEAT_SME.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] kselftest/arm64: abi: fix SVCR detection
      https://git.kernel.org/arm64/c/ce03573a1917

-- 
Catalin


