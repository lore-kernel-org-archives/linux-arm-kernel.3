Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22917D7831A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8TxeOJ5sbsSSvTyCxYc77FuJJZ5C+nxlerzWVaAJl8=; b=a2vyKu5eJGeK9dfqEW5s0Q5eYI
	BP9OUXx+jCJuLmt2S2ddUyK60FBwJmh3ZBGVg6RuFWx+5CrMiydXm9V+WlROu5ph0tDuMX5ZyvbSg
	pNLBkq1i6OdeU+a+P7HPkPMKCi3glv9BQtT/H5ABNUelJ44S0JVu7i7PIzKr2AA1fIyGg4q3YRXzh
	dInBmqXvYHJw50OYG5AAi+381WSjp4Zj9qHxgU27HS9TnjD63I0qjt3xMXQsId0f/4XMsLtBSPrcZ
	+g8fNUBu7oFhozdlyAL3KbwC/EDlzaSCQuozvMyhzEI+vqw4f9Eu8/17904yM3nwU1q4H53n8VLkH
	lHoaJn7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6D0-00000006Bnb-0EaE;
	Mon, 02 Dec 2024 13:11:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6A2-00000006BFn-3zyV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B0E85C67AF;
	Mon,  2 Dec 2024 13:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B835C4CEDF;
	Mon,  2 Dec 2024 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733144901;
	bh=Ef2b8udLHuXGFaC72TBWdqafXfxqKV9+55Tg/ue3f4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Jz8XLa9as+dSkLfDf/HTz3nQ8di7RoxUnOzJj5YZm7N0tuhlpEWQteg5decI5cqy6
	 si39MXQTXML09R5D+8Ecrvp9aNfXMK12PuITXtrIgJgtd8NQT41dh46bs6b0tljKGl
	 vWsFh2LXgT5xJLn9jP/vxSBoUs8X1WJOB6te/DK6c9qoslNTITYIAfvxY5pfIqXP04
	 PrMxFFJ01gai+TO2BByJee1zn+rb4HUuGSh6QCDHa47BZ4SHzJiwP0z1p8hjwcLMGm
	 cKBAyGVSPhiELkoyu5xxJIF7UzutgkHc9zeN6pWR96ZIWn4I1uF/QfmOXoORsdUgda
	 7HhfmIxkT5RTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601EAD7831E;
	Mon,  2 Dec 2024 13:08:21 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Mon, 02 Dec 2024 14:07:17 +0100
Subject: [PATCH 3/4] arm64: defconfig: enable Maxim max1720x driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-b4-gs101_max77759_fg-v1-3-98d2fa7bfe30@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
In-Reply-To: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733144859; l=718;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=ucQGph6fETnDzKTb3OS0faNFj61tkZWbwahqqiH/Ct4=;
 b=y+t6HStF+LnskISJskU8kHe4uHWfGmyfR/MuVZ77JEhlbV3eIjbigVk184uDWmagPkGdPINld
 Nd5l7ROflaEC8lFm6zxOk6bbNyZEaeI62TMXepJKVlkYcn2BsMAic7w
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_050823_047942_9BB507BA 
X-CRM114-Status: UNSURE (   8.56  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

Enable the Maxim max1720x as it is used by the gs101-oriole
(Google Pixel 6) board.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f458d9c555ab9771a1fd9139ce1aa..e7523e53f2ed26bab39e64f3b2d8c8afc7c1a1f0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -675,6 +675,7 @@ CONFIG_NVMEM_REBOOT_MODE=m
 CONFIG_BATTERY_QCOM_BATTMGR=m
 CONFIG_BATTERY_SBS=m
 CONFIG_BATTERY_BQ27XXX=y
+CONFIG_BATTERY_MAX1720X=m
 CONFIG_BATTERY_MAX17042=m
 CONFIG_CHARGER_MT6360=m
 CONFIG_CHARGER_BQ25890=m

-- 
2.47.1



