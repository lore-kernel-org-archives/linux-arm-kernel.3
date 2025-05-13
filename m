Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4532BC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3QyM1DjmFDWSeP13sIro0GR4y/rY666nmRswSJJONM=; b=QSwRAHp86Lgdx+mnnLCRItpxiR
	lzxHCWIlbR0b8hmxj+N7TSp3wQKAJM0eZFNOQQi7h38OCAcxF2xy3Zk+z1rEKWdTleQn64I6FpvNF
	kZNWq11SPjJGQ3qUXk0xGY0ab6qV6xuak+yn3yneE+8xvvLeuvrrRh6byDqjvUMV7UB35J3XDfLBf
	KCzOZzK1G3OTPeS5dlKVVWAbgReH9CFai9DcHJvmXmxR2EQRa+hI/rligonHuxOzAQYK9YxV9tfMG
	dwv7+YLzo+TtcLkrvFOCoWApKtYwsi4qbynJM3Ps9Vfp+wbD0DRIjNZP4kiJ6YSsBPzWApFfNj+k4
	0v2vu4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqt2-0000000Ced4-3Gz4;
	Tue, 13 May 2025 14:45:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqph-0000000Cdt3-1M3c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:42:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 082E2113E;
	Tue, 13 May 2025 07:42:02 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC1723F63F;
	Tue, 13 May 2025 07:42:11 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: dts: arm: Drop the clock-frequency property from timer nodes
Date: Tue, 13 May 2025 15:42:08 +0100
Message-Id: <174714730381.3608105.12769749620212383258.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512101132.1743920-1-sudeep.holla@arm.com>
References: <20250512101132.1743920-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_074213_404010_A8A5F86C 
X-CRM114-Status: UNSURE (   6.82  )
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

On Mon, 12 May 2025 11:11:32 +0100, Sudeep Holla wrote:
> Drop the clock-frequency property from the timer nodes, since it must be
> configured by the boot/secure firmware.
> 
> 

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/1] arm64: dts: arm: Drop the clock-frequency property from timer nodes
      https://git.kernel.org/sudeep.holla/c/1fa3ed04ac55
--
Regards,
Sudeep


