Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738B7CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6MTfOFVWEkSUDTe+Tl0C8qDvu0XyTn3jt4TNMswQuA=; b=ZGs6ERKw4O8KWuWNntRnUUFfzk
	ipv7zwC0cKdC1jnjFAmKuUqmtwDqgtv264DETNl43cFaEi4rSu1DkTXZyNsTkg19sIQw+HVbkb+EN
	x6RtQ4SCNzrMkdBNGAt+0b5ee4KhR+x7xbRER5gmRxS5Z+9cTxPIwe0um9KLrbGdwzMskoD9XEsSk
	5EUOfYR/J1mI8gK7V+RYuDFvoB4nr8/0E6pR1hg7V806fu77xbQj/oNu2hSApsQCZ5Pjw7FR9HkYO
	hrrX82tS4/sTRFGhZ+h5aNkNup5vfi4harJfN9qN6pZ2BC6oBrlLXMvlOCenVjQmBAZJjFrtYrYE4
	TTR0zlKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJHP-00000006KzC-1WEX;
	Fri, 08 May 2026 11:22:03 +0000
Received: from [2a00:f820:417:0:178:251:229:89] (helo=mx.nabladev.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJHL-00000006Kxg-19XZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:22:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5EBE111D1C;
	Fri,  8 May 2026 13:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778239307;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=O6MTfOFVWEkSUDTe+Tl0C8qDvu0XyTn3jt4TNMswQuA=;
	b=FQ2270znWepd4TScypSZ76Ew/0uOxqRSPjSkJFYqi+dJtEuAsHP4rS5JrV+E9tbR6JHfI3
	w8VpVKL9AoSk6lqLkbQrq5r0DpBxy4rGe923RgstnIpVrD3E5uuo6pBk+gS83TcrCz1fXm
	g17YPI3p5M1kbm4yoYy0wnYmrcBxHfU4Cr+nXO8CPK3fVuLyQ60HhomuwT/50TXKE4FNtS
	/8OXHiF11A2DVGYvWPI0gc7m6sBKERRtbctST5EloZWKGlX8XvVXuXZUPWzcXoGR1KhWga
	OR4LrXojySWO8RqEFGxEGJLgJM+ZXQ9/oFtnnF6OGAQGOOT/uuabopoFGGHGUw==
Message-ID: <65342735-44b3-4a2b-90ab-6093e0fd91c9@nabladev.com>
Date: Fri, 8 May 2026 13:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
To: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260407211850.79881-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260407211850.79881-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_042159_563292_5980E0F7 
X-CRM114-Status: UNSURE (   8.39  )
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

On 4/7/26 11:17 PM, Marek Vasut wrote:
> Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
> with Lontium LT9211 bridge. This adapter can be optionally populated onto
> the eDM SBC. This adapter can be extended with multiple panels, currently
> supported are the following:
> 
> - AUO G215HVN011
> - Innolux G070Y2-L01
> - Innolux G101ICE-L01
> - Innolux G121XCE-L01
> - Innolux G156HCE-L01
> - Multi-Inno Technology MI0700A2T-30
> - Multi-Inno Technology MI1010Z1T-1CP11
> 
> Note that in case of the i.MX8M Plus eDM SBC, the adapter name containing
> iMX8Mm is not a typo, this is the adapter model string. The adapter was
> originally developed for the iMX8Mm eDM SBC.

Hello Frank,

this patchset is now split. How can we proceed ?

Thank you for your help!

