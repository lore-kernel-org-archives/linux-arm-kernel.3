Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F172FCA0EF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8l89w4bHTJH83H28ZxlWSCRMM0V8+br4qkqPy5/xjd0=; b=ITSsB5LDJ5hiUDAO7r6MTOjlQf
	8BnxVB8lertLqmRngaXiP/W+gm3aIhaFVdFqUd7INyF0aA/vLsMDBCzoOm7JBQQSyfMHKhBe649ZV
	ZKKaHaFx52hUH2gdvVuyd9CTde5+rvewkprX/zGUIluDpyOh2Fxja0UKgSqPkPG568kXNyZjdULe8
	bjwEABxRKs60dQTtMpK4jW83PI9SzzZ/HheMUHpud+W17ym26CXJ5dVwbVKOf9Ia8vqn5a8f7wADr
	62VXI6pxDt0LWip6H53MYhsp/Oz6NHm2sBnp/7kuJrLD4ihy9snEpDADs1+1QCOpxVPY6SITmvJHA
	7O4mFs+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTAT-0000000BYvV-0caa;
	Tue, 19 Aug 2025 20:42:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRJu-0000000BKU6-0JZL;
	Tue, 19 Aug 2025 18:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8l89w4bHTJH83H28ZxlWSCRMM0V8+br4qkqPy5/xjd0=; b=gcR8kMD9Q71A7ezSFp0EEPQhem
	TJqW4ftDjs3qSqnC8AZ0XXhgHZn9wkOD+bwUNPMEn9JTbWOm4DsgbMES6CmD5dWREc3BFGop2eJBH
	+TEB01ubMjD8uJ0/T1fiSq4Kz5l21rKXWIGHnvm7CgRquGhL6v9H3ZimHeWfL86D6drVCh++UxjGF
	+dln30WIYeoic3imgQ0tnzjIhzqNBvTtJzfsn0kbKxQD0VKHwsevGtMvh9gsvX/jTdh5wiYHs1bO+
	g4+6KZTKeWf93whbuJErQgPevIuN1gl77doOV9YB98XI5+YjJoVzD/v5nVw9he7hC0hMegIiAgzGU
	pZuimlAQ==;
Received: from i53875a31.versanet.de ([83.135.90.49] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uoRJq-0004Ru-TA; Tue, 19 Aug 2025 20:44:26 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dongjin Kim <tobetter@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Change ethernet TXD timing delay value
Date: Tue, 19 Aug 2025 20:44:26 +0200
Message-ID: <2821088.9PvXe5no7K@diego>
In-Reply-To: <4d25c642-d457-4cb7-8bc1-587edd4f1d75@lunn.ch>
References: <20250819045018.2094282-1-tobetter@gmail.com>
 <4d25c642-d457-4cb7-8bc1-587edd4f1d75@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_114430_114653_0E194E8F 
X-CRM114-Status: GOOD (  15.40  )
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

Am Dienstag, 19. August 2025, 18:03:47 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Andrew Lunn:
> On Tue, Aug 19, 2025 at 01:50:17PM +0900, Dongjin Kim wrote:
> > Very poor network performance is observed on the ODROID-M1 Board
> > (REV 1.0 20220613) when running iperf3 (under 200Mbits/sec), and
> > this problem can be resolved after changing the value of TXD
> > timing to 0x35 from 0x4f.
>=20
> How did you decide on 0x35?

just because I accidentially stumbled over that recently, Rockchip has
some scanning functionality in their vendor-kernel to get possible
delay values for a board.

Described in a document called "Rockchip GMAC RGMII Delayline Guide" [0]
and one code location is for example the armbian tree [1]

At least that is one possible source of per-board delay values :-)


Heiko


[0] https://lo01.g77k.com/aeb/docs/en/Common/GMAC/Rockchip_Developer_Guide_=
Linux_GMAC_RGMII_Delayline_EN.pdf
(random internet source Google found me)
[1] https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr5.1/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-rk-tool.c


>=20
> ~/linux/arch/arm64$ grep -hr "tx_delay =3D " | sort | uniq -c
>       4 	tx_delay =3D <0x10>;
>       1 	tx_delay =3D <0x1a>;
>       1 	tx_delay =3D <0x21>;
>       2 	tx_delay =3D <0x22>;
>       4 	tx_delay =3D <0x24>;
>       2 	tx_delay =3D <0x26>;
>      14 	tx_delay =3D <0x28>;
>       1 	tx_delay =3D <0x2a>;
>       6 	tx_delay =3D <0x30>;
>       1 	tx_delay =3D <0x3a>;
>       3 	tx_delay =3D <0x3c>;
>       2 	tx_delay =3D <0x42>;
>       5 	tx_delay =3D <0x43>;
>       2 	tx_delay =3D <0x44>;
>       1 	tx_delay =3D <0x46>;
>       6 	tx_delay =3D <0x4f>;
>=20
> The numbers are all over the place, but it is clear that 0x28 is the
> most popular for some reason. But since this delay values are magic,
> i've no idea why.
>=20
>      Andrew
>=20





