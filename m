Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8EBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 19:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5a9rAhmopJZ5u5EjKi6o6S4zgyoHiAEMghIDkGL5ppE=; b=k4k5KR1n2uKC7Z
	i+IVQjDzAR1RtjFQ75AnTu7LKkPdVeuheGveohQFye+smUBDrSCYVULi2qAo7ZgAa0vKD2y+jxie6
	mP0q5RbXv+gSTymXkthvaD4eUsL4uFn8f1lbZQpyKUAhLnfRPxS1LmBjQCDES1HJ9U2bxCNwZcVNL
	Dc/5hHU3n5xYWgj6R6Lu7We8uZ4bRbw3HLnTPYYwtcOX2YCFhiSYeXBRNIeOOx0YsQkcpzE84ikjw
	92yd69Pj1T9qjk9RWskwNOlxk3WDbdwXnkxXkMo1KD4FatNV+/xrqttcK5Wpil6H09a2YsuiPpPxO
	N2XLcu28efBXfllOh52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNH9U-0000000BAhb-0uEP;
	Mon, 16 Dec 2024 19:53:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNH7u-0000000BAQt-44Y3;
	Mon, 16 Dec 2024 19:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734378691;
	bh=vBX2Vf+dMmYBxIYAXJDj1ffDK4+bTutXNq5/laHlFvo=;
	h=From:Subject:Date:To:Cc:From;
	b=U2vTbyMTixp52uXDeCeVDxyQ5nBLdG7oDCDgTR0gLZK+wYw77LuUoeSV8d4gQivJI
	 MyAb/2XenzfhshV4NW7k0B63gWrAhDjbDP1jEnrrUUeCP58VxETQgfQAhpzu5FWKmm
	 syzZya6tnFEgHIuafS+bIUCDat/3OD6D+jRK/yTGkIU7l3V1yZLe+H0qDaNdhICfYe
	 Sk1U6qhwoO7fc8DL0CwsIarOgNaifAklKDHwm0fvhcOJV6Jt346Dsh8PAt9PRTcy1E
	 3Q3XlTXSl2o9aHXBANbyby3XzVG2S6AFbVoLgbEe1uG+JIzRgYgaHOewhgvEkGOWqV
	 0QMMcF/eYpGpg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2736917E3778;
	Mon, 16 Dec 2024 20:51:28 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/2] arm64: defconfig: Configs for MT8188
Date: Mon, 16 Dec 2024 16:51:24 -0300
Message-Id: <20241216-genio700-configs-eth-sound-v1-0-04a719035d6e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALyEYGcC/x3MQQqEMAwAwK9Izgba6lbZr4gHqbHmki6NilD8u
 2WPc5kCSplJ4dsUyHSxcpIK2zYQ9kUiIa/V4IzrrbMeIwmnwRgMSTaOinTsqOmUFcdx8KHvPt4
 bBzX4Zdr4/ufT/Dwv9URWS2wAAAA=
X-Change-ID: 20241216-genio700-configs-eth-sound-8876c4356602
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_115135_160946_1F2D222A 
X-CRM114-Status: UNSURE (   5.66  )
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

This series contains a couple configs needed for MT8188 platforms to get
working ethernet and sound.

Tested on the Genio 700 EVK.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (2):
      arm64: defconfig: Enable sound for MT8188
      arm64: defconfig: Enable MediaTek DWMAC

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)
---
base-commit: e25c8d66f6786300b680866c0e0139981273feba
change-id: 20241216-genio700-configs-eth-sound-8876c4356602

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


