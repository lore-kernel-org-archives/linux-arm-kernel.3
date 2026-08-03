Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CE9C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewIzq0LibUQ6nB6UeoGja0UgNFI3wXy5HatxgQmIUJw=; b=WnC8+DULR8zOYYjdUdTGrOboz1
	TtDKoJ0yWD6pgaNGndoC++ofbnpVN/fUk+kX0GlQaZo7t0XllygHwUtR4OWN1RC5OTKuuMTvAnBYt
	ZPCtRh1vEyAd1eOyRO90IFPKFDQrSCZhwwImCmQ1GAclmbD77Wo/2vB08wxLR+6yrdFQQ5dmZn4uf
	kz5BT9gUv0qwO8YhUPgLLiFmvzfHT3kbHFYIbILBj3MYmoFeZk3IVxCE/q90otP1p06wOo4Y7Dus+
	vqYU+3aODzSqeGzpYirZRDY+eP+NmbM1ji6W4wI8ytnmikdahhgeGfy6aVoizWudXSo40ZVfIfdU3
	/IQXwX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqseG-0000000H9Ui-1kAq;
	Mon, 03 Aug 2026 13:24:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqseF-0000000H9U0-2MCB;
	Mon, 03 Aug 2026 13:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 34E4941209;
	Mon,  3 Aug 2026 13:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8CF1F000E9;
	Mon,  3 Aug 2026 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785763447;
	bh=ewIzq0LibUQ6nB6UeoGja0UgNFI3wXy5HatxgQmIUJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SV0fH98WZVDHS7kV3MtroOyYATNwTHsNidP7OGsD9j1V4qyH+YZ/Z6Hox1QZ1jNA9
	 3jdYzqqt6GOMDx+cHMzWLEllGzDiDSbCMjaRF+vYEnhYSnwCC94E1nTW9rUHlDmzKn
	 /ttUNPZyWB/8TRiK8Ze4s6IhSF/MxJZrj+la7KbmuQOJZjSRBpr7BKObrhLpco39Y0
	 URWIpqf4GWuOtmtT2OpMhlAdLWgyh9RRr//v6IedvZ8H3Nv7xEq9QBgHh9mX5Vopcx
	 /56VW0xcJQdfq4amODpFS7ibeYomUH76DHpLhbXjmoiMMW5mHjFNlStxVhEERporJZ
	 6XaUvT5CgQ2UA==
Date: Mon, 3 Aug 2026 08:24:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add MT8512
Message-ID: <178576344579.3104650.10771178654777991535.robh@kernel.org>
References: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com>
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


On Tue, 21 Jul 2026 10:00:28 +0200, Carlo Caione wrote:
> The MT8512 USB controller uses the standard MTU3 device MAC and IPPC
> register layout and is handled by the generic mediatek,mtu3 driver. Add
> the SoC-specific compatible so the controller can be described without a
> legacy split node.
> 
> For now the only user of this is on the U-Boot side but we want to keep
> bindings in sync.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


