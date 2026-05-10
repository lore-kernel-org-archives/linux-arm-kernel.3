Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD39CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GulxoTj1jEWsNMntry39y1K9tzfSbygQwga7WsmiQw=; b=pIxJmodeQDkni1F8IuCvRjSgYG
	qar9ZNpOWVgDUpvz79WAVBTXL2obIqawMhAX+4n/oe5VH8lPikf4Yndcb9J3Xg3FputqJCFuhJMDv
	UjCEkNKXsN/+UC3tH9Z7bvq9Mx0/AD2yA/3+dUOQ8pUmDffXNMZYaT96i1CqsEkd/IuNckJok+APE
	B1PLZePxL6Hj4zE3NP1IDS0JN4t8/ongDgV+2sBZMtbbKN9jF4bgqqMWfyDOS+xWWL3L2xGEitl5n
	yXrB9T/gJWlREDpslzvC1JTQ80qjQ1EpBAQdGv1yhDO1TFMY2eAC1jo351kvJLgbXiyFpqQJJ5IdX
	fo2yA44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLzx8-0000000ARhu-3qoK;
	Sun, 10 May 2026 08:55:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLzx6-0000000ARgs-2Rh8;
	Sun, 10 May 2026 08:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778403351;
	bh=YwiW+Q760MzYPbYvu9d9Xiw/mH/fNOhKEvXvG0HvquM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QFE5N1A3ga/Uu86j6mV7t3ln6mwZ1ZepXAvnVa8kVVlSGomKkqDfL4Dd8xoPkSgid
	 RXCobStc/4gG8ymUdAmhwuEB1q2NlbHf3r1zmIFmdCsX47j1BvvyT4zNV8E9/p7ats
	 LIt88bgCnLWvpv3zvTGpM3Y9QsngbCCkuA+/BkcPvdtP4FvdkvdvPz9IA/rjlNyfCC
	 DlZuoEUMW0FnCzogFBS4Vh1tCfNjH5m6Qz73ywUdGDU29zP6194sCg5R4CdpUlydw4
	 sp7ITNzvHApAAk572rSvCT6mWEHj/CDaGeGpx1r7d1ENBUSCTw/BfYKtKSDNfuNxPS
	 y7AV31Hxou9xg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4AED17E0EB6;
	Sun, 10 May 2026 10:55:50 +0200 (CEST)
Message-ID: <c76d7020-2b3b-4f30-ab40-a8442c953966@collabora.com>
Date: Sun, 10 May 2026 11:55:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com>
 <agA1dFpheTaBfyUt@vaman>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <agA1dFpheTaBfyUt@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_015556_788372_5E68E7BE 
X-CRM114-Status: GOOD (  12.77  )
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

Hi Vinod,

On 5/10/26 10:36 AM, Vinod Koul wrote:
> On 27-02-26, 22:48, Cristian Ciocaltea wrote:
>> This series provides a set of bug fixes and cleanups for the Rockchip
>> Samsung HDPTX PHY driver.
>>
>> The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
>> calculation and synchronization issues.  Specifically, it fixes edge
>> cases where the PHY PLL is pre-programmed by an external component (like
>> a bootloader) or when changing the color depth (bpc) while keeping the
>> modeline constant.  Because the Common Clock Framework .set_rate()
>> callback might not be invoked if the pixel clock remains unchanged, this
>> previously led to out-of-sync states between CCF and the actual HDMI PHY
>> configuration.
>>
>> The second part focuses on code cleanups and modernizing the register
>> access.  Now that dw_hdmi_qp driver has fully switched to using
>> phy_configure(), we can drop the deprecated TMDS rate setup workarounds
>> and the restrict_rate_change flag logic.  Finally, it refactors the
>> driver to consistently use standard bitfield macros.
> 
> Sorry looks like I have missed to review this one.
> Can you please rebase on phy/fixes and send...

I've just verified and it applies cleanly on top of phy/fixes.
Do you still need a resend?

Regards,
Cristian

