Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB90C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsyrHL7oxH+rFy0BGzwR2ub9eQ0OD8OJoWa48oeALqQ=; b=NPH7CVAQ6HdKK9yzUwwv+2ZpL8
	7QYO7cmlFnQC3XFN/SW6LUKPEzp2InTquxY9YBDa1pnXHwt6UV4t/Jy3Jy80ma+dN/iiX0YAvY8D8
	8MULMWSItephgoRUW0QxFxloDLPhaMg7yA3DJOocn60Z/VMFu69Jm6qzWddzciNzVj6uwNlumZazm
	UaHT1RVXZ5X4wq84G5azajhNhvSSPZ3lxwGqRy5FVzvM9pNqZolMytbw/SsH31xOFN53a3oLvKLbQ
	0lY1S+gA62hGjUZy/kxa2/ioqv7XrndzIWtLZPJEkAJ6EAPjW/4duJtv9jIBmrGC1orrnRup8G0QZ
	PAMv3GFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJNS-00000009CtC-37qy;
	Sun, 05 Jul 2026 09:43:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJNR-00000009Ct0-0eI8;
	Sun, 05 Jul 2026 09:43:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AA6E40BC8;
	Sun,  5 Jul 2026 09:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1EB1F000E9;
	Sun,  5 Jul 2026 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783244584;
	bh=dsyrHL7oxH+rFy0BGzwR2ub9eQ0OD8OJoWa48oeALqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mUQtXevhy8s3LQcF3BAkcUi3LxRGrAs0KPtq3+NhdepMB7mtyV3kfZN0aQL/IjLxJ
	 6RAull5oOdcedpdnZwMkRQYjevKR2aeJy7/Zg55AVqPEOrTabTunzMyAtkLhZFO+AJ
	 yAu+/RK0xRvDqOCzwCk5Hnb+jeKqmRs+jgS05j2UcHKdef38WaZO7ZRC/jU3yU4DNe
	 BjY3zKFrXn1sM+TYsIjBxdL4lSM8y7Cw9W0Xk4PJmvoO09invbXzxmBPxwKYTBHMW7
	 PhP0Sp0+k7xr1CWLtGPf4KrXcUasfXYcWeavofl1W6LAghuh6g/w/QrnJNsaQpvOAv
	 YAX5CnGGpf2OA==
Date: Sun, 5 Jul 2026 11:43:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 09/13] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
Message-ID: <20260705-miraculous-mini-gibbon-d6cb6a@quoll>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-10-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703110317.1283411-10-wenst@chromium.org>
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

On Fri, Jul 03, 2026 at 07:03:10PM +0800, Chen-Yu Tsai wrote:
> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
> 
> MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
> and USB 3.x Super Speed (SS). The block can also be synthesized with
> either HS-only capability or HS+SS capability. The SSUSB controller
> handles the device or gadget mode. Saying that SSUSB handles the HS
> portion is wrong.
> 
> For example, on the MT8195, the first two instances support both HS and
> SS, while the latter two instances support only HS.
> 
> Switch to a "ports" sub-node for describing USB connections. Port 1 is
> Super Speed if the controller is SS-capable, otherwise it is High Speed.
> Port 2 is High Speed if SS-capable. This port mapping scheme directly
> matches what the hardware returns in its capability registers.
> 
> Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Squashed DT binding revert and addition together
> - Dropped reviewed-by from Bartosz
> ---
>  .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


