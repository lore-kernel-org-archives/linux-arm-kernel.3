Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7700610BA456
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewcL6MHsN5UXFP6Oe9Y0BEj+IBckQbSIJfjFx555W2g=; b=MJFG3aEQ8p0JGq74WmLZxYwM1P
	uVEiUSTpHthbVJO+L64N8PFTCwlAJyw1r8Le/As09ir2Qk/rYmonXJKX/pgQy8ShH/h+wdu0nIXkx
	ucwl19x6+CIdFp7Xp4IRwU/UTL/I+xWmZowlJwN1of5ACZ4DYWhiLuZ5FzFCyd73ouUvxxXBEITrg
	sJufpdcIj3HlhmXWqhIoOb1JkEkOwQ+pnZ3j9FazIFR61mvloxUeGbgMM8dsAHEj8MdVqtQGh760c
	nEyGPmOFB5bh1bXgymLG106JENbIRX1ZudHNDJElaeVzzgDtUugBcFwuuVkESJrRSCkHk0mJMxfdQ
	I14XSYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63AD-000000072DT-2VH9;
	Fri, 27 Mar 2026 09:07:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63AB-000000072Cr-2PIG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:07:32 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E9822190A;
	Fri, 27 Mar 2026 10:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774602370;
	bh=ZjebFdSihxZLgJjAVBYMuUvCsxxt6OaZ8SQEmNE3ewA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBm9bbWjFN4/OZSMEelhHf0QPQRYl72Dhq8RYVZCxPcy0hGxja5sMThYMXaLX1rel
	 X1ZZnF+We8LegC55l8RLOXAPKSTiMEttEtQxwlZ4ekjCNDwU/zfopIhdysVyU7lDgV
	 f2LwiNndKl0kkwu8FdF5nFfEjdKy3oLWn0qbPhRA=
Date: Fri, 27 Mar 2026 11:07:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: renesas: Fix missing cells and reg in
 Salvator-X panel DTO
Message-ID: <20260327090727.GB3026970@killaraus.ideasonboard.com>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_020731_755350_B00AA819 
X-CRM114-Status: GOOD (  15.54  )
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

Hi Marek,

Thank you for the patch.

On Thu, Mar 26, 2026 at 05:23:59AM +0100, Marek Vasut wrote:
> Add missing cells and reg DT property into Salvator-X panel DTO to fix
> the following warning:
> 
> "
> arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

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
>  arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
> index c83a30adc6adf..7807c3f80409a 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
> +++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
> @@ -27,7 +27,12 @@ &lvds0 {
>  	status = "okay";
>  
>  	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		port@1 {
> +			reg = <1>;
> +
>  			lvds0_out: endpoint {
>  				remote-endpoint = <&panel_in>;
>  			};

-- 
Regards,

Laurent Pinchart

