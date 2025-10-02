Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C81CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 20:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYQTH8+ZTNyy5Onfgvtg/pHaQOWg/aF5Qe3BfzlnQW4=; b=KSOPlpMbNzsbhwQ6DTThZl62Te
	1wEPGCxUAQbB3UEhP4X26/BKaRZrNsBeTU3hDsHez6u7Kn3J5PnGNm6yiqXHJR3Ma71ka/hPE6M+W
	TwJn+u+res3k3zdJy/i1E5aqV49g1ilTtZvN/yJ1ts6tJ+H6QLO/ZHNUQx7j7nvB9oxpKzj2kKFAo
	ELGUoASTy06/9KDUdWbjcWX/7WxTeUhZutqnCRF2HHuj1EHWTDnE9VutxryOtBeH6Ru89KE8+x+xR
	W9sjdPkEGCJWJ/3hxGPegnmYpWEL0lL+IsT9WpuD2/JU7naPZKU3yErF8JdhhKvKJjnngtxECQzL5
	GAAQVPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QIF-0000000BDXv-0TLB;
	Thu, 02 Oct 2025 20:52:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QID-0000000BDVr-0HfC;
	Thu, 02 Oct 2025 20:52:50 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4ECA41118;
	Thu,  2 Oct 2025 22:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759438276;
	bh=DgFpKOW+hWlaCg08U/RBp/FCxL6mGQtQM2kTf8GNnhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkrZ1dyY8K2J79Viiy1hEnfBtCZupBIIM9TgQK0ofWMArAO8Ur7TeqfgAC20aNXrx
	 8FhPe6wfAKKCsNJ5J5ThXDTxT26uFEe5o/x6kBBEueVgPuFTE00e9SamEKTgXUCS0l
	 9R1pr3Ripo7w4PjyNLyFr9/mlcf7WwLgEQmuzWIk=
Date: Thu, 2 Oct 2025 23:52:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Algea Cao <algea.cao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Add device tree for the Orange
 Pi CM5 Base board
Message-ID: <20251002205240.GF16185@pendragon.ideasonboard.com>
References: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
 <1964913f-8323-4714-a061-5fa09ce0983c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1964913f-8323-4714-a061-5fa09ce0983c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_135249_248737_2C11F268 
X-CRM114-Status: GOOD (  27.23  )
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

Hi Cristian,

On Thu, Oct 02, 2025 at 10:24:59PM +0300, Cristian Ciocaltea wrote:
> On 10/2/25 6:47 AM, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series adds a device tree for the Orange Pi CM5 Base board
> > from Xunlong. This is a combination of a compute module and a carrier
> > board, so the device tree is split in two files.
> > 
> > The work is based on a combination of upstream device trees for other
> > RK3588-based Orange Pi boards and the downstream device tree, all
> > checked against the available schematics for the carrier board. The
> > compute module schematics is unfortunately not available.
> > 
> > The series starts by adding a new compatible for the board to
> > arm/rockchip.yaml. The next patch documents a missing property in the
> > rk3588-dw-hdmi-qp bindings that the device tree needs. Finally, the last
> > patch adds the device tree.
> > 
> > Patch 2/3 may be slightly controversial as the new DT property could be
> > better named. 
> 
> Indeed :-). As a matter of fact I've already planned to introduce it as
> "tmds-enable-gpios" [1], during my recent FRL related work.
> 
> > It has been supported in the driver for a year now, so
> > there could be users in the wild. I have therefore decided to keep the
> > current name. I am open to alternative solutions.
> 
> As mentioned in [2], this was "inherited" from downstream and hasn't been
> really in use so far.  I intended to do some more testing before attempting
> to send those patches upstream, as for now I couldn't notice any (obvious)
> change in behavior when switching between TMDS and FRL, with or without
> making use of it in DT.

Thanks for the links. The new property name is better. We may need to
preserve backward compatibility though, how confident are you that the
enabled-gpios property isn't used in the wild ?

I'd like to get the device tree for the Orange Pi CM5 merged sooner than
later. Would you post those two patches, or should I take them in the v2
of my series ?

> [1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/5a32a84ee3e801daaeb974f967f6e213983feeb4
> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/df4d94fdb94463dd4175338bf7044b40c5e559e4

-- 
Regards,

Laurent Pinchart

