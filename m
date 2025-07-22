Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14FBC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xOJq3V18JtheS0jk9r4/nf24c/guEXGlXAf0l9WkO4=; b=fv7lU9DFqwXBwB3R+ZXDr4zEYF
	aX8Zd12dqNVctWnMKEfjKnDLgulGz/oIzjotyhy8SO1dRB5Pq1R7HidfyijlQaoLbio3uoEO5xPn2
	hNAM1aucWeafofA2EVpX4ZZfNuc4k8mrVb4auz58gerxf1+GwJESEPx/LOXOz7YxTg7bi70KmPmEL
	bAKdlFKl2jaWJJmWWj15flGi2//H3bkUQ8ly/WM2NUE3LanlXJxgQDdWYSb02Db1FjfC5A6hZZJ+B
	jdDdni57riPAe4NUAS8JVOx+yOS2CIzLLwX6UF0dU+2JcjR5q6yK+kHsR4or4lHwdAmTsUGBPwIsi
	qKgb/XnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAG5-00000002AAn-2jti;
	Tue, 22 Jul 2025 10:30:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9xg-000000027fY-42Gd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39542A55EEA;
	Tue, 22 Jul 2025 10:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E788C4CEEB;
	Tue, 22 Jul 2025 10:11:02 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Allow sve-ptrace to run on SME only systems
Date: Tue, 22 Jul 2025 11:11:00 +0100
Message-Id: <175317903265.3058188.12275051311356684269.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718-arm64-sve-ptrace-sme-only-v1-1-2a1121e51b1d@kernel.org>
References: <20250718-arm64-sve-ptrace-sme-only-v1-1-2a1121e51b1d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_031105_071538_9B3EA83A 
X-CRM114-Status: UNSURE (   9.79  )
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

On Fri, 18 Jul 2025 19:33:16 +0100, Mark Brown wrote:
> Currently the sve-ptrace test program only runs if the system supports
> SVE but since SME includes streaming SVE the tests it offers are valid
> even on a system that only supports SME. Since the tests already have
> individual hwcap checks just remove the top level test and rely on those.
> 
> 

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Allow sve-ptrace to run on SME only systems
      https://git.kernel.org/arm64/c/b5cebb5de9a8

-- 
Catalin


