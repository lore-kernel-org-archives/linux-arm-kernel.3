Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7281FD44C48
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o2S+6qdaPdQDErOOkcRdTa+fAT5ROTXBz0aYWeVhrtQ=; b=BiPhqMLNfChaiB8t3/YjBKBdVt
	QoY4mQHJAhAUdQh/BCmKRn9GyeRSzTGaeWiLo8oaHdRZTf6nuTxJzFHDJ5rT5cTTcZ19fq5G+/XXm
	tyUXsggwZJWkkXQqbEIHdPHWEk3MM0yO86TdHut79dVagfse5OAhzELP/InU7krXlYHNePSbdVQNK
	7348/FjwEcnVD5eOAhbScZKYCrTf2ph/JNdz/Nbh0/T2F2CrD7GMvgSSauZxzItb+EJeDo+CV7YQ8
	sl6G82agshlQq7DgjCG7gEMqvEbpLCVh+9fm3jYBRcYUPRlcIN1QJTXKUuIw2EA+WcMapQy3bvYwo
	J0Qy0OcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNN4-0000000CPj3-3ZeJ;
	Thu, 15 Jan 2026 13:26:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNMf-0000000CPfb-2AW2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45AE343A1E;
	Thu, 15 Jan 2026 13:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71AAC116D0;
	Thu, 15 Jan 2026 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483576;
	bh=jFf6M1o/fklj5p77ApwFMOiss9+hCY9+nR+JRnQr4eY=;
	h=From:To:Cc:Subject:Date:From;
	b=FzB5MsyQQkS9J3sackXt1WLSdbw7gxp7Ofx4mVeLgtvG+VqOgDQjkO+VFUQvmUMdg
	 bN1vjJNmQZH0uAnSHTmQg8BBO5feZFFw3zKDy7RcbveNqEq69SrqddXecAEvMiRxoo
	 c4ISB7tRzBsfV30R8oiCfzFuk7yybG5Ex18AWFA6UOtKM9DeMxS2qCDPLGt8T9DqV+
	 pilblXCm4fb+8wxYqtGq5udYDTwOAUB8HytoOg9kCrDrRyHUiD92dZC0lkookAdwPy
	 DetS3lThxrte4J/wsxm0TWjH2APyukf1sz6bQK/p/CK2aDtZErwM3CApk9vIxHskRe
	 3Szms3OJJlx1w==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 0/3] arm64: defconfig: enable Kontron SMARC-sAM67 support
Date: Thu, 15 Jan 2026 14:24:41 +0100
Message-ID: <20260115132558.1522169-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_052617_598377_ECC51727 
X-CRM114-Status: UNSURE (   7.33  )
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

Enable the modules required to make the sa67 module function
properly. It is planned to add this module to KCI.

Michael Walle (3):
  arm64: defconfig: enable the J721E PCI host driver
  arm64: defconfig: enable TPS6594 power button module
  arm64: defconfig: enable sa67mcu sensors

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.47.3


