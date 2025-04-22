Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EDEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GSbFCnYwRoEJfanRXiJaNF7D3Gjr/FVdsfwNQdE0Qs=; b=Gc+XrIy0r0Z5KmLEwFYQ5GuEko
	AP/XTPbugn3V5HhyUytaC10k4QFft5DemT1Pz8heFjf3uusBTQWg9c1dzewiRIgVrjPcNhTB28kas
	YH8DqoZV30jcyQp+L2EQQd1h3oPpDQEv/QRR1u45gZe0i8UVjNSUKoEuwA/6ipMb0O6xEWWG/Ms/P
	wJd3K2G0zvBXT/slLkKwCrOQdcEc0EO5GTMZWNomtX+Qs2xStV+qo/1m55byRbszAhyHlxd70T/FM
	TcMAz0OOkTR4etTmU/Ws6ttmZrSb256D17LPDS06glPTHgDrTY4s/5sZpx+4Y5nl6uXYR5KZtZhqi
	UMhpLCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fx3-00000007oTc-0tDV;
	Tue, 22 Apr 2025 15:54:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dis-00000007JKZ-25xp;
	Tue, 22 Apr 2025 13:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9GSbFCnYwRoEJfanRXiJaNF7D3Gjr/FVdsfwNQdE0Qs=; b=g5E/mHe+2rukUAB8dOcWlwcYaQ
	n5vuv3qAo5RMQ/6LGqQSicvWVvIoXA4BNvaxQDo7ZNvc0XBISdf1brvoPuY2aJY27RiUmZzDoFRz3
	KTA8vIP/EpYzuQnCk+Zf9VkUAE4IQHsHF451VLxZjoWuUbN1QAaETsoM85t6JMu0w+djW8i31Z8Ka
	XxcdQ5AHQE09vvZUhPPrFgh9EAY+Ew+RMObBTFViguGoVI/LxvilxAO3AdfKAiDjEXNiv9aqL0tCe
	pfOMmMLDSyaHp+RWX8dzTga8UmuUFEGj0begJ72SRKgawV8G4TlxrYZzl/T6xYygZ1/986M+wS5Pz
	PAG8qbYg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7Dip-0000000BEZY-1ux0;
	Tue, 22 Apr 2025 13:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328689;
	bh=uxRkFn5GGKR61GJD29fIEi4WrE6zCuwdOIW9qIt7JBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lovIi5E1jC7zJKuQ6of3+VK0ExG/J9aKGlb5sZEArNGaWTyUq6BCmf5XeGZU6bN/p
	 Cqrk/qwHyBaHk6amES/goBhjixOpc+OjCVezFDV2jzXIRtNUUN3tTJdhkBQYrQtLNJ
	 T8MxuluL6Gz/GGwHR43MJZnKdXBgtHFHlK4Qj9LTSpFFC69t1u5eRh9qshFRF2wBeJ
	 UNxfWV9+JKkhriBQDYMnHzMaTSyKufJgyAq02Zl7KXZARGc0sIKaHtishJLdu3zvaL
	 XNI2g6bb9UuetSIC8Gc4PdjkLt0nubuxNluqPfeUzWaylcCqaspD634eI4K5pg7Foa
	 nHWlgGdXmwagg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDA8117E157E;
	Tue, 22 Apr 2025 15:31:28 +0200 (CEST)
Message-ID: <98b14dbe-a8c5-4f6c-99fd-209d714c8194@collabora.com>
Date: Tue, 22 Apr 2025 15:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] dt-bindings: phy: mtk-xs-phy: Add mt7988
 compatible
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_143135_708714_1FC64AC4 
X-CRM114-Status: UNSURE (   5.28  )
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

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for xs-phy on mt7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


