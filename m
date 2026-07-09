Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A80C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fV6MbZxaEIWb8I6xAjF/w/nGojtb3KKFpIcUzJkXR4g=; b=ujAZ/lbOcygR9EiVe0iE7WZaIp
	N6GyGY5OwXDvydADis0HxTiZUhyxFJxGY7aOFd4Mi8Wa0mkmPZoS98ta36OKII4VsyJGupAsx6LXO
	+yKnfKzLn1s58Hq0N/siqF02wziF6FRDq7Z5j0bOW83byqP9ejHg0Ud7ZUMW3+DytoMIIdfVq5hkK
	nQTXValMIZ+wTNMo8q6u1oQY/S64xhFPC/Lus83WRBFWh1zgB83Gqi1xxaKG4Al933c52H+IUxEKf
	JfmSfFZDCDiPFyaaGdMpObec5QBduDpDKlFjf6BpwTEZoy6GnsA9Xl0+JR1quq+dLEi5H12NoXj3c
	1ne42Ytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpM5-00000002hTH-22YK;
	Thu, 09 Jul 2026 14:03:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpM1-00000002hR6-2mdi;
	Thu, 09 Jul 2026 14:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783605831;
	bh=UZ3PHDW4zdDEQxDflFdrx632qTOxZ6BffzUYxwD25o8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aonCRNv78A6rJhUU9Yelak8FMv9h3vWd6X2KAv9D+3tQKgL++k+u9a1CpDyQtYB/+
	 WPfEDilYkS7rR5HAw0oZeMANo/AkMQmUD+CdMx8odchxfd8iqykMH9x3u6O01WUuLV
	 jflyz1wXeIZeXc0NbPmTQmpiP6vFzyOvV3MZNIN/M4QdpxtRNASsv90LpqhEcZbsU1
	 lAsryKztCwJVB3kbtOGk8O4D8CHnrdVJ8JDju87BwDCiwXR3eQX4GqvBU8Y8KLzWY0
	 9msiVgM+eXtV109ZqNUaHwKCQknMsjMhj8Hy6sKk7QfaH/2X5K1hLZ26I49X8JllFT
	 eeMV5WEPOa57g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B592F17E071A;
	Thu, 09 Jul 2026 16:03:50 +0200 (CEST)
Message-ID: <9c128479-ff4e-43dc-a220-4653a3068e56@collabora.com>
Date: Thu, 9 Jul 2026 16:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/18] dt-bindings: clock: mediatek: regroup MT8192
 dt-bindings into MT8186
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-6-2926da3db6cf@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-6-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_070353_858223_F38CDE25 
X-CRM114-Status: UNSURE (   6.24  )
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

On 7/9/26 15:42, Louis-Alexis Eyraud wrote:
> Regroup the MT8192 clock and system clock dt-bindings into MT8186 ones
> to ease maintainability and have common files for several currently
> supported SoC or new future ones, that have the same kind of clock
> controller design.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


