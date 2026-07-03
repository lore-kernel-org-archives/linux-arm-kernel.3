Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016F5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3QWF9QEhp1MYt6N9b3KeNj8xni59MRNrkc85etaxMw=; b=TUe/9tmK09Q352h0DuC9uL2QeS
	3xiTtxn6PMAvX4F7Bz/42j8kQtBpHke5eFHnUKlIj07tbJj4Qnf7DGPbIP6JEyBR6A/zP82rOkTOt
	U5ek3c8uz0urJyYtHdsDkYrvuxjdVmt2cop+7L/aV0McLYlVSUc90j38MqgfOUDWrfZRQbZJH81Qr
	57wL6bCp/VzNlziEQMwFnKgiqjbhMp7/SvibSEBtldPbbLiG41LK+SKrdQ7T5HyVDQFro+WrOTU8e
	WmAJwr++UoAXe/MlKH9HS+Nv2ARzjusHyrWT9NMjLs4GXis8a/FzKxLJ0VJLzzzJYWt/eczEkcK7f
	CwpdgBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXYT-00000006BWu-2TQD;
	Fri, 03 Jul 2026 06:39:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXYS-00000006BWl-0hsf;
	Fri, 03 Jul 2026 06:39:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59932600AF;
	Fri,  3 Jul 2026 06:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174F01F000E9;
	Fri,  3 Jul 2026 06:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783060755;
	bh=D3QWF9QEhp1MYt6N9b3KeNj8xni59MRNrkc85etaxMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DXA1EWj8RozS1lVUZfUQ23DjASd/q3OBgJzO5YP2g4jyXPNQCs2o6DbpQW/QPcp5p
	 oX/s40PFzy+bCCx+bhYnj4pJqp/dpRESOObhZWyuVu2gM3D4vtIpg7b9QjUZIO5zxk
	 1Fr6yQ7Z4LBDHHnP6hu3jGySPxnj/ldwDQRU7450Q6AUmlJPE0OdNE8BcknEv1fJx+
	 MlVyumgmQvVzDCerFheHXCqJHXblkynw5hbXXvPnP+yOOnok0xcKArkv4sZU9hZMSn
	 HL3o2SARmYIJ9/8YDk4Tjz7crpUW7oWgNCqnMhVEtv0ZY/vxfrfGN5sXs2dc+aVmGp
	 WPspsgTGVzUDw==
Date: Fri, 3 Jul 2026 08:39:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cunhao Lu <1579567540@qq.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
	Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD
 compatible
Message-ID: <20260703-truthful-aardwolf-of-spirit-b6bafc@quoll>
References: <20260703-master-v3-0-6d56de6fd2f3@qq.com>
 <tencent_3E31CBEFAE0986665A26322171642BC00B05@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_3E31CBEFAE0986665A26322171642BC00B05@qq.com>
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

On Fri, Jul 03, 2026 at 10:35:40AM +0800, Cunhao Lu wrote:
> RK3588 integrates a Rockchip CAN-FD controller variant that is not
> fully compatible with RK3568v2. The RX FIFO count register field is
> encoded in bits 7:5 on RK3588, while RK3568v2 uses bits 6:4.
> 
> Add a dedicated rockchip,rk3588-canfd compatible to describe this
> variant. Do not use rockchip,rk3568v2-canfd as a fallback, because that
> would describe a register layout that does not match the hardware.
> 
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


