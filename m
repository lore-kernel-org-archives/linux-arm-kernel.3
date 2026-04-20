Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D62FF557FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kvD2DikviA++89KX8OaJkmvE5pvGQ/4eoowpnanR1U=; b=LZts65kvwmMq7GDi06FxShu/TP
	LXDI/9ilW+9dIYk9ey7FRl6P2zSGlCfplmTWq57ZmbyIWUv8mz+zQenPVvbAC+lN6hJ21PY+4eIN5
	zwtHHZUz42rsrhoINVIr8RzaZKoBsoLHMeCXlcHDZ9s1RT6dnmoCmF+M0XTNh4HCzJi2eqO9jw2nO
	3IboVsb5rmy1YKR3QOra9pnEZVQ2t2jchyg3GulaFDbStSzZL82DOxHmM9063ZBvFMFxRUmqrYfdW
	pGZEl8BUfprH+i5HNkRV/Wl8xdw4hLsb40d6VMpXpaBULlWoqczWotlPp7Xx6mUe04FnFRqKVESb5
	xu/ArUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElP4-00000006hwh-1Ig0;
	Mon, 20 Apr 2026 09:58:54 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElP2-00000006hvi-0jq9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 09:58:53 +0000
Date: Mon, 20 Apr 2026 09:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776679119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/kvD2DikviA++89KX8OaJkmvE5pvGQ/4eoowpnanR1U=;
	b=l9Q+SfqX30Qbs4KOt9Td3MQlmR+ub2/x8RzsNtI1ikkuTqvGUHqL/7fQSxj4+MPO0w/lPr
	NEf8ZTUZ4MYvbPtcFkMzHF854I7iUPa+mZO39ehgSm85T6DYrbCa3wF/UtSpqdZ+3MFZU7
	zMYqG5I2ke+s7B5IWmHES5F8yKqLtickGuWLgp3wu/SRnw7ZUnY8ZN+VNDwG86vPyDjQPJ
	u4uH795JJPYgjjHH2hfcnr0aFPMtEPAaAs26qfZ6B6zdFa5zN/8Ky4FZjjSM7vLBVgNaie
	e+7+a7NIDNiCPjbLeaZlH3OMxJ4CK6dzJi2zUmpCmiQ9DNNaBKV3PpIoxEb8Xg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, funderscore@postmarketos.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at
Subject: Re: [PATCH v2 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
References: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdsedm.2ad0jjpxzfm46@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_025852_418182_DDE2DAC6 
X-CRM114-Status: GOOD (  12.04  )
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

Hi,

On Mon, 20 Apr 2026 06:18, christian.koever-draxl@student.uibk.ac.at wrote:
>From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>
>Supported features:
>- 1GB/2GB RAM (via U-Boot memory fixup)
>- 10/100 Ethernet (Internal PHY)
>- eMMC and SD card storage
>- PWM-based CPU voltage regulation
>- UART (Serial console)
>
>Changes in v2:
>- Split dt-bindings and dts changes into separate patches.
>- Updated model string to match documented vendor prefix.
>- Put vddio_sd states array in a single line.
>- Added a clarifying comment for the unsupported Amlogic W150S1 Wi-Fi module.
>
>Notes:
>- The console uses uart_b at 921600 baud.
>- Verified memory via /proc/device-tree; U-Boot patches the node to around 2GB.
>- Tested on the 2GB RAM plus 16GB eMMC variant.
>

Sorry I was not clear, but the patches need to have a description.

checkpatch.pl should complain about this. Please use it to check that
your patches are in the correct format.

See the kernel docs about sending patches here:
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

>Christian Stefan Kövér-Draxl (2):
>  dt-bindings: arm: amlogic: add X98Q compatible
>  arm64: dts: amlogic: add support for X98Q
>
> .../devicetree/bindings/arm/amlogic.yaml      |   7 +
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 250 ++++++++++++++++++
> 3 files changed, 258 insertions(+)
> create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
>
>-- 
>2.53.0

--
Best regards,
Ferass

