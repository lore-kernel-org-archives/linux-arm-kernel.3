Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E596E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVD38ry6XjUWoVgJ+oJLF45j3WXHuey6ua4rBWQhTj0=; b=vYtnFxHFYSz6eCTZ+Kr5Dn5lBR
	F0rRxusF3jIaWbMqWSybnLDqChBbbRkDN4cUBHtn0YVEnVQ/Jy4q7xQoGZFU43+toG6HX2xCkyksm
	LDU7cI929EEeefetjam0j9ZgYt2tyzOYOgYZ2qz7IcHD+cMI103X11i718XLjBOkLbeidn0d6l3wX
	Rnw+c9QDMDO1EkfXD5N8suVET2638eMTbqf8mycZgyqmH+1GMTPzpyoVBTnv0xCb6ipn2xz9AuA8C
	+R9MNm9fX6XZ4A6IwreiNFsrPGRNyMlGiHj0FwLSTObxhX0P3zZtQNzvn8LEiFbgL5DYImmLo6Lkx
	BBoHOzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUt98-00000002Vfz-0FAh;
	Mon, 06 Jan 2025 19:52:18 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUt7w-00000002VSW-3ubI;
	Mon, 06 Jan 2025 19:51:06 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7b9bc648736so1207199485a.1;
        Mon, 06 Jan 2025 11:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736193063; x=1736797863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVD38ry6XjUWoVgJ+oJLF45j3WXHuey6ua4rBWQhTj0=;
        b=OGVR14CIYRk1AgdtfEHcjtG8APi+bLHFlABA9/R2m+bEh7Rx9IQdaATkG6jrZgAqGS
         Ntf16Anqyl4gNIoDIikb8Q49gU37RSLG6kQmEJzx9IWrwaTxWcKuHeV32YuUq0NndlPq
         3cviwdj/wtblCpfRiYgym9/YnHjaK0KTLhUze/5N3Ko+4mqk9yLSFfuxJZP1An0CmuQx
         sNxPLjlbrMXEtSKgPEKm6it58p6FqdDi7uXgE1ludjMk6Hp27BK0s7saXjoNtt0PZ08c
         FEhgmMSZs0fNO/h8KIvAsBk15kzpKjYsXep0kxu4Od9ICSLB46VbtFjQ2yrC04e7aApZ
         qbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193063; x=1736797863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVD38ry6XjUWoVgJ+oJLF45j3WXHuey6ua4rBWQhTj0=;
        b=ZTpmz6ikNR0BjeU+KBWcfYwsDO/8lWNCKKdL5aSO9k7BaKTAaeVqoYEu47n4dzOFFr
         45wpf4D6+zuJlcpOZD3K0D+T0tqBj91XyYKmU6iqHL83Drue55hRSHsOhEp5yhzZNOEi
         F1Fv/ao5mNpoMav0zP07TGim5lHSJSgcf2jcgeUWasWJ15mIGlZshLpptMz93aXYEfIE
         dVMTgDQkOTap2rSk+lk0k0xdUXEf2+e7lgwDAmoNf0vDzZguaAOXH5qXlzmSE+XDD+Ty
         i0Z9x+2gRqNIR8YwoMVuwgkap62hEEDmAXQnlaYaC7ALQvZ6CUJqDWTvNypxU8hLdBfs
         2QHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlxyuLM2SShUKvjP+UjBQlG2Z7tGJtAYTI8erwSlg+uPQYDlPNvir51hltUB2Z35QeU0VZRWEcLXCzTu8CbHBN@lists.infradead.org, AJvYcCXYIgpY0jtT7n3AVeQiinAT3SDWcQixVSEps2KdzcN8qdgeo+qvnoZKN/3YjVUKio7bxCB8CYOafRYfHFtlNxk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkki1pCLBPNPdCXsV0QdrxGYMqLKlEwGsVDICoML25nxK9CRmt
	S0kMFJ2Sj1w4huRg/+qQHh++X9IePxtH7CDJmLtorplyECc0YIuNQvC+ae01M0tafSSrdb19cy/
	nKkgTdQzEoSQccRStoMZSU3Tkqvc=
