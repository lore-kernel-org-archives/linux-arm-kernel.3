Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18230CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 06:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zv+bq8Y4125ZUtVQWA5vR0XBl99zeMI54gkrK9c5vNE=; b=4tc6+JFoodHvUrUHNYnzOA8Kzq
	3IO0hOnQKYc0oKPi3whxfCNKnpq9oOjHP2TMyEq+lpi/RP/2UqdbAl3mkjPVxFhzWGHCHAZVk1tCH
	RSBGZvFjXWXNxwO8CEf7kPV2A4SRmOT/zoRbei7f5S7tn44NWkjqFJrp/x5jzmBYIIjUApM0GHLbX
	j82U+oQZtat3rz21xXQh2Is4fkkWlXsG6Ef0C+eYMPy7cirGhGz+bi87GqkD2H/4NWw0oegzmn35L
	CkNkodXwjFfi9y6ht25nt6yAR6T40tixp/JwpbvW8m2q926aSdFNlGJPoUT5p7vQwK3rJ4q825yoM
	WSxX1jZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJ2C-00000009veq-2jvt;
	Fri, 22 May 2026 06:07:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJ29-00000009ve8-3vEr;
	Fri, 22 May 2026 06:06:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A973840207;
	Fri, 22 May 2026 06:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F241F000E9;
	Fri, 22 May 2026 06:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779430016;
	bh=Zv+bq8Y4125ZUtVQWA5vR0XBl99zeMI54gkrK9c5vNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bTaHUPD5OkGxNjL9uDPG4wGMmKtXLO5mPQJ/MqDVK5784jUhIG9jhLGixf0M7782/
	 xHdlQaLig7FdM8Ht8T9tEHIZRzxp74JaRC7kKg48+RQ7lpqiq7pMnddYb8fyhP7Vj2
	 BfZUktHANeYE5bMliEjICrkfRZMMGeM3xlKRCUDPMx3ZwybizsnxkJ6A4wjXGmztFg
	 /t1mgbdSx1cVLlinmtNaMTqk5dumtUrGw3ZRyfNbm/CbxVCjyTamvaTiQhx15KXRUG
	 mm/WU2adz4GbLOYZph/VQTLmuURBDMePgoZPN1CtvjNIbMTHGZjoIWxkbIhIpFOJof
	 tRmum7N4OWKNg==
Date: Fri, 22 May 2026 08:06:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v9 2/5] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <20260522-obedient-lovely-kingfisher-2deda1@quoll>
References: <20260521153645.7028-1-ansuelsmth@gmail.com>
 <20260521153645.7028-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521153645.7028-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_230657_990006_B610D638 
X-CRM114-Status: GOOD (  15.60  )
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

On Thu, May 21, 2026 at 05:35:53PM +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node. Providing the phys property is optional if USB
> 3.0 is not used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


