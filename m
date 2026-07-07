Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83501C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARJtStOd24SeMWn03WDpYKksjNNKhxE1nVOumgSWP60=; b=p/N8z+LbIAE7XL4iRI5CUFvPA8
	FWqiaxhabsANL3nilocKgBCABwzRT1JZ+7BD05y9GOPAJV57pysOfO8NebAEQeiZww3NAGe8r6RLZ
	lPGGqzu/cYFpDwH8l3gT4LTeL/gJ0gMaHXJyqPNHOxdXxsyATIJ1ZvBt1KureZ59yGzuA5LJHKn39
	2MLP4h23RWeumcxWpBRPHSupvONOLwa9bVUmhpoJ16OZR0K7/VFGTTz2GPmUJFawo/vcPtGcjAJyL
	Lmgu+w5WskZ2cY+qztvl9NK7+kCuC03kqZTGp5D/C8ibHGKkdMNBRMepfkb1v/DHdROIm3g8lvRjO
	wYz+0avg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1aa-0000000EY15-1L4A;
	Tue, 07 Jul 2026 08:55:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1aW-0000000EY05-3o2w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:55:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 70BDFC8F1E8;
	Tue,  7 Jul 2026 08:55:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01A19601A3;
	Tue,  7 Jul 2026 08:55:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C9BA11BC10CC;
	Tue,  7 Jul 2026 10:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783414526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ARJtStOd24SeMWn03WDpYKksjNNKhxE1nVOumgSWP60=;
	b=b/VO1cmq/Czd+9zsONRk1F/8fNp1QhwKz8ivy0AO00vPAXxiD76Bc/4MxdJT/ex0s+1aLF
	cVUHDrc08l23sld4CMhIhm2y4E4gkkFKPoTKJbDbt3Z8m/K3iw6DJSg7GkqvQT2Htq4gz6
	xPgBrCDeDlCJX/Ym+qSs315h42bTU2V03cK3G6fljAuBJeEaHm9NRll9Dkov2z4l9wO6Bw
	TSSGBtocNor6F1+COt/mMABpv3e4ku3NJWSOeMoSoDvwM4FazT/fxWTA/txj6Q4tX9cGMl
	ZPQGtcNr3alezZ+mPXtZaorON0rtaB3igCSBjXLGiAj9K+FZ3At2aAMNEhf4Rw==
Message-ID: <f416b487-5bac-4391-aead-61fd4d2f16ae@bootlin.com>
Date: Tue, 7 Jul 2026 10:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: stmmac: mediatek: add PERI_ETH_CTRLx
 register offset in platform data
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: rmk+kernel@armlinux.org.uk, kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-2-17f345eaaca3@collabora.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260707-dwmac-mediatek-mt8189-v1-2-17f345eaaca3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_015533_105850_5E070B49 
X-CRM114-Status: UNSURE (   7.54  )
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

Hi,

On 7/7/26 10:21, Louis-Alexis Eyraud wrote:
> In preparation of newer SoC support, that use like MT8195 the Ethernet
> control registers from the peripheral configuration syscon but at a
> different base offset, add a new base offset in the variant platform
> data to access the PERI_ETH_CTRLx registers and use it in implemented
> methods.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

