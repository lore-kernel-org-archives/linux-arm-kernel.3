Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93650E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFQ5VEImP1WAv3XnAxz/Dvcv8FAHqggsJ7Ak7Y1LxVY=; b=vAlwdo1smxnmGUSEty0kNGaI1j
	OlM3T6udtSesWFiwvWeRT60vwrknwsk7KI1AlNpeY5yC7cqtwSI/NVgyEBdAsdlWolMr4d8SI9wnS
	GJ6WRxXSkCjByafLXe5CPTCB9Sa4NLUSpNZEIpYoqEXJUXQxeA7D5Po3ihs+5ZhVHKkwNPo9psj8D
	D0I41cgnkJRKEiyTeXnf+ina14R/mS3AVPA0xSf80/AdLSYZHnFzKaz67CJUJbRPCJ0Ep48TWR2d+
	vFZVcWcfyIGRNPDdGNj2FL0YBQ6ptP4isebZrb5yGaRqIj+dlG1ROjefCEEx4e87lCMQpybVXWsWX
	RcNmmFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYQB-00000006lL3-0naz;
	Mon, 09 Dec 2024 07:43:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYP8-00000006l7u-3fY1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:42:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D47BA40FC8;
	Mon,  9 Dec 2024 07:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40FFC4CED1;
	Mon,  9 Dec 2024 07:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733730125;
	bh=iXDqLuzxLZKBI8aoHt6mcXjhjBAUdKfhlnHvvviHoMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsBCo1VuY3xVO6bn2VZVSkTjt9jLXpByR4Y6LEzN/Tpb3RJnl5Hu+64YUYFlnx4LH
	 xapVtQWJGQE1cf5d5jIQKHE5/4MZ4IhM7AdyByGk5A0TP8BAejBaXgTMPxq17lkTyx
	 qq0K7Tse3yot1UbEsfP6mb8QmDmBVV4t2SxCTOHHxaZAkD3MBgwHU+QyLsdpV62jEK
	 ZwpkbeBEgS9DnFDwa5yfImwROByK/zE30UDxD1doaYey0CDJoedwRH57HxtOcVPvHe
	 lv/X1rhrmznuTy2yB6JJRju3Jktp1AqS5jopYUyWrydCLrvHDTCodnujDRt/CUcJSh
	 XmmSCL0H4K5BQ==
Date: Mon, 9 Dec 2024 08:42:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v4 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add
 properties for ti,lvds-vod-swing
Message-ID: <lbbayope3b6nkzfflgb2fbgakxpx7uewcslw7mynn5gki6vlxp@4amjbijjcrnt>
References: <20241205134021.2592013-1-andrej.picej@norik.com>
 <20241205134021.2592013-2-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205134021.2592013-2-andrej.picej@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_234206_971675_C9A492D3 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On Thu, Dec 05, 2024 at 02:40:19PM +0100, Andrej Picej wrote:
> Add properties which can be used to specify LVDS differential output
> voltage. Since this also depends on near-end signal termination also
> include property which sets this. LVDS differential output voltage is
> specified with an array (min, max), which should match the one from
> connected device.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


