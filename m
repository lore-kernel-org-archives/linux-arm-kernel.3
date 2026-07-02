Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81621C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwkpuFiJFSig1yrgIRHVrq1BQtVphda099BHLY4gXx8=; b=VhMOpNcZCFTNH70uUhGzxJJNQL
	0ZSMRwM+geAV5dvRqjSkn85u2RM/YSxC0qcCRLMlzKjWuK4X8afiKqiHF8nq+hBwT3/CIkAg45YBa
	7ydeIjJCOy/Hy9Bx9v3Alqw9K9xqFLp4eHi7o3Svy5tyDNwSydfIHsKw02AMv65CB7NX14Y5yz12Z
	8syXPBSUptT0FypiETw2sqUsP8umeY8iNDGPyiOOD8UzEJ9owBsjSbB4sqEum4HLziDF0Xfty/NSj
	yrg1Jmb72Rn5cfp2ozauPnrP94N2LGO66y45Ajo6TM51Q2bRI4xSTnEr0NkscWdZ8KzzI+GH4gW85
	qVLcouwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMij-00000005JS7-0qbA;
	Thu, 02 Jul 2026 19:05:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMig-00000005JNH-076u;
	Thu, 02 Jul 2026 19:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kwkpuFiJFSig1yrgIRHVrq1BQtVphda099BHLY4gXx8=; b=GnNg4IcbGHj4LG3T+K83pcS4qd
	g1bV+9BkUhKcRb20kwj58+CxUOs7De7lebEY06waM02j88XzE13GSkX4jwLL0ebUnOYw9ojoZUtTW
	jIMnYrZuIL5i8e27f2CXf6jcA+kvgOm9Aj8/S3h+myUR6FZiTVPcF4v47aDTwCrUeUaMYv8nXJlm6
	2JynNtRFpf2i/fL8kFsAI6jXv/Vib0HWY+UL0VzeGGw5IfqSVEYPHm6vz5ocSIKShLKu5jBYG1Jq7
	39+58w0Q8cW5sa/mG5wh+QX5s9W2gPRnpjpGD6GfYivmtxnVyddQTrhiTeVHO1T5D4YYrwUds32lv
	gjLwNegA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Thu,  2 Jul 2026 21:04:55 +0200
Message-ID: <178301901903.3838694.3276523670393868229.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608060940.52549-1-hrushirajg23@gmail.com>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_120506_089899_0BEB1CC1 
X-CRM114-Status: GOOD (  12.47  )
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


On Mon, 08 Jun 2026 11:39:38 +0530, Hrushiraj Gandhi wrote:
> This series adds initial device tree support for the Vicharak Axon
> single-board computer, which is based on the Rockchip RK3588 SoC.
> 
> The Vicharak Axon is a feature-rich SBC targeting developer and embedded
> use cases. It ships with:
> 
>   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
>   - RK806 PMIC providing all SoC power domains
>   - eMMC 5.1 (on-board) and microSD slot
>   - Gigabit Ethernet via RGMII (RTL8211F)
>   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
>   - PCIe 3.0 x4 and two PCIe 2.0 slots
>   - SATA 3.0
>   - USB 2.0 host ports (EHCI/OHCI)
>   - NXP PCA9554 I/O expander for status LEDs
>   - Haoyu HYM8563 RTC
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
      commit: e0008b108aaf8c5aa22930b2ceadf8f894562acb
[2/2] arm64: dts: rockchip: add Vicharak Axon board
      commit: e08c3389c78dbefd31a57df8807cf57ef6f3c9b1

Please check for double empty lines and ordering in future patches.
I've cleaned up some things.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

