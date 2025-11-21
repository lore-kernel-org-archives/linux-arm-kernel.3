Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A68CFA747
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJUoIKr1I9MMSbQA0r8AhQnQKuQqjsMkxPhBcdgYaHo=; b=ApY4RlUsiwp/D1LYDEQpmd7rsc
	orgEBUqLZDiSjAY5Ze9/1laI9mucEP5aawIODsaEmjpIQaB4kONPbVppJZiDlU6IRJyod/wCYkQMe
	KtHlt9VM555Ba2sRfQb0+4rxHplDt+sMhY87UIwZN+s2E+rauNFF6G3KLWwhk4u+xsu1CiRFI5JOw
	ukR3BakAVbRRL76fl04WkqmirlLsoO85USlLb/3wfn1oK4RkXMWJBmh+MtdzI4pySm8f8M5BjcFcI
	2suw9HdW0K4c+yPS2i7GkD4nUFYCgNKqAv0XMieJ8yNpttXfYLukn493rGs+7QoZrluPQbXPvxU6d
	ao4KTWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMJX-000000081t4-1i7F;
	Fri, 21 Nov 2025 08:16:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMJV-000000081sv-2gOT;
	Fri, 21 Nov 2025 08:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBB94601EF;
	Fri, 21 Nov 2025 08:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD03FC4CEF1;
	Fri, 21 Nov 2025 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763712976;
	bh=++S1fgLBKiTEYDVr3ZDON6U+2JRDih2JeUGeY62KsMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elLChGXpWDVPBrFpLE1IMMMZbQmItEXg8wIZsiVNThvnVWAwhSlHRhSHwHHmvW+81
	 TEez/dFfS9abZWaMRRW6OLxo1LoAl7jqzg4nsAiyLCa5rjzSPdAFeGZoFpxrh87qdw
	 OStHA8cVb6t2+jbLYta2FFOJKA7Qo5ROABcFQgYuSgt5Tf+CixYL9UuWwbVHR6LW5e
	 UEbkzhg5lEBl7zHCe/y1ynUtIDnhdhLPhV5XSBGEYhmwM/7TvWqfUa/BWsCWWGekAC
	 Ug0KjbHZszjSI/bX5BU748T4F4rAsF759f380d2A5vRc1igU195dCW2eQEHSYEaKNk
	 MW5knPl/batYw==
Date: Fri, 21 Nov 2025 09:16:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: phy: google: Add Google Tensor G5
 USB PHY
Message-ID: <20251121-attentive-demonic-jacamar-fc4afb@kuoka>
References: <20251120-phyb4-v6-0-b6694e1f0caf@google.com>
 <20251120-phyb4-v6-1-b6694e1f0caf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120-phyb4-v6-1-b6694e1f0caf@google.com>
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

On Thu, Nov 20, 2025 at 05:36:41PM +0000, Roy Luo wrote:

I read last discussion and patch is fine, except one issue in example I
never noticed before (see at the end), which I want to fix. Apologies
for not bringing it up anytime earlier, I missed it. While at it also
one more nit.

> +description: |

nit: drop |, do not need '|' unless you need to preserve formatting.

> +  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
> +  Google Tensor SoCs, starting with the G5 generation (laguna).
> +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
> +  and USB3.2/DisplayPort combo PHY IP.

...

> > +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        usb_phy: usb_phy@c410000 {

node name: usb-phy, because there are no underscors used anywhere in
upstream. While at it, you can drop the label as well, because it is not
uised, so just usb-phy@..... {

Please send new version with these two fixed and:

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


