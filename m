Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A44DD132D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaYc2LVDsAE+818bdTnM3o6tmWXWgzcFVg9WXd40wow=; b=Y7SHmVIYp5ZkiZ2BCvB3qM3w4u
	85NFjwjLpD5lmM2QTso0NC7sCv1uG29cIYOTZ70ZVy3BJrrowS/11TEeIVIvpWa+kotp5I4NGFvGC
	7rrj0wA3CKoGOE5FyZ8SQxjeZjSzTOhqab8fNZVoyXMeJsXLRlwYfZWLTfIy6VAyd1ZtVYJn8A2RN
	nb4416oiz5/xSgP7mzdkeIxrZpGOBMopixM1nUGUFgNiMSkVJnRudPQWrHvgSIjP3Qmjrzt3NKHqp
	7U9/FgGAt1LKOHXtQ+G6wnXhsitlvj+zzmfSaXybU2KW7pBhUDWy+Ap1EZ5Z98if6nFBHyKtz9juT
	kyoEWy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yd6-0000000E99M-12hI;
	Mon, 04 Nov 2024 15:04:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yLn-0000000E6rE-3gAl;
	Mon, 04 Nov 2024 14:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730731597;
	bh=OuS/4i+oygUwsdbc+DVGxua1yWNGYXVWyfGEWNFamiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTSHtLS836wcVaZJDpm8Yf8qGI47kjv7/IUuPAG4uEwoXmnGr4LDmIN2uQk2Iv82m
	 Sm178fUyf/ZN8sJLsAA7CvSLgf48cQnCFrVbdors/KoZ1eCTtw4ktA/s/eA6d4ynYF
	 OrpfuFm+okUH1/UIcJNuasDi4zp1oYo8hqDKZAnRQceI1Fba9HH6pBRRyygKWkuxdl
	 xRXOUCV6dj8n0bzWIZdH6oqV12rZSeKcW6sXSjzBSNVH1N86162i8PGA5pHbMen/e9
	 yG3hm8vszU5yTpruquqB0J5+PqIppIXloKC69s6VLbQEJBzlcFvgXe1rsM0kA5VYve
	 msFOR5HntBqDA==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F2AF17E3696;
	Mon,  4 Nov 2024 15:46:35 +0100 (CET)
Date: Mon, 4 Nov 2024 09:46:33 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Biao Huang <biao.huang@mediatek.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@collabora.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 0/4] net: stmmac: dwmac-mediatek: Fix inverted logic for
 mediatek,mac-wol
Message-ID: <c6fec04a-7eed-4c61-85bf-a11542df441b@notapiano>
References: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
 <9a1ce320-e1ce-4d2f-a8d1-7680155ef71f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a1ce320-e1ce-4d2f-a8d1-7680155ef71f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_064640_091982_04D888EA 
X-CRM114-Status: GOOD (  23.44  )
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

On Mon, Nov 04, 2024 at 11:18:48AM +0100, AngeloGioacchino Del Regno wrote:
> Il 01/11/24 16:20, Nícolas F. R. A. Prado ha scritto:
> > This series fixes the inverted handling of the mediatek,mac-wol DT
> > property while keeping backward compatibility. It does so by introducing
> > a new property on patch 1 and updating the driver to handle it on patch
> > 2. Patch 3 adds this property on the Genio 700 EVK DT, where this issue
> > was noticed, to get WOL working on that platform. Patch 4 adds the new
> > property on all DTs with the MediaTek DWMAC ethernet node enabled
> > and inverts the presence of mediatek,mac-wol to maintain the
> > current behavior and have it match the description in the binding.
> > 
> 
> Actually, I'm sure that all of these boards *do* need MAC WOL and *not* PHY WOL.
> 
> The only one I'm unsure about is MT2712, but that's an evaluation board and not
> a retail product with "that kind of diffusion".
> 
> I think you can just fix the bug in the driver without getting new properties
> and such. One commit, two lines.

Alright, since you're sure all the boards need MAC WOL this is simpler: I can
just fix the driver handling, and also update all the DTs to make sure they use
MAC WOL. (Right now some are enabling PHY WOL, mt8395-genio-1200-evk.dts and
mt8395-radxa-nio-12l.dts, while the others are enabling the MAC WOL)

The MT2712 EVB currently enables MAC WOL, so even though you're not sure about
that one, I think it makes sense to keep the current behavior ie add the
mediatek,mac-wol property just like for the others, so it keeps using MAC WOL.

I'll wait a couple days in case there are more comments and then I'll send v2
with those changes.

Thanks,
Nícolas

