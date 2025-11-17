Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0A6CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 22:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L5kqb0tozN6alabYLEOS+/qQznlRRLUS1mLMC1yn0Ig=; b=Bu2q7+y30vkr7JplC0vSn75GQm
	icKsIzSbJuxUDS8RpWZU2WC6aEO9yB7rzagz2mCGLWtdUlnqUdoKY4U+BRPHlZuMExqjxQPDIaXhf
	++1mAPuWFEQ/+hTZsyrCic9vxJB19r36F2H9b6FJjnVTryT1sEiBqkKHCkXI+jMtiS2IkAGqAdvfU
	Fa+FUO4lJNFljzaCn+gqKUOy+9Xcf+pMeoNSnuYSBlnkJ0aZDGpe3ACA3viGCYADFmNaQy25LkTgR
	5eXR84oow3VnPj/OR1YBkey10Gc5KWQuCUSu/H+Pd8jLVcO3gkxMv3BFWxwaLIZC4sEhrcOfsBFVl
	TbRV/Tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7aj-0000000GwfO-09gZ;
	Mon, 17 Nov 2025 22:20:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7ag-0000000Gwes-0f00;
	Mon, 17 Nov 2025 22:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=L5kqb0tozN6alabYLEOS+/qQznlRRLUS1mLMC1yn0Ig=; b=BH3tu4n79ih1+Gi+0qBXg02/lW
	qBj405fuXZ0OTKQKDj6gqGtuJovOlShYMrPqMQGwBc157mrWrrrs8cneys/gAUYEMxvOtcD20Tc5T
	oNQ43u6CCUym09z7yqz9sIo/nfxMDcXRbRRHt/00tAeS0VaShIcv52tRSPzzmB8DXCnU3aTJMRyhh
	BQcYDfriOqO65RR4ToTtwbu6yFd/iTRBS1BQyeZAJ/20Nu7cXqzA5cGCPLq3QceWj6FrtA5hPsGN/
	cywksqR+oUOYyPUYj03Zlsf9Qm884bVQZLcJBPqdBX4qZ70RjpCLWDsmA9Q4AlPRXl9J6et7VRtqK
	g0TchdGQ==;
Received: from [31.12.4.86] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7ae-0001Py-E2; Mon, 17 Nov 2025 23:20:52 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.19 #1
Date: Mon, 17 Nov 2025 23:20:51 +0100
Message-ID: <2002416.CQOukoFCf9@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_142054_200267_3F61306A 
X-CRM114-Status: UNSURE (   6.79  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-drivers1

for you to fetch changes up to 048213a38e7ac1591f725e370c152cc80dd84105:

  soc: rockchip: grf: Add select correct PWM implementation on RK3368 (2025-11-17 22:34:12 +0100)

----------------------------------------------------------------
Some additional sane defaults for the oldish rk3368 soc.

----------------------------------------------------------------
Heiko Stuebner (1):
      soc: rockchip: grf: Add select correct PWM implementation on RK3368

WeiHao Li (1):
      soc: rockchip: grf: Set pwm2/xin32k pad default to xin32k for rk3368

 drivers/soc/rockchip/grf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)




