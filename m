Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D05FCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhRFq4UtJ1FWApnkqY6mEgaYN11X3Y0mXj4sL73koYk=; b=VKClWmVQiVo6/V55CwhQAw5jvY
	2nuU9o9TEdYa2DWr5c9RCR1vIDIhW5sIZNyevbeHijBnXPLyCpoj3ydpcwraQiYG5hySg+yVKILXc
	niILm9TuRB3oeeFTb5yJKiWfiwfCG3Kc+0P6aoSztjTVkFyyYuw/2nZVVNGCRV+N342bxTTS0IDRc
	gr77rOu7jAL7e6sANoyTw0jabU5q2X52/vcrM473IfbdFzsTT3BnALIeM5OHB1HQIfbL3jMkQgQmB
	TpmLalY5wbtLnO1b4Fg+JDeCW2DOZobmAbJAlUE2CTUbzOCNDsu1bD9ccDH0eBO2R6zrlYoWrif7i
	UENqlWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLsp-00000001AVp-0hTW;
	Thu, 18 Sep 2025 21:09:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLsm-00000001AVN-0cHo;
	Thu, 18 Sep 2025 21:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IhRFq4UtJ1FWApnkqY6mEgaYN11X3Y0mXj4sL73koYk=; b=mqdAqbuMhaX05+AVwIxaxZi0TB
	htLdqDt30MiAqnjBZnHKqLauhIC1vFJ+3unudCP6cWxJr9zFi2uNnUxSjVHjRiReiT3/TK7EHOdZb
	f0z5+XPJNg2kx3+N0nPkjjpB5UyoQYVk57Vsznj70YGQ8zUghwV9+k4KhQKblO/RtbXoEKg82aDRD
	LhmYH4cqRM7qXCOwP6ce+fFgjd/Czsns7wf5zWvyw2eLT+PvRwVjbtb3Hb4goFS+ia5d+0WNrJgjC
	saPGLtXUnj7S098virm7a0VhHbtt5BYjO+E4uEbZZr4EI3hHfE8zY8rQhQn93hP+/9h38SEy5elCX
	mUaTg40g==;
Received: from i53875b0a.versanet.de ([83.135.91.10] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uzLsk-0003SC-3D; Thu, 18 Sep 2025 23:09:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: (subset) [PATCH v4 0/4] enable ROCKCHIP_PM_DOMAINS
Date: Thu, 18 Sep 2025 23:09:22 +0200
Message-ID: <175822973681.1568500.10556154418854538683.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
References: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_140936_212260_A0215DE8 
X-CRM114-Status: UNSURE (   8.21  )
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


On Mon, 15 Sep 2025 11:33:13 +0300, Mikko Rapeli wrote:
> MMC_DW_ROCKCHIP needs ROCKCHIP_PM_DOMAINS before MMC is detected
> on Rockchip rk3399 rockpi4b and similar devices. Make this dependency
> more visible, or the default with ARCH_ROCKCHIP if possible.
> 
> v4: fixed Kconfig whitespace, added select REGMAP_MMIO to MMC_LOONGSON2
>     instead of disabling COMPILE_TEST
> 
> [...]

Applied, thanks!

[4/4] ARM: rockchip: remove REGULATOR conditional to PM
      commit: a1b20e062245571c128ec521c4df56ad1bff9bd0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

