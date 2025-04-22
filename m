Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B549C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSaJ6hAGPpxWKoSB3uDzVT+laxWcwPInbVlAuogRFUg=; b=ZrE1Ufs76ANKPWPd1hFRLDOVO6
	+0bZONHfpnuLO65/dvb7kxo6Gwwsw/Tnx1+7mcUf0PClhul40ho4tLgWwA0LIRcN8wqUsc/j1vIH+
	k2OJlHAxwY0G2J6GGSEm9IV+Lf/i9NTcbmvxqxPP1Onts3gcAfBvJtCG4yQOWid67JhQj+MxTJU3y
	BmUG2tuE6/DQGiHKVHfo1B8M4WrItxGdGiSL9Z/JlLK8sYX5YClnnJ+KRCMUHGezKGLVykSXHDPCm
	8MBVGaJdPSh+GtXl/SBe2FTGFb6WEjEt8rEq5HaoHCMIeG/p0eM037wqQd3dFC4k0w1DHld1mhoKy
	udZZz9ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8T-000000085Zs-2ljn;
	Tue, 22 Apr 2025 18:14:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E7l-00000007OSb-1WPW;
	Tue, 22 Apr 2025 13:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330240;
	bh=t7nOXqE4tlbUoj6BmNiVFgKSUV9qTZl5Ay/HW3Xp1K8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MjylqTvi+L1qqKxxF0boEP8g/2kSCHawLIDiEo+gs7N+9IlOjUw9Lax4cjb1trsYY
	 0u5DoItprRmDafebGTqMkqmkS6Mhj9wvT/BFVG4QlHMu31ZO8e1p0AcLGJDb4lmJni
	 OlzVoRjIqjyHWHr988f3jUEDlYjPIXpMpsiEDJg0R21K6QmXoTWBMT+KWwOlVbS+Pl
	 CfanzmJPqud3KnPcpc8KuLi3AYu5vCZ+V9dFhb7X/SY506vTK4SSxuLVxbahzZmlc1
	 DSJIqfCNFJ9eychDUZcka2c1nv4Fiyd5h8ymY+axHjwkPuM8evtu1ANAXi3Pr73yNy
	 2AXQq1vZDotsA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FB9817E3626;
	Tue, 22 Apr 2025 15:57:19 +0200 (CEST)
Message-ID: <50124f4e-fcc5-45d0-9677-dd1327e0077c@collabora.com>
Date: Tue, 22 Apr 2025 15:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] arm64: dts: mediatek: mt8186-steelix: Mark second
 source components for probing
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, stable+noautosel@kernel.org
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065721_549307_AF9CE340 
X-CRM114-Status: GOOD (  10.39  )
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

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> Steelix design has two possible trackpad component sources. Currently
> they are all marked as available, along with having workarounds for
> shared pinctrl muxing and GPIOs.
> 
> Instead, mark them all as "fail-needs-probe" and have the implementation
> try to probe which one is present.
> 
> Also remove the shared resource workaround by moving the pinctrl entry
> for the trackpad interrupt line back into the individual trackpad nodes.
> 
> Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



