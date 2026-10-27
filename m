Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B84D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 22:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kp1CvmLz;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=DHD9ZAWd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wzA/VJ9i+i6DJvVJgSV/qqezvPTQqdtwC5bPnK70sno=; b=Kp1CvmLzj00Hwu
	xffnW0ER9ywcdmJ2mTNFVC+NMu6uhUTrnezcG7mSLtFLv42nuuCrL85BfxD2jMBN+P43yHDoJFwe2
	/00WN/cuZ7MKYJy5j4UGtEaoHoD3AwhbJMfV0KdNhhvwHgYn2lc8c9v6fcAK4rvitaBKtq92DvOkC
	ed0jjvumo28DBgECf7sLqC7QLCyOQ5w6RjTGryAUd2mJrN2sH5Jzdy3kSc+okBxXyXXEIW8wMbkcT
	yl7UI8iuQ7Z1edt3s0YVlHse4iIXMF09hYMtVJC5BK718uGKV12LoI/4OtpL8QdYkkKmiC0sSD++a
	hCQ5D7WU4Sf//X8JE/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLpNe-00000005ppE-1OeP;
	Tue, 27 Oct 2026 22:10:54 +0000
Received: from mail1.rojer.cloud ([144.76.98.110])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLpNZ-00000005poS-49F8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 22:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793139044; bh=y6y5Y1QJ5LEzAXEEvEIOfN3dlwUpLEs6mRHVPK5l9wg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DHD9ZAWdlMQrJGsXgSieQctSZjGbLjRTJGVuKaqNRfbMCMG3hh7BaG3ujAOt5CEfy
	 6Yx+Uavjq6OBz6FGstPmMHXQAewNBlpl8KZRtPYX2IMICMnNneZaUJ3AyshZe7hinu
	 d+X1rVLIuWlG9SGFnyA+f1vcXMVyPz03vzAACuI91HjDAyA3yiPF2mHNvbObd0zwHT
	 iCZhx4XCyAGYgQqNvmOXXwKpvdKRzH3lRDb1OGldppCMx6+LLtygtUdGt1EybQAl1t
	 QnQG1aMA27CxJ48y4mDJ4b1jZg/O9HR5Dj972fCsNGj3jwEZtEEOnsbJJj/73HalDD
	 EC55j9EgERK3Q==
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id AB3AD127218
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 22:10:44 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso316985eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 15:10:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGbJH3GdSYlyItGpv5t2aK/V6JBlf3wVv6kH+SqOHmw4Y//7n7fgh4PG855E4mXeblHwGRWd4C2wad8EneyLsz@lists.infradead.org
X-Gm-Message-State: AFq9FYITYQt/hoJtAO24eF47YUm1OGmL07qazDh4ucIfOdYcD0/Qr7IL
	3n5h3yxb97mg8wnJH0pKVnPkXhCgLyBRR4PATcX1B7oDElyCBiJDaGS87/dQxRFedv+J3vJLk4+
	iwSNQJJgqFAkKMvTdIJQJhEcra1SsEw==
X-Received: by 2002:a05:6820:1c88:b0:70a:c89b:d12d with SMTP id
 006d021491bc7-713eaf5ad71mr348646eaf.11.1793139043070; Tue, 27 Oct 2026
 15:10:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023235959.2988087-1-rojer@rojer.me> <20261023235959.2988087-3-rojer@rojer.me>
 <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
In-Reply-To: <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
From: "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Date: Wed, 28 Oct 2026 00:10:31 +0200
X-Gmail-Original-Message-ID: <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com>
X-Gm-Features: AclHuK9ygSoBB9eZyXuz1KFNk_TaXqdwq3xhUt4O0wFduajwOmgNHGsigYcfU5Q
Message-ID: <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergey Bostandzhyan <jin@mediatomb.cc>, 
	Jensen Huang <jensenhuang@friendlyarm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_151050_373574_B3BA545D 
