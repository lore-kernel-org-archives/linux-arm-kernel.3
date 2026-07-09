Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A746C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjxUpCh3UV4T1LBVAzv7OZK7wAlK818T02sqq8fvTHI=; b=uZqX7r6cnZRlzY9g7qLvxUrHQF
	ZJqpE38rf5PIf8cALzX1rD+aHpEqmFbaoSfhiQ6c9Ps46YGqm6t/kdms3mhgI38vZN7uUgGri66x2
	85jL+wpUh/PczNKINlDhmolxcE6haPEPa1sSgbHS+ktXSVGZQO4yHRhoVn7cBQt5JvtDrzO+dae1n
	js2k+aunbodEFrBJfInytXUZh9xD8jMOXUDmAWjTLgMtx6b2BF0Upx2p/EDMPyxluVu8+mOWNLY3v
	YyMOQCIwGiVes3Dp4zArJjxDb+bUHOwp4TEjNfKsGygSGvatjgBRwDC2385E3ObRYOBhgms9+2xi7
	glYOC9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpM5-00000002hTj-2cYY;
	Thu, 09 Jul 2026 14:03:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpM2-00000002hRR-1VEO;
	Thu, 09 Jul 2026 14:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783605832;
	bh=XjvVRfcKcK2Mimm4SQHCDuE4JbyoJqNRUTqqp0ymYHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=axxhB02KuIM+ZNdLMCoAwg37XbrA/+4D7/vcjclUz7KsivGjEIb7WTgNZ95WGZllQ
	 CARfzVIuXiXXrZIR3MaUaxQ0UeFz2tMCrCTNum76JH/Xw4QDmMZYVkxBB0tDuALThI
	 1AGRpetMNTrEXtmxfcyZpm09z2w1W1stT5jsp01SaMpaylROHWRRYp5Jhi4mqACUba
	 PMbe55SuLBN9/UEo4T5d51QfQQdmHsA8B6xhn9K/OibLN/7AUrBhXRLQgI0DRy/n9a
	 hgq24SOtA3dwAsD6LlYUeyYXOwTHfQ1n1Bd4ABmXU7vPKEFAYkUvIXgu5UvfWDc2Y9
	 jWkJ5zkJIEKJw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1D6F17E0D33;
	Thu, 09 Jul 2026 16:03:51 +0200 (CEST)
Message-ID: <37250e83-39f7-4291-85e0-648c5a5c629e@collabora.com>
Date: Thu, 9 Jul 2026 16:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/18] dt-bindings: clock: mediatek: regroup MT8195
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
 <20260709-mt8189-clocks-system-base-v2-7-2926da3db6cf@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-7-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_070354_546805_F2022EBE 
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
> Regroup the MT8195 clock and system clock dt-bindings into MT8186 ones
> to ease maintainability and have common files for several currently
> supported SoC or new future ones, that have the same kind of clock
> controller design.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


