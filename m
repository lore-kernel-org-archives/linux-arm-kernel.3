Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B102DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 09:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+JPtmIpKJxkCCHhFEXHwMh6xG5uc6TqOuOvNrIN6iU0=; b=j57luHTA05aGzW+/BxHVCf+PLm
	eGcegP0nQWZKk6lFfewp/kXNYgweJG6MyvxbpiN+rjNt7uW1P/iVVQoteL4crprC3CrQC/nnk3dXb
	V6sLSTUvsRMIE9XMHR1WPv5k4fy3xYSGZbXbZr42z55VA6Xl7wDr7LLqTDpLLC5uzzpFnLVk0N6Cj
	KRVPwHWWzItE47fEGhZPimbW3jPjT7u6Qn9SS9wijZsYAQeVB1ahJUMfaLJDwyI5dh46d+F8RbfzS
	gq8Ezd+NhXUSh2yyz11CSVY1lnVrfaLYgi3fFggfC5fm7k17NeQ/mR4CtbOAk7+BNnNmSwUG0Tofa
	DvBQ/G0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4MU-0000000GV4O-1Oi6;
	Thu, 04 Jun 2026 09:27:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4MS-0000000GV3r-2gVY;
	Thu, 04 Jun 2026 09:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=+JPtmIpKJxkCCHhFEXHwMh6xG5uc6TqOuOvNrIN6iU0=; b=0TD4G51dpPFZcOXT6rd4xHwOJe
	6bN/A4XEMo3hrWK7YcH7kDTvJiibpCuKWtLMUnwbsWA02kDJ+4D/oFdX1lmkCY6JZPvnFRDHD/Rbe
	JJS/ieamJWI9EFIvTzG1l0uHJyTSMTGbqVnf9NkFfb3TtecI2W76uRl7xgt+vne8EwL0DRcohm1P7
	vmjo9eDBTZhPXsLvbshVigoJTLVg4zty3kTb6PNESl8YLQnCk+WTdQdVPfZPLsBj460ZcKVDI9yy9
	7wZRGS1cPrQfZazsToBukBxlaGro9OyvIIc0t5mTSXlD6k4knlsqpwO2fi6k+68KHpOx+Oiv9kBu8
	gA2d9YtQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip arm32 fix for the current 7.1-rc
Date: Thu, 04 Jun 2026 11:27:34 +0200
Message-ID: <4474108.o2A3GueYyp@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_022736_684329_0392E24C 
X-CRM114-Status: UNSURE (   7.76  )
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

Hi SoC maintainers,

please find a below a fix for an issue in the ARCH code for 32bit
Rockchip SoCs, that appeared with 7.1-rc .


Please pull

Thanks
Heiko


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-arm32fixe

for you to fetch changes up to 6fc5666aa576c6c3bec256fa31d72653210319d5:

  ARM: rockchip: keep reset control around (2026-05-26 23:20:39 +0200)

----------------------------------------------------------------
A change in 7.1-rc improved the general handling for reset controllers
using SRCU, but at the same time broke really early users before work-
queues are available.

So adapt the SMP bringup to keep the core-resets around, instead
of aquiring/releasing them on ever SMP action.

----------------------------------------------------------------
Heiko Stuebner (1):
      ARM: rockchip: keep reset control around

 arch/arm/mach-rockchip/platsmp.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)




