Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEB7E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BknNvEyONDeJB2BvQSlYKsJNmxf71tvTuTji3F04UX4=; b=unKYS/aWnF00rpYGEPCWaF/BJb
	bKL4VKk/Kz61GVyth4wb+6hU+e0Twa8kcbKHgldKTGGBwcYPBQb90hahv3zSsjwZZ0uRlc3FS1kWD
	WHfgygTfX+c69UogB0OaddBJVCsoeojHruENeITr5rgHo3fR0tQ9DkxiZIJoNu+yMaqRp0NrniGQx
	jwncY0WLmOMBN+ndJyNKxO89p14ODwImLE4rfp+gYbnVPt/2V0VvSBPrVkZgMiPmDVzomtghipC7K
	Z8Ro0D02H1fm+KdiCxGYlE63RRdMEwqm2igVVJ7zPbcOyNFrGg3ReCP8+rIJHkJR6ZXcq2m318s08
	9EfXVTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkvh-0000000BubX-3JpH;
	Wed, 04 Dec 2024 08:40:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIktv-0000000BuKk-3BUx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 08:38:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF4E8A41BDA;
	Wed,  4 Dec 2024 08:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB276C4CED6;
	Wed,  4 Dec 2024 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733301506;
	bh=qyu4sdJIZE8YG6rqCb7uR8DZa3zsLilFXXQte5W71Y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQ0wZyK6Er4GCW/x4pOB1Ffy0HNXP+XICFbzET0oRoBpt4FU8X/+OUUtlnnaHtrzg
	 /Mdwdd0AavZXy4ptwgpYPh7nPyfGVzgH7xMTizhdmolotE1PKaqYLHFsI6am5kx9pl
	 mSPUzx775CXor3wN9oKhvHFPBdSMAjLMfIfNdU6Kjlhxb9EGEq4Efgu+wz6Qw3yGMk
	 Gbz/8PhTpNU9O5kabC7BQ1pDZL4bUenwgIgfjjsnJcI67wLkbJ8cy/s4VsUpYyVns3
	 mH9flRBYJHGgNQ7cXNAVojfGNN8iQvtxgGntp/NlG2SQlXbcL/TB1IjT24rQX+/tMC
	 9Pr7ZVC2oDGyg==
Date: Wed, 4 Dec 2024 09:38:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: syscon: Add ti,am654-icssg-ctrl
 compatible
Message-ID: <ii7dbehl2ecvgc6e4kqy5nk2e22hnbk43tldqfxjk7xxapnp5x@7ojnf36ej3fm>
References: <20241203173113.90009-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203173113.90009-1-afd@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_003827_864153_69AC5ECB 
X-CRM114-Status: GOOD (  13.79  )
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

On Tue, Dec 03, 2024 at 11:31:10AM -0600, Andrew Davis wrote:
> Add TI ICSSG control registers compatible. This is a region found in the
> TI AM65 CTRL_MMR0 register space[0]. Each instance is used to control a
> an ICSSG's RGMII delay and GPO mode.
> 
> [0] https://www.ti.com/lit/pdf/spruid7
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index b414de4fa779b..34943d9fc0ab5 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -115,6 +115,7 @@ select:
>            - ti,am625-dss-oldi-io-ctrl
>            - ti,am62p-cpsw-mac-efuse
>            - ti,am654-dss-oldi-io-ctrl
> +          - ti,am654-icssg-ctrl

Considering your patch #2 adding something with similar name, this is
quite confusing.

Anyway, where is any user of this? If there is no user, then why? If
there is, then commit msg should explain that you document existing
device.

Best regards,
Krzysztof


