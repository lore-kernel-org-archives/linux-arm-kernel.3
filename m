Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2961C531D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 23:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B1VWqfrwhX41oO9kNBmGr3imsWUDg1Cc0ShpaEM/OW4=; b=xcH7VBo9j4V/HRySoD0Vgi8ujn
	V4QE6Zf/UCIwOl+NISlCDg8eoIrSGU0ffRxatmqInbjAV587teI+O5qgKSzbPIMhjLxRHC4Yz2YxW
	98kJzCCB71FEtMEzh54qd8Fz2DwB3L0H7da/za9EWaTZdWMp6LcBz3012Tx2zhl3YE/Ij3Z7RtNBv
	zevjpkIkyMwm3kqtfNwjy9IjkaIjbFse3OUmaugPJWm7pk/7+GZsKL6QlhEe7Bjzi7l3sJ8l31YpZ
	DoWLvmdKZ6jjzYuaZQH+wYWwDQzAozZMmTabcWyMp7RMjTv80/Uv8HVrdixDkywCZ9xt7D00iFK8N
	B+xa+oPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn2Qx-0000000FExB-3JwQ;
	Thu, 23 Jul 2026 23:02:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn2Qu-0000000FEw3-18ax;
	Thu, 23 Jul 2026 23:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=B1VWqfrwhX41oO9kNBmGr3imsWUDg1Cc0ShpaEM/OW4=; b=22xPKoB5gpO3UgxazGHw+xG8/e
	zP4Snp58FJbCsfKW0eHM04BOeBpq1qnaTW3wysTG3lnjQo6ZG4mt8dIxZ9dyRbM1zLJjqM1RNGTd8
	bHUvtXZh8S4kjx0eY9OVcwzMTtnNi+nfQcVyV3rm/DOgtOCP81/1s6T6InaJL0yD+yqWrCfSkTDOO
	a6LiQORNezglKHq+NLb5MH5jv0rfFvrcdw3FAflQ61tJt5c0HgZQMUckyBxvpHyinb9UofFctM+V9
	dfQ9/+MZTasdq9/tnX+EXmMiXoyf+a4Tc9dfyHqHvCIYExCHDANXcf1SlaaKUbvCrhvHKvfMfuR/m
	ceaCGROA==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 7.3 #1
Date: Fri, 24 Jul 2026 01:02:25 +0200
Message-ID: <4283932.anssfa2V6d@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_160228_320029_9E150AFF 
X-CRM114-Status: UNSURE (   6.54  )
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

Hi,

Krzysztof improved the bindings for pmu+grf regarding the reboot-mode usage.

Please pull
Heiko


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.3-rockchip-drivers1

for you to fetch changes up to 39eace59ac826465fae0788d0a6b304ec94f9944:

  dt-bindings: rockchip: grf: Narrow allowed reboot modes (2026-07-07 21:41:33 +0200)

----------------------------------------------------------------
Narrowing of reboot-mode definitions in the bindings for GRF and PMU.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      dt-bindings: rockchip: pmu: Narrow definition of reboot-mode
      dt-bindings: rockchip: grf: Narrow allowed reboot modes

 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 8 +++++++-
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 7 +++++--
 2 files changed, 12 insertions(+), 3 deletions(-)




