Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BC6CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQcipJTVAK/XgWcoEQbI/7AqWxzqwZ+9gkRoP1M9fpc=; b=vVLwQby7nZ81H/jVEPmLLY3xCC
	SS04AAvCEX0Wq+6X71HVPgemUnORvjcQD0n6NZfDrkbDdQFk4PUfc9UI2iD0ffdPpkssz0vj9zG2T
	g3RQ/m4bSIx7zmIksdbItxam2amW9UnDEKdMpcjWwnGP/FF6nmOpim+bQSHzxN5k7UfOik0vcKvik
	J9x7qe+yJHxxY5P4+z2q0IE572phg5cjyRRhaoRiR1Ur9TimuOWrgjLZgmsUApqLAU6XHc3wdsQC5
	/+mIQgJFJbL+Ri2M9P4/RDFEIfFvxlBrhVa3l44H5AchTQwPwr0rCvZpNV7hWtoEPlfpofl23JvSY
	CnUXZQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXecD-00000009PbD-2udy;
	Thu, 11 Jun 2026 12:34:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXecB-00000009Pal-2fG9;
	Thu, 11 Jun 2026 12:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781181268;
	bh=GM32saeASmaz4if372xZH1/viClkocEGw0aQEB81ZZ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UO8fXxIRvl8X+2IN3ioGsA87bY3fVCCXwCcJjo+thI/jKDT2IcJ5v79i4tnfwq42O
	 3QgjWsYrBG9e4MdpF1Wbir4JI4qrJSVfK+GZPDbPD+SfEQaNys9uJxbfGiz0gDB4fc
	 gt9sA0DcLt4YRibXe4H4ZlA6toZDq7FXBM1ikmhNbYddIUcdw3K8jypOFjCzC5PIdh
	 sFrJlTlAiUroICwy9Rhy8JSwf68ZMh5xMYdJAts1blQ1l88FURSxP/s/kTzzouIiGJ
	 wnhSPLvFiH+YxbUltYjAnKzFPszfdMO6IHIy5mm9eBzRBLvE8yoO3VSNdWnUYO1E6k
	 dYhBamWo0jPNw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 46C0017E0191;
	Thu, 11 Jun 2026 14:34:28 +0200 (CEST)
Message-ID: <38f0e334-bf28-4c8d-aa3c-e075c31a0c1e@collabora.com>
Date: Thu, 11 Jun 2026 15:34:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>,
 Simon Wright <simon@symple.nz>
References: <20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com>
 <e0eeb794-11b9-4ba6-bee2-f6cc607d3a16@collabora.com>
 <ebcad67e-e14a-4d0e-b3e0-79ae1d146eaf@collabora.com> <aiqbX8kon8HtiSEl@vaman>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <aiqbX8kon8HtiSEl@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_053431_847701_81160463 
X-CRM114-Status: GOOD (  12.02  )
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

On 6/11/26 2:26 PM, Vinod Koul wrote:
> On 03-06-26, 13:27, Cristian Ciocaltea wrote:
>> On 5/20/26 10:05 PM, Cristian Ciocaltea wrote:
>>> Hi Vinod,
>>>
>>> On 5/11/26 9:21 PM, Cristian Ciocaltea wrote:
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
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>> Changes in v2:
>>>> - Collected Tested-by tags from Thomas and Simon
>>>> - Fixed a typo in commit description of patch 1
>>>> - Added a comment in patch 2 explaining why PLL config errors are
>>>>   ignored for rk_hdptx_phy_consumer_get()
>>>> - Added a missed FIELD_GET conversion for lcpll_hw.pms_sdiv in patch 6
>>>> - Rebased onto latest phy/fixes
>>>> - Link to v1: https://lore.kernel.org/r/20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com
>>>
>>> In case you missed my comments from last week on the Sashiko AI review findings
>>> - in short, I don't think there is anything to worry about and the series should
>>> be fine to apply as-is.  Please let me know if you would still prefer a new
>>> revision.
>> Kind reminder..
> 
> Please post a new revision based on phy/next

Done (also addressed the confirmed Sashiko reported issues):

https://lore.kernel.org/all/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com/

Thanks,
Cristian