X-CRM114-Status: GOOD (  25.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shawn,

agreed, it makes no sense here. will drop in v2, holding on for
feedback on patch 1.

On Tue, 27 Oct 2026 at 15:58, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> Hi Deomid
>
> =E5=9C=A8 2026/10/24 =E6=98=9F=E6=9C=9F=E5=85=AD 7:59, Deomid rojer Ryabk=
ov =E5=86=99=E9=81=93:
> > The NanoPi R2S Plus has an M.2 E-key slot wired to the sdmmc_ext
> > controller in 4-bit SDIO mode, where FriendlyElec fit an optional
> > Fn-Link 6222B-SRC (Realtek RTL8822CS) module:
> >
> >    - SDIO signalling at a fixed 1.8V (VCC_18)
> >    - WIFI_REG_ON on GPIO3_B0, 32kHz sleep clock from the RK805 CLKOUT2
> >
> > Enable the controller and add the power sequence. The SDIO pins need
> > 8mA drive strength for SDR104 tuning to succeed, as in the vendor
> > device tree [1]; with the SoC default of 4mA no sample phase works.
> >
> > On boards without the module the controller gives up after about 0.2s
> > ("mmc2: Failed to initialize a non-removable card"); nothing else is
> > affected.
> >
> > With the mmc core change for the module's CMD11 handling at a fixed
> > 1.8V [2], the module is tuned to SDR104 at 150 MHz and works with the
> > rtw88_8822cs driver; without it, it runs in high-speed mode at 50 MHz.
> >
> > [1] https://github.com/friendlyarm/kernel-rockchip/blob/9238df9d21e835b=
ba35c8ba5248784387936cb2e/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2-rev=
24.dts#L144-L172
> > [2] https://lore.kernel.org/linux-mmc/20261023232813.2983368-1-rojer@ro=
jer.me/
> > Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
> > ---
> >   .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 56 ++++++++++++++++++=
+
> >   1 file changed, 56 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/=
arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> > index 6ba4a74cb1f..db19a18ae45 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> > @@ -17,6 +17,15 @@ / {
> >       aliases {
> >               mmc1 =3D &emmc;
> >       };
> > +
> > +     sdio_pwrseq: sdio-pwrseq {
> > +             compatible =3D "mmc-pwrseq-simple";
> > +             clocks =3D <&rk805 1>;
> > +             clock-names =3D "ext_clock";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wifi_reg_on_h>;
> > +             reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> > +     };
> >   };
> >
> >   &emmc {
> > @@ -34,3 +43,50 @@ &io_domains {
> >       vccio4-supply =3D <&vcc_io_33>;
> >       vccio6-supply =3D <&vcc_18>;
> >   };
> > +
> > +&pinctrl {
> > +     wifi {
> > +             wifi_reg_on_h: wifi-reg-on-h {
> > +                     rockchip,pins =3D <3 RK_PB0 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> > +             };
> > +     };
> > +};
> > +
> > +/*
> > + * SDR104 tuning fails with the default 4mA drive strength, use 8mA li=
ke the
> > + * vendor device tree.
> > + */
> > +&sdmmc0ext_bus4 {
> > +     rockchip,pins =3D
> > +             <3 RK_PA4 3 &pcfg_pull_up_8ma>,
> > +             <3 RK_PA5 3 &pcfg_pull_up_8ma>,
> > +             <3 RK_PA6 3 &pcfg_pull_up_8ma>,
> > +             <3 RK_PA7 3 &pcfg_pull_up_8ma>;
> > +};
> > +
> > +&sdmmc0ext_clk {
> > +     rockchip,pins =3D <3 RK_PA2 3 &pcfg_pull_none_8ma>;
> > +};
> > +
> > +&sdmmc0ext_cmd {
> > +     rockchip,pins =3D <3 RK_PA0 3 &pcfg_pull_up_8ma>;
> > +};
> > +
> > +/* Optional M.2 E-key SDIO Wi-Fi module (Fn-Link 6222B-SRC, RTL8822CS)=
 */
> > +&sdmmc_ext {
> > +     bus-width =3D <4>;
> > +     cap-sd-highspeed;
> > +     cap-sdio-irq;
> > +     disable-wp;
>
> Drop disable-wp.
>
> Otherwise,
>
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
>
> > +     keep-power-in-suspend;
> > +     mmc-pwrseq =3D <&sdio_pwrseq>;
> > +     no-mmc;
> > +     no-sd;
> > +     non-removable;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&sdmmc0ext_clk &sdmmc0ext_cmd &sdmmc0ext_bus4>;
> > +     sd-uhs-sdr104;
> > +     vmmc-supply =3D <&vcc_io_33>;
> > +     vqmmc-supply =3D <&vcc_18>;
> > +     status =3D "okay";
> > +};
>


--=20
Deomid "rojer" Ryabkov
rojer@rojer.me

