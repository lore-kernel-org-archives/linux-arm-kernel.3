Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E39D43346
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2iQWKi+iMZjurZnIXvfzn16/7cDYCLjFarj3dgv6kU=; b=Yfwlge3U8P38P17Q/M2HsA3d2u
	tpntRix2upnbHfYZvuH99SMiNA3TmpmMdP6w69QogPwHg41a4ju0Q98UfF+OCU3VXU18tr0YTpjhC
	r9iYrQE4f+Fd6DbIIbDsbKQBYA+OuEisJLG4/ibTlTOdFZjtqYGe2faC1g0xiNFXNq4eZdLkZHBjZ
	YeO9m+uUV95KgbHblt4UXfTwDx5gkZbK0RdNYyHNDaUdsVOWWFp0nxitn1WsWVU6yItRH4CpbLVWo
	Wj4FC3jSBHdQ4HAFO86aosu2ySNp9jFiun3PW2JkGsCwEASCdMmHn2Yx+IveaFTqL/wUKvjl/XW+W
	Xe0rgzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90N0-00000006cNT-0JxM;
	Thu, 07 Nov 2024 11:08:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90J9-00000006bYb-22QN;
	Thu, 07 Nov 2024 11:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730977449;
	bh=slKSHyyrpH08lOUmIwOolaT0TYsVF5P5RcNmJWsE9JI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AOjC2qNwONp6VivyirmZI01GGHr0yA4PwxISQQbbznkDiz8xuWX0n9oNqVo9o6h1P
	 mowVA20Mbhgj4Ck9eI8GCEL/7AogRz2B3QUkxJ5CJWdfU/eHJs95WhLv7a+2df+kQr
	 Mq6qmF1QlPUzovydpAV6n2r4bUXQPSVJulfG7tg8pKNCy9GzYcJfrHPItZwLz13o5u
	 B6dNB21xvRXZUYpYiUIKpoN9hqVQzjNrDo5KYLNyDCbmtuOrJ4vtqVDteeO+97jDXK
	 UnMmKhlUAnIERktjI5TQMhN8/1GAklUo7Qtmq4x0Dp3U5obkHTOqGxNWPP65PN7OXs
	 bhbeiGCTlChcg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8842E17E35E0;
	Thu,  7 Nov 2024 12:04:09 +0100 (CET)
Message-ID: <55c07154-8917-4273-9e91-39433474bbf2@collabora.com>
Date: Thu, 7 Nov 2024 12:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: Move wakeup to MTU3 to get
 working suspend
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Wojciech Macek <wmacek@google.com>
References: <20241106-mt8186-suspend-with-usb-wakeup-v1-1-07734a4c8236@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106-mt8186-suspend-with-usb-wakeup-v1-1-07734a4c8236@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_030411_712337_969FF6FE 
X-CRM114-Status: GOOD (  10.98  )
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

Il 06/11/24 22:01, Nícolas F. R. A. Prado ha scritto:
> The current DT has the wakeup-source and mediatek,syscon-wakeup
> properties in the XHCI nodes, which configures USB wakeup after powering
> down the XHCI hardware block. However, since the XHCI controller is
> behind an MTU3 (USB3 DRD controller), the MTU3 only gets powered down
> after USB wakeup has been configured, causing the system to detect a
> wakeup, and results in broken suspend support as the system resumes
> immediately.
> 
> Move the wakeup properties to the MTU3 nodes so that USB wakeup is only
> enabled after the MTU3 has powered down.
> 
> With this change in place, it is possible to suspend and resume, and
> also to wakeup through USB, as tested on the Google Steelix (Lenovo 300e
> Yoga Chromebook Gen 4).
> 
> Fixes: f6c3e61c5486 ("arm64: dts: mediatek: mt8186: Add MTU3 nodes")
> Reported-by: Wojciech Macek <wmacek@google.com>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



