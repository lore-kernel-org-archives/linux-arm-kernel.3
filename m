Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9FDFF60D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9ZBjcAr40Scjp794d8Ip/NkXgLZ8ekwp1FGYnThcmc=; b=sm+D5MLDxo75bjyA15qZBO4/Ki
	u5Lb+yaAh+d9D1Eyz2fmcH6rkKUT8fTBZVL6VcRINzzvFyAYBDW0R6CfAv5hqFwjoy30ursTOzvgy
	SXPj5imMQATwSMmGyKomdy6IPauAyGHQMms2CPKniwDnCWlyt7ju8jfAfJ9mEJmI6TRPMTAqt7xWI
	5RuR1Wyo/qHPrllG3t90A7o3l+4oegzzVWndFLZ5sWSF7Srdc9nhIww/43RBkniRaeoJPAmOHmJz/
	xvOsdqYHIaT0r2sb78tldAdH3VJYNSqFFHIA7hU93VSldhZy5cyOFpxpLXcVU3PfMJcSUVVGyzRGh
	l3xk9kSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TG5-0000000CRNJ-1dL8;
	Tue, 31 Mar 2026 07:11:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TG4-0000000CRN1-0FDn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EA1D60123;
	Tue, 31 Mar 2026 07:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2919C19423;
	Tue, 31 Mar 2026 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774941087;
	bh=XdwZEdTlh7eUy97pvQnqE/71BTBUar0XRDwzHcXBMRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QyRC3uPKayasDp5XbK4TcodAQFVigapbBpUw7l9SV5fn2FogMcr0+0H3k3CwEub67
	 ut/eKMiFQW9cbDFEPtncQEvdwRLGDky5jsRNpdVTZJk2L76YBU2H8GJ5m7UxFokgeN
	 Joa8xlffQh7E0Z4x6TX7PnXOVqLpnVFzwADKCsHY6IaW3pWEY3XweYAqXvCK5NTeT2
	 HpaR1oiw3WuQLEIOucFlXBGQNA8CgO/Mn/O5t6qilNFgnNahLE0EnVSPD32geOl9ca
	 nGD0YLzJIO196sqPtQRsydsJ6XIKflDTNFC93Pp87Q8RIoqlVLu3t279lE6fjAi5Mk
	 TUokJqkNqWrjw==
Date: Tue, 31 Mar 2026 09:11:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moteen Shah <m-shah@ti.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, nm@ti.com, 
	vigneshr@ti.com, kristo@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, u-kumar1@ti.com, 
	gehariprasath@ti.com, y-abhilashchandra@ti.com
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: Add audio overlay for
 k3-j721s2-evm
Message-ID: <20260331-fabulous-bipedal-boobook-b11a27@quoll>
References: <20260330094459.128648-1-m-shah@ti.com>
 <20260330094459.128648-3-m-shah@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330094459.128648-3-m-shah@ti.com>
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

On Mon, Mar 30, 2026 at 03:14:59PM +0530, Moteen Shah wrote:
> +	p10-hog {
> +		/* P10 - MCASP/TRACE_MUX_S1 */
> +		gpio-hog;
> +		gpios = <10 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "MCASP/TRACE_MUX_S1";
> +	};
> +};
> +
> +&mux0 {
> +	idle-state = <0>;
> +};
> +
> +&mux1 {
> +	idle-state = <0>;
> +};
> +
> +&scm_conf {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	audio_refclk1: clock-controller@42e4 {
> +		compatible = "ti,am62-audio-refclk";

there is no am62 compatible or DTSI include in the parent SoC file, so
am62n seems to be completely different device than j721s2.

Why does am62b appear here in this context?

Best regards,
Krzysztof


