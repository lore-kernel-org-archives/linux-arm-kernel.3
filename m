Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B056BD6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzByLoX8jakLRN0ny7u3dNWNxuSp8DM6Ql4ZxjAEOtw=; b=Ctl8vFgu/YHun2aIb+z/kphwME
	UHgQCrehl9a2vLWyqmpy6IATXnzEZjY6eeMTSQWDtXsuSk64SCB7mas63/sv/Fa1XlWoRf1E4Xvge
	0ggK5OIIJfSj8o/e5iN0o7L6IbCFMeRTLTqDfKBxQFnwhaysL6WlhQSaZ2RKqLPqBOtaGAms39L3t
	ogYzxU/BObIn9DS2lSTCAq7JvTg507lS+1rz5s+oTa+Vl4DGPkVN7HkxbWZT9eKEfiliriMh2d8V2
	m94lKiT6iv0RExQIV7wudPHn6YrFcsKDyaf4Jic6a7J6rxA2aRp0AuUEZR7Y1pGjLwyudx/XR5eOb
	JxnraXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBfRR-00000000bcd-2e3J;
	Thu, 14 Nov 2024 19:23:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBfQW-00000000bTf-27PW;
	Thu, 14 Nov 2024 19:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731612164;
	bh=JRi8xKxGuuE+b0jHJ+Vql53V2Sw0uR0okGWsErcdffQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yqkehs3TrUIuXJhUJQV0HpIYhnyj2ep62TqiK6605+0AuNb+Ie3PObfpQ3qgk5Bdu
	 PLhwrXLEWqQEHPdM3en8D8z79kKxPxDDh4M+C4yC6aNxeJio+hyvyZ0aN/ixk6rNJb
	 UduvP3x+5asy+/QrE7Qu36caEXlA+Y5GJ5lFJnX5it8BERejomH5Blxmm5kCsL9Bjh
	 RVp28VQ1E3WeOVM+o3m8a4OiFpHPx8EWEfx9BH//KOLwhpoBlIqsM+uwZcb+v4tdsj
	 MNlj22eoru+8XGoTvwzC5bk00i+mITI1XejHZc8ZlBAb0Nl7FYt0t3FqRY7ws0+rxo
	 WqQvyaW17HrXQ==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6856D17E377C;
	Thu, 14 Nov 2024 20:22:40 +0100 (CET)
Date: Thu, 14 Nov 2024 14:22:38 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Michael Walle <mwalle@kernel.org>, kernel@collabora.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Set mediatek,mac-wol on
 DWMAC node for all boards
Message-ID: <d441b614-0b71-410f-af4e-30cb164d9cd5@notapiano>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
 <20241109-mediatek-mac-wol-noninverted-v2-2-0e264e213878@collabora.com>
 <bdbfb1db-1291-4f95-adc9-36969bb51eb4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdbfb1db-1291-4f95-adc9-36969bb51eb4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_112248_698272_47C07779 
X-CRM114-Status: GOOD (  23.79  )
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

On Thu, Nov 14, 2024 at 10:26:34AM +0100, AngeloGioacchino Del Regno wrote:
> Il 09/11/24 16:16, Nícolas F. R. A. Prado ha scritto:
> > Due to the mediatek,mac-wol property previously being handled backwards
> > by the dwmac-mediatek driver, its use in the DTs seems to have been
> > inconsistent.
> > 
> > Now that the driver has been fixed, correct this description. All the
> > currently upstream boards support MAC WOL, so add the mediatek,mac-wol
> > property to the missing ones.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt2712-evb.dts                   | 1 +
> >   arch/arm64/boot/dts/mediatek/mt8195-demo.dts                  | 1 +
> >   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts | 1 +
> >   3 files changed, 3 insertions(+)
> > 
> 
> ..snip..
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > index 31d424b8fc7cedef65489392eb279b7fd2194a4a..c12684e8c449b2d7b3b3a79086925bfe5ae0d8f8 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > @@ -109,6 +109,7 @@ &eth {
> >   	pinctrl-names = "default", "sleep";
> >   	pinctrl-0 = <&eth_default_pins>;
> >   	pinctrl-1 = <&eth_sleep_pins>;
> > +	mediatek,mac-wol;
> 
> The demo board has the same WoL capability as the EVK, so you can avoid adding the
> mac-wol property here.

Not sure I follow... If we omit the property here it will use PHY WOL instead,
while the genio 1200 EVK has the property, so it will be using MAC WOL, so
they're already the same and omitting will make them behave differently...

Let me recap to make sure we're all on the same page:

This was the WOL configuration for each board before this series:
MAC mt2712-evb.dts
MAC mt8195-demo.dts
PHY mt8395-genio-1200-evk.dts
MAC mt8395-kontron-3-5-sbc-i1200.dts
PHY mt8395-radxa-nio-12l.dts
PHY mt8390-genio-700-evk.dts

After patch 1, they all get inverted:
PHY mt2712-evb.dts
PHY mt8195-demo.dts
MAC mt8395-genio-1200-evk.dts
PHY mt8395-kontron-3-5-sbc-i1200.dts
MAC mt8395-radxa-nio-12l.dts
MAC mt8390-genio-700-evk.dts

And after patch 2, the remaining PHY ones are set to MAC:
MAC mt2712-evb.dts
MAC mt8195-demo.dts
MAC mt8395-genio-1200-evk.dts
MAC mt8395-kontron-3-5-sbc-i1200.dts
MAC mt8395-radxa-nio-12l.dts
MAC mt8390-genio-700-evk.dts

The only board I have in hands and am able to test is mt8390-genio-700-evk.dts,
which requires MAC WOL to work. For the others, your feedback on v1 was that
they should all be set to MAC WOL. Except for mt2712, which you were not sure
about, but it was already set to MAC WOL so we're keeping the same behavior.

That's how we got to adding mediatek,mac-wol to mt8195-demo.dts,
mt8395-kontron-3-5-sbc-i1200.dts and mt2712-evb.dts. Let me know if there has
been some misunderstanding.

Thanks,
Nícolas

> 
> >   	status = "okay";
> >   	mdio {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> > index e2e75b8ff91880711c82f783c7ccbef4128b7ab4..4985b65925a9ed10ad44a6e58b9657a9dd48751f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> > @@ -271,6 +271,7 @@ &eth {
> >   	pinctrl-names = "default", "sleep";
> >   	pinctrl-0 = <&eth_default_pins>;
> >   	pinctrl-1 = <&eth_sleep_pins>;
> > +	mediatek,mac-wol;
> 
> I'm mostly sure that Kontron's i1200 works the same as the EVK in regards to WoL.
> 
> Michael, I recall you worked on this board - can you please confirm?
> 
> Thanks,
> Angelo
> 

