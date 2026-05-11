Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8943BCD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 18:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3vHhZIVTzvgvCRzJ0uCOBL0Xwoamb427dFFS9Exx7c=; b=wnJyWCeuMBIyGzvrU27IGesn8I
	gTd5o04k/QkC7J4n427ZzehppUpdRnjamYkVOp0+Vwdd3mEkozmzKhDf5ga1V/ZXilC0RrFugMkJE
	vdE405GDBIENYnAEy26FALZ0CSJtZgnFQXpymeOK2m5VKcWgiWdqwkwb3S/NbKzHoyOMZU7nNMT8w
	T/gxWA9ScUQp7lRc7EQxpsgCWZ21Iz/7aEVwhFSsikDRNQJIwMwmE4hWnFo9YjXR4u4AlPoJjgyRy
	GIHrS2bXXUK/bH/H0o1mzRzqx6SUD95arGUFLva8lZyae3P6+JbE0F9cgMu0hk7HcCklg4NW4WMgm
	ogCCeKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVPo-0000000EWBn-1AGw;
	Mon, 11 May 2026 18:31:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVPl-0000000EWBA-3x6q;
	Mon, 11 May 2026 18:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778524295;
	bh=yAroUwZ0Px8ARskG4DqFPBVU8jY00U9EJFO3vig1K9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GutqXGYO3JhKA3FnsetFtIbZHyWyyqJkjRYkQEkGaQhIIfwrA757hUQ5q8tn2932k
	 xcpBsfXSaijdhk/XjmUJyOKH/6t5xqVdzv+7G9k6ZiZNsIsD6d333AulhcoTVVXAn3
	 SdlpoML5KJrnLWxPvM0XxNTjmrTpdNNUBDB0yivI1UZNn0s2X482X4/IcRT3PvK7FD
	 Iacp5x96JzOqR+zydNO6YOS8h26nFHNW9tZHisCS+phOwR9U0BYrSO5O+DeUgxFnZu
	 Laz0qQfL9EL6Ox9BwEDg3I/YU/dJVvq5EUrZStlUAkkh0+AHQpJb/daZPWMlBABYxB
	 DqGluskkQ0Siw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F6CF17E12AA;
	Mon, 11 May 2026 20:31:35 +0200 (CEST)
Message-ID: <466dd8c9-c80b-467a-ab99-e58a308079c9@collabora.com>
Date: Mon, 11 May 2026 21:31:34 +0300
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
 <agA1dFpheTaBfyUt@vaman> <c76d7020-2b3b-4f30-ab40-a8442c953966@collabora.com>
 <agIBa7qxIGgqCYZ1@vaman>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <agIBa7qxIGgqCYZ1@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_113138_126333_B5609B99 
X-CRM114-Status: GOOD (  12.54  )
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

On 5/11/26 7:18 PM, Vinod Koul wrote:
> On 10-05-26, 11:55, Cristian Ciocaltea wrote:
>> Hi Vinod,
>>
>> On 5/10/26 10:36 AM, Vinod Koul wrote:
>>> On 27-02-26, 22:48, Cristian Ciocaltea wrote:
>>>> This series provides a set of bug fixes and cleanups for the Rockchip
>>>> Samsung HDPTX PHY driver.
>>>>
>>>> The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
>>>> calculation and synchronization issues.  Specifically, it fixes edge
>>>> cases where the PHY PLL is pre-programmed by an external component (like
>>>> a bootloader) or when changing the color depth (bpc) while keeping the
>>>> modeline constant.  Because the Common Clock Framework .set_rate()
>>>> callback might not be invoked if the pixel clock remains unchanged, this
>>>> previously led to out-of-sync states between CCF and the actual HDMI PHY
>>>> configuration.
>>>>
>>>> The second part focuses on code cleanups and modernizing the register
>>>> access.  Now that dw_hdmi_qp driver has fully switched to using
>>>> phy_configure(), we can drop the deprecated TMDS rate setup workarounds
>>>> and the restrict_rate_change flag logic.  Finally, it refactors the
>>>> driver to consistently use standard bitfield macros.
>>>
>>> Sorry looks like I have missed to review this one.
>>> Can you please rebase on phy/fixes and send...
>>
>> I've just verified and it applies cleanly on top of phy/fixes.
>> Do you still need a resend?
> 
> Yes please, it didnt apply for me

Oh, I used the following branch, hopefully it's the right one:

  https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=fixes

Regardless, I submitted v2, rebased on the above, while providing a few minor
changes:

  https://lore.kernel.org/all/20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com/

Thanks,
Cristian

