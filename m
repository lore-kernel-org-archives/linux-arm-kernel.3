Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BD0CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anJy0kovOnmwnKwTf1uVV5HwRBu0s+Xw6msJvdrAWkM=; b=Prt1DnQ1DYF3vU8O59MaX8yhwX
	hRuLy4ipGyUKArX62W+qaZFe9OAxaihjGSbZ14COh+g3OVlUkXhMU4/BUnnOV7hwhe2Fvx7tV1eKC
	75r1++mkRQHfTWnlyELmWPkeTgF9/snPz31eDXd31s2iyETvI1OZ5VffWdeAsEZY7AAjRKYGZJvgS
	vuMktsdBYpJvwWJwfH8uPgwDlpdrFf6Nq9cZacrTN+hvuLRArWfoH1jT8oUc9NmrQmQmnE+h8qV+G
	QZnIuYu835Os0Bz3p77T6dJmbLjvpI1CzeUj0RFQnR2YI70V7s0duTokGx6dcNvH6SJrHmh6kqXQs
	SmWS804g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdPL-0000000DkmY-2f1t;
	Wed, 05 Nov 2025 13:18:39 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdPJ-0000000Dklj-0KDO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:18:38 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762348704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anJy0kovOnmwnKwTf1uVV5HwRBu0s+Xw6msJvdrAWkM=;
	b=aa6b5568Qh3/bE4wzKB/hpYPvmdW4nlyMx41tGjnmZuoU64FMmoh4cXl1BRU5DJ6tuo+nI
	3HSYeLTC7A200JHb4jozfS3Q0HgGytOBgeky7yw/BxPCMnlkdGUMCr+Xooh2VOJaWNvruP
	BbBMVUyM3OUs1s+qs+7rdLcCskHKQe7q47xlfLhSUdGa4V0LtZvnYUjzOa+HAbeokkQGPq
	Xe5gFcTNi0N3+crmQfPC192PhyQd03iDeVnEwTxdEwVRH2R2MCNzUfbPSO3XYuzSqXY4+i
	IWJzneP/ljxJaSA6odMvzs1zM5cn/jb+7sYU87vOWDBcBTGBP/ObrAsTfnVg3g==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 14:18:21 +0100
Message-Id: <DE0SH4UBVXBH.77ADEH3224GK@cknow-tech.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michael.riesch@collabora.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add missing clocks for cpu
 cores on rk356x
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Heiko Stuebner" <heiko@sntech.de>
References: <20251103234926.416137-1-heiko@sntech.de>
 <20251103234926.416137-4-heiko@sntech.de>
In-Reply-To: <20251103234926.416137-4-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_051837_258363_5ED196A1 
X-CRM114-Status: GOOD (  12.45  )
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

On Tue Nov 4, 2025 at 12:49 AM CET, Heiko Stuebner wrote:
> All cpu cores are supplied by the same clock, but all except the first
> core are missing that clocks reference - add the missing ones.

I noticed it myself some time ago (but failed to sent a patch), so

Reviewed-by: Diederik de Haas <diederik@cknow-tech.com>

Cheers,
  Diederik

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index d0c76401b45e..a1815f8a96e1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -69,6 +69,7 @@ cpu1: cpu@100 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x0 0x100>;
> +			clocks =3D <&scmi_clk SCMI_CLK_CPU>;
>  			#cooling-cells =3D <2>;
>  			enable-method =3D "psci";
>  			i-cache-size =3D <0x8000>;
> @@ -84,6 +85,7 @@ cpu2: cpu@200 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x0 0x200>;
> +			clocks =3D <&scmi_clk SCMI_CLK_CPU>;
>  			#cooling-cells =3D <2>;
>  			enable-method =3D "psci";
>  			i-cache-size =3D <0x8000>;
> @@ -99,6 +101,7 @@ cpu3: cpu@300 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x0 0x300>;
> +			clocks =3D <&scmi_clk SCMI_CLK_CPU>;
>  			#cooling-cells =3D <2>;
>  			enable-method =3D "psci";
>  			i-cache-size =3D <0x8000>;


