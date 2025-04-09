Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2972AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlYLujFgzIUO9x3mV7brDn0xcqDIlmrWS7+6SvRPM0I=; b=FO/IxB5BvfptVU9oF6eC8INDpf
	mSEBYuLId82XNlIBG3QKhhgJtW5EWAw8JroPkQV7zdX+bmZhhoRYTEqRcvAHjckYkmZkmn3kiSfe7
	tmq6ZuIZn+XGwu9890zRgPCZ9VVZ1Fbsm/m1t8yOB0ynrpHLpYsm7PYP2xoIC5RV+EUWnJt/E3qCv
	SFyDO/xUvrHVZzVIxQkNIzdJnW7bTc9vsbZwKlcWwLneHWsrZxToJEBHh+HbOPOuUySzSYpGvz9xB
	BkvQhRi0qs9ZW5Q9wF8JiQTLoBsaH2C2htQJY311fPsmn1HRTpIhWWZROthaOvRgeC6fl4M2aR/KU
	rT2pghkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Z4q-000000081hL-1tQh;
	Wed, 09 Apr 2025 17:19:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Z34-000000081RN-4B4T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:17:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CA8A615EF;
	Wed,  9 Apr 2025 17:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA331C4CEE2;
	Wed,  9 Apr 2025 17:17:12 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>,
	ardb@kernel.org,
	broonie@kernel.org,
	maz@kernel.org
Subject: Re: [PATCH v2 00/13] arm64: Preparatory FPSIMD/SVE/SME fixes
Date: Wed,  9 Apr 2025 18:17:09 +0100
Message-Id: <174421878646.2870912.3802724291984766270.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 09 Apr 2025 17:39:57 +0100, Mark Rutland wrote:
> These patches fix a number of problems in the FPSIMD/SVE/SME code, as a
> step towards re-enabling SME support. Additional fixes/changes will be
> necessary before we can re-enable SME support. I intend to follow up
> with more patches in the near future.
> 
> I'm hoping these patches as-is are largely uncontroversial, though I'm
> afraid they've only seen light/targeted testing so far, so any testing
> would be much appreciated.
> 
> [...]

I added these patches to for-next/sme-fixes (and for-kernelci) for wider
exposure. Not queued for upstream yet, I need to review and discuss with
Will whether we target 6.15 or 6.16.

Thanks!

-- 
Catalin

