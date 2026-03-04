Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41660EFCE37
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 20:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5OgD7a1mtxqBl7W2yXZFFc9dalLVwkrCnkwlR0KQFc=; b=TSqz5ZjvesQ/BykIgKcX6Rs5W0
	HNwWk+gU/0cwr+hM+ljr1143G9+chbDbMQIzLMw/LVkj29o9NkfcLUVbEipSbmiklHEuF1uBlyBGv
	Etc03EFxvRaHGADy4lvo+9aRKbrPFGUtGxKQJgRsgqlmSrBOr+ACs/JkAHhK3pqt6GYobgm82HWGH
	ovuz3rnRYs4iRgVZ5pF1jtUJvho4MYEMup/kx5RxJpzlx9ztn4vQ+U9OTeY0Ok7kpKA/HazJIaHqT
	xt51g71iH8IT/3jR09LKAGp3dmo8VEAjpdi3wsV5bh8AzqxtFGnbSYPY+f4bIsskHm7p8In+ph1wg
	qzIk6Yuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsbw-00000000RUb-2y3P;
	Wed, 04 Mar 2026 20:14:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsbt-00000000RU2-2unJ;
	Wed, 04 Mar 2026 20:14:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69FD2402F4;
	Wed,  4 Mar 2026 20:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5684C4CEF7;
	Wed,  4 Mar 2026 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772655260;
	bh=7LbZg6skQwe1JIVxe4uIFooiyh42caVjXi8zFEyCeHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vOSWAYP0ASIUMPrNsRctEnLesB/qOpdMCrQy6ahbi4pLYMii7O8IIBA8F63PZsyg0
	 ZcCnF1kj3cVmc84Vx9h9Kq96VZaMCMHxuCArllf1CYolj2oqppgnv3vXM3w6laZHlz
	 NOtq23rucRl5IE/Bb02Fai9gX/5ewV1hAPdziT8RA9B2ev0oqJbQtiikHUnSW5L9q5
	 Uk7uAI6xqy1wRgSUh7h36AH8oidWLE77AQilsTltHa4bvKQfckiIg6DJMG3yRydPNA
	 OvbzcQS3k3wio6bMSaigTPS0yMDQddq1Qx4b83K8C3Iv2VNsdfZAH1Ox9lzB5Wl3zL
	 iEzLjD3XL6GFw==
Message-ID: <679dbfdd-9e46-4265-a01c-faf163924ec3@kernel.org>
Date: Thu, 5 Mar 2026 05:14:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 01/22] ata: add <linux/pm_runtime.h> where
 missing
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Niklas Cassel <cassel@kernel.org>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-2-vladimir.oltean@nxp.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260304175735.2660419-2-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_121421_781953_4C994118 
X-CRM114-Status: UNSURE (   6.52  )
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

On 3/5/26 02:57, Vladimir Oltean wrote:
> It appears that libahci.c, ahci.c as well as the ahci_brcm, ahci_ceva
> and ahci_qoriq drivers are using runtime PM operations without including
> <linux/pm_runtime.h>. This header is somehow being indirectly provided
> by <linux/phy/phy.h>, which would like to drop it (none of the functions
> it exports need it).
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

