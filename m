Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17761C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMbcpm4qmrlMqnVMTM+9alG8P2dx9VHAtE3yHd1M7Wo=; b=xWbrAs8F328DqlknJx2f+khcYp
	1XiosllTQLjAnFSubv1zi/niP7Kf1kANMmr/07Z84DFICewFqA5LU7yiEnl82Dsr/GjYmilnYsPgz
	RHn/jFGClqnKlHH/zaAitxHnUoiIYim+N3uT+tb0T4WCw8H5tD+nICsEyyDleAWJLIAC6lVkCFZIN
	H0yt11oWQ399WJ83u0IsZkaqP73v50VL0b7P/8WKnYtyIsPpkUIA2PMD75nTmHThp/aXWweeXsz+5
	JfRJgFQSiMbztwp3OvuNLd1lwFLQiPzDwPBxGwH9RdT6sx6CmT+1W6kP8/ckbNxMt702TEex/rvo8
	5UJoYBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4MN-00000000RTn-0ZIE;
	Thu, 20 Feb 2025 11:04:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4Je-00000000QuZ-31xk;
	Thu, 20 Feb 2025 11:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740049321;
	bh=9ASkIEzS+6XMgMIawHaWqrHsCYwuVwK6odSFxevMpFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NrTkn4C1My6ql2JSSgUKNTpsKonypHW/rh1EN8tqXylBFSd+0pQhJNtbK0UvDPPYp
	 KLIYunu1n3s1FYSU9Wdo173rtn2zjJCWnCADGvfzDFLsN4v712RUpMcdwHQtDkqFAu
	 rkC9MwlFA+thadeUIghQshp4KnZEf01INDT+UsxgeyvcvBtXpGB9xyoVDZqhvHJRmr
	 RCEiobnxn2lWWgx4/bf7iKMQ0cpokEUsnI06J1tDQa0bxIxQiGoW6przJqwOYHahcm
	 iH9rMEcqtZ+OpYmZiWBhciqklYq1vYUG5ttORkC/agYKpRo2E1xM8tX1KRz3NVn0I1
	 rVSagHCoYLaPQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 57C6917E1247;
	Thu, 20 Feb 2025 12:02:00 +0100 (CET)
Message-ID: <fa07a088-2ba2-4475-89b4-5104db2a28ae@collabora.com>
Date: Thu, 20 Feb 2025 12:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] MediaTek MT8188 MTU3 USB and Genio 510/700 TypeC
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, pablo.sun@mediatek.com
References: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_030202_915701_A89085C6 
X-CRM114-Status: GOOD (  11.23  )
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

Il 20/02/25 11:55, AngeloGioacchino Del Regno ha scritto:
> This series adds MTU3 nodes to the MT8188 base devicetree, fixes the
> Geralt Chromebooks to use it, and adds support for all of the USB
> ports, including TypeC Power Delivery, Alternate Modes, etc, found
> on the MediaTek Genio 510 and Genio 700 Evaluation Kits.
> 
> This also adds the missing SuperSpeed port to the mtk-xhci binding.

Forgot to add....

Changes in v3:
  - Added a commit to allow the SuperSpeed port in mtk-xhci, resolving
    dtbs_check failures
  - Removed useless vdd-supply from xhci1 in mt8390-genio-common.dtsi
  - Removed useless interrupts-extended, as the wakeup interrupt cannot
    be found anywhere in the schematics; the wakeup anyway works because
    of the pericfg's syscon-wakeup doing the same job.

Cheers!

> 
> AngeloGioacchino Del Regno (3):
>    dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP
>    arm64: dts: mediatek: mt8188: Add MTU3 nodes and correctly describe
>      USB
>    arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX
> 
>   .../bindings/usb/mediatek,mtk-xhci.yaml       |   4 +
>   .../boot/dts/mediatek/mt8188-geralt.dtsi      |  18 +++
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 121 +++++++++-----
>   .../dts/mediatek/mt8390-genio-common.dtsi     | 151 +++++++++++++++++-
>   4 files changed, 251 insertions(+), 43 deletions(-)
> 




