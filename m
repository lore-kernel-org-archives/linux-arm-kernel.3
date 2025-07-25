Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0542BC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycLa5sZP6RtstXvIhkCpx1BJln0cSO7gZwSgc9Y35Ug=; b=g/ylSNwJJIaVex1cLulatUvg/q
	tkWzKyyWHD1/uT1nRW7J6Tk8hSwojoeykn4s23wTwwQTowPBfvRxEGqW95zRYHrPgha+YIofwzvbw
	fa0yirchSXvNVfNQMZ43hwsW6QYLOOx9ioFYRSSpkzqUoCFpvGMFjPKv8a1rFtVTTAbQkybPtexCY
	Q62pI7ln+I4oKCZRxPDWZMAJB6v/Xmv+gcAiB/5iIW9IhpT0TjFjTza26rEk2rcqkPpX/JMpv6PXO
	JTyG8xTxMqdakpPlflNN7W0IzWpSHLxANa4CVZ888RGminxq+ucAh/5Qy201QCnU5NfPHPDQqfThJ
	Fs2znvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRZS-0000000ApnN-37IA;
	Fri, 25 Jul 2025 23:11:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRSo-0000000ApGX-17Fu;
	Fri, 25 Jul 2025 23:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49039A5663D;
	Fri, 25 Jul 2025 23:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B9AC4CEE7;
	Fri, 25 Jul 2025 23:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753484668;
	bh=rv/KgJ71TJlmcVVZvmym0sY0RHiUoLRxlEzbvqHPDzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKK8R2+AK6f9Y0S/zn5et8FKdDTW9z3REceWUn7v3RynP03t6TI55PPkjxBQJ/tXN
	 REhiNH333o/cGCi8/Hej65aWWULcZl/u0NhRx/hI0XYVrj9uKhKrf/FoOv2sTcxGUS
	 K4q1MQAZJ9OuH5CyQlEaaDgmje0Qfc2XczLRc397vBzXFKdY2RxK2z+jVUuMrIMy05
	 5BOoY15ETn2UlO1B8PwGh9q6DKOYACOqNl1dPy1TQ/gaSestfQv/woqON2QUYEK0nS
	 ODD34BiNpcqrxJRd71tIebYHtjlLaEE5gvafAleNw3KbirckCggEB+sVdcbeX4Giu4
	 jej/+NXgXlftw==
Date: Fri, 25 Jul 2025 18:04:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 03/11] dt-bindings: phy: rockchip,inno-usb2phy: Add
 compatible for RK3528
Message-ID: <20250725230428.GC1993803-robh@kernel.org>
References: <20250723122323.2344916-1-jonas@kwiboo.se>
 <20250723122323.2344916-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723122323.2344916-4-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_160430_366366_CB3CAEA3 
X-CRM114-Status: GOOD (  10.57  )
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


On Wed, 23 Jul 2025 12:23:01 +0000, Jonas Karlman wrote:
> The embedded USB2 PHY on RK3528 is very similar to the one in RK3568,
> the main difference being that it only uses two clocks instead of three.
> 
> Add compatible to support the USB2 PHY in RK3528.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  .../bindings/phy/rockchip,inno-usb2phy.yaml   | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


