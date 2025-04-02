Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37580C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dFc7u9CnVfU1XQEyU2fA8Dt9PNsmlCZe9MtA1EHRpdU=; b=U4bNrTLvGKdvfdocEP57zm7Hih
	zpIHryp9sug6ogk71+9e4byl/VLeFAlmIm3sqmhqEj8eaHfEaqIepyJR2fpNN8cIt5GIxbrBjmsDi
	fhFu/Ty3ZsAKATATjb3TokWetGYxgidW+oIoIrF6x9P++17Lo9LLanudFeKXN8+29TdxW7ig9WYwC
	4G22RoEjClo9HMDppYhZvTaxi1fSUwIaq5Kj26359LnXKzxaKp5cU+Kyt+bDXr4O+8SKrs8j3obl9
	TPGYzTzDdUhUc4onsO3OJHfXDC8NTm1zJKllGAqeKyZ2ScldSyyvvoNF6joCcTLbYWf6L+uEqycCv
	FbAStnDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzu4y-00000005dL8-1tcY;
	Wed, 02 Apr 2025 09:08:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzu3B-00000005cvw-1Mvd;
	Wed, 02 Apr 2025 09:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743584779;
	bh=MAaSZtG+Pj7zEYW7AwCKH08fcrPrYRFVdzT1WeOK+d0=;
	h=From:To:Cc:Subject:Date:From;
	b=jbq5b83osdkvhR8TvZ30q+MDMOdlWmA8KEPrSvu/EqjBgzryRgk9PcXSSYxvsv7dJ
	 yIINhtNFZgEmnwoMZZmeQf8iCS6wb9F7V7dT7JP+HxO6lsvz6w78+2BUF8Fk+ey8i3
	 iMrP4DCzbFWOmzSMIqbkaXmrhIBeObTq27ypGD9JqAwvXwxfy3Ip8DwR5wWKKWfo1+
	 tKKFnY/xQFYvLQXzTF8KCqkIpz6cwPew1bMqlqXhW0M70w3r2DvgZmzni6cTonTw64
	 CNRW09GM43/pqgYXz2//usrInupdj2HCdQ82DJOmGz0tgBgAbLZlDZRE30pU5VNRZX
	 ebYtFqB0/1wbg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D397617E014F;
	Wed,  2 Apr 2025 11:06:18 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	weiyi.lu@mediatek.com,
	tinghan.shen@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] arm64: dts: mediatek: mt8195: Power domains fixes
Date: Wed,  2 Apr 2025 11:06:13 +0200
Message-ID: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_020621_666595_E354D3C0 
X-CRM114-Status: UNSURE (   6.17  )
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

This series fixes hardware access issues happening on the PCI-Express MAC
and on the video encoder and decoder IPs embedded in the MT8195 SoCs,
fixing system suspend functionality.

AngeloGioacchino Del Regno (2):
  arm64: dts: mediatek: mt8195: Add subsys clks for PCIe power domains
  arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 54 ++++++++++++++----------
 1 file changed, 31 insertions(+), 23 deletions(-)

-- 
2.48.1


