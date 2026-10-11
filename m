Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D67CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 03:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMFtoZqWRCnK6Yp6lCte4tFbFuG7YOga9wTlhoj+Iqk=; b=RrYnDokr6lSvDhwY4F8iyHqC8B
	RUHeZwjcwtj/sxBWY9H0lU35JBxenELvCBsd41xO+H/SR/reuqE7EMY66lggLO2JOrSWJ9Cf77rvm
	V2qYXfmb+BIGs3GRXWc8GFm1gQnKrlOQFnAKJn4WBezAYEKUJ/J7fgsizvTe8mgLkLyI2Wl3Ndu2I
	W7PqIgMEsnhn1yZCPamJb04JbB3Z/u6zkWO6C0ccrcTHS8Ay8y6TSa14DF/leyF6PcnJcoaAgk+AI
	2B6cyMg+CxyduUZXvoDsKtUjw0szhfBNrCmGXMoEcRHkt/XGpOfZzSaoy3e65JrQf/uMEZxHhKxWo
	B0YhgiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFk1I-00000008fyo-2J4V;
	Sun, 11 Oct 2026 03:14:40 +0000
Received: from mail-m81189.xmail.ntesmail.com ([156.224.81.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFk1D-00000008fyI-3yOb;
	Sun, 11 Oct 2026 03:14:38 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 509894f63;
	Sun, 11 Oct 2026 11:14:28 +0800 (GMT+08:00)
Message-ID: <4903cefa-4926-4bae-93e9-1165bb9ae646@rock-chips.com>
Date: Sun, 11 Oct 2026 11:14:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Radxa E54C
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
References: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
 <20260820100020.3370385-3-amadeus@jmu.edu.cn>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260820100020.3370385-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa128f466c803a4kunme554c163fbe0b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHRkYVk0dHRgYSE5MGkkeGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SS8sBXuxdz2my2paSh1oyHFK2MqPW/SkrpaWpdTRGmV1NvKGXoZXlSeOQ/Bd5kv+xflRFmZd2ube+W/yo+MudCLmH+ME+jTgY8jCD4VpFtZL2AtA/I3mz/x8Nyf77PN3bfCQU9MctwsCUetZlef3VRw+R9k8b1wPbCt52lHmODs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=DMFtoZqWRCnK6Yp6lCte4tFbFuG7YOga9wTlhoj+Iqk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_201436_612771_4D12D8CE 
X-CRM114-Status: UNSURE (   8.61  )
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

Hi Chukun

在 2026/08/20 星期四 18:00, Chukun Pan 写道:
> The Radxa E54C is a high-performance network computer with
> the Rockchip RK3582 SoC. It has the following features:
> 

...

> +
> +	vcc3v3_pcie: regulator-3v3-pcie {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_pcie";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_sysin>;
> +	};
> +

I was checking all PCIe part of rockchip dts files and wondered why it's
marked as an always-on regulator. But if it's actually not, it'd be 
better to improve it later. That would make reset rootport mechanism
work better.

