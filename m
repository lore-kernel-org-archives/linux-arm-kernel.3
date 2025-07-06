Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270C3C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRnNEdFUZDUc7i/2+6ap2C8XPEleT4FYqDDGGpHrx+o=; b=dF3JUHclOa0GOwoYUpoD+c3vlZ
	pMD8GJ3E/i8YOpr37R24HRdwKtM8qZKxblNVW2lDPu/Xj5aOiT61IyXIKsIN4o1SzkCmsXerSbFFX
	LykRaI8hnq1rNihZhihU05iFgRcSu5XMYzmzAMMcUzckVDsQmk21bbR2Jv7Ka9Rmk1U+iPnbQMgQp
	YWg6Oa8yLEg5Mxv/yqwE7U4bKb+69ahoP6X5Zqfn8CysLb+w9QJmrhP5oq/0K31Gjad/AlkTfbBxL
	wHy24GJmN50D6W3cPUqlCN1A4B+eltuzKIB+/APxucK63X0yYz1YZuGQJ+KlGGcFWsmf9XBNmPAJm
	o70z/nLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYM0e-000000004sB-38rb;
	Sun, 06 Jul 2025 09:50:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLv5-000000004Jw-1CYY;
	Sun, 06 Jul 2025 09:44:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34AC660007;
	Sun,  6 Jul 2025 09:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFD2C4CEED;
	Sun,  6 Jul 2025 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751795061;
	bh=+TfC+wPk/bSE3tIMJmcXCuJm6QOuYn/Hzvt0nI3VoHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBSVzSbNHmfQxX+AWV3h55UI6WakRg9IrkTao6uCaCt+XVGPB6cR/j3TLlPTiNRrE
	 7QvT/Yab84ddVWPLJJMNhNYhTkb8YobUTHOh6a+3CMLvPkAeqndUmt4i7PywL2H0oe
	 nCskUTKgLGWmhSnrQlYRWdKk9ajPYvF91Bk7V0/GbEN02SpEzpgbCqSDeIH7RP6kcA
	 uCFJ8lqp9izMAQxe8zkMbqqoamUDrzmaOnCIsDXfk2p7hIPTTI3cMeXFgA9dh3y1o5
	 kr+cTI4schFOjMKNydeFA3DkPRN6E1VkjZBByuk1qlAwWIe2CGXqaIp4OnI0R44eDv
	 /aOmjT9HGM0yw==
Date: Sun, 6 Jul 2025 11:44:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, neil.armstrong@linaro.org, 
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, 
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com, 
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v4 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo SS phy
Message-ID: <20250706-diamond-crab-of-will-72205e@krzk-bin>
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
 <CGME20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb@epcas5p4.samsung.com>
 <20250701120706.2219355-6-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701120706.2219355-6-pritam.sutar@samsung.com>
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

On Tue, Jul 01, 2025 at 05:37:05PM +0530, Pritam Manohar Sutar wrote:
> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards

Agian, this?

> compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required
> to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
> These two phys are combined to form a combo phy.
> 
> Add a dedicated compatible string for USB combo SS phy found in this
> SoC. The SoC requires two clocks, named "phy" and "ref" and various
> power supplies (regulators) for the internal circuitry to work.
> The required voltages are:
> * avdd075_usb - 0.75v
> * avdd18_usb20 - 1.8v
> * avdd33_usb20 - 3.3v

One more commitm message completely copy-pasted and completely
uninforming. The voltages are irrelevant. Explain the architecture. This
should be just one patch with proper full description.

> 
> Add schema only for 'USB3.1 SSP+' SS phy in this commit.

Why only? Add everything, describe everything, but not what voltages you
have there but the architecture of the PHY.

Best regards,
Krzysztof


