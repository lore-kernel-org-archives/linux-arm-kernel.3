Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE1EC55177
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/P9Yr3NyPl5CWWf1cvkXE/7u9qKEVbSvfgRtfoX3WMA=; b=u2dlPCtOCvnL8ONLoBJlNVSaGd
	xOB0XmcMyQZNXt1XAUkJMN5e7PzUm0ykTqTeE8robg7mTxDtvcmAq1s6nRZWWOI1y2Cz4SrjObS0g
	xEIUZ7hXL8vth7QF6p4gJBfOUXUMeeYK62w/yZ6E/KysKD+MV42eTfUioDoi5om5BW262qVKmzOtj
	SpPOwSxphelUrfhiHhh/kz1XDUw6BEqcs7nYr5qpK3Sk56UUusIGWUM/s+b0VU7W80VGdLcJkQYaD
	4jhO/IwVq9UAXucK/v65z1PP7W97BJAx9oP8V7MQI35z8UrGdFG96IATyxjlbgohGsN0BUJAiwm11
	OXklzRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV4E-0000000Fc1T-27K6;
	Sun, 02 Aug 2026 12:13:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV4E-0000000Fc0G-0HuS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8248A60A87;
	Sun,  2 Aug 2026 12:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECF01F00A3F;
	Sun,  2 Aug 2026 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672801;
	bh=/P9Yr3NyPl5CWWf1cvkXE/7u9qKEVbSvfgRtfoX3WMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y6Cl3yjMioOhVYPcDD+uzWXqT4fjDdyg9payanzrNsq2M5JWpQRJrv1jd5FqSnMxQ
	 14PhY9TWB3KRAOZhul3PDXDOvICXLHLxtCwAQU3Cy8Xe0IK8Q2p1wn8felyR+7nGMJ
	 n/9A62YJ8AcJ8lQAL+dJNggPP1+Z5JmBnOgBvozmgbK35wF6DCKPSuqUe0I8UgZBvZ
	 aMtwt4E4CWk6V8zPfHEO5mFXvZ1RDnWN9jBAM63+TSCgll48uDbs5onkoC7ILX/GEW
	 H/+nJ5AmbD4QjKDj8fSM2qKtfSSkpfL5Vt/krqwpp2hLkB+V9XhWcWW975jDwuSSUW
	 WQOp/GqBUhUbg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] arm64: cpucaps: Remove stale comment about keeping capabilities sorted
Date: Sun,  2 Aug 2026 13:12:34 +0100
Message-ID: <178566240020.4128780.5660795893318109343.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730132758.26039-1-will@kernel.org>
References: <20260730132758.26039-1-will@kernel.org>
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

On Thu, 30 Jul 2026 14:27:57 +0100, Will Deacon wrote:
> There is no functional requirement to keep the entries in arm64's
> tools/cpucaps file sorted alphabetically and, in fact, they have fallen
> out of order over time. Given that only the arm64 tree touches this file
> and the perceived benefit of sorting was to help with conflicts, just
> remove the stale comment and accept that we're collectively not very
> good at the alphabet.
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64: cpucaps: Remove stale comment about keeping capabilities sorted
      https://git.kernel.org/arm64/c/6c74dcb1e1b7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

