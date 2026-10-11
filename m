Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386FDCA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 03:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCpg2ESHQC0kLKSunXHQ5tFhB92LVhJUQ3PXxAQdGmo=; b=O7ofEnTHufNdfIygthimy1kFoE
	xLvoM8PBiq75G3ewUwZtV4l7IH9YdXroeHhyo2QwHOzcMBmOrnZqSbogtrtxry1iq5DtBnRNhEbB7
	rNAouzxH2RbT7JUFyZfmQcIzaFgwCdFz7lY8Y7szW0oxDi7UbmhoZ7n6CDXzu+KynIodJyM77S6Fr
	mwKnwy2VMUeTnXLfasNfIu2YBDhcfLEupaKA2W+3me2T6RVG3zzcUHMVK6bBtypvCz6I6IxawoIGs
	sQMUmKmhBxX/hpbDvhYoXELUj3vsilqaear0j1bJA/PWIdi2EH7xpK/qg4JVcFhmcFymHWPl344N1
	JW6YqqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFkHw-00000008gSj-3wB8;
	Sun, 11 Oct 2026 03:31:52 +0000
Received: from mail-m9318.xmail.ntesmail.com ([103.126.93.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFkHs-00000008gRo-0LyN;
	Sun, 11 Oct 2026 03:31:51 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5098b255b;
	Sun, 11 Oct 2026 11:31:43 +0800 (GMT+08:00)
Message-ID: <9a8c6a76-8972-4b1e-8384-842668621fce@rock-chips.com>
Date: Sun, 11 Oct 2026 11:31:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Andrew Lunn <andrew@lunn.ch>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v8 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
To: Bob Hui <bg9oxa@163.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com>
 <20261007-quarkpi-ca2-v8-2-b83192bed07b@163.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261007-quarkpi-ca2-v8-2-b83192bed07b@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1290431dd03a4kunmba7fbebefd914
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ01MGlZNTh4YTk8dSx
	pMT0pWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JLDjmmg9o/8Q7fsHV8WerOkHOQUPDsyvEAY2gbZWMRzcj3vXOEmlcrFuksiFJFLnnS4u4x6+qZ14dWnHXOG6S32X8B/R6lwVM2PbK8QxGEgkofJF3YXBXCmgmzvzq0SdLx2vT9GYHjRdij3uSLz1Oc/TQhwPihFjKeSl6l9zx8c=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=yCpg2ESHQC0kLKSunXHQ5tFhB92LVhJUQ3PXxAQdGmo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_203148_648201_9F9BBFFA 
X-CRM114-Status: UNSURE (   8.38  )
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

Hi Bob

在 2026/10/07 星期三 13:18, Bob Hui 写道:
> Add a device tree for the ALIENTEK QuarkPi-CA2, an RK3588S based card
> computer. The board comes in 4, 8 and 16 GiB LPDDR4X variants with
> 32 GB, 64 GB or 128 GB of eMMC; this was tested on the 16 GiB/128 GB
> one.
> 

...

> +
> +	vcc3v3_pcie: regulator-vcc3v3-pcie {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_pcie";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc12v_dcin>;
> +	};
> +};

Is there any reason that you marked it as always-on?



