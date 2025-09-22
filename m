Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB10FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anjUrIiFYK2qv+KyQVbpNAWugOgiouYPlUB5yFcOLnw=; b=Ji1LY6ZiZZSlBUx4ce8ZThP+Ce
	Eoq+Iskx/13imCFZOa7Z0vtvcLDm6/tAdIoGEATDjxbKzrN6Qg9Ch71J5DxWNYuuC1hPedSmREJ9G
	LA5hH89KLt6fwdfpMiGH+M0QsDchekuP8oZZcJ+eTemoiRabSBaHkdfUDQKdkDxP/nB8omDpCg50+
	NX3k5Z0UKq4TZoaRmyvx3vo75rFtS1Vv+o8ggaYPZMgth07JRgmtrClCK3Xz2FjMTDlzDbEcgH5Iz
	ruHIY+WTqWAbjrBnWXuL3Ml9ZI6EPgBRS/KDOD3R1kUurxVNZbxzgySjhf79a54wzMEN/DaAIdthT
	06+mVO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dF8-00000009whg-1ek2;
	Mon, 22 Sep 2025 09:53:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dF6-00000009wgm-0S6a;
	Mon, 22 Sep 2025 09:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758534833;
	bh=PL/YajbOibPLqyRMxiJdv/uzpYvMdylD/ei2zQhoXwI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W/nQzgw/B/SriU0SadvwUreIeC63YgmlyBEJRz4Je5mwXxlK1vKjWy37TIASblOFf
	 tGuskA2KvFgwvZFc+TLFGGgzYfKes4R/uuIncC1pR+der0PSFHtoPiScOfUC8rcaGf
	 T0Ypr4zGnZVxetKwVJS8W5CwpNZrX9wFYuF5fRPOcALAiAsA0ulzIumQScomGWYrC3
	 vjrNjrLxIY8ZOgDpSfWBcVgekxox2gWpnPxDrPy/obXq9ZEstd7jbQ61bybINrb5/M
	 55D/sTvL15r7ruD1xzcvvXdRkx4/jLjGGmvJ2C4dKMnlGn7sf8rZNVuHRaqjianyuY
	 YjX8xT8cgjQ5A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01F9317E12C1;
	Mon, 22 Sep 2025 11:53:52 +0200 (CEST)
Message-ID: <3ba38a84-2e93-483e-8316-f992f981ac7b@collabora.com>
Date: Mon, 22 Sep 2025 11:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: dts: mt7981/openwrt-one: UART labels and
 console
To: Bryan Hinton <bryan@bryanhinton.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 daniel@makrotopia.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250922035828.2941327-1-bryan@bryanhinton.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250922035828.2941327-1-bryan@bryanhinton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_025356_314751_950F721B 
X-CRM114-Status: UNSURE (   8.27  )
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

Il 22/09/25 05:58, Bryan Hinton ha scritto:
> This series makes two small updates for MT7981:
> 
> - Patch 1/2: Add stable labels (uart0, uart1, uart2) in the SoC dtsi so
>    that board dts files can reference them directly.
> - Patch 2/2: Update the OpenWrt One board dts to define serial0 alias,
>    set chosen stdout-path, and enable uart0.
> 
> Both patches were build-tested (dtbs) and boot-tested: mainline Image+DTB
> built and loaded via U-Boot on MT7981 hardware, with serial console output
> verified.
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks!

