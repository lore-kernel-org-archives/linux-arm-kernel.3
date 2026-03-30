Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A6CFF4934
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 02:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzfztcHVW5zVig+WG14bRx+Z0nkYHAr2g4y2I8ErAoE=; b=YdTJWOM3vH46yujK8Mnw3ORKf1
	4TSKX8VMu7jZah2NelZA0qyjxJOaumM1A0SSUQwKuax90DDzUUqp1YHy1vV7hgYnPrdMccMDBs6HW
	EgYq24BiLEW+tf5Bkl1RZ2NWj7ncb3zVl2+0ow99ZeWxZJ2HeFzMWtJlwH90hWRR0e6KtUclUDqoZ
	qlGwxPqAtjI7jx1iYj/mWAQQwDUpzZZbg7/MlwKCReY4pFs1dmnm0abpALXZyodw9UvKpvrvsTgnw
	Wz/7X6yetQFxP5tQJJag7Ibms1RqBz8qntkajsw3age0+B3BGsCR3esj9joHQ3IvsXXo2K6nyqjjE
	4bpV72AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w72fP-0000000AWKk-27US;
	Mon, 30 Mar 2026 02:47:51 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w72fH-0000000AWJe-3SLJ;
	Mon, 30 Mar 2026 02:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774838854; bh=LzfztcHVW5zVig+WG14bRx+Z0nkYHAr2g4y2I8ErAoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M2eeelTW6i0L0tXSpv9TL1cOaX4GUj+YwnaOgyy9Y+WcChuL8DB8I2JClDgNG5esP
	 /ibxCqZmgOBqB50GxHA2Q9Shm9MoxEIC7xc9Ea+YsINxXUG8+J9LoI/JESpTh7K1ll
	 5+Tho7bGpC6b4nTc/UqAQF88kzoDEaPCndLfJ1EY=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id BC0B724B; Mon, 30 Mar 2026 10:47:00 +0800
X-QQ-mid: xmsmtpt1774838820tpjwh2w6i
Message-ID: <tencent_723DE3D68C7F44CF67ED583F558130B47208@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+JMPTFH+qlG0rqFrd7A0ipJV8tAJUcbaZuu0agTHNatFA4WZx/s
	 zodnfSGb1N+LAOqHNYU+r1lA0EcdWOT/nY6HCBp6KlPHtbuylYyVlMGP8XfiVBQeXgl8sJgNkU7u
	 /FFo437UhXvLd4MVfvGMYNYMuKCiQE9gJ7hTn/uaMdUMroYzccZhE49oG/amEjCfsyP4MZ+S/tRP
	 kADGHEiZ5mNjZm2VJ2oeaGVJ6eqi3bDMhE6K6g883lDqqWhk85qB5cl5BkotUirbY+oMm0dwSsa3
	 diboPV4L6ehO0NGLq+0UfOL+ZrQksOhS3FGUz5DAO7Mvf2lPB7PZiXJn9ZPg6c1bSP+rCgaLkhON
	 66fwD8CEhwamOsYf27Wbt9o9C1cj6OyHjSISetWBySFmE7fUz5ENXBl7ZdJlKd4YCoaRxv+KZ29i
	 wps2ca7JKNs9oL+gb2LLOKLqtvZBX48Cby61HPzxi1lTfQhFd8FAaiBIE73WHxIOupRni3ucFZna
	 hEk1vnuaCXBB5lPwLLXA+2sGwosTx38XHtxs2W0+AxajoTe5e2K7DKszL44PhWwsUqACuaCwIza8
	 j2ZlLPavRhNWSvnGnzAU3EHYH5jNJcr3sy2BrB7Az5jT6UubNlWlc4JrbjdAA8VLhI36PqMVUSon
	 Gx52rRgFdFw8YdDMF9V8gwzn3/m0oG3zoSS9Oh3vh40tl0TFNQgil2L946tlM6yZOlo8cd+j39M0
	 Zt0t9OBTXNRCqf0TI0ly+MPPA6O5ifBb1rK8NaqoUgnyVRp2dcegXhZ4oAiInUW9VZLtdmFZuI5b
	 V32NC6k7yAQNlEx415H4MKoydnY7jXUL9KsN6UlCsUinLTt/VZhgU+pNbdIEndjzOse5fAG0l6VI
	 aWy6WMVOOyhlpzgJd0yfIcGmObTQY7xlAv35+HebXUjRJ80/kmUjLElSZI+y9g9yO448fnFDlZuv
	 bX83Abl/L7cavgA8+Q9fHhPMiri9ksB/IPs1SglOniuK5y22NrEeBjYuLflRh54JUzi/jKgOLJoQ
	 VraR+p0RqXtKKyAvwKnhcslaOTJC8Lmf5vCtpwPU5KQexpaG6eP+8x1SIdYyHc9luOyS0ZTcSUSs
	 Br6zrxwFeblJb6BU66ckbYxUhBIA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: krzk@kernel.org
Cc: Yeking@Red54.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	finley.xiao@rock-chips.com,
	heiko@sntech.de,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add RK3562 serial aliases
Date: Mon, 30 Mar 2026 02:46:48 +0000
X-OQ-MSGID: <20260330024657.50845-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9b3ee9e9-d44d-49b1-81ac-9c3806dc0efb@kernel.org>
References: <9b3ee9e9-d44d-49b1-81ac-9c3806dc0efb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_194746_284394_F295805B 
X-CRM114-Status: GOOD (  16.30  )
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

On Sat, Mar 28, 2026 at 04:08:57PM +0100, Krzysztof Kozlowski wrote:
> On 28/03/2026 14:05, 谢致邦 (XIE Zhibang) wrote:
> > This fixes the stdout-path in rk3562-evb2-v10.dts.
> > 
> > Fixes: ceb6ef1ea900 ("arm64: dts: rockchip: Add RK3562 evb2 devicetree")
> > Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3562.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > index e4816aa3dae0..14e74e8ac7df 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > @@ -26,6 +26,16 @@ aliases {
> >  		gpio2 = &gpio2;
> >  		gpio3 = &gpio3;
> >  		gpio4 = &gpio4;
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +		serial4 = &uart4;
> > +		serial5 = &uart5;
> > +		serial6 = &uart6;
> > +		serial7 = &uart7;
> > +		serial8 = &uart8;
> > +		serial9 = &uart9;
> 
> UART aliases are properties of the boards, not SoC.
> 
> Best regards,
> Krzysztof

So are you saying that we need to remove the serial aliases from files
like rk3308.dtsi, rk3328.dtsi, rk3368.dtsi, rk3399-base.dtsi,
rk356x-base.dtsi, rk3576.dtsi, rk3588-base.dtsi, and so on?

Kind regards,
XIE Zhibang


