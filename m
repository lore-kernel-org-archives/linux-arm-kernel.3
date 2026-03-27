Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319AE10BA455
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLsy/CssNK+lnIK4lJym7dw7hHXn3LKkM7c9dVlTTUM=; b=Th3UUJrTUJgpELQ+gXzaGScPyq
	/1xwOYm4wA1blI9u6CAlI2mevHysiKqXd4fdUpEkJQB2rUrYaPKYREsVNgYHBsKmTOvwT8VWwjSj4
	mlz1WWudP9OXKIZtq6W6bPMl2xK/qpj1kIjcb9GJolexZXmBNapMTyH+RNTu45n3unCojguOf9aXx
	mMJTus2247STeXFg5+pxPybrdij/RUUvBbLg9/9wq3GMZP+4A+SK5mFruUwrFyk89G+LSRt32au3I
	WdUMu6JTwrc0EpBenWk2Fn6teklaGjEQtfbDqW+FRmmlU4QGRY1iYnivvTBCH0AZzZISC/cr5pVRk
	qrHaoZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w639v-000000072AP-1DrK;
	Fri, 27 Mar 2026 09:07:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w639t-0000000729s-1Oy1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:07:14 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 06EFF1783;
	Fri, 27 Mar 2026 10:05:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774602350;
	bh=lK1k8tVf48GHPvLwztHGlY4knt1Zw3SO9dEwb1AzehA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CN/BRyvhAdneg4XVvKktKriMy7t5utblF/xZKEnWtnArTviz/lflWGxBOLkJHkHey
	 WyR8VVPk8lclPvE8jq0RI/9Bhd3GZvHPgNzQyWUcBySFXflOk5OWBIOOszoz/+0soe
	 ZeZcJ70NXcxRwbKI4dgFNcVsnmigD2MvjprbZf2k=
Date: Fri, 27 Mar 2026 11:07:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: renesas: Fix missing cells and reg in
 Draak/Ebisu panel DTO
Message-ID: <20260327090707.GA3026970@killaraus.ideasonboard.com>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <20260326042411.215241-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326042411.215241-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_020713_510848_CCCD1D5E 
X-CRM114-Status: GOOD (  15.70  )
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

On Thu, Mar 26, 2026 at 05:23:58AM +0100, Marek Vasut wrote:
> Add missing cells and reg DT property into Draak/Ebisu panel DTO to fix
> the following warning:
> 
> "
> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

It's slightly annoying to have to specify those properties in overlays.
It would be nice to improve the tooling, but a warning-free build is
probably a more important target for now.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
> index 258f8668ca361..90767d74e21b2 100644
> --- a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
> +++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
> @@ -27,7 +27,12 @@ &lvds1 {
>  	status = "okay";
>  
>  	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		port@1 {
> +			reg = <1>;
> +
>  			lvds1_out: endpoint {
>  				remote-endpoint = <&panel_in>;
>  			};

-- 
Regards,

Laurent Pinchart

