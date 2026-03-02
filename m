Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761ACEB362C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 20:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwU/X9w+6a1uV2Ytl59ICSXsOhUOW4pSOpbpniL37os=; b=LBpH0Zn1EbvUp21PDKSWZMWYn2
	ZXlbbayk4dUrqV2UX0oGTw7gdc/GNVuSE48ygarfWOs2ksldq3/QyXf14Qow+LRobGjBsIelmt9ZY
	GIwfn1FylmgyOOozQtpFS4GyLd2axwKgFTxDG0pHRttVasWWuQZ/QqOtMZ/1VEZmdirKDJmszjjED
	dvKVu2/hmKxoh6oFjB+RZkIK4c5Bzx7p/kw5nVr0jVQ9xWDLHdQHrdYEONRVC1CkSiDAP7AThIqUT
	0xLzoZfZDV2tQNRIGuh10IQYSGHj9fKFc8jg9x6uCeD5Cxopkw+kq4F/dfKre6Z6MnotVNcfIWg9q
	yEuGZRFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9pI-0000000DnP7-0mWI;
	Mon, 02 Mar 2026 20:25:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9pF-0000000DnOJ-3Fu5;
	Mon, 02 Mar 2026 20:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772483106;
	bh=j8C1DSiSsbLi3cNhCq6PK862abqoa5luMjGyDLs7LpU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NsHI334R2Nhzn/eAQvAmbuv2NUvAeI4ppyOkretq4D8UJ7VHwfVDFNBNdYgol9D4c
	 thQ8HkveUWAR20DmANTnqLJZWy6qnawfA6YEFzn1z/olHCvjDhu46Y2YsoRg4axmWw
	 Adp8KXvO8fDVcqJWhXLJSHQFIzlM1OYJJ+jVLkKlmnl2JG3M6h6NehpgBy+ZyNHLgg
	 evOv+1r8KH1DBU5oZ10Yh2Hwlti626spVndBbklYJi5/G3LneJFHDhqdFBFxN0bKrX
	 Q2Teqf9GfusR3Vszaqr5HY0YbjBwwDMrqk32CDb3hdNCL9nvUP8f9DtMkFVbD0+xua
	 ntJ7fuU/rdvHg==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7CDD17E0D90;
	Mon,  2 Mar 2026 21:25:05 +0100 (CET)
Message-ID: <e1a0d7e0-2432-401c-80af-8195a21a9d1f@collabora.com>
Date: Mon, 2 Mar 2026 22:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
To: dubito@online.de, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com>
 <88436a35a3197393b5eb4fc49962a3b5906bf147.camel@online.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <88436a35a3197393b5eb4fc49962a3b5906bf147.camel@online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_122509_967221_DF18FF9E 
X-CRM114-Status: UNSURE (   9.85  )
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

Hi Thomas,

On 3/2/26 9:46 PM, 1und1 wrote:
> Hi Cristian,
> 
> Am Freitag, dem 27.02.2026 um 22:48 +0200 schrieb Cristian Ciocaltea:
>> This series provides a set of bug fixes and cleanups for the Rockchip
>> Samsung HDPTX PHY driver.
>>
>> The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
>> calculation and synchronization issues.  Specifically, it fixes edge
>> cases where the PHY PLL is pre-programmed by an external component (like
>> a bootloader) or when changing the color depth (bpc) while keeping the
>> modeline constant. 
> 
> as I brought up one of the mentioned edge cases with my Radxa Rock 5b booting
> linux from EDK2 [1], I wanted to report that with this series applied,
> everything works as expected and my issues are fixed.
> 
> Thus, feel free to add my
> 
> Tested-by: Thomas Niederprüm <dubito@online.de>

Thanks for (re)testing!

Regards,
Cristian

