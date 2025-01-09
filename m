Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5F1E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 23:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4K85W78j5LD5Qw1D7olPNBF22g7jjZJJbwQt9RhBE4=; b=nL3MQMROfskGFPLWJZx8X1u5/M
	BsYlpKXoEJw4b8QM0h4yCD4tqnMb0Wvh8cR3kg6Oc2TVLOvhl5xMnEIu1WczHNUT9UWDKke7B/kQK
	J398Zt8IlL22npD3/Nyy0AJQnDKMPlFzC4RTbuFr4hRQ/boNYg2QtieI4Kwuu8KxVkirJk5Zu7AoO
	C0qvFRHg3hssdgd3wYAceXlwhlOT+3EcCtoyCKn8k0w/XAzwbdJop18YOWlU4XkNIPKmv//Ekkzfd
	X3kkTAMDGQnneKZoCa9YOjaHGv5T1fYx3Bes7gomPkn/kPbUxVii5BIlc+DjFYS1DPMq6cu/n2YZ4
	5AWB+O/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1sh-0000000DXzn-0kd4;
	Thu, 09 Jan 2025 23:24:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1rU-0000000DXqf-1MAe;
	Thu, 09 Jan 2025 23:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y4K85W78j5LD5Qw1D7olPNBF22g7jjZJJbwQt9RhBE4=; b=xP/jN4xZHBmcTKe7LHJsSGfqFl
	juQWWmZ1dRFNgBHFi2xY0iprnlbQb7VPdZSsVyOxqaW4Eh7RR/T1XH4HZtX2OV/7t+DYRcPLkqGKB
	sUc5HyW5mA5olLyazl5tCqFm8hpvu0fxcBPb3Y8bbdWrBoemeZqo5iv9JqVvpWhuegDGKX46Hf6B8
	PsCk883PzOmAQgZ05PVxarmIwNo454RYkQW9+87ZeLVg2H4fDCsbTX1JQkewzce3P5c2DYO9KCRh7
	Unck75DKURxvjrTWSUqPYwLQEl5BigfJZHUOpU83ZPbP6fbDdyLzozIFkeOGpG40oc8iszz/35qfH
	5m1n/TVQ==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tW1rS-0005y7-2P; Fri, 10 Jan 2025 00:22:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] arm64: defconfig: Enable RFKILL GPIO
Date: Fri, 10 Jan 2025 00:22:35 +0100
Message-ID: <173646494622.2947053.1242486528783559862.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218-rk3588-rfkill-gpio-config-v1-1-dfdf464f97d4@collabora.com>
References: <20241218-rk3588-rfkill-gpio-config-v1-1-dfdf464f97d4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_152248_362555_865DE087 
X-CRM114-Status: GOOD (  10.28  )
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


On Wed, 18 Dec 2024 11:31:30 -0500, Nicolas Dufresne wrote:
> Enable as a module the RFKILL GPIO driver. This is needed to power WiFi
> and Bluetooth radio on various RK3588 board. Without this module, rfkill
> will report the switch has hard blocked, which prevents using the WiFi
> or Bluetooth feature.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable RFKILL GPIO
      commit: 893b4ea693f1ae236cb2f6a94b489d6569933520

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

