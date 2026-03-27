Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E47810BA457
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3b36e9JaVM3y+hLywUlL9I6Yn/OOimVU09TMzR0lvg=; b=MuyHf4EXpERmcILV+W0flv8iWr
	mqA+ToyX4XeXSD4+r9Ix0zeC2pQBGBhq7KhAb+XoLok80TO50w5gYsZ95g7Td4GvnJ1ZdQxfAYKuL
	xXlqtcskuOJntFW/MOJbU9DekUnc+05AX3Y0aRvyzTjH4Oq5TUg4xPaoVSh2MvODiUOCLH7e/REAb
	Q3Jq+EhNUoEqdWDHxv2FUMpTA54LI8gqmak7s9tucZmHAOF7SUL18QsvOhR7oMF84ex27b9CWixOU
	6c532XsXbFvvZ9eulZdBd1B2XuFkDJDT+c2rAMsp++khrRPGSeYIIh3h5iiDNjhgIqKVUOjhkZ27b
	ovheI54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63CS-000000072c2-2j7O;
	Fri, 27 Mar 2026 09:09:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63CQ-000000072bU-3ndb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 09:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V3b36e9JaVM3y+hLywUlL9I6Yn/OOimVU09TMzR0lvg=; b=XMfKdr5xW/epoWHxsqj9K3PPuI
	t1/ThjSeSPyhXxQrBw8jQpdQ+WMlWXYNYDh5cSmyyW5vQeOL7dPLXqkPr0gbqkQWR8N78Dv6XVkCG
	lnDP21AesUk5QCT2XgfPi6U4r3mGDwMx3MXWNfjlpI2wFLy36LSMIMOMdU+Z1IfQ2ncBYWEJET7l4
	/vPcWOj6M8MkCEPPGZfL/8dpL6pWc9e46L3kpnrgwzDa+3fJX7Y8MAR/DNv9/E+lZTgbnBk6cek0z
	D4/0ONjnYa6TJ4XP4O3Zwf42tlSCSBlyP0esMRbmbba8/ajevfWuy7ywQdflC7R6jNzx8z1TiIYtl
	MtfY5LvA==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63CM-0000000A2Nz-2ifV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:09:49 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 67AB91783;
	Fri, 27 Mar 2026 10:08:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774602505;
	bh=ei1i5cV8a/IBRvWiha54HpphTcf28300D3GC22f3cHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLPlgZHvraNag+g5XxAUcVeWCzwyBNlWYWGGp7VlJPKTXYvQaBxlXlWQ12Xy1RHKp
	 J7MFUrNl+RlE6DF4fht/ldC2DMuAgSegYAPAsm5mzTIZaFIlO1zMUN3sAQGfhLCTur
	 XeLT6dLDi8v5cKZwdtgPqdAgKyjxDL03V1vCSTFE=
Date: Fri, 27 Mar 2026 11:09:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into CSI2 subnode
Message-ID: <20260327090943.GC3026970@killaraus.ideasonboard.com>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_090946_827899_CA7CC86B 
X-CRM114-Status: GOOD (  14.44  )
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

On Thu, Mar 26, 2026 at 05:24:00AM +0100, Marek Vasut wrote:
> Add missing cells and reg DT property into CSI2 subnode to fix
> the following warning:
> 
> "
> arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi:49.10-55.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
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
>  arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
> index 4d2b0655859ab..3feffa4f16a9a 100644
> --- a/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
> @@ -46,7 +46,12 @@ &csi2 {
>  	status = "okay";
>  
>  	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		port@0 {
> +			reg = <0>;
> +
>  			csi2_in: endpoint {
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;

-- 
Regards,

Laurent Pinchart

