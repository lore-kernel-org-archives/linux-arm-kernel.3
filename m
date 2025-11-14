Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479B1CD8CBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 02:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kq+Oc886/LrLDNK1/htEPP+A49jj0wEsAdsPts936pM=; b=P7/Jg0gWwaaSH1aDE7rd6qIpXs
	gn/TgsAXfZsdFQeeWD4Y9OJDCXYni7acsBs4AQo5kUpzbTsEHPBgMBaKBOW3GK1xdTz92HsuHbE1h
	c/L3Mm9VQO/78PLn+DZcQxlAEm2KyrV0d+8IbM8VEyp15oTcd65K18n+k284felXY6TaNSlYsHxiA
	B9W5Zl+A4Iua19EU/MgmmZlH4A9N34I0XprwnBuLau7t602s5+lS4yBQERrlrgyTlTYrlKynfrW80
	cjy25XkEEKKVxr4aA+Z04mxbI55gtEs7/a+epLEuAEbxJCUt1cQBU83uP6MeGIXYuiUZwoLCXdPY6
	HOLTFh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJj7e-0000000BOqC-0Oo9;
	Fri, 14 Nov 2025 02:01:10 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJj7Z-0000000BOpM-3H9A;
	Fri, 14 Nov 2025 02:01:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 2B94340FDC;
	Fri, 14 Nov 2025 03:00:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763085657; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kq+Oc886/LrLDNK1/htEPP+A49jj0wEsAdsPts936pM=;
	b=NIGAVFUkmzy+jNAIJciKEgw5Ep3TqVeem7Td/7j/6XgIC+oFFnoTVeRPCv7Ylil+cysVHI
	QceK/Td99BFv9Sbl8spI+HJk6baFEyh0flBqoIWFw03f/kTsFzWEDwLsVrYKFIx/i2V8Qz
	V/+zfbsGDPE1lhVHoNWXu52nRhH/acAZ/c14/9+gECBnV+FfTOCtSb4ZWYV2qmVW8/XP0A
	1vEU6xXNlVDrAqdZRIdc2tyzYTTt0dZ7FBw5kzqgdJG/PvibL3xkvLg5tKNvkQJMI0CBx2
	UnQYz6RvuEKIiavrWwby7nyk1SaLgNnx/ZFQwnrEOqNulKrPv/To7cCL3m2Khw==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20251111172003.2324525-2-michael.opdenacker@rootcommit.com>
Content-Type: text/plain; charset="utf-8"
References: <20251111172003.2324525-1-michael.opdenacker@rootcommit.com> <20251111172003.2324525-2-michael.opdenacker@rootcommit.com>
Date: Fri, 14 Nov 2025 03:00:54 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: michael.opdenacker@rootcommit.com
MIME-Version: 1.0
Message-ID: <e8235ec5-d857-1a0a-7108-3c2b8a5dbed9@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/2] =?utf-8?q?dt-bindings=3A?==?utf-8?q?_arm=3A?=
 =?utf-8?q?_rockchip=3A?= Asus Tinkerboard 3 and 3S
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_180106_055230_45DE3C5F 
X-CRM114-Status: GOOD (  12.35  )
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

Hello Michael,

Thanks for this patch!  Please, see some comments below.

On Tuesday, November 11, 2025 18:20 CET, michael.opdenacker@rootcommit.=
com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>=20
> Document the compatible strings for Asus Tinkerboard 3 [1] and 3S [2]=
,
> which are SBCs based on the Rockchip 3566 SoC.

For consistency, this should be s/Tinkerboard/Tinker Board/.

> The "3S" version ("S" for "storage") just adds a 16 GB eMMC
> and a "mask ROM" DIP switch to the "3" version.
>=20
> Link: https://tinker-board.asus.com/series/tinker-board-3.html [1]
> Link: https://tinker-board.asus.com/series/tinker-board-3s.html [2]

These two lines should read like this, to serve as references, with
an empty line afterwards, of course:

  [1] https://tinker-board.asus.com/series/tinker-board-3.html
  [2] https://tinker-board.asus.com/series/tinker-board-3s.html

> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Do=
cumentation/devicetree/bindings/arm/rockchip.yaml
> index 6aceaa8acbb2..451597a6cffb 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -86,6 +86,17 @@ properties:
>            - const: asus,rk3288-tinker-s
>            - const: rockchip,rk3288
> =20
> +      - description: Asus Tinker board 3

This should be s/Tinker board/Tinker Board/, because it's actually
a proper noun/name.

> +        items:
> +          - const: asus,rk3566-tinker-3
> +          - const: rockchip,rk3566
> +
> +      - description: Asus Tinker board 3S

The same as above.

> +        items:
> +          - const: asus,rk3566-tinker-3s
> +          - const: asus,rk3566-tinker-3
> +          - const: rockchip,rk3566
> +
>        - description: Beelink A1
>          items:
>            - const: azw,beelink-a1


