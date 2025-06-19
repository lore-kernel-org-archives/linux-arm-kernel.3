Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BC7C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 04:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mebxJHfBUu+PEqj1h1kC5lphByggIbGVwWubkQZ+XwQ=; b=qE5muOcHUA2q0qzMNVEwMNkJHX
	hEEcCjBuE/Vu2qiLZ6ILD8EHwnLbY4kQ6a7BnxvrmiZtafQxyxUfyI/AHLOnxpbxTHBCbJUmzwUNN
	92YjRtn8kMT/35IwNmG+zFqOwWnywQYvtdzTVoRqo30D5tCHZj2vKH+vbv74FLUJBJfGqXZ8KgS7D
	8yf0qXX8YLkDM8UUGrKhAUGmAq5uWdLbYPiMiIb97J9kPfU+lrN344ApVG8w9hAN4VbK+6j1N91r9
	7ppWmibVLe2HW1Jhe2/ZYQWONFOMGH6/loqIevGXksbeaY85qUhRQVupDbnvEDKfxSmBceUI7JZSQ
	3CDp9r5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6ZH-0000000By0A-36L3;
	Thu, 19 Jun 2025 04:08:03 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6UG-0000000BxGr-3Yxw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 04:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=mebxJHfBUu+PEqj1h1kC5lphByggIbGVwWubkQZ+XwQ=;
	b=NAy//Pt8StCnO+J6isdiPSTwZBabJznZLHn78gfOQIYVXNSK4OiSg08u8bSyw5
	pHhMaV9+UFlQmDGG9GqD03fssfyhYOAYiufj6rKky7Z9JO34yNwLAA4uLmcMtK5S
	/FXDGpCpNh/dEFLQFF9YJOlFKv3Xn0LBePjgGEYdtyii8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_zzci1NofHL2AA--.60682S3;
	Thu, 19 Jun 2025 12:02:38 +0800 (CST)
Date: Thu, 19 Jun 2025 12:02:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 6/8] arm64: dts: freescale: Add the GOcontroll
 Moduline Display baseboard
Message-ID: <aFOL3N7Si7ZWfEYR@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-6-a8f0195420aa@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-6-a8f0195420aa@gocontroll.com>
X-CM-TRANSID: M88vCgD3_zzci1NofHL2AA--.60682S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWUGr4UKF1UXw1xuF1fXrb_yoWfuwcEyr
	WkAa17C34UJ3ykAr4fAr43GrWfuw45Xa1DW3y5trs7uFy5Gw1093WDtryrZF1Uua1xtFWU
	Z34fKFWrA395ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbG-e5UUUUU==
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIR4JbmhTi96deAAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_210253_187692_0A80511F 
X-CRM114-Status: GOOD (  10.08  )
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

On Tue, May 20, 2025 at 08:34:55AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Moduline Display platform is a part of the wider GOcontroll Moduline
> ecosystem. These are embedded controllers that focus on modularity with
> their swappable IO modules.
> 
> The base Moduline Display board includes a board-to-board connector with
> various busses to enable adding new display types required by the
> application. It includes 2 Moduline IO module slots, a simple mono
> codec/amplifier, a four channel adc, 2 CAN busses, an RTC and optional
> wifi/bluetooth.
> 
> busses to the display adapter include:
> - 4 lane LVDS
> - 4 lane MIPI-DSI
> - 4 lane MIPI-CSI
> - HDMI 2.0a
> - USB 2.0
> - I2S
> - I2C
> - SPI
> 
> Also a couple of GPIO and PWM pins for controlling various ICs on the
> display adapter board.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!


