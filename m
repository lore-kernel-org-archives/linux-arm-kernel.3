Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F9CC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TDp48bHsNLwefkivp6ahRNAatvlYx+YYOHXw2V7efvw=; b=CFge1JAHM7p8k8fc7sBtFi2QjR
	xvhs9hbOX1+Q7/pJTu6RuFTVyHryLHnd52sME2YlMA5gnmedlvS1WiaLZZmZ+19WRZ8qcKbIWpbJj
	u4kPDJ/HDLGu2kd9xyTzSl1q1mbEJ1KV/CYQA3jxMUSbEuzRS6emecuWegJhzSoQJTSI1gmVuZ+o9
	6CQG55QuZBxGHIa7JAhlLPPyvntVoPo8H3f+wrRmNx1H49PlzD0Dl6F581LircmgFOYd4ujPjHN9W
	Wch23+5dsSKbFJGYus8aGvx+Sj4/LeeNdqD1CIbUzvUZMhXqBqOMX3izux2h64yPXERZMigX5OmY3
	dM4I3I6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNn1-0000000AUfp-163O;
	Wed, 11 Jun 2025 15:54:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJJP-00000009i70-3ofu;
	Wed, 11 Jun 2025 11:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=TDp48bHsNLwefkivp6ahRNAatvlYx+YYOHXw2V7efvw=; b=nNWzNDZUli1TAaSj7QXb00FssX
	xqc584IW9SfZNSieKZ7STukyDv5AS4B4pFoXFjS2dv56d9n7gJS3CKKfQ2iUnq0kP2B4sEHe5Zwc8
	jup23IVRJlGQM9OzxgJOSfYofcvcV2YtlSq2bJ9jGejVP8k9VmpxbNnFfrZ5qqs0BF+bvBwBKvZgX
	JmZ+/xOROu2ig91ZifJE8ypdssO0gkgLD2KUhwch8UAx5AUGSjGt4HeP4LqSa9mIZFHMQMozFIRnV
	XPmkxA//H+zM741plAOqle2DR6A2gmZKzIcThYo0vCt+ptEYAdM3ORDYah8emkrlulhxQi6ZU2qAZ
	tqjvOkSA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJJO-00000002K95-0ZXk;
	Wed, 11 Jun 2025 11:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640083;
	bh=/xBjPL/xGn4SpJ0kMI0oUuAtTggcop7AzvAQx8nzDEE=;
	h=From:To:Cc:Subject:Date:From;
	b=DVRxKKgjCYzZW5IGdrBD3dFdWi2lJr1Do5BFXYmFzY8FENT6+SiswcLtaSfgrWUpm
	 ij66oinROpTyHf+x0xkFwwFPEjFCvNB6Y9M9nCgNjWUupd062WkkrrSp/LTfHE211f
	 DtTtUNHh4lz1QGkpioI/b4R0icccl5Ocir0JmJhic6vbbadtF5fvvPClkn196aMa8t
	 G3ESDfJWDnJdf5SB4NRc74oohyLDm0Tvln+wwmXIdhKAcTmd12kVhkpvUPWpEl0rI5
	 JKegGO/uQCwEX7o+SpALAjZeEA6Ccd72ob+LC3pWiNkBXblHtZ32WNeseNE6I1Er3F
	 ebKGRyNJJhAYQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF64717E0536;
	Wed, 11 Jun 2025 13:08:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: devicetree@vger.kernel.org
Cc: qii.wang@mediatek.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/3] Add MT8196 compatibles to bindings
Date: Wed, 11 Jun 2025 13:07:57 +0200
Message-ID: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_120806_298629_11F7E0F0 
X-CRM114-Status: UNSURE (   7.34  )
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

This series adds compatibles for MT8196 (Chromebooks) and MT6991
(Smartphones) for HW that is fully compatible with older SoCs.

AngeloGioacchino Del Regno (3):
  dt-bindings: timer: mediatek,timer: Add MediaTek MT8196 compatible
  dt-bindings: serial: mediatek,uart: Add compatible for MT8196
  dt-bindings: i2c: i2c-mt65xx: Add MediaTek MT8196/6991 compatibles

 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml       | 5 +++++
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 3 files changed, 7 insertions(+)

-- 
2.49.0


