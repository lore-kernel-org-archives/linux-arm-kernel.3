Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5055AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 20:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UXmmAlErtFOsXEtXEzutgc2RcV/BROHq0bT3G0kg3i0=; b=AfDQurreu1PPC/QJMbpSBKQ1JJ
	VssZn8bKxytX75fP/02xkETmsVSJ31ZT5slYoRrTFEEKjJktIPOxXt1OGV9XVkptjSPtnOTjexT0p
	uEiP/TC3A7uwlSWM6bPcU0k8tlf5gn6sLMQXRqPvMiiHBFi/ScdNcBIn+qhHr5iccKS8G6KDohNzV
	rKBZgMth+uc3pLZUy/D18wv8EAKxlYGszzRTu6sVTScGAR8hqKxlvKohALdDxVVoMzmAQWKVbL1LN
	FbO2yNbzmSKpxiE/ITNKSlOZhFT98+o9wl8tZMlv5eDFgpz1P8DRlpjMAsZE3SMDiRYmo+H80FHoZ
	3ixt9uMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJEE-00000004Rwp-1Y0T;
	Sat, 03 May 2025 20:12:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJCK-00000004Rnf-0BUn;
	Sat, 03 May 2025 20:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=UXmmAlErtFOsXEtXEzutgc2RcV/BROHq0bT3G0kg3i0=; b=yPOrj21k2YRKQqJqEDNmNvBEsM
	BsqHrb/Sx/v0fedPx9GURlrT4D8Gpsq6tLpvtWvEzhvZE5dWEsAsrfUB/3c6Fvbxg5/duav7uG1Ho
	2KgvOMbBqeY3Iw9gEKM55ITPl9mJlu6bFz+UHAfDpf+kYuTnp28kMnseBejDB7L3K3PJAE4QELfqF
	J4cmmfY1MbczlXvH89NYUYDNg0CRVl3mQ+t1Y9c4Qwp8Od/dVChScrNA9zZTLlhITCE/Zffatnfj1
	ntwoxQvS4WrsYRY9nQ1AtNARMOM+anIibRCHfa18aeSIZmOgSb2/EPWJMJe8naeiPpgVpIiVEI5iD
	/EwFI3RA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJCH-0001e6-R6; Sat, 03 May 2025 22:10:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Some graphics enablement for the ancient rk3066 marsboard
Date: Sat,  3 May 2025 22:10:41 +0200
Message-ID: <20250503201043.990933-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_131056_115737_BB3F4B7D 
X-CRM114-Status: UNSURE (   9.39  )
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

Enable both the hdmi output as well as the Mali400-gpu.

Did this to test a patch converting the rk3066-hdmi to a bridge driver,
for future improvements, so it'll be nice to keep this around too.

Heiko Stuebner (2):
  ARM: dts: rockchip: enable hdmi on rk3066 marsboard
  ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard

 .../boot/dts/rockchip/rk3066a-marsboard.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

-- 
2.47.2


