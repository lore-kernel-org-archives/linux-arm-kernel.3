Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6703CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 17:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmQllN2pDw8NXAbKMZpYQ4Kj+bbL5tYdmA6gAXvP1Kw=; b=jfVAnwB88rIm1SxsBAyidFOTIS
	lQKGBFgdw8lHJt0UEp+Xgyph2bFmr75yPgYyqWb1cGb+50Mwf0jMgCiSJE92R5rGiGpuebdui/EhN
	CnrUjw0UCuQEvZWOaZoHVgltlhty8B1u9RGy4P+MSXmzH893vqVdqXeXjPfglKYenm84O9P+w7ucF
	r2WIO+3eQkDPtxXpuQyTBmtXyEs+6kKmJn/2aV/TRqD/x9OXGZuF6c6ZwPhPcGTvo+s8+2oyQ2Two
	Tp91jSxyxy2dSepL7OwChCxexizVpZMg86V1/Lz/UfJXIXelkXub4UQpL2dM2k32EHGv669L+HheG
	gel+pZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJHv-0000000C7AG-0t8O;
	Sun, 07 Sep 2025 17:34:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJDg-0000000C67m-3wyG;
	Sun, 07 Sep 2025 17:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nmQllN2pDw8NXAbKMZpYQ4Kj+bbL5tYdmA6gAXvP1Kw=; b=G0idjGkbwbq6im9iS0jIsINwRj
	y30L1G7MTUyr5KSI5JzrP1ieKW3hs979GPPFohd4fGA9ROaNa7ZV9scjmBHoJd634Mo9oqrtTKuiH
	J2tHF2A5lbRhaCgEi0essNw4XpHR8Ea4xWNxOQztjhKlgRHqtu4ybFDqk/NK5ooXVp5bk6poL7PvF
	4gQNA1SSlKR1ou2Lhw2odab4GjazaSo/X9fMxBfxiwg+fw2vcqGw09C7nJfML1R60sViTViHBCsR1
	e107BnMuJ03h5j+MGdfeO/RYGG+6DCqr+aiEqsVtNBwpjpnc4jg3ERSRfie8muGPP8G5QTnWsj76+
	k46Z/1Xg==;
Received: from [61.8.147.163] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uvJDb-0004Ii-OF; Sun, 07 Sep 2025 19:30:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix the headphone detection on the orangepi 5
Date: Sun,  7 Sep 2025 19:30:10 +0200
Message-ID: <175726620394.195224.4863527121598491124.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904030150.986042-1-honyuenkwun@gmail.com>
References: <20250904030150.986042-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_103028_979876_ADA3C1A8 
X-CRM114-Status: GOOD (  11.61  )
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


On Thu, 04 Sep 2025 03:01:50 +0000, Jimmy Hon wrote:
> The logic of the headphone detect pin seems to be inverted, with this
> change headphones actually output sound when plugged in.
> 
> Does not need workaround of using pin-switches to enable output.
> 
> Verified by checking /sys/kernel/debug/gpio.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix the headphone detection on the orangepi 5
      commit: 0f860eef417df93eb0ae70bbfa8d26cb7e29244d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

