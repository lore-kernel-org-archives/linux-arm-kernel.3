Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19DCC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 05:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3WsYS5uiN/e8RKbVFWQ/WRtpqEQ4L/s6FfMfN0Pauc=; b=Rod0OULhqMWdxZSM8oh72n00ln
	pcqX4Rc2R9Wxyj7a54eOJpPyjwPHCZnoQ0cVh/GtjsPfS9ZamjbLNDq3RLqGD0yulqmdb/thqh3/u
	Bs0kom04emyczYi2W9J+8TudzMR9dQaV/3YGO0fdFd0dq4HcjYnJk/igZXi3NvvNBllDewcsv1j3b
	k/LBmV3JblSjmmdpZkLPEWARgY+NtyaVoc4XZdDgf2zTyNHaq/VGmc4aKTee4GgV+HmteWxE1UhEn
	t0BiqXU34MlGgLHA6Q1zEtOEy5Qr6jyPf43qhK+2AH9N3j1sR4VC6y0rBLblkjmqN5HjoV/aT8GKV
	PgK513hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pIe-0000000Cu7Q-0X2R;
	Thu, 24 Apr 2025 05:39:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pGe-0000000Ctm2-1EM1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 05:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A1E5A41449;
	Thu, 24 Apr 2025 05:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7A5C4CEEA;
	Thu, 24 Apr 2025 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745473019;
	bh=16Tv7vNTdXwidd0uz+YZ0SsmgwWLIo9ELsC6Ft/58yE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lVplbl5vuIGMKKE0B/NwmZpSwfZ8WJB6kVcHXsCeHiRN6rfm/4g0DAdIeaieu8MGA
	 mfdA2W/0ZK8E/rnmbOhBWS8vg7rlMWLDN8F6EfcBBrremkw1mP5UfJFgg8Ib5foF7n
	 8MqhggV0Y6L+QJunuO9LTbyh5yHQWRdQIFhTK2WH2Drq/bR7y7Mq24q2LXNnKguBdW
	 91LSU+KOi/D5z95P/zfTN/aF5pWY9SpAqn/XXqT1Voe0syR8/wecy5Rh0uOxfikBBg
	 m76FP4RIDY23BtcmjNKGYbfUeZFOgNPhsnCiGEKA1UjB5wnDdYu6suZBqA8ed4zKUw
	 3J1wZRtnNiFxg==
From: Vinod Koul <vkoul@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
References: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
Subject: Re: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
Message-Id: <174547301700.316124.6778478265087224914.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 11:06:57 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_223700_403123_D8C7FDF8 
X-CRM114-Status: UNSURE (   6.61  )
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


On Tue, 22 Apr 2025 20:11:19 +0200, Geert Uytterhoeven wrote:
> The Arm DMA-350 controller is only present on Arm-based SoCs.  Hence add
> dependencies on ARM and ARM64, to prevent asking the user about this
> driver when configuring a kernel for a non-Arm architecture.
> 
> 

Applied, thanks!

[1/1] dmaengine: ARM_DMA350 should depend on ARM/ARM64
      commit: 86071b369dbdf0a8f7e4424c4e0b613ba7b8ab5e

Best regards,
-- 
~Vinod



