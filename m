Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DE9C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+L54xcPOgo3Tl3OhdKxub7XjEMxQHH+MtkMzQBJzPXo=; b=FX/1Az55cVBtvyCnESan++VRGQ
	KWUmVJxsQKMsWKOu5STqk1gVu5CWrTyLKN10b1UvP8Xlida32aTqYAf/DOhrHiYpGQHsvGsw1nUnA
	3NS3XXVFTTSlui5YaDfS2ePZkMtfgP79TmmA9otrHcgV0tRCW1QrFCSWRXmOffEhk/IdelgyC/Sko
	K9yLwq+K49I7JnX9oKLDTn/3QWfORNn9ZR5NofkO9Wr6xDPZUsLqbvYxdGRZDKed1MteLsrUAubmf
	4MjuOrcUfIaqKhytdRhpsIguCU43yXZpSUhnF+A78dRDQ8P8s3o6fTe34/d8cK6UVomraVPhsjqM+
	+fVfUdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKNh-000000085Kt-3vyX;
	Fri, 07 Aug 2026 13:13:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKNg-000000085KR-1q8J;
	Fri, 07 Aug 2026 13:13:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F18E840322;
	Fri,  7 Aug 2026 13:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902CE1F000E9;
	Fri,  7 Aug 2026 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786108379;
	bh=+L54xcPOgo3Tl3OhdKxub7XjEMxQHH+MtkMzQBJzPXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lvDs/XdRGELCpxPDY+CqZcFscBtADM91yf2QFo8Juvy9Xitth1PAXc+b+e5zbdSbB
	 GT/85QUi8gKbticjPvB42HXh7nk90rGn1SrNPryO+CyWR//oSWkPRYV0gwZ6xsQZh6
	 RkVGVs6LZhKMN1iuszhp4eJfF86/4its6Pj00LD9qEr6/lRD/PqmCJ913gcgyIzY8w
	 aGOFTyGoQ40vh+K3FHFzowidnrBQrxrtbIm4UywBkRw/rmFZ5I6Y49Yi5lhIGbZx/Z
	 YqAuD/0PLTPpGKZHlQOW4AFirL2A5S14JWb0h3jxTzg00rVvwZoD62iSw+wk9/Oe12
	 h0PLOXQxooOXw==
Date: Fri, 7 Aug 2026 15:12:50 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thomas =?utf-8?Q?Niederpr=C3=BCm?= <dubito@online.de>, Simon Wright <simon@symple.nz>, 
	Diederik de Haas <diederik@cknow-tech.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/10] phy: rockchip: samsung-hdptx: Consistently use
 bitfield macros
Message-ID: <pemlt3unw2rp6womindyxpdpcw6xnrkn63xkhk26xns6iht42r@lee2spi4j5jo>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-10-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723-hdptx-clk-fixes-v5-10-8e786067865f@collabora.com>
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

On Thu, Jul 23, 2026 at 10:41:53PM +0300, Cristian Ciocaltea wrote:
> Make the code more robust and improve readability by using the available
> bitfield macros (e.g. FIELD_PREP, FIELD_GET) whenever possible, instead
> of open coding the related bit operations.
> 
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

