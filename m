Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B4CD20695
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LA27eETEMeKn2TVb6y+owtRyY3BBlRXR9GEPMauKk30=; b=z7nHNpB6nrMh7+ANCFwww2SBWN
	k6r/Mm+wJ5yh9FjEuwDSCxWxJD/VNUIlOJFW0YSK0MAA7nwxtO1Ak561TXnQosDQzrUSdvEFJuDcx
	bd9pFfGPWsOFdh1zITwxOwJAg9hN1a3L6vNc55PNJc39KjtDxNoiZoWKBnDKZe82puzR6k2v6/2GP
	kxIuuMB93wxR1+Do2d7ohhqZkRRe6b15H9n9y2EnuAJzFOUoyq3fB27jQjlQQyV0B+WOITAvTbYE5
	1Qv/8bmGCpZhDfFtHx5Iqt52DHU1/DDT0Stm49Dl+SDEF2TizZEJ3GhWtLsFCPriHNDZxk4Sttq6h
	orA64FSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9bX-000000084XA-3S2O;
	Thu, 04 Dec 2025 13:42:43 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9bR-000000084Sp-1dyT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 13:42:43 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 68A1D1FA5F;
	Thu,  4 Dec 2025 14:42:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1764855750;
	bh=LA27eETEMeKn2TVb6y+owtRyY3BBlRXR9GEPMauKk30=; h=From:To:Subject;
	b=HvkTHMxd4ioPdsJVVac+RcIbiIPiUjkTj8wYc+DcdOkK3M0WixFNJ4pgeVek1Nufn
	 ZxRx0Z4QOmDiKcXXEdjUaOGAK6rBAKquqXNBXo6HZslUrTK8ZSw6z15aKTsstANvyh
	 3wKIcryi24P3inZLyfPCZtb/inDYH7bMy2udVxod+7/QJqcFjBxOpVjktoMdqaux8u
	 5w46ZHI+QrPYVfURGCdBN8oLu31IW4qmIKlq2fBIg0PH5fasdO85y4buH0AH9oq1Bd
	 HJ32l+ZqSUBgdM3qGT6UZA+SN5QzDHOjCEIhg+8By5XC/9+s86rfWpEwfCzYFfnS8C
	 HG9sZh6vCAV4w==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: ti: k3-am69-aquila: Fix USB-C Sink PDO
Date: Thu,  4 Dec 2025 14:42:17 +0100
Message-ID: <20251204134220.129304-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_054238_028661_DB2BD49C 
X-CRM114-Status: UNSURE (   6.37  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Change USB-C Sink PDO and the amount of power that the device can sink to
zero to maximize compatibility with other USB peers (the Aquila Clover and
Development Boards are not sinking any current, they are self powered).

Francesco Dolcini (2):
  arm64: dts: ti: k3-am69-aquila-dev: Fix USB-C Sink PDO
  arm64: dts: ti: k3-am69-aquila-clover: Fix USB-C Sink PDO

 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts | 4 ++--
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.47.3


