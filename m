Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E33CCA9ED6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8fEydYQ9ABesQI0CRxDNvPg0eyljVYmUDFMToCw+i0=; b=srxxQXdD2OxiO/EtYz5pCwk6Lo
	bbsFtoItf1T4THwV5ld4ucDuZUABa4X/pvElc9d+XW5u0QMIdWS4SFPSucoeoUriTkT6RGF9Iet3U
	dEhJt3yjCEzDm2R5Qa0/HZ0/dV/K36aNADMvGdADshv1/OPEtJhI0lodsVQkvtZwLstSJv/xb9+jV
	w7fOsA7n+yBog5rMwi1slVtPOKA5Ak2oX7v1hX7JEn1K/Enu7y+r13dwE/OO8KHz5DUE5WCb0dKiV
	oB3tCtZbixCjkzrG5mc3uFR9C3NJf9dI7VskKt5ZR5WHxAViYi5Utag9usK4RZ2N2HRSiCaGvgYb6
	1teOwpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9wJ-00000009mKR-1Tgu;
	Mon, 12 Oct 2026 06:55:15 +0000
Received: from mail-m128239.netease.com ([103.209.128.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9wG-00000009mJW-0Axl;
	Mon, 12 Oct 2026 06:55:14 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50b00267e;
	Mon, 12 Oct 2026 14:55:04 +0800 (GMT+08:00)
Message-ID: <5c8a2985-e1aa-4062-bca8-fb05809b0d3c@rock-chips.com>
Date: Mon, 12 Oct 2026 14:55:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, heiko@sntech.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Radxa E54C
To: Chukun Pan <amadeus@jmu.edu.cn>
References: <4903cefa-4926-4bae-93e9-1165bb9ae646@rock-chips.com>
 <20261012064010.1837103-1-amadeus@jmu.edu.cn>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261012064010.1837103-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa12ee4bb9903a4kunm5e92b5b71addac
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTxlOVh8aTk1JT0IaGUsaSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dcu/8CbeQxrj27k75dgmHMQK6ZG4pjwsRnfgVTy3VCZnsY8P+MDVlGNRuoNvTij7L2dO5fIOYhNEptPmKWbplAQGYt3St/9nEpH4XpkDG9TgqtyYd0ditS0+jwqoM4+h2f2afFrULgkuZqTjvgtqXrQko6tLcWoL8JYuUpGgOaU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=d8fEydYQ9ABesQI0CRxDNvPg0eyljVYmUDFMToCw+i0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_235512_634074_635443D6 
X-CRM114-Status: GOOD (  12.01  )
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

在 2026/10/12 星期一 14:40, Chukun Pan 写道:
> Hi,
> 
>> I was checking all PCIe part of rockchip dts files and wondered why it's
>> marked as an always-on regulator. But if it's actually not, it'd be
>> better to improve it later. That would make reset rootport mechanism
>> work better.
> 
> Please refer to page 21 of the schematic[1]. The 3V3_PCIE regulator
> is enabled by the PMIC and cannot be controlled by the kernel. So I
> think it's correct to mark it as always-on.
> 
> [1] https://dl.radxa.com/e/e54c/hw/radxa_e54c_v1.2_schematic.pdf
> 

Thank you for providing the schematic. It does appear to be in an
uncontrolled state. Theoretically, PCIe control timing requires a
controllable power supply. The current design may cause trouble
enumerating certain devices due to always-on power. Unfortunately, this
board already has always-on power, so let's just leave it as is.

> Thanks,
> Chukun
> 


