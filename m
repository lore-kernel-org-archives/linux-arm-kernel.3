Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B84E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SBd5SJv87i4jOo+5k9uOKrUg6sUQ45A9jsFMVMrJ2k=; b=NhJe1lVH8w92zZNBM0IjqdE4mQ
	Wpqi+Kz+Ri+UGrDv3P8qTAiuXjbR9NfWax+SV59ZuKtSoTipftd2Q3RuiL1tz1s2qV98UJ26wTSBr
	vofVSa/1OthTLNGUBoyJdZyQ4KRT8OH8KQLYnru2LHNTRsOzx4fCX1KzIoVNNaDFenmpKjF4Xt8cD
	V9mku2GxVD41LP+TcEZkGccCIQ0UV0x/G3SSLHFjrHZXviL3YhA0Yf/PMdJgxtQGwZADqgmUBo+H4
	9Qkv5twkvy1qkK2v0V+RxFsMJQWiY/6RDVUwu52t9YZrbdaPz+HM6oY0CEyyd931UAPejjYjFmcfe
	mO/ZYa5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUku-0000000D6gF-0rMQ;
	Tue, 17 Dec 2024 10:24:44 +0000
Received: from mx2.securetransport.de ([188.68.39.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUjf-0000000D6Z6-03tb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 10:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1734430907;
	bh=8SBd5SJv87i4jOo+5k9uOKrUg6sUQ45A9jsFMVMrJ2k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=orFzDA8aSiVmjuOLI0FczHf+sV6rgHbBwY1rCLoQZmN26RYgL8j2l+X3/iatdnKmY
	 b8xoAYr56vlGH60Ft6JeBplQUpzhM40PlzJfTjbHedeSxJdabLMGJCbSdHHixcphi1
	 lb9E7LRcfOgG2yq8vh7PQWtwuyEPxoqMurXdC9Kwq5ORhdK6MpFfzAtZQ9zVkfrtD6
	 TPj7Qb3S/WcXNcjSdr1gd/QrjiY2WJuGIDAk5IvCcqmaVzeHjzDsszfXwcIcv6osD4
	 wJPUa1C/p8SqxiNZIErbJs9gq/mrmhBCHLyQopmkKF7TvAMHnJrpalgvWU7PTcZCZ+
	 JAEERiw5hHxIA==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel
	<kernel@dh-electronics.com>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: RE: [PATCH] ARM: dts: stm32: Swap USART3 and UART8 alias on
 STM32MP15xx DHCOM SoM
Thread-Topic: [PATCH] ARM: dts: stm32: Swap USART3 and UART8 alias on
 STM32MP15xx DHCOM SoM
Thread-Index: AQHbTa+SkhqBiEt7mEeimKcVLbuCf7LqPx2A
Date: Tue, 17 Dec 2024 10:21:35 +0000
Message-ID: <2a960747f48e44daaa3cffe93ceb8ea3@dh-electronics.com>
References: <20241213223658.99802-1-marex@denx.de>
In-Reply-To: <20241213223658.99802-1-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_022327_276452_93055288 
X-CRM114-Status: GOOD (  12.73  )
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

From: Marek Vasut <marex@denx.de>
Sent: Friday, December 13, 2024 11:36 PM
> Swap USART3 and UART8 aliases on STM32MP15xx DHCOM SoM,
> make sure UART8 is listed first, USART3 second, because
> the UART8 is labeled as UART2 on the SoM pinout, while
> USART3 is labeled as UART3 on the SoM pinout.
>=20
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 =
SoM and PDK2
> board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> index 086d3a60ccce2..142d4a8731f8d 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> @@ -15,8 +15,8 @@ aliases {
>  		rtc0 =3D &hwrtc;
>  		rtc1 =3D &rtc;
>  		serial0 =3D &uart4;
> -		serial1 =3D &usart3;
> -		serial2 =3D &uart8;
> +		serial1 =3D &uart8;
> +		serial2 =3D &usart3;
>  	};
>=20
>  	chosen {

Reviewed-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>

