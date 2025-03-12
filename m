Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1395EC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DV26id+i/ewtmpSTouvrpN5ux/gSJA+7Ro6w0hdJWB4=; b=p5AlW8vXn9nfAWGR1mpEzXWaAb
	WaBUNqbfFmFLDYXnAvxKvSanH9Jh6k/2EmeSdSjFZe7P4IVcAw7ypDborYLsznOhXvwN0KrPzLhxT
	W59cqBvGIJDIk6nigBmbUlAhidiM5ejXmeWiugUKFFsGHBdVfEE6IqJOoxBQivLShPC0nlEZKnHou
	nShV3lCZ9OlsC25oGS8ZcMEOO6wtXwGRwy8+tKyUGLiWMkZUvGluhlfd/xjGFYb9R0nYyPbUeecKn
	fr1LpUMPS2K1u0hn+zhs/zH67ftJvs1edmAPH4tnC9U9u9JPmA2RK+kP5P5Lm7+s80D3Ig2Jya3xr
	ZvlZB79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGye-00000007liQ-3pcZ;
	Wed, 12 Mar 2025 07:58:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGnX-00000007jra-1sdJ;
	Wed, 12 Mar 2025 07:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DV26id+i/ewtmpSTouvrpN5ux/gSJA+7Ro6w0hdJWB4=; b=cMBXd1jmwnOLFaPtfCRXeS00IA
	07TuLv6/2ZO/POdWCwMUx1Y2OPxQtRM0BqmXD7orD1AZbf73ZQQwIxNVgRIvxQb48hbET+YWO9tBx
	tAI547cso8Ca9NA2TfE7u7KM6rW4BklkCtFrqgWyPNNQ4JVkb8wcQfUeVd2M7Ur/xrcPJFC8iet6O
	IC3NumxJpx8vCHmpQQUpqRkrz5AXEmaA4239olno501iVCKu1eTXMLg1dg46c00VB8BEYa9ZdomDi
	nDkxov7T2Fsve++uGCA4e5YotZsJTM7GCNuzD7TLh975pF4fHZNfMP96dUjvdVMIxFFUncB/r0czR
	nrxztl5A==;
Received: from ip-185-104-138-79.ptr.icomera.net ([185.104.138.79] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsGnF-0005zY-0p; Wed, 12 Mar 2025 08:46:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Florian Klink <flokli@flokli.de>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/4] Orange Pi 5 series HDMI extras
Date: Wed, 12 Mar 2025 08:45:58 +0100
Message-ID: <174176555629.249409.12164910795169233638.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227235623.1624-1-honyuenkwun@gmail.com>
References: <20250227235623.1624-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004639_497777_24F848BB 
X-CRM114-Status: UNSURE (   9.74  )
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


On Thu, 27 Feb 2025 17:56:19 -0600, Jimmy Hon wrote:
> HDMI Audio and HDMI1
> 
> Need testers for Orange Pi 5 Plus
> 
> Jimmy Hon (4):
>   arm64: dts: rockchip: Enable HDMI0 audio output for Orange Pi 5/5B
>   arm64: dts: rockchip: Enable HDMI audio outputs for Orange Pi 5 Max
>   arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Plus
>   arm64: dts: rockchip: Enable HDMI audio outputs for Orange Pi 5 Plus
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: rockchip: Enable HDMI0 audio output for Orange Pi 5/5B
      commit: 21f1208a3af4c30497f60ce220490edd761c5ed9
[2/4] arm64: dts: rockchip: Enable HDMI audio outputs for Orange Pi 5 Max
      commit: 01284d7e38fca8a4d6a9982cc69e618aadd30de1
[3/4] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Plus
      commit: ffafe9c2dc31d1a346aff482157dd37eaadbe054
[4/4] arm64: dts: rockchip: Enable HDMI audio outputs for Orange Pi 5 Plus
      commit: 1bfb987d1a54bc139b62261e3698006418835229

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

