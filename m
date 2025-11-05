Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6AACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06qBPm1fhFSKR8WuXfgSJkBHchOvYaGI3r+Tq1ruRHM=; b=WmcV8bk63rjQe7PpKhmKxl73Sn
	5vrnwlpu0EnHPKj2mY+ssV40lRGgF12S+Z4j/dU2EOxWCfxw1fbTvTRtZILvhvyJQn8HYNtK6ACOo
	x9Lm2Sxx6Ue42CFGaYDZRJGQLdwlb7WCRXLhrGbmITf33i/gk6XU4gZqgIIs+DQevn7Ndhc1fR+2s
	d4qGMNsSAE30U7hUtfk+b5VLF+2bwvpVt0QLdPZdifSTPd2zqHud+Fpk2knZHaK0EP1c7SaMep5cM
	IC/HwZNYOK5cIYtq3mU7SX/znGc9ofCXlaoIeyv5cGCbdmkl+nRtXHWE+gm0LVZtC8pxGDydepWGe
	LXB/Bgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdNi-0000000DkZU-3qxc;
	Wed, 05 Nov 2025 13:16:58 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdNh-0000000DkYa-0nH6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:16:58 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762348604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06qBPm1fhFSKR8WuXfgSJkBHchOvYaGI3r+Tq1ruRHM=;
	b=nuFi3+XJIUC4IMIZbpTNvnro4Irl5tYMnQEv6fg/Kkvl/IljVEvTDKotl6REwLqxDISxs1
	jThgRGnSFy2QBbD3kavo6bUiH81wPE88IxmoVUcgZFaqwcJLuolnq0lVd9iUCAbB9WtBZJ
	DXX7B1rwDawDtBkYA6jbdjAFiuSeJaLipBy5O2IdmxEimmOSL2m/teOlY/62usQ0UKCA72
	YkJeImAlO5eo6SX7oI+p+l20fKbwhNW8ixTRCMvu3x/THQH8TppAJ4pAC9gO8W/4fDyLSb
	ORun7XhsHZ7QsaF72kfVFoe81YBN2F09k+BeOKzG5qgJotzcvXV4PRBCVeQZOQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 14:16:42 +0100
Message-Id: <DE0SFV203UMS.1ZV2JE6QEPN29@cknow-tech.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michael.riesch@collabora.com>
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: use SCMI clock id for cpu
 clock on rk356x
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
References: <20251103234926.416137-1-heiko@sntech.de>
 <20251103234926.416137-3-heiko@sntech.de>
In-Reply-To: <20251103234926.416137-3-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_051657_364585_ABC2E80D 
X-CRM114-Status: GOOD (  12.32  )
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

Hi Heiko,

On Tue Nov 4, 2025 at 12:49 AM CET, Heiko Stuebner wrote:
> Instead of hard-coding 0, use the more descriptive ID from the binding
> to reference the SCMI clock for the cpu on rk356x.

Any particular reason you only did it for the cpu, but not the gpu?

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index a3361527d4fe..d0c76401b45e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -53,7 +53,7 @@ cpu0: cpu@0 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x0 0x0>;
> -			clocks =3D <&scmi_clk 0>;
> +			clocks =3D <&scmi_clk SCMI_CLK_CPU>;

Regardless of the above comment, feel free to add

Reviewed-by: Diederik de Haas <diederik@cknow-tech.com>

Cheers,
  Diederik

>  			#cooling-cells =3D <2>;
>  			enable-method =3D "psci";
>  			i-cache-size =3D <0x8000>;


