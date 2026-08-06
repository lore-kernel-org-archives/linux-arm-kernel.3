Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6A4C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzg4oijdQfL4a+SOwfgD1mEqalS4Z4bgOGtunstsnxc=; b=QzPvSkJUiQxcBYuQIzXnyQIV/K
	yLqTtgz37vFvg+7Qo0yXk1e1st8Av4Ys5c5zSNPa9aXCRivRttETFjQvQaMFrXUHRJG8hzWkX1k8h
	TymXdmuTwlk+jL5/tmJW1on+k0GepKbNw6uI2YoaeKR15gzaNWzXtTr81bYbRysKXSjyqxKG/ZFOm
	vpnzEOsQKIjMCpUNXAjh4JIluXo2flKOMlyKHDb890dOWz7hMcux33FJAItBSbCw0dpExBp8mG6mu
	bGhG1RoGvahQibROOyiZuTSdENgVuFasm8mJR2gW7YOEhcaGKGNLy8sQWRx1zgQH8gFmTEl8p0kgZ
	//ggolTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1du-00000006Ktp-2j42;
	Thu, 06 Aug 2026 17:12:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1ds-00000006Kqt-30iF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71F0041B45;
	Thu,  6 Aug 2026 17:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D71B1F000E9;
	Thu,  6 Aug 2026 17:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036348;
	bh=kzg4oijdQfL4a+SOwfgD1mEqalS4Z4bgOGtunstsnxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=djQytoxPj+BUhDG7QcJUbZet4DYdLJSUST6i1DYyt/DByCt3pD29F+IanPw6xkXCs
	 sUdct06IPVcQe2Jl3lxWWp9VQQFwkRia8IuOGqIXZPXprbWyLhZZ347J4GcaiuSyNg
	 nE2OIVxLGqAliWTeBUzZLIhYdKvbh0JS2Wk2Al9YLP72m9SB0dvLJuKO8P1DhjfWNv
	 ACQ0o+cAc1m4zJioJQydmyk85t0b9kxntTXluON2DHcnBQi2QoxtM5d6/z2r5rO5ay
	 W9hKGynykjw5GXIHivdHXnGOrGaFXbM6Y0czPVKyE7nbeb1cV9++C4PS1LE4Vy9rQW
	 Qs0EjQS97H52w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: arm64: Add Mark Rutland as an official Reviewer
Date: Thu,  6 Aug 2026 18:11:48 +0100
Message-ID: <178585197062.3660412.12325972019127903509.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803164230.25172-1-will@kernel.org>
References: <20260803164230.25172-1-will@kernel.org>
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

On Mon, 03 Aug 2026 17:42:30 +0100, Will Deacon wrote:
> Mark has been part of the arm64 furniture for as long as the code has
> existed in mainline and is consistently one of the most active and
> knowledgeable reviewers that we have.
> 
> Make it official.
> 
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] MAINTAINERS: arm64: Add Mark Rutland as an official Reviewer
      https://git.kernel.org/arm64/c/71dae04644e1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

