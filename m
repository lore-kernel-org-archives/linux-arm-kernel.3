Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BBCD31A3A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSUdcgC/EKugyxh8nCC/VrXygJiNrzdd7eFrxnHVnxM=; b=ixeIh3P0U7F7sZWbHzglac6pGg
	xqW8YXYmSZ3j7V9YXtJTAjUeYjPGSxHrS99htpVPTEF2spfXtr9OBRg2J9wKZ6N4VBEAA5oC/z5Sv
	6qiuf3GA4V0D48WRcy+qfjZLIS0dQR8z/IfiNvyCH2cNvmPxENvf3esWBUEyTptsZG+fhiz7i5O2O
	fxJvZh/LW2rkzJ9fFeI2ruAT6QQsV6lF7Tqr1mm4zcU3E9Wx6qJFpzq9wtv0sJRBSStpItHRL48nY
	y7RNg476kzdPqgPhJ6cetrCTVyoEMR2m7wZH3RVP/m8k0Tfkdxa2XQNq4PNGJcFwV9yk6lj32XiMC
	6GobqGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxF7-00000008Zt7-1yxP;
	Wed, 14 Jan 2026 09:32:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxEy-00000008ZrK-1jQp;
	Wed, 14 Jan 2026 09:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768383154;
	bh=RQZW8N3E4EpxjaX/E336krRniaaouBTQ7ZoD68DziUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Beo1AHPN648OlmZMqfNKSiAawQOs1X2tQQ+JnS52QD0N/CSA6TXlI13KX3LaUXrZQ
	 ZlemAD3JoS2qvMu+xyjJfhvPnz2HRBvARFoNprqC/Kfg+0/2KdtYk5HEiBgXANBp4W
	 s4DQydLjrYf/8hD39Ua9g7s7MTM+Onsd7TKL+cmFufB82HWX+MuxRKWFk8ZRWn17Dv
	 lGPgbLGW1OJs7tqXo6omN9IfGgwqDUqBxxNzyNi3IkNPSHRztR+Q66QtJsXw4vBPPp
	 lx6Yyp8owuuMG3df+ImpL/MKRyUkiViRnj2idnPFfWgwWv+ORRqx7FgIN9eeCSKFWA
	 Xa/qylgMW2tgw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4A8917E150E;
	Wed, 14 Jan 2026 10:32:33 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260114092605.3916367-1-wenst@chromium.org>
References: <20260114092605.3916367-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui: Clean up IT6505
 regulator supply
Message-Id: <176838315384.13786.449316758672672364.b4-ty@collabora.com>
Date: Wed, 14 Jan 2026 10:32:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_013236_693787_1B315BF5 
X-CRM114-Status: UNSURE (   8.01  )
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

On Wed, 14 Jan 2026 17:26:04 +0800, Chen-Yu Tsai wrote:
> Align the name of the regulator with the design schematic. Also fix up
> the gpio property to the new "gpios" property name, and add the
> GPIO_ACTIVE_HIGH flag. The flag is actively ignored in Linux in favor of
> the old "enable-active-high" property; nevertheless it is the correct
> description.
> 
> 
> [...]

Applied to v6.19-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183-kukui: Clean up IT6505 regulator supply
      commit: d33d77044c37aa97f24e3e3adf2f781aba774db2

Cheers,
Angelo



