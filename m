Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEC6CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7SSWITmvQSFYZjjfwZX101jy+t3hE5x404+UGYCxaE=; b=mCQ0Iu6V+JfVXThj6KL0MUv8kD
	XSLKG4nXGU1VEEWfxdPImBKqO9sNSpnN5wRuH3GUir55qN3G/9sCS4Ab+bmm20k3J/Ux+UWNzWypL
	dBazim4jTrK0WB0AMWH2e1s4Sti9VKPN1K9FMbaC7yhwTb5WeZcPJQML1qZ52dd2fPUbk3YYl3fDj
	4TwkT7Fny+89JgfOZGZrlMt6Gg7YkfPnuFIVgrlkl0/E/Mh5pXmOy7o2pgGaKeacAIDKgN2vHEDIU
	bEQcpDVeQqA9GaR8Jj07lMw8kKSFinsGOZqqOqXYvAwK85D/IFy7vkssiO4qOBtzDsfZiorApj/kI
	IKk1s1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjm3-00000006mr7-0ua0;
	Tue, 11 Nov 2025 08:30:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjm0-00000006mqS-1I2C;
	Tue, 11 Nov 2025 08:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762849840;
	bh=d6hbMkfnrqZV3eqYEQrTninyADS9Axe0rTNBA1LAauM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=BOh2+jq15IgCBzgothKOYnuAhsJMpfnUeGLlpiXL1BdcQfwtEPYTbJ37791r5/Nlr
	 jWY+6AA/opWdHkVLEZ/RiDfayNNeB/R6QzozNq2IybvmDzmqLgmIjTpWwYfJ0LZoCM
	 ErHgT2j4JLN47umS3CFBCqXFeEJBnr0DGEIbmWeZvqr5RUxIdt/ZbjoDotyNF7lfOm
	 V620by1hc67TqdVdtVhj61JfdweoPLzJ1mgYDnxP8okD9ZYnDN5AlHx/AHecia75H0
	 QOYrPzU0UYwhHl+QSNJ06cLBca7j+Fx7DCjIVDHLBvPcKfsQMddJ8tCXfDSNnRdr39
	 gJM4zdOkWLK9g==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6633017E00A6;
	Tue, 11 Nov 2025 09:30:40 +0100 (CET)
Message-ID: <2fb8b8cc-c393-4b2b-a501-667e7a8c4dd4@collabora.com>
Date: Tue, 11 Nov 2025 10:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] Add HDMI 2.1 FRL support to
 phy-rockchip-samsung-hdptx
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250902-phy-hdptx-frl-v4-0-7d69176373ce@collabora.com>
Content-Language: en-US
In-Reply-To: <20250902-phy-hdptx-frl-v4-0-7d69176373ce@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_003044_557125_E670D51B 
X-CRM114-Status: UNSURE (   7.48  )
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

Hi,

On 9/2/25 11:44 PM, Cristian Ciocaltea wrote:
> The Samsung HDMI/eDP Transmitter Combo PHY is capable of handling four
> HDMI 2.1 Fixed Rate Link (FRL) lanes, while each lane can operate at
> 3Gbps, 6Gbps, 8Gbps, 10Gbps or 12Gbps.
> 
> This patchset extends the HDMI PHY configuration API to manage the FRL
> mode and provides all the required HDMI driver changes to enable FRL in
> addition to the already supported TMDS mode.

Just a kind reminder if this fell through the cracks.

Thanks,
Cristian

