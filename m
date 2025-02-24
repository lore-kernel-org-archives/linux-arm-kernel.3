Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D14BC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+bB6gBEckuYi5FCk/0+mHTSaAah2UOvyiek4Gw+13w=; b=2FmeGpt1SMCw1r2h6ahgc3ZfOv
	Si7eeq/VxhxvjyvfSkLXJt2gNaaKNun87/EtKvV9cW6/tiYQdoATH3yYNWWgT4PHKAXDArA7HmgGd
	U0zm1Mbeb9N80ES2fbgvphuZ/5sM82/YRuCVZ7H6wLhfTcABT4rvP4Giw25BtKQ9DGzHcGN5yok5O
	cSmonF661BmeqzJ/YwAHMLiBF6sejN/nUokCWMCSyRZkiGb+zC7jjI2nxsXiTX6agTf3wJ9NzfEYO
	QQT+Gw5N/J1fWGLDDhWWIfvK6DW/soR9MfmH1FUIVYcvkmofuVVprjN0w3DCCv06f6wGsppZFQmhb
	Ga28VyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVl8-0000000D96P-0Z3q;
	Mon, 24 Feb 2025 10:32:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVgS-0000000D7tX-3aEC;
	Mon, 24 Feb 2025 10:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740392850;
	bh=58mOQSEzO1TyVtwzbSqqgxMRd/iPYGw37WbmD25YxWk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g5WEDT6ebSXT+N7vc6Re2Ur1ATaIdAxQByD4Atsi5Wp1+AFdnuESgEbgUKJDohOeV
	 yEevjWJLx29bbZh1KIw+izJt28pYTU8Z9DGNAWAqCHNaATYhn4k9RH/I2di9KN7GlO
	 regBIXKzP0ebx7TokhwHzNp0u8a7gkJxk6xG0whoQcCok2dBIg6NUOVUro4JluBd8y
	 72FXW9i3rf89pgPPfKfpdWEBrn9/s99Ze7cP7JduMJfbsZo/dszEB8S1EqTHreC7Yc
	 OFWQ8Tg3+QFhakC59Tlc49lUUHEPT1dqdb9sr0jw/euLP1VSv9NCoRo7/yc+cmmj2p
	 NvVs6vPm4beIA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E2BF617E019E;
	Mon, 24 Feb 2025 11:27:29 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250221-fix-mtk8390-genio-common-dup-regulator-name-v1-1-92f7b9f7a414@collabora.com>
References: <20250221-fix-mtk8390-genio-common-dup-regulator-name-v1-1-92f7b9f7a414@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Fix
 duplicated regulator name
Message-Id: <174039284983.36653.14029465967864965883.b4-ty@collabora.com>
Date: Mon, 24 Feb 2025 11:27:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_022733_077698_7F5D1DFF 
X-CRM114-Status: UNSURE (   6.03  )
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

On Fri, 21 Feb 2025 09:49:52 +0100, Louis-Alexis Eyraud wrote:
> usb_p2_vbus regulator has the same regulator-name property value as
> sdio_fixed_3v3, so change it to avoid this.
> 
> 

Applied to v6.14-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8390-genio-common: Fix duplicated regulator name
      commit: 8020b233c6f166d703ee1d3b065fee502bccb8f5

Cheers,
Angelo



