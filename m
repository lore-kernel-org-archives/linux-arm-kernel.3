Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863B2C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2g3XZkYaw4bhS5r3rrWzVcyGxMpBmZMUDgMP/E1iRs=; b=ikHmWyb5iqpnjp4C8rBYUK8tXs
	m1tnkNITiIAeP76XB7wfPr+2F+2vAec9FDbF1IEsgA/gtd+vwlaFy5B2ThggW6lpdKKhHizWmpDXm
	I+9rH7ZK9CwWb2236xcIL79X9ovQhdyn57b3k9QVpxDtQV5Ty4Oxd7nDll7hr7xJ6pvWOMSqgKYv9
	Rv8YZhFOa0KtUv4eZgxhFlh5f2CNfiLm0ir7bLcxj+wZoBvvVFEefrfR3kUSMnEUkcCg0KNUam36y
	1tJWj4AiLaq+u2CSwHdXF0l0gLhFxpiwvUlKP36u9BRWez2XwKa2YSBq0l58pccS0hWEvcotl3Hpm
	/JA2/Ugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCYW-0000000FIGU-1cxH;
	Wed, 14 May 2025 13:53:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAQM-0000000EuPv-2Lpp;
	Wed, 14 May 2025 11:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F91344DA2;
	Wed, 14 May 2025 11:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3511AC4CEEB;
	Wed, 14 May 2025 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222641;
	bh=i533NMeV5GO7/xUYiXrfMLveCBR6FPalyI6+47rPinA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B5DCbJdDVntyYKsinJJZkSasBRsJRoIJbKDNq0evLfR5lBVlzCo3GjKAMoL5xXgI8
	 6RrU/kNHwaLRNUh/Kc1Va43x0qX8rJCbT5pgsVAHKLNukv8kPSUNWc9Cpjv3Kjm4Hf
	 CFXTEkOaiVAMsS+DmJaMCILJBIa97FDqWmA2xaQ+J+ucod3JSEI6wP9Hs95WL+ITbp
	 6FJRJZdJs72MtXP0gIrsnLKkCKUj+KHQBilQdjtXp4Ok/XMTAqPUNNhA+xVKysVTb7
	 CvO+e1DQYEC3SUoKaAV3ykq3pdevrjaOnrH4qmxuQkvSCEUyGoL+zDg9K03UmNAKri
	 rDsC51GYixY1A==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, heiko@sntech.de, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250415081200.349939-1-nichen@iscas.ac.cn>
References: <20250415081200.349939-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] phy: rockchip: samsung-hdptx: Remove unneeded
 semicolon
Message-Id: <174722263987.85510.17860995825685488845.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_043722_621218_5A9890BC 
X-CRM114-Status: UNSURE (   4.52  )
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


On Tue, 15 Apr 2025 16:12:00 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied, thanks!

[1/1] phy: rockchip: samsung-hdptx: Remove unneeded semicolon
      commit: 3b2b414927dcbd866c99ec92e3a214a69fc51c90

Best regards,
-- 
~Vinod



