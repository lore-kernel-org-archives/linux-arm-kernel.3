Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F56C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctYufrM9KKHus2Tgjf5Lf+bhwD7v/cZKOa2Grm/1Rjo=; b=mQzn5+Jpd+OihnV4V1LKrTHyVr
	85rlzj5g/XuXfSM1WGzVB1NCYJSwLWN6TpvMs8/oNkt1STeLgt90Gv8rSstECqR9bKVIGbHmlxXv5
	x4kk5NHhAAEXzmW/RgtWmaAyp4Djy42102h0Cp4++NmhCFwJnMCQSdvzEm1NvhPvPcobyI2qSQDHA
	DzN4mw5zOK4BEPLya+afnziMHNqobl0GktMQ/KLus8ofp0onC9954YU0AKBG1+aGL8tohyaog7QiC
	hzFayD56mfH/pRFL8E4UkQBGQyNMWip4gMrTxYAmoSe/gUGC+f3ZcoUeftA/y42waejRwOPrezSfC
	ZbP0vRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLT0-00000008G4k-05ZW;
	Fri, 07 Aug 2026 14:22:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLSx-00000008G4F-1K6P;
	Fri, 07 Aug 2026 14:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786112547;
	bh=Z18AD3eJbmG6g7iT3gQzh9p4HXJKnEXyBQpiwqBYGh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i8mAA1aRBHR+bFJ2R7K3C/2aHumZlngtjHzPJpTITfLHpTtaYspdj00rm/CX2oqKs
	 Aqjj6l9ascZ5trGek5YqHEbIg6zXuk4pLKKATcvCevADfAqDqEVVk43Mt3immfqZbj
	 vIOeLHQx5Y4OAnPgxnNIj9GDZ2RHySE6nPPP7Pckfr9pM41C59JVIqfbQP2ayHPtbL
	 Y6ZZ+tDxO4+ulSQdr8cXKZNWHhFm+qTC/QD/9rkZ62hBVMSZDE5KpUIUuzi2OK56NX
	 ep5fZRTPXJalm+l+PmqDOlmU8rqWPYDo6XlI6UX/oSRpzJncgyyhRkkNE8QZrAzkq6
	 BBf9pYRKvDrvQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A53517E021C;
	Fri, 07 Aug 2026 16:22:27 +0200 (CEST)
Message-ID: <f7432098-f7f3-4893-9aaf-e9eafe928ad0@collabora.com>
Date: Fri, 7 Aug 2026 17:22:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] phy: rockchip: samsung-hdptx: Handle uncommitted
 PHY config changes
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Niederpr=C3=BCm?=
 <dubito@online.de>, Simon Wright <simon@symple.nz>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Andy Yan <andy.yan@rock-chips.com>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-5-8e786067865f@collabora.com>
 <wuoofxrtk3ieb5ukmk4jed3oyeqhyyttdo7fidz7qyingswtki@53vy32pjjqja>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <wuoofxrtk3ieb5ukmk4jed3oyeqhyyttdo7fidz7qyingswtki@53vy32pjjqja>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_072231_497117_D9552121 
X-CRM114-Status: GOOD (  16.56  )
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

On 8/7/26 4:04 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 23, 2026 at 10:41:48PM +0300, Cristian Ciocaltea wrote:
>> Any changes to the PHY link rate and/or color depth done via the HDMI
>> PHY configuration API are not immediately programmed into the hardware,
>> but are delayed until the PHY usage count gets incremented from 0 to 1,
>> that is when it is powered on or when the PLL clock exposed through
>> the CCF API is prepared, whichever comes first.
>>
>> Since the clock might remain in prepared state after subsequent PHY
>> config changes, the programming can also be triggered via
>> clk_ops.set_rate().  However, from the clock consumer perspective (i.e.
>> VOP2 display controller), the (pixel) clock rate doesn't vary with bpc,
>> as that is handled internally by the PHY and reflected in the TDMS
>> character rate only.
>>
>> As a consequence, changing the bpc while preserving the modeline may
>> lead to out-of-sync issues between CCF and HDMI PHY config state,
>> because the .set_rate() callback is not invoked when clock rate remains
>> constant.  This may also happen when the PHY PLL has been pre-programmed
>> by an external entity, e.g. the bootloader, which is actually a
>> regression introduced by the recent FRL patches.
> 
> Don't mention 'patches' in description. Once the patch gets merged, it becomes a
> commit. If needed, reference the offending commit(s) directly.

Ack.  I will reword if there is a need for v6.

>>
>> Introduce a pll_config_dirty flag to keep track of uncommitted PHY
>> config changes and use it in clk_ops.determine_rate() to invalidate the
>> current clock rate (as known by CCF) and, consequently, ensure those
>> changes are programmed into hardware via clk_ops.set_rate().
>>
>> Moreover, proceed with a similar fix in phy_ops.power_on() callback, to
>> handle the scenario where the CCF API is not used due to operating in
>> FRL mode, while the clock is still in a prepared state and thus
>> preventing rk_hdptx_phy_consumer_get() to apply the updated PHY
>> configuration.
>>
>> Fixes: de5dba833118 ("phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support")
>> Fixes: 9d0ec51d7c22 ("phy: rockchip: samsung-hdptx: Add high color depth management")
>> Tested-by: Thomas Niederprüm <dubito@online.de>
>> Tested-by: Simon Wright <simon@symple.nz>
>> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
>> Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Thanks,
Cristian