X-Gm-Gg: ASbGncu2V7MCbJqyG9mZuAM7Lu/7BT8UZoV/Q9y51Mx84L0s5qvUBjpZSVCktyBjvAd
	RAqQ0pxL1e3615CGVvmKLDjOJurVIM0gdL7h0gEbEaDEXwPgN0A==
X-Google-Smtp-Source: AGHT+IFFhXRZczwYX7+y4k2AHyUXGH6DMbUubnu6jmb6A/f/+7SoRgMGuMBQkStFKpYVSokMXldT0Z3yBk0oZOPbm+w=
X-Received: by 2002:a05:620a:1790:b0:7b6:cb4c:10e8 with SMTP id
 af79cd13be357-7b9ba716c09mr9322005585a.11.1736193063281; Mon, 06 Jan 2025
 11:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com> <173619154694.838812.1604486663887944578.robh@kernel.org>
In-Reply-To: <173619154694.838812.1604486663887944578.robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 6 Jan 2025 23:50:51 +0400
Message-ID: <CABjd4YxP4jXZbRV0X-E8JntV+hzSo-4Jiq3yaequWuiWkqoUJg@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add H96 Max V58 (RK3588 based
 TV box)
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-rockchip@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_115104_970388_A54B8C3D 
X-CRM114-Status: GOOD (  29.19  )
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

On Mon, Jan 6, 2025 at 11:28=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Mon, 06 Jan 2025 01:07:16 +0400, Alexey Charkov wrote:
> > H96 Max V58 is a compact TV box based on Rockchip RK3588 SoC [1]
> > that ships with Android by default. Add support for it.
> >
> > Note that there is no publicly available hardware documentation,
> > nor vendor sources to be used as a reference, so this implementation
> > is best effort based on poking around my board and staring at the
> > decompiled stock DTB. It works for me, but improvement suggestions
> > are very much welcome.
> >
> > HDMI output is not tested, but expected to work.
> >
> > SPDIF output is not enabled (base RK3588 .dtsi needs amendment)
> >
> > Auxiliary LED display is not enabled (no mainline driver available).
> > The controller used is FD6551 connected to GPIO3 RK_PC7 (clk) and
> > GPIO3 RK_PD0 (data), which happen to be the right pins for
> > i2c5m0_xfer pinctrl config, and thus might potentially be used with
> > the hardware I2C5 controller (to be verified). Out of tree userspace
> > driver is available at [2].
> >
> > [1] https://www.h96tvbox.com/product/h96max-v58/
> > [2] https://github.com/arthur-liberman/linux_openvfd/blob/master/driver=
/controllers/fd650.c
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Alexey Charkov (2):
> >       dt-bindings: arm: rockchip: Add H96 Max V58 TV box
> >       arm64: dts: rockchip: Add H96 Max V58 TV Box based on RK3588 SoC
> >
> >  .../devicetree/bindings/arm/rockchip.yaml          |   5 +
> >  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
> >  .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 785 +++++++++++++=
++++++++
> >  3 files changed, 791 insertions(+)
> > ---
> > base-commit: af349ca4d3f8659d84abc667125c826fda155109
> > change-id: 20240618-rk3588-h96-max-v58-c2c1bf8e6996
> >
> > Best regards,
> > --
> > Alexey Charkov <alchark@gmail.com>
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=3Dy rockchip/rk3588-h96-max-v58.dtb=
' for 20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com:
>
> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: syscon@fd5d0000: usb=
2phy@0:otg-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-=
[0-9]+'
>         from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.y=
aml#
> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: usb2phy@0: otg-port:=
 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-=
usb2phy.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: regulator-3v3-pcie: =
gpios: [[267, 1, 0], [187, 20, 0]] is too long
>         from schema $id: http://devicetree.org/schemas/regulator/fixed-re=
gulator.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: regulator-3v3-pcie: =
Unevaluated properties are not allowed ('gpios' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/fixed-re=
gulator.yaml#

Indeed. Will fix it in v2, sorry for the noise.

Best,
Alexey

