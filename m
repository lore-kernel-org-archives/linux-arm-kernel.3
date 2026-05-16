Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32C3CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lUkMa/skiS9szlmUK5jSzGw25vtWPwSPxmsL5r5b8c=; b=maXfYLmcwdYr9XmpXuq2K9nP5u
	xL3b5mQDYcF+UrZ9AMZ3XbBHdZNYc1XfF6gAz3orrkawNjxSsejaKqjkpQg6HIe+NtwLWg1ajfTyZ
	EXckROsIRhdOPBwW1Fng2NhJ1fyqlum58LQyTCtXLOwFKlNbeV3hS6G8zUd4S4beVQymyImlaDVpS
	DPDLHjUZkzf5QkRcnoReE5PXKd82gvTwJtgpm+jI3WCcWUeYXDz1rZt/U4dFB/wXHoBm33N8SqjUI
	xiiFcqierbRsTeaYIswSe7pYjeGD3Km43SDhl9jR4CGOe779QeCQhoPZQWYN6lA6t7qwCdly5l2XS
	D/GSVb3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOHqO-0000000B1Is-06Jq;
	Sat, 16 May 2026 16:26:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOHqN-0000000B1Ik-2Yqv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 16:26:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B359E60138;
	Sat, 16 May 2026 16:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93296C19425;
	Sat, 16 May 2026 16:26:23 +0000 (UTC)
Message-ID: <1fb4a8e8-62bc-447d-8f25-84a3a6890ab0@tuxon.dev>
Date: Sat, 16 May 2026 19:26:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: microchip: lan969x: add OTP node
To: Robert Marko <robert.marko@sartura.hr>, srini@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, horatiu.vultur@microchip.com,
 daniel.machon@microchip.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr
References: <20260515115954.701155-1-robimarko@gmail.com>
 <20260515115954.701155-3-robimarko@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260515115954.701155-3-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 5/15/26 14:59, Robert Marko wrote:
> From: Robert Marko<robert.marko@sartura.hr>
> 
> Add the required OTP on LAN969x.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

