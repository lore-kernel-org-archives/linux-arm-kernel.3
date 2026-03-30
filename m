Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A6F1061B18
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 22:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndHT4poHKZYtUxLQmarvMbYFXw/ugVgemiecWc7CkAI=; b=awVCSv2+giMMvKvQWJKg8M6KnU
	X1rllXzFC2FlOcUrxWx0wj5mUliEHanrYEDg/eJVyHwbzabY3J59Gr4JeDxiZ8qHhmjNDDl4Bcwrw
	dr+/7BCdoWLE5qCWSqySMUHfJ0SZyyJLsdFR8mSymcduMEN3fH6ogh/DVOjCzEuKbccTWokmWhAbn
	DQDOKrzvnmw+0RTJwm1nugIsz/MQJRRu3dWs8CE1l59HnnChGpkn+qXQywVl4fGcYzfNjGpS7YV/1
	r+mFqJuS1PVVdS598GMl8ZL+0zI8HG13alMSgJC+FyUKYWte95AJNEq3zqkpqa+ZjBSBza1o+XD+a
	wJ5jn/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LXE-0000000C0Ex-02t7;
	Mon, 30 Mar 2026 22:56:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LXB-0000000C0EU-1VT7;
	Mon, 30 Mar 2026 22:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774911393;
	bh=iMI9J6wlQN678sFaWi+2un61tjW/vjxUuuKzfWAUal8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cpZq751Y3ckqzSYnL3Vvkr4ADYrvwghibjE1ZhibpowINr2988K0r+woqtp6iD/+h
	 S/5rlRhNyBEVTwAgvvW3GoN37oY0wcD9YnjK99bOORSLBB/5vj1gb5mmjQHTTmXb0J
	 0u2yLsZrnVxrbkIjRqOd+N5PkyrSYzYmEQMX+Ld4VwU03sqtOkOENW4CU2QXiLsCix
	 2Vivr7y1rPL11yDRsZgKqECFx0JDMvkNup7SiTED3bXmXQeBBOxXnltjrgjmcATy3C
	 4RqVTuWMX8F65nREkvVfGeNdl+t1yb87YBRihrBi6BKcczi7M6jcy7Dw+Cf1nYdeMB
	 Mo/rplpIvG3fw==
Received: from [192.168.1.57] (host-79-18-8-236.retail.telecomitalia.it [79.18.8.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 20CF217E517F;
	Tue, 31 Mar 2026 00:56:33 +0200 (CEST)
Message-ID: <f2827d9f-ddba-4fbd-8d1f-a1a2d1b94708@collabora.com>
Date: Tue, 31 Mar 2026 01:56:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] phy: hdmi: Add FRL TxFFE level control
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com>
 <20260330085723.4rewkbs76lz3scum@skbuf>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260330085723.4rewkbs76lz3scum@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_155637_630747_285B84DD 
X-CRM114-Status: GOOD (  16.79  )
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

On 3/30/26 11:57 AM, Vladimir Oltean wrote:
> On Sat, Mar 28, 2026 at 03:54:53PM +0200, Cristian Ciocaltea wrote:
>> During HDMI 2.1 Fixed Rate Link training, the source and sink may
>> negotiate a Transmitter Feed Forward Equalizer (TxFFE) level to
>> compensate for signal quality degradation on the physical channel.  The
>> source starts at level 0 and may increment it up to a maximum agreed
>> upon during LTS3 in response to persistent link failures reported by the
>> sink.  TxFFE adjustment is optional and entirely independent of the FRL
>> rate and lane count selection.
>>
>> Patch 1 extends the HDMI PHY configuration API with two new fields in
>> the frl sub-struct: ffe_level to carry the requested level, and a
>> set_ffe_level flag that switches the semantics of a phy_configure() call
>> to a pure equalizer update, leaving all other fields ignored.
>>
>> Patch 2 implements the new interface in the Rockchip Samsung HDPTX PHY
>> driver.
>>
>> The series depends on the "[PATCH 0/6] phy: rockchip: samsung-hdptx:
>> Clock fixes and API transition cleanups" patchset:
>>
>> https://lore.kernel.org/all/20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com/
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> Cristian Ciocaltea (2):
>>       phy: hdmi: Add optional FRL TxFFE config options
>>       phy: rockchip: samsung-hdptx: Add support for FRL TxFFE level control
>>
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 74 +++++++++++++++++++++--
>>  include/linux/phy/phy-hdmi.h                      |  6 ++
>>  2 files changed, 75 insertions(+), 5 deletions(-)
>> ---
>> base-commit: f7b64ed948718290209074a50bb0df17e5944873
>> change-id: 20260328-hdptx-ffe-a89c51e66904
>> prerequisite-change-id: 20260227-hdptx-clk-fixes-47426632f862:v1
>> prerequisite-patch-id: 5c1d442fae39103bb758f54738aff33d2491401d
>> prerequisite-patch-id: b86f30292308345387d2a6b50949ad040b931592
>> prerequisite-patch-id: b1335105db9177cb10c64ed1bf0867832e6aac2f
>> prerequisite-patch-id: 83db6603d13e19f239e89fde2b26366eb0106b7e
>> prerequisite-patch-id: b534395ad315811861f11859a3946f65c90c631a
>> prerequisite-patch-id: f9637e57c902f35218cda658397416f84f7285cb
> 
> Sorry for my ignorance; who is supposed to act upon this git-format-patch
> base tree information and in what way?
> 
> As things stand today, the build infrastructure we have in place will
> not be able to apply and test your series unless it applies directly
> onto the linux-phy/next branch.

Oh, I assumed that since b4 makes managing series dependencies straightforward
on the preparation/submission side, there would be similar tooling support on
the build/integration side as well.

