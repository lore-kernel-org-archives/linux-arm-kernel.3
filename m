Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E317CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 01:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eawiXWtUZj4uCM8OnFXHNWvbRpsp4qvBIm2uw04gQNk=; b=DWySIEzeydpZ5u76+dAJ40+0aW
	JPH4ORemlmnqZGUYBCmNEDJWmL9XbML/z6oIbyGEQDPLnSIBAsdYGprcRTCyJwyO+bOfB12r9uZrT
	QwwPLOKhcZhawemmxvwZXCsGkDbbCEpIPUHD+13gh8uDL286vZaTnRA4VFmHZjlAosB6r5Ln78Xlq
	skxowfyR39nHb70c5f1K4snrWlNqYSzKXJ87Tq2bmyxSZNkIp2zvTDRpZB9FyQ4D2fjuB+96V63P6
	hMJepPzlewn5KQ0Mm+3P2EOul6Hz4t25uSmME7kHCTRBc41zVxbbDaxnf0UnvT8vcBoOQGWAoYVv8
	qijiSzaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMp2-000000023x7-2RZ2;
	Tue, 29 Sep 2026 01:39:56 +0000
Received: from mail-m16023653251.xmail.ntesmail.com ([160.236.53.251])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMoz-000000023wM-0Vqf;
	Tue, 29 Sep 2026 01:39:55 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f6b915ad;
	Tue, 29 Sep 2026 09:39:42 +0800 (GMT+08:00)
Message-ID: <9d48120b-8206-4c74-8e98-3a1aea2d08bf@rock-chips.com>
Date: Tue, 29 Sep 2026 09:39:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/5] power: reset: syscon-reboot-mode: Add support for
 Rockchip RK3576 reboot modes
To: Alexey Charkov <alchark@flipper.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sre@kernel.org>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0ead1536503a4kunm68e8d0327ea435
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGh5LVh4fSkpDGh9KT00ZGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=eWazI0Pnn7knjwGZECTX+ulASdL6vLBpupw8PlWpjyQgib35ZuGJmKiYgU1Vw8dmz1m3gQLEYhQJSXd8dY1GLLmWZlYU2Te4TnKAIwEvzJed/bZRiXJLR93PwydEDwbOO11FFLvJ8AmiXtluSCCjjqcwl1ebHyCNXuTNAFemS08=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=eawiXWtUZj4uCM8OnFXHNWvbRpsp4qvBIm2uw04gQNk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_183953_843891_C26697B2 
X-CRM114-Status: GOOD (  19.96  )
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

Hi Alexey

在 2026/09/29 星期二 1:18, Alexey Charkov 写道:
> Rockchip RK3576 supports reboots with a specified boot device priority
> mode, allowing one to override the board-defined strapping config and the
> OTP programmed priority setting.
> 
> Supporting it requires several changes though:
> - The boot mode request needs to be forwarded via TF-A to the boot ROM
>    (upstream since TF-A commit 2a97ba20e901 ("feat(rk3576): forward any
>    boot ROM boot mode request on reset"))
> - Some power supplies need to be kept active across the reboot to prevent
>    early boot code from running into a synchronous abort
> - The magic values for each of the supported boot modes need to be defined
>    for the OS to use
> 
> This series enables the above with the RK3576 EVB1 board as the example
> user. Other boards will likely need a close to identical change to make
> use of this functionality, but need testing.
> 

Nice work, I did a quick test on my RK3576 EVB1 board, this
series works for me.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> Alexey Charkov (5):
>        dt-bindings: soc: rockchip: add boot ROM download boot mode
>        dt-bindings: power: reset: syscon-reboot-mode: allow supplies
>        power: reset: syscon-reboot-mode: enable supplies for the next stage
>        arm64: dts: rockchip: add reboot-mode node to RK3576
>        arm64: dts: rockchip: name the reboot mode supplies on RK3576 EVB1
> 
>   .../bindings/power/reset/syscon-reboot-mode.yaml   |  8 +++++
>   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 16 +++++++++
>   arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 36 ++++++++++++++++++++
>   drivers/power/reset/syscon-reboot-mode.c           | 39 ++++++++++++++++++++++
>   include/dt-bindings/soc/rockchip,boot-mode.h       |  2 ++
>   5 files changed, 101 insertions(+)
> ---
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> change-id: 20260928-b4-rk3576-reboot-mode-d3804e39df04
> 
> Best regards,
> --
> Alexey Charkov <alchark@flipper.net>
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


