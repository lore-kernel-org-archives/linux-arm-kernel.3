Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03351D44D45
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55zvySz6mffWQ+++ZbZ/oF+SBTtaOs4T74NYodmXzqA=; b=qIonmnzGZZFRtFgJ3fVqz55J4m
	Vo7o38dlN0g97AEwNZCgr8qw1rWKwpiAkyYy4fzmHLOkizw3dPcNYi/McrCfMQdvAB8vFAKvYgzi9
	Rkx7jC6V3RBrhTrYdJJ+ddEyffKBxUpDW/gXhEPD0PtmQRW0y3TpxGj7x2DRy5MJZnjtozFPPfDah
	POEXR2JvskN/DPIUoQYXWhIaQkiL3scqE5NkrbrntoYk6lpTJghpxBnkDb4ZMzOuHfnMpTrEuofaf
	fvRxj5WZowGa/T2tCQI98jiow3mQ/0yZwpEyvuFrqSHrQJtSwqMRY4jlauVR6ccOdJSryjAKRvaVA
	QiVrYfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dMZ-00000002kzw-1PRR;
	Wed, 06 Nov 2024 10:34:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8caB-00000002bS3-0GHf;
	Wed, 06 Nov 2024 09:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=55zvySz6mffWQ+++ZbZ/oF+SBTtaOs4T74NYodmXzqA=; b=D4LdaYL70wPDH+ZYvWP1kv/GRX
	86a/H/2vzVYvjhlAmVf5xv5Pzb2T6Myj9Q2aNBx/kDUYkMOFIXvJY1pjNXQh/pYn0xxnPGVE8T9GG
	lBp2unVeZVU/h83ROlppwJ4hUcwhqp3i1EdbRdnaWNsXFS0sff+CYBSSTgUkPqZzGPcacaSlGZPum
	PKyqSfOIZ6VbeiQjC68KiNA7VyJsEoRZY+A3tc52HmlSb5oe6sr6PPz2VpRvsK/fMZ50AJpgyxK7v
	yeGZIDtJOBOEit6X0qRZ1Blr19HP6iWXZ3X2O5SxDZwJ9NdF1mmNIVNKqWyJnC+7Vfy1lP9g8AwO6
	MR9oZnAQ==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t8ca4-000639-VL; Wed, 06 Nov 2024 10:44:05 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank Wang <frawang.cn@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, william.wu@rock-chips.com,
 tim.chen@rock-chips.com, Kever Yang <kever.yang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [RESEND PATCH v3 2/2] phy: rockchip-naneng-combo: add rk3576 support
Date: Wed, 06 Nov 2024 10:44:04 +0100
Message-ID: <1809753.VLH7GnMWUR@diego>
In-Reply-To: <20241106021357.19782-2-frawang.cn@gmail.com>
References: <20241106021357.19782-1-frawang.cn@gmail.com>
 <20241106021357.19782-2-frawang.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_014411_134713_3F2C9B57 
X-CRM114-Status: GOOD (  10.85  )
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

Am Mittwoch, 6. November 2024, 03:13:57 CET schrieb Frank Wang:
> From: Kever Yang <kever.yang@rock-chips.com>
> 
> Rockchip RK3576 integrates two naneng-combo PHY, PHY0 is used for
> PCIE and SATA, PHY1 is used for PCIE, SATA and USB3.
> 
> This adds device specific data support.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Signed-off-by: William Wu <william.wu@rock-chips.com>
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>

With less magic values, everything looks a bit nicer now, thanks a lot.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



