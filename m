Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71D5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 12:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuwHyEIoD2Q0bmkBoVOOBYeWgbfoPuD67bLeWt0tdLw=; b=tg3YmtIScSZQqdNXE/D9WBWImi
	UBcsaBM/RyAHm7Im1muS099DyV88gxrcwQkjT682ql2IV35usKVRY47AjWcjzSCpsRiN4QzyDIFT+
	FxlD8og/VzIC2J+B/1sjYRS+60/V5+eeDqa+cxWaK0yPk4PI36Tbi6msEwgJ0FrABArl1JHMBnX0f
	umEcgvFI3aOX4KO9J5gFoTEgMKERZsy/10bEJNAW1rrfHvv/YrDcJf3qCJbkZgJkgs3iPunfdd2wa
	r5EexuI0k17mE/q3WRWGv5lcntcG5eokogkd5cHk/jP7FGDJB6lirTBg6KRSXnF5CP/uVj71Mnq8B
	E9PYKJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ47f-0000000BxlS-2GCK;
	Tue, 24 Dec 2024 12:34:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ44N-0000000BxAc-1rcK;
	Tue, 24 Dec 2024 12:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nuwHyEIoD2Q0bmkBoVOOBYeWgbfoPuD67bLeWt0tdLw=; b=Rf4RZOyYXMJy4YxEHu4aSezXOs
	Q9j89iwiwNlyg4rPIS8flwazm6EgNNuZpU3j1cIdsJmrzV65Mfj28xA3HUAeg+k2Y6QhE7OAXtc49
	DpGtZ/2DOEF07/les2bEDNeDFY69f76bWYTDyD9xrPh2TZ4PBed8CSLtyFp2N9Yc6alOBR9YshVyb
	x2YXJSl+iZi0crIVWw2nF01mFFhB0WRVJrSikK9ckkNQlDEDFYMGD0Xu5WWDFfKfnjuVWuPcxlN9T
	AyjKIpeuoSZifX/ZeOudOkvtWvsJOF29DkUbEPpQsysSSRrsO80wRYGA9OvyVawV+Lm7ESXHcK+DW
	+wa2dzMQ==;
Received: from i5e860d12.versanet.de ([94.134.13.18] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tQ44I-0001Dn-RH; Tue, 24 Dec 2024 13:31:22 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Jon Lin <jon.lin@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] phy: rockchip-naneng-combo: Support rk3562
Date: Tue, 24 Dec 2024 13:31:22 +0100
Message-ID: <2024855.8hb0ThOEGa@diego>
In-Reply-To: <20241224094217.3817100-2-kever.yang@rock-chips.com>
References: <20241224094217.3817100-1-kever.yang@rock-chips.com>
 <20241224094217.3817100-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_043127_495455_F738D247 
X-CRM114-Status: UNSURE (   8.48  )
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

Am Dienstag, 24. Dezember 2024, 10:42:16 CET schrieb Kever Yang:
> From: Jon Lin <jon.lin@rock-chips.com>
> 
> rk3562 has 1 naneng comboPHY used for PCIe and USB3.
> 
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Fits nicely into the existing structure

Reviewed-by: Heiko Stuebner <heiko@sntech.de>





