Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AE3CD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrImUZyjT4lmb9BXIxXyMNGdgHElksCa33HHo6A2zRM=; b=gapj3H8uSZwOsaO/ORFSEp/3hk
	/OqV1brgxVM/vqJIfMCijcjvvPC3ouq2RZXv+1IPovT8LWRmwBdDVXkvDd+V08BO+wQT2zOua6Qg9
	qSnt6xtm9P2/LK83DkUQE7pzkuRYCYEabtTN/PSc4+uze2accr2jq3tRPRcDiuoAWMgjQ+lRgy1cb
	21jah+UnbHwspop6FPTKWpzYcnkRvSibEv+2yE5/GtZii7yeuIDuA94/RCSG7IIOZdPXn/MBOqNQ9
	OIusmSWwigvGPsP1f3IYIJki9oGYERKjo8/PgoNRAG/oiNCB+zfFlinWAvZ3Kg8T0p2MP8lFS/3fD
	bpccFPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzkm-0000000AbDX-1Drj;
	Mon, 01 Jun 2026 10:20:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzkk-0000000AbBa-2369;
	Mon, 01 Jun 2026 10:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SrImUZyjT4lmb9BXIxXyMNGdgHElksCa33HHo6A2zRM=; b=k+OpxkXjey2Lmif/YVYJXqdS98
	v6TZM1Wo/TjHarw8jxVT8LASmto3lUevq7IivZw9mcm8YnF9ZFC5nbxLY6AiH0kzCmMwQaXkzEIv9
	kzC+AnOC8yktwJToXXt6qKT73ZkFENaOwpflqybM9auVh7Q6TB/lBZt8dD7mMk4fFDCpHOGlSACqa
	hHyhALN3No0U0Jm8YDGw+JzZkQTNyhZaybYV7gL2eK2FnDVwKpM3KUm23i+2QBw0DPzwhwYjwAUsP
	vDyRJMweGynDNNS1PdEp7XyyKbSYXE/LeUu0+71wD2c/EBd5diCLqfQtRS3Yuw92R+88G5FrzGTQ+
	UwkpzMLg==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Gray Huang <gray.huang@wesion.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com
Subject: Re: [PATCH v3 0/2] arm64: dts: rockchip: Add peripheral support for Khadas Edge 2L
Date: Mon,  1 Jun 2026 12:20:01 +0200
Message-ID: <178030918401.239725.2769966054558634435.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507033541.2576335-1-gray.huang@wesion.com>
References: <20260507033541.2576335-1-gray.huang@wesion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_032014_526121_2972D9A6 
X-CRM114-Status: GOOD (  12.07  )
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


On Thu, 07 May 2026 11:35:39 +0800, Gray Huang wrote:
> This patch series adds support for several key peripherals to the
> Khadas Edge 2L board, which is based on the Rockchip RK3576 SoC.
> 
> These patches build upon the basic board support that was previously
> applied to the rockchip tree. This series enables essential
> functionalities including power management, RTC, wireless connectivity,
> graphics, display output, and USB support.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Enable USB for Khadas Edge 2L
      commit: 720fe68fd9f138ada2936ffcf3dd0129a889455a
[2/2] arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L
      commit: ef81db2fdd5a75e3834a4726dc7837f6d2a7229d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

