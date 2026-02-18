Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7218EE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 01:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbfMPh8Ar648jFRBWAU94j8h/1Zyd35Gt3WyX72rN7E=; b=qfjABALUGDBuQI+CUmD4o41CDB
	hDQ/yc01NdY1KvQUtN0UHB6cYVIA3xTXun0r2TVpzDZQIjhp4KTdCu6dwo2CG6j5b9fZrGjQhscgm
	5Rmbn/hsfEuRvfq7S5s2nVK5KHHwzbTUVEBgHD/Y0OuWfBBsNkGHudop6/8Do3oAoZ3d/tZh3A2y6
	ifM/1oGn+3Jb0ez31daPiw6xTptnVunk9AkRuV7mPrh+iSt+jufB0BFS5LIJKKpvqttFsbg6ZhuxC
	xOIay+YRiZMxqimx1HiLNDrsRDzoDPSGRch6RDADSZ+xlhzHApKq01kcjzkDgcJo4jvWOd3V3tJ3o
	ciA21Bzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsWGf-000000097qE-1tzW;
	Wed, 18 Feb 2026 01:22:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsWGc-000000097ph-2Zja;
	Wed, 18 Feb 2026 01:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771377728;
	bh=APtxeUx0eDQJR7IoVCyJrWk/yYivtUIxxTdH3yeZ6g4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=QEgCSBX0EWbYPkVOEbbgqIi9DbLoGaZLjkdJx0oNoD18HpkgaxcSJutWqTAzASEaf
	 IwyQp6Bx3NjwVar2jB9v+25w6Gwu6f+yOS8BbxKe89QY4HVI2LizgpYcK2Nzsvzmcz
	 KKKLIAUFR8beVuJZ+vQcbFdZxNORslKZKMal+yZxrO/+dT7jEz+LwoTmceuRSWwizR
	 gbnM9vzMEP1z6iCx8l5NNg0DUMrF1qhu0h1mlAdaar0d3PezXkaxou+cp3JD/uYTmq
	 AlFQ7bLbXoNqC4Ll2l/ZNEeH2JhyOJk/qroneNOofpmZHAC6f5SveWTM8Qm/xQQq07
	 1g396ozN3vt8Q==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3566817E012E;
	Wed, 18 Feb 2026 02:22:08 +0100 (CET)
Message-ID: <26e31b3b-484f-433b-833f-c639ee437f63@collabora.com>
Date: Wed, 18 Feb 2026 03:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HDMI monitor not working on Radxa Rock 5B after phy
 rockchip samsung hdptx HDMI 2.1 FRL patchset
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: dubito@online.de, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
 <8e410a11-bd7b-4a12-a711-0514a59409c0@collabora.com>
 <1859c940219a4dbfdf0497afbf333e627ab0ba25.camel@online.de>
 <98e46dbb-c8e2-451f-accb-ea48f63f9408@collabora.com>
 <4544ec4ccfa49cbdffee098878df7806223935a0.camel@online.de>
 <08369c90-fbab-477d-9ac6-388deddfd3b1@collabora.com>
Content-Language: en-US
In-Reply-To: <08369c90-fbab-477d-9ac6-388deddfd3b1@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_172214_867764_360C7BCE 
X-CRM114-Status: GOOD (  13.39  )
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

On 2/18/26 2:52 AM, Cristian Ciocaltea wrote:
> Hi Thomas,
[...]

> 
> Sorry, I somehow missed the following warning message, though it has been
> already present in all the logs you've sent to me so far:
> 
>   rockchip-hdptx-phy fed60000.phy: PLL locked by unknown consumer!
> 
> That indicates the PHY has been preconfigured by an external component (e.g. the
> bootloader), which is actually a scenario that I didn't verify.
> 
> However, this just another way to expose a limitation of the current approach
> for managing the TMDS character rate: done via the Common Clock Framework API
> instead of the HDMI PHY configuration API.
> 
> As a matter of fact, it was actually an item on my TODOs list for quite a while,
> but blocked until recently due to several dependencies waiting to be merged
> upstream.
> 
> Hence I took the opportunity to finalize this task - please give the following
> commits in my rk3588-hdmi-debug branch [2] a try:

I've just realized I introduced a regression while doing some cleanup work, hence
please ignore this until further notice.

Cristian


