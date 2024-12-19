Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42827E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Zw2d1P4RwoK4b8sGzJTYrAeKHEdi4dA0KvE5MWzkqE=; b=U1Ts50tMNUVhcckkApX74xUkLV
	u0lI5EXxlrLnXpnSJnkU/X+4LZSMyGSGXs42/8Jm2xd915b2N441RfWn7TQkt6a9mE90ahuh1YocV
	YFtdOUrfYgF4XnXD86pHb/ryxh0sJpFS2gF8bW0TNlRYY6bUd9Bko99SMgp+f21oOX4chAWa41KSn
	vLvvex0JTNMOInwW8Dx26Wzqy/WyUE47tmGmwzhRlcJ9VcpAaRyP08/pTxu82wP3cDkd5y0ekD3vk
	t+dmkuYKX/E/C/32T+XOQezyx4dhUvKlr02j2kwJM3IZAQMDXZDF7dpgc6wGVWG1y0AQdxqbTK4ht
	cNsTlBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOF32-00000001i2X-3j4m;
	Thu, 19 Dec 2024 11:50:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOF1x-00000001hxI-07Kt;
	Thu, 19 Dec 2024 11:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734608963;
	bh=zrTiXUwCLjiTAbMoDeiCmLIyME5GPRSo8NxwUPaBOLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bA1sxbFDC4cWYvcp6F27Qs6Zgx6bxSsQbnLpUKw8apPWElBlgO6BEAPXaz3oQB67E
	 +qEIEN47j+kFhGmOe4TYf9bc7PN5Lbn7R1EVQHn+aIIJtSoxFjooPomspoPKwD7PX1
	 pcQyvGgxDxhN1DmXm4aiwmyLRh6j+uJjxv8ZQuGRjl+PbhjEM1e+4wowPJDlEONQCj
	 UpkuavukSqE9ehzQRNLfaggBy3FNjOC6rj2RfmpYF343n2GFj3H8wXjnC/48daugYH
	 o0jmYySwlXekNvLRS5ODwsS919HeXiKLgbnst+xHTpeM80MuJaslMAFsglV+WYzWP2
	 M9u321Dnju7Lg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D7CDC17E3630;
	Thu, 19 Dec 2024 12:49:22 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
References: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
Subject: Re: [PATCH v3 0/2] Adding second source touchscreen used by some
 mt8183 devices
Message-Id: <173460896280.52937.15376299467879995072.b4-ty@collabora.com>
Date: Thu, 19 Dec 2024 12:49:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_034925_213237_CE55EBEB 
X-CRM114-Status: UNSURE (   5.70  )
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

On Fri, 13 Dec 2024 05:27:46 +0000, Hsin-Te Yuan wrote:
> 
> 

Applied to v6.13-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
      commit: 5ec5dc73c5ac0c6e06803dc3b5aea4493e856568
[2/2] arm64: dts: mediatek: mt8183: willow: Support second source touchscreen
      commit: 9594935260d76bffe200bea6cfab6ba0752e70d9

Cheers,
Angelo



