Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B859CF58C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPQA4Dr3vBorL1dzId/dpD2cuvLcZ6linW6uYCaO6Lo=; b=V2W7MXduWRCe7hI6Re5IKUNT+0
	R4tkbcSfeceuXxyZd8a9MUgH5FXDQmczAe77zK5gKoXjArTZFTECtgExpPIcAzcRXqCwQKjGphzfB
	UGtTdrGsWgClWKVaNaVx7jXMp6C1J1a/sWEDqadwSLllQPNIR1sxWAQ8r3FNeW8QnGxss+5Qzp31x
	dyHedctQJuMhG4TdCl5yXcRx2ZWIiBcb/RPATvIJdkzk8ExY9QDXyA76LfU5UKMKNFpR2bPOADabN
	+LqouZaX5cFoLvkTIDK7ITfsHDx/e+XJs1AQOdxvulej4lbgz1bhC2dwMgR65u3TkAtWCPndKrsp5
	2jmBhvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnbM-00000004ua9-1b5f;
	Wed, 19 Nov 2025 19:12:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnbK-00000004uYJ-03TE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 19:12:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B0BB42ABC;
	Wed, 19 Nov 2025 19:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB98C4CEF5;
	Wed, 19 Nov 2025 19:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763579539;
	bh=IKAlcYGTKdJXVFZdjwTp/BjIGSIhrX8hMQqbZOGJqM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tg/soZymer9O+wnKEmzv77mKDYj6GwA+JijOhY9gG+zR00pB2MgkkDM897KFbquM3
	 prPdtyogNJ/tnCoRh7gsWNvmPeRVDnURUN9OgUdrImcDWcvm/WHwui5dhI26hAFoKS
	 qsdeLUU4A8rES/F1aSkIn72nsLga/VUCRqF28ni+4Shxa3MuE1RQ/kma2JO+t3MFb/
	 kWqDnyzIOtHjkqRkn4pETqB8iji6nuHDniZ043tf/h9Upo+cuv8Bzl9Nx1PA2ZeexO
	 WqXLMyzLZpnrKswkVSkNSUjkOowwgIVLx5U/irTothpvYjw4+fSN1P7NsYnlXhDls+
	 rdj7pvDGzEb5w==
From: Catalin Marinas <cmarinas@kernel.org>
To: will@kernel.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	patches@amperecomputing.com,
	cl@linux.com,
	Shubhang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	geert+renesas@glider.be,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	soc@lists.linux.dev,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2] arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT
Date: Wed, 19 Nov 2025 19:10:55 +0000
Message-ID: <176357945539.2095097.9737276524353571173.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021075704.527626-1-shijie@os.amperecomputing.com>
References: <20251021075704.527626-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_111222_093990_5B4108C7 
X-CRM114-Status: UNSURE (   7.64  )
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Tue, 21 Oct 2025 15:57:04 +0800, Huang Shijie wrote:
> The patch "7bd291abe2d sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig"
> has enabled the SCHED_MC/SCHED_SMT by default for arm64.
> 
> So remove the redundant code in defconfig.

It's usually Arnd picking up defconfig changes but since it's more about
core features, I queued it.

Applied to arm64 (for-next/defconfig), thanks!

[1/1] arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT
      https://git.kernel.org/arm64/c/a086f211a3b1

-- 
Catalin


