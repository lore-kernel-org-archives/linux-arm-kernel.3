Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4D8606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jma8wXLU;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=VtsZPq4Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OZvV+q5DV43ONtY61riaWk5gvmlm5puW/V+gDbugD30=; b=jma8wXLUHYq87G
	ynBFNEDSFWLHxtjUA07QHLc9GCczhsB8hHs8Rflwv0iL2Bw3bTf8nDxlEpAydOO5kchNPXtO0G1B4
	tw8w5p+DZSeD3OGevRZOHwxVPoBdE0/tH/hHqeuIFiSSZS/mmKHJ0Q/Er4Yg8K4vMGc1vL0WudOgO
	AIiHXT1/bpY/8BQmEVIGTakYTAfsjIpgRl9xcQFCHpK9IZvVrY1Lf5GUupUXlG72RDZ9s5Z5di/A0
	oaVac4BvCmWM3V/paRVsVoN501WBoLj6+83CJZLoYnh2fuXZmDW6BHxcGhWxfaIS6pX8sNh0s6KRP
	FGaZbzNmxvEJNmYJbCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcxa-0000000EuTh-00ty;
	Sun, 01 Nov 2026 21:19:26 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcxX-0000000EuTK-2tYX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 21:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=OZvV+q5DV43ONtY61riaWk5gvmlm5puW/V+gDbugD30=; t=1793567963; x=1794777563; 
	b=VtsZPq4Q7xgoWRsQvqGD9suPEaEFMn2dBdjOPsMPKHC5FGQmTTDUee7vYuW3jG0NEPuhqtLy7p2
	0R/tvtIC8I2vXic/JREb99l9TqEIKoyaIzLTlICrMxiRZ80HrvFliTNnczc8TFldJdB419szhY0KJ
	gIDcUO1wKfh1wPSFfj0mRvBfUjXccY64onlixDWiUq8Y6UgVR5KC17eBv0ppkJL8ZZ5fK3dk1/s6i
	V9REWVVpFo0T134u5lkCughgTG1/SL8WhM/PnKD93d8dXS9ttcUUxGhaShE9wTGkes+1Kua6bBM7I
	jbqG7lk05LNI4vlm1xb4G9U2rloKpoFpOnug==;
Date: Sun, 1 Nov 2026 22:18:31 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christopher
 Obbard <chris.obbard@oss.qualcomm.com>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Paul Walmsley <paul@pwsan.com>, Russell King
 <linux@armlinux.org.uk>, Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/9] ARM: dts: omap: dm816x: Fix pinctrl range
Message-ID: <20261101221831.7d63ec51@kemnade.info>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-3-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
	<20261028-patch-ektor5-dm8168-dts-v2-3-4544429251e2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_131923_736706_DFF009D5 
X-CRM114-Status: GOOD (  18.22  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 17:06:04 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> From: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> The range of addresses accessed for the pinctrl module needs to be
> extended to take account of the fixing of the size of the pinctrl
> register to be 32 bits instead of 16 bits. So in order to allow the
> final pin control register the address range must end on a 32 bit
> boundary, not a 16 bit one.
> 
> Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> index 261ebca8863d..fc124f9ecfa1 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> @@ -90,7 +90,7 @@ scrm: scrm@48140000 {
>  
>  			dm816x_pinmux: pinmux@800 {
>  				compatible = "pinctrl-single";
> -				reg = <0x800 0x50a>;
> +				reg = <0x800 0x50c>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				#pinctrl-cells = <1>;
> 


