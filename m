Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B16CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEQbfTHq4woxkjSkKI8PNLDzgEiv+PRgAM1sGErVRZ0=; b=pCLsVEICwkq/+NRlPmyowM57QG
	Qsq0hvbeyPfl8KmY7MD34vAgwB1TAwA3llCM9TXAMWt/4n8G5Y/bdVAttTouRbxaZ8mv1aY+r6Ac8
	QrKBQ3k1K6PFXdRdzf2/GInD1TRREGb8FS32b2qnZvcfuvX7jic9BZcBYcf0J2icXKdCiNKe0xyP1
	f05ZEpZiFWiYwddQO3kkIqnUBIyMPmgbojr4q80x7NpHqQBE+/XEY0lXs1ArxobDhSey1MjefUZgQ
	LkJV0M+2bLtVvH44WwqbE60p+kjZ2FauP/k5Y+7xGXXUSIBd052fgaZDk/MBGli1KMagOCY15W6OI
	iXR+zmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjut-000000072c6-0YkZ;
	Mon, 19 Oct 2026 09:44:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjur-000000072bW-1tRp;
	Mon, 19 Oct 2026 09:44:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21E8A403FE;
	Mon, 19 Oct 2026 09:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE601F000C4;
	Mon, 19 Oct 2026 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403065;
	bh=vEQbfTHq4woxkjSkKI8PNLDzgEiv+PRgAM1sGErVRZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xd7yGmJsIMZdGXApleih8fbzna4kEqDO3fB52ZJb7NrAhzNy+V1vGo8W9kdwwU7E1
	 Edt2BnYl3q+bTiMbmWtZM4nwxAduGAQnEPeryPbB60MuvrDP8IULar/u8BlSPyblKu
	 3ScLYDi/cNZRKeAEFhBBbgzTV4kXf/cxW/qmN6xCTdv4UHr+/Ynk8gwFtnOii3WCg/
	 d5TgtFPiNNhmyXEy78pm8B1Jk8URg17Iuxtdly7KZWvemhKZ2cRbeYIaAqhq2oIinU
	 E8oohLft0PkH2PegkysUq+FD2nu6xS9YK8INUCUI0CI6ghH4qerMYYn/RgvLx53W2+
	 Z8eetD5GuabiA==
Date: Mon, 19 Oct 2026 11:44:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: arm: mediatek: Add MT8163 Amazon Echo
 Dot (2016)
Message-ID: <20261019-steady-dragon-from-wonderland-3dcf33@quoll>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-1-f2462b2d2437@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-1-f2462b2d2437@protonmail.ch>
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

On Mon, Oct 19, 2026 at 01:39:57AM +0100, Ben Grisdale wrote:
> Add compatible strings for the MediaTek MT8163 SoC and the Amazon Echo
> Dot (2nd generation, 2016), codenamed "biscuit".
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


