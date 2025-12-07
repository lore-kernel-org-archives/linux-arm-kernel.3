Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820B5D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 21:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubmVBf2THb9WiaCuIxeJKsOm1jvo/yN428q54G2L8JE=; b=VHWbppSDwHHYYtgXiklN6pTiqp
	2sUxbuiaYJ9+ofFuniS5ZFvv+SOsIxBoB6fMvSWiZ6Db/HfwLGGxTBBSKdpHvP1HoLtskTTADw67Q
	bgncagvfNii8j3YI0Yov1bcg3V+85Q2E+kZPmhQP8EKF+8uV9A4ZYXoTWcluunCrTMJ8mOMNnIc2v
	xJQ+s2wMHHxz1bJn9wd9f8ENBXWUzB2LuM2dYDy9pPT5QY53BTWb5/68dSl3DnmiBzdxPnf0Dosmr
	6JXoYRctSkadmcslmcN+Sc5sbyDBjjOROMY4jsTrAfvRS7f866b5dMMhDRbuMugzfIHnLY365t80y
	wO/2WOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSMT7-0000000CGId-1hvE;
	Sun, 07 Dec 2025 21:39:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSMT5-0000000CGI8-1l0V;
	Sun, 07 Dec 2025 21:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765143533;
	bh=imzAolqIJKjIbBRAXPxzblwltEq5JIsw4/FvhKhP6ww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=orrmjAlagW6XDsR1fClEviYK79zgQeGISPlh1h59zn79/Dub36W76X9kawI0jnq7L
	 l5neOqdpbF/L+JnzQzThej9fgzAZmHBda0jF24uHuf0HRuWgAnpP9xjgUsmgzlRA/F
	 mOcUBUKE0N9F4gwtjeJYobHj2EuN74B9BvYJaJE3ThuPzs3PDqOQUcuxmz+1TkRCAc
	 2iWi+g8AGWI7qj+LuB+fE4loES3o9RhFY3GQQI7sY8M6zU95Eqq3aCqsj+eIi89zDi
	 iNA8GUzGzwbNHBF2bsm7Xnp4VXtPgIjyO8GxFu0rUbMdTZ3LTcFyfWdMHrEsOPWggF
	 G0uM8DjE+iIAQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3345B17E1017;
	Sun,  7 Dec 2025 22:38:53 +0100 (CET)
Message-ID: <ab0eee09-56bf-4a8e-8feb-f0bc355d476b@collabora.com>
Date: Sun, 7 Dec 2025 23:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add HDMI 2.0 support to DW HDMI QP TX
To: Maud Spierings <maud_spierings@murena.io>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
References: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
 <4ec78537-5184-4e6b-9ada-ff268fbe9c3e@murena.io>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <4ec78537-5184-4e6b-9ada-ff268fbe9c3e@murena.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_133859_628978_6DB9F5B7 
X-CRM114-Status: UNSURE (   5.29  )
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

On 12/7/25 3:16 PM, Maud Spierings wrote:
> Awesome work! I've been waiting for this feature!
> 
> I can now actually get 1440p100 on my display and 4k60 on my tv over HDMI.
> 
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>

Thanks,
Cristian


