Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0FEFC9EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wDmi5TljwuQ7BCUZdY8utGZfK6AwLG0p45YxsFA8as=; b=yGSdSA0Jfv89zVpQXMgJHhlVNo
	ZQ9jOtSu/TZUM4frCgvtFDLTm4BIz4zNLifYl6abckSTx6eMbyK3g2Qvg3fO63GsG3Vzi6/RziBt2
	AhlR6DjbTdfex9Z+j6yjgp14Za1COWoToya+t3XCFWL8GJVXyRKUySrbIJuudQ1wdG5fmRhHdyiAP
	9U9RepE4EAKnobsOBZ4ZGZeCTXM2fumMA2Soxb3YAHiF8BoZcUflLs2RwTn1eBBjAzAMWKOGbJZOS
	8wcRCRGwGkPAXHzSCPoVCM+esfbxBFKI8KUoSF5VpnL/Y0m2/P/L+gvSH0E+TLEmdASIhr+cgQ9tP
	HxK5uGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyoug-000000055zn-2iNW;
	Sat, 07 Mar 2026 10:29:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyoue-000000055z0-0tbl;
	Sat, 07 Mar 2026 10:29:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 745CB44102;
	Sat,  7 Mar 2026 10:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A43C19422;
	Sat,  7 Mar 2026 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772879375;
	bh=Rs91B4+PcG6vEi+B0TdzuE9KIq/VuYpa8ADVKgBLvfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHppHgHmQbxfgKu6Le6HuH7wGZTeSeyGx2103ymUImshBH7p1WKietXJCBgvu3B1+
	 kfzLBmp9hUoNg0DJvHUOLI9qb0KFv/A8ST1m8RPIoFG6XpuZdyTV57Ud528r6P0k3j
	 6bTpg6rM3fBaWBviL3ujsVEYfhMWPXO22ISZNEL19L6gAmBQdUN+9dXKYA/QBCDWGw
	 RNSL12jqmirP+hBQgrPlj2B7/gUDIzBRIBZjnsmt3hvYwk2S/y14Oox3KqQxBVusuW
	 fwiCu5FhGNxmws8hAGPfftxfCZL9PjcYBeb9wtEVkdXS/cQbwJqpiW2SPnwtVtdPlp
	 BbCn5F52Pyqdg==
Date: Sat, 7 Mar 2026 11:29:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: soc: Add bindings for Airoha SCU
 Serdes lines
Message-ID: <20260307-crouching-uppish-gazelle-08fc1c@quoll>
References: <20260306190156.22297-1-ansuelsmth@gmail.com>
 <20260306190156.22297-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306190156.22297-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_022936_270753_2393933D 
X-CRM114-Status: GOOD (  11.94  )
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

On Fri, Mar 06, 2026 at 08:01:50PM +0100, Christian Marangi wrote:
> The Airoha AN7581 SoC can configure the SCU serdes lines for multiple
> purpose. For example the Serdes for the USB1 port can be both
> used for USB 3.0 operation or for Ethernet. Or the USB2 serdes can both
> used for USB 3.0 operation or for PCIe.
> 
> The PCIe Serdes can be both used for PCIe operation or for Ethernet.
> 
> Add bindings to permit correct reference of the different ports in DT,
> mostly to differentiate the different supported modes internally to the
> drivers.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  include/dt-bindings/soc/airoha,scu-ssr.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

No, this is not a separate patch. Binding headers ALWAYS go with the
bindings, when you add new devices.

Best regards,
Krzysztof


