Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48979CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PDgfQkXxUD2ang+AE5yOliR5MKflAuDjv8QWb+ETdE=; b=szO0tEzhM76vINZ1Bp7c0qUaSG
	I1ORpG2be8avO8/cFqv5sled2NlcQqqN7yvikZ4Hfjgl4Cut7TZIj+sij9jOazUGSFwkM2QApFtsZ
	q0A3CJA0myxdGhPail9na5QYMITEzqQtiu3evNpZuGnnC6V14t1bTwfUfaArZeKD0iRdH2OWSz5vu
	1RtfahFn+8syAYmgXhHkdx6CH89eUwRUq+th1SAqPgl6N/BHkTxsG0+tUH0TsPVsO7n5JdDhSRGhY
	b7XxpRvq+TqGQPTLG/KcQCATborKe47SHc0Tzc6OlSDvoQpPO988DDFpIXRil2CL4LE75ZyAQzys+
	HoJNA9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OvM-0000000B6MH-0NlV;
	Thu, 02 Oct 2025 19:25:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OvJ-0000000B6LR-1nkt;
	Thu, 02 Oct 2025 19:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759433101;
	bh=7dyLoe6PQosf1e6cw6Y05vwLtzGzEVNzwP6YK46yvf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NUJDuyj2mc5Lq9RKXPVNApVDUt4W4sJzsni6xixG0psfHI0M8XftkNGrY4GrYUEpE
	 9rVm4AMTWxUAAuKWgpi90y1Ge5dzxPWRDF7C1JESNNqhPyKDyuTCDtuFOL9i66DKHA
	 qlxo5Nh/NWrIb/rYiZ9aJT/w8m0X9gMmDYkQHSLIGoyt/EUSa2R6y/xhNZYyUK+Bli
	 yQwZMIkznz/877t7sr/9m6o3cWPL30msnJJlSqpRYMMdmXuiqroSJfxwTZin9C8Ahg
	 pV5BW95IimcwdnEuuuMz2h2JY7tSVYUbP/KN0wH4b8BD3FeWkoX5AihXDKBgh2Rgx5
	 Uy+pVuEci+p7Q==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 729B217E12BB;
	Thu,  2 Oct 2025 21:25:00 +0200 (CEST)
Message-ID: <1964913f-8323-4714-a061-5fa09ce0983c@collabora.com>
Date: Thu, 2 Oct 2025 22:24:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Add device tree for the Orange
 Pi CM5 Base board
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Cc: Algea Cao <algea.cao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jimmy Hon <honyuenkwun@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Muhammed Efe Cetin <efectn@6tel.net>,
 Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>
References: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_122505_658483_D71FF793 
X-CRM114-Status: GOOD (  20.09  )
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

Hi Laurent,

On 10/2/25 6:47 AM, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds a device tree for the Orange Pi CM5 Base board
> from Xunlong. This is a combination of a compute module and a carrier
> board, so the device tree is split in two files.
> 
> The work is based on a combination of upstream device trees for other
> RK3588-based Orange Pi boards and the downstream device tree, all
> checked against the available schematics for the carrier board. The
> compute module schematics is unfortunately not available.
> 
> The series starts by adding a new compatible for the board to
> arm/rockchip.yaml. The next patch documents a missing property in the
> rk3588-dw-hdmi-qp bindings that the device tree needs. Finally, the last
> patch adds the device tree.
> 
> Patch 2/3 may be slightly controversial as the new DT property could be
> better named. 

Indeed :-). As a matter of fact I've already planned to introduce it as
"tmds-enable-gpios" [1], during my recent FRL related work.

> It has been supported in the driver for a year now, so
> there could be users in the wild. I have therefore decided to keep the
> current name. I am open to alternative solutions.

As mentioned in [2], this was "inherited" from downstream and hasn't been
really in use so far.  I intended to do some more testing before attempting
to send those patches upstream, as for now I couldn't notice any (obvious)
change in behavior when switching between TMDS and FRL, with or without
making use of it in DT.

Regards,
Cristian

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/5a32a84ee3e801daaeb974f967f6e213983feeb4
[2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/df4d94fdb94463dd4175338bf7044b40c5e559e4

