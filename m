Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B13E10BA45B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhE/FSzNzROsTBw0L04I3JmRgxSCgtBQkUR9KiPMS6Y=; b=DLtlVGareMa+ZHvePTrdtY1ORk
	CinOtF/LzzXXjN+5TRxABmMNEO80Cb3ZdtoGqtPeYXM9FhvNECdKbSXJrFGGOTGwVMWNocRj5rY2d
	s4AP1IPdFj+qn938sRIhwD/yp55tTmz9nQQywoE3L8zXCHi/X+heaK6wU0qlyYx9YJLWzdPpZLuua
	t804OMWAAGWGE2Yhb5epax9wCqnpPlJLaub0hO8xtgovSL2M0P4OGeD6pma8mC6WKDCY1ynGdVADS
	/daAW3VkKh/ESzUiwl1LGmlsMYE7H+LCByqZuBnScH3oVp4s0I8Qqe83Xk7+ta+DenD1Hp0qdJl+L
	z6bf65Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63DX-000000072rz-2Fbm;
	Fri, 27 Mar 2026 09:10:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63DU-000000072rP-32uG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:10:57 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DE4651783;
	Fri, 27 Mar 2026 10:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774602576;
	bh=7pnfBL44hki3rABoq3LGWT3iYReOHb/JvBtn+6DpyJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDK0FIVQEde8xzYvKoBoCtYsp1Z2rjn3fdUsKguFJaQsEtXnmd51+EAqY2c9WTdXx
	 qThPxYpdLVaCpYj7mDuDBzOC6dGYKGgV/NtBIHvq1mNdOFrmJblRofaAiSHWrVjSYl
	 AHJJkyJbFDMZRoJ8NkChSd44VXX1zyEH9wtRB56k=
Date: Fri, 27 Mar 2026 11:10:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into DU subnode
Message-ID: <20260327091053.GD3026970@killaraus.ideasonboard.com>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_021056_905195_E2F561DC 
X-CRM114-Status: GOOD (  14.77  )
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

On Thu, Mar 26, 2026 at 05:24:01AM +0100, Marek Vasut wrote:
> Add missing cells and reg DT property into DU subnode to fix
> the following warning:
> 
> "
> arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:29.10-33.5: Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
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
>  arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> index 36707576030d4..f5412578ee65f 100644
> --- a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> @@ -26,7 +26,12 @@ &du {
>  	status = "okay";
>  
>  	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		port@0 {
> +			reg = <0>;
> +
>  			du_out_rgb: endpoint {
>  				remote-endpoint = <&adv7513_in>;
>  			};

-- 
Regards,

Laurent Pinchart

