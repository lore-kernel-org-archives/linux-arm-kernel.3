Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862DEC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTJyzc/zMCZOX2O75cjdUrm8CpljF+Yy2jrwQvp1lV4=; b=26d71vTwhRfBuFKF/D1Wu0I8Pt
	t9/mYe+ZPOcMHczDP+/lxLnYQXHA51Tez39iVd92FGwonQ0LcRdinzKhALwd+njkVUBIlh0qt1Skr
	trRh2Tr92aZ6W7QNbXc4X1HcM3WXfiAY2siTzJD5C2qYJb624S8M3dPYEsor3q2khHuHsuf/Cbd/t
	TKLEseBy6iAWpq/o7ZoLbdIO4VCAbSmmNDNr61YlWVVPPSRKkJ9p739x43TED6nPDOGylpOkhLRlS
	d4LKcjBzAnZWyjY/4fwfjg+0Yg6bw5+yUye81CVHjeR8zpZ9n55YDc7YeCv3DzXL4ClpbvcqswQ6P
	S4IRyW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGzB-00000002Ccc-3vjN;
	Tue, 04 Aug 2026 15:23:21 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGz8-00000002Cai-1rQo;
	Tue, 04 Aug 2026 15:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1785856994; x=1786461794; i=wahrenst@gmx.net;
	bh=PTJyzc/zMCZOX2O75cjdUrm8CpljF+Yy2jrwQvp1lV4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mV569GzOF+mxE3Nsy1VsMVlakw7D9KJqo7+RiQ9O76d32V5Oru6f1/la29j8cgs7
	 74WmlFHZzV9fSiv3ScEaXTHb7CnhTiB6VPvy5073GYD161hNAYodP0ZMgsm4cQei4
	 7sv77g/8VOl8otqxsin2wGJB52jo++8krL9RXvBoImh8guwSXhqditjORpmpn62t6
	 sIis/xk70Xyg0zpnxFeJ379qSGYtATgQ4is0YZ9NjL97ztp2A1XqKMF+8p9qhbpxA
	 XzfgiAvK/bVEEoHTgn8wws5k34Fi2ESgKOth6li0RxZjwqAunXVkA5TrUGtf7rWY+
	 K5e/L4ynGScxo5UzIg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvPJ-1wRaIE05kj-00ONvS; Tue, 04
 Aug 2026 16:57:11 +0200
Message-ID: <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
Date: Tue, 4 Aug 2026 16:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P4hylk2BckQnMYZ8JZKL1DnIWZy/oosvtCUSb34v3gHvWDceUUt
 ToOaWO3e3gFgLOZ+IAJb1ZR4Ztjg5zxfsci6MzRoXPgBkehpYTL7yN2gAvohPeVDfMAKkQ9
 AjpHxp4VRveBWeW+PFzzItsxByJfuVa+j2qsShg2SkhHuseEgkd7l9IzgithR4h+nkeCwUk
 gQEQg2gnXIyP4ebMM2OXA==
UI-OutboundReport: notjunk:1;M01:P0:ujYkc98ZlIw=;u5/xqZSRXthgob4MysKMR8BrCG7 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_082318_775215_E29872F2 
X-CRM114-Status: GOOD (  18.47  )
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

Hi Gregor,

sorry for my late reply.

Am 04.08.26 um 15:13 schrieb Gregor Herburger:
> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> and in a c Stepping. There are two separate dts files. The
> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> the d Stepping. The d stepping does not set its own compatible/model
> string but uses "raspberrypi,5-model-b".
In case the SoC and not the board has a D stepping, why do just change=20
the board compatible without the SoC compatible like "brcm,bcm2712-d0"?
>
> These two steppings are not compatible. Booting with the wrong dtb file
> causes a crash at boot.
This sounds like the patch should have a fixes tag?
>
> Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
> distinguish between those two steppings.
>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/a=
rm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> index 127be0fc27c22..5a86ad69645c3 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> @@ -3,6 +3,11 @@
>  =20
>   #include "bcm2712-rpi-5-b.dts"
>  =20
> +/ {
> +	compatible =3D "raspberrypi,5-model-b-d0", "brcm,bcm2712";
> +	model =3D "Raspberry Pi 5 d0 Stepping";
> +};
> +
>   &gio_aon {
>   	brcm,gpio-bank-widths =3D <15 6>;
>  =20
>


