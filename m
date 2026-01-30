Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F1AD49C90
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35O1ouPQq7JVxuQaJXJKItVDeVyxmWIq/ojltmrU7Ys=; b=kxBZXks/lpyJusV8qoHILbRFwj
	0+X+2yHISijzXWqvz6JQJPCHFgh0uOWf6sg9fiP1s2M+0gCqdHoxVh8iejzQuU9ro6XLwx1hsBr6l
	jD5S01T45y3+iZJ96loSSfsMugqk7tKdePaav4kN/GKoN6m6KZOSvvksv+z7czQ41JA9NNskIwGyR
	zcA4QNIbWb34fgYf2DHxR8xpDtqjl5XniyyitNYwZQ5rqNd0tAoMXMUJaXrDAAu6HstQvsul0hUrY
	i6rlkQ0NLuHoAb6H0MvipmM6qboa6OqCHzwT8UoLANwNmSKzQ1fVFx/LI/eysuAjX3U7WP1aAYd5J
	AwTxN4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllIM-00000001HzS-3E3t;
	Fri, 30 Jan 2026 10:00:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllIL-00000001HzJ-0oP3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 10:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C30E60129;
	Fri, 30 Jan 2026 10:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37D6C4CEF7;
	Fri, 30 Jan 2026 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769767204;
	bh=XmpHmdq1HfTT5TO3UqPlxsFYq0BALvEmTrAOu4O+SBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YOEZRsRze/2xRJN64xGZWXdND9Pa0WkXXHbl+cPH5YWcdEr3ulVdhPEOvqs1o0grD
	 C1+dM1gmGUqinF6z7FmH6NBP689VRQIs8ehWE4qXpKQNS/NYE57ygaKJgRBZjRfzHF
	 sabk3GlBPtb95eSCmQwUtzGWlqnIqjRKCJg9dmI2H87ePmfafMEaQFPnnaSy8BHPkJ
	 Xq0T3qgvQamTLap5n7+D5d8COsL1qtfGbJDfW6nAdmBBX/ZMDo5V5wbW4wNYS2DbkA
	 jyWZy9vuMvOPuJQDK8Jf7ren/WEDCHSxO8VXpXeQqC9JuC8Y+xb23Lt1vUuqfXZPPD
	 5uqckPmyj0f+Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vllIH-000000071QQ-2L1y;
	Fri, 30 Jan 2026 10:00:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	wanghaibin.wang@huawei.com
Subject: Re: [PATCH] KVM: arm64: Fix various comments
Date: Fri, 30 Jan 2026 09:59:56 +0000
Message-ID: <176976718624.2311376.11327321071827821123.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128075208.23024-1-zenghui.yu@linux.dev>
References: <20260128075208.23024-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, wanghaibin.wang@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Wed, 28 Jan 2026 15:52:08 +0800, Zenghui Yu wrote:
> Use tab instead of whitespaces, as well as 2 minor typo fixes.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: Fix various comments
      commit: 82a32eacbacc6f7e372f98999e5ee1ee0dd7462d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



