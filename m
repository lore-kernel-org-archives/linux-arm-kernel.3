Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2935FCD0424
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SR9cb/NIAN+TDe+F6HqYgKFF2Uv1cZydE7v0ZjsLoDc=; b=WXPM7b6znQVAt8gv0eh6S1h433
	UtsfB+dgXf+rBzlweAIEGJAb1RPjPa4eQmmExcTg43jaegePCFZCxrJdlBze3HFzhphpNFR46n0QH
	y9Vem9cH3P4jjHzlBx7Y+OEl/l27Ixm2s2Q6p/lV32h2NbgVNFTQlcQI31vT3rbWX5VzCUPXc1f2y
	lUxz8iM9aNmDoul3GXC4QzOfG+d9DcTk0u0nuuREuWuw25fM/21hwV61s3nvT3oOLC9c3kk1JpCZr
	N4F8YHXnsmc4bm0jQ3AkXlWIAE3i2Zurt8sszeYfJp9WbEwY3iO4HuqMdodjTj0Jyc/4NwGEjK/xQ
	AEHYejlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXH-0000000CCqI-1Bx6;
	Mon, 05 Jan 2026 22:58:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXE-0000000CCpQ-3ns4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:58:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91CB842A2E;
	Mon,  5 Jan 2026 22:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E911C16AAE;
	Mon,  5 Jan 2026 22:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653928;
	bh=eVFCFughzWlleH6dRyl2s/mRvVF8Hq50KtBaaSeHaKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mw9S84SFVQ9vZkjs3dY/ABZIsCCfHcb+c2xNb+ToYs3bv3jbPUHk9qosudiEfJlSr
	 veQa8LoOS7kwNdGEn35dSHMfcwDCfyXDR8hBrFU43GTGmTXg1XyHgfpP3fzzpK2wSG
	 zzjaGLfs5Bl4pMnTFrI6Qk/C/kFvFEZGpm4dJygGi3kzAP6pbQb9W4C0NDBhFLSLhN
	 4e/XTY4zbTFdtXKoLxn5hTh/iQgxAK/4krPvRH9dEi2lMOgygJcpkyaaRlVxXD/XjN
	 M6gXdPfA5FCifDMoxWlWelVep+R69eILz5QhmFHnB2xtgLq8kGsTVahIa0g9O2HniJ
	 +5to89oOMPdNg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Hanjun Guo <guohanjun@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Update the maintainers for ARM64 ACPI
Date: Mon,  5 Jan 2026 22:58:22 +0000
Message-ID: <176764576478.1442346.3568871194644962163.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219144906.348353-1-guohanjun@huawei.com>
References: <20251219144906.348353-1-guohanjun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_145848_968467_936BC7F5 
X-CRM114-Status: UNSURE (   8.67  )
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

On Fri, 19 Dec 2025 22:49:06 +0800, Hanjun Guo wrote:
> ARM64 ACPI patches go via ARM64 tree, but the listed maintainers
> for ARM64 ACPI don't include Catalin and Will, and there is no
> F: line under the ARM64 architecture entry, so emails will not
> route to Catalin and Will in an automatic way.
> 
> Adding Catalin and Will to the maintainers entry for ARM64 ACPI
> to fix the problem, it will make life easy for merging ARM64 ACPI
> patches.
> 
> [...]

Applied to arm64 (for-next/acpi), thanks!

[1/1] MAINTAINERS: Update the maintainers for ARM64 ACPI
      https://git.kernel.org/arm64/c/e97e3e31d898

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

