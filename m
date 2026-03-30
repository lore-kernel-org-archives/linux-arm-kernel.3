Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AF0FF4956
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvRc8/vQsRdHMmvU9XneXShCil42foLEEHlhCzha6vE=; b=sQYkfZ714ZMnZ2ad1CPKQCXkDg
	QNju+leSZlTDvW2ZqW99tX79fxsjtuC1wcISd+4St3rgSsNWRtLg/3CM5mrFTRrkWVgIHOBS6ypVs
	UKJFRbpkWK70bt4DpnEAcBTVg+sZaAXvvnm6UyTGKOjalQutfTIRHoV7i8Xvfh3iaunScDYRFPSUb
	lKY/xqewOxsQVRsH4Y4Y5EsekEyT8ZPKagiCnbrGiCgvuYtCIO1aF64deQfY0sG26xhJ3+I5q/Par
	65OWR6Jk0Ymwl0S+jTuAX4A+H+5Pe8skcP5EhMXDFsfdssxAjAEOgXUwICFTb7GuqvJyBGw01mRiu
	idV60fCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76wv-0000000Akzu-2FNm;
	Mon, 30 Mar 2026 07:22:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76ws-0000000AkzT-1VAT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B2C044099;
	Mon, 30 Mar 2026 07:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44BFC4CEF7;
	Mon, 30 Mar 2026 07:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774855329;
	bh=y9mD+65Lfnb411B/kfQPwX/qSL7/8ZFUg+bOT7K+rGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oaw7gFD1elda2OVOh5Mf2F+21lWFSJ6PFcjYNXBpLh7kYUqXGWm91AkDoESlBm7Pn
	 uxPYKRpAkL+oYRIVQmIHr98FHYjQ10R0wM1v4tVmyWnri2w3N0Vd4mtQCPq0HjiZlf
	 iLmU29HaIMaTpc70mpC4Gh26jLbB6+1q2zQoD6PEvNcNrvtpqEpXWEnuEE2AdgYLdL
	 zpPR1h6pELEN2H0aR5XXYG20V/L/F76hlGNsJa1R5iYUJ0Lt5yydyACY0u6qhaDP9x
	 4uSuRO7od9Miwn9qpJtEzSmo6h10BBQinoPdGqTC23vrORJUzCPkoXofndbE6C3TK1
	 BXbJ0u0opLehg==
Date: Mon, 30 Mar 2026 09:22:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ulli.kroll@googlemail.com, linusw@kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: gemini: Rename power controller node to
 gemini-poweroff
Message-ID: <20260330-rough-military-saluki-e2dd8f@quoll>
References: <20260329205151.15161-1-khushalchitturi@gmail.com>
 <20260329205151.15161-3-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329205151.15161-3-khushalchitturi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_002210_439564_014984E2 
X-CRM114-Status: GOOD (  17.68  )
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

On Mon, Mar 30, 2026 at 02:21:51AM +0530, Khushal Chitturi wrote:
> Update the node name for the Cortina Gemini power controller from
> power-controller to gemini-poweroff since node "power controller" is
> reserved for power domain controller.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> ---
>  arch/arm/boot/dts/gemini/gemini.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/gemini/gemini.dtsi b/arch/arm/boot/dts/gemini/gemini.dtsi
> index befe322bd7de..c524adadcf81 100644
> --- a/arch/arm/boot/dts/gemini/gemini.dtsi
> +++ b/arch/arm/boot/dts/gemini/gemini.dtsi
> @@ -228,7 +228,7 @@ intcon: interrupt-controller@48000000 {
>  			#interrupt-cells = <2>;
>  		};
>  
> -		power-controller@4b000000 {
> +		gemini-poweroff@4b000000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Why gemini is added here? It's not generic.

Best regards,
Krzysztof


