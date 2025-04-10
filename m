Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBB6C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LP2MrA4kyJJF7nqkw6ZY/203xCtdrQPU/4NP3oP3G/g=; b=muH2BindGuSfhk5KSVz4qclbl5
	Oj3BL7w3BP0dJ9wnkGdh/BwSA5R32VDRUCcUrkLnmMYnEIhNBUvsmJC/iSz/afbaI02DYjq5QoUiD
	2u+8Fp4Fhz1LFQS9LlUCOjGIuW/F8LGOEmIKP1wBkqX0Qgity/kPVcrVbWs7QkKQyfjjpwIg/kaSV
	MsOd3SYHLgEOiqrkxL/YVnKkFWfsaopzDxZEuLMePm4kJX3HOqqwSUSYO37AtC8mWOHFnonqXzhfH
	xK3yipGerxIUgOY+925f5ht2kMTe7sjSdqX6RzeRQ5xeIBfWf+kjH+zIDwxHHiwp8aNMbwKBYCFrk
	CrCINH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2txQ-0000000B2lB-3mYd;
	Thu, 10 Apr 2025 15:36:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tGj-0000000Aue3-495Y;
	Thu, 10 Apr 2025 14:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LP2MrA4kyJJF7nqkw6ZY/203xCtdrQPU/4NP3oP3G/g=; b=EZSOnlkoyN3gXhuJQQNV8cyHEy
	ze/dE37vB3N+UPsQbU3lU1IeGJIy/3BFKh8/iHrsbFsIjmyP/xQulcanGcKqo4TWj/rASERCmC/4C
	apQWRspn2hQQiDTlifjCYBpgVY0IGzXyask7/4vy/TdnYu1C75gqBPVbmuLY1ZMVi0vkoPG4alBkd
	AOgK3uZOoCEqgGKscMKVvs3VU6yEKbMlQbWU4uhxyowttMwlO657VYbL1eRtAiWRQ2NBYTl/k0RUz
	anpCdsZuEbqjGEjV7Uh5miGmvrnZibSu9plpEaWA5H4KVDHdMLMeTvFTBxFIRPat/dyi5C/8lB88G
	Od0vRQhA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGi-00012N-ES; Thu, 10 Apr 2025 16:52:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rock-pi-4: Fix mmc-pwrseq clock name
Date: Thu, 10 Apr 2025 16:52:27 +0200
Message-ID: <174429674408.910874.12009966723443982772.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250409205040.1522754-1-robh@kernel.org>
References: <20250409205040.1522754-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_075242_045563_FA082E33 
X-CRM114-Status: UNSURE (   9.06  )
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


On Wed, 09 Apr 2025 15:50:39 -0500, Rob Herring (Arm) wrote:
> The defined name for "mmc-pwrseq-simple" clock is "ext_clock".
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: rock-pi-4: Fix mmc-pwrseq clock name
      commit: 6833cbdc733c9e1088fe9936b2dad95cc7d4c580

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

