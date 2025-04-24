Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFF2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2VXJafk1BjcmS2ArnQtcT4DeSIeARzmNCub6aakcyM=; b=F8bR0ScuCQuNW37OefiGmz6TUM
	i3EVfeZB9pauVv+giyXm8O8Zqa/223S0Q9PVMUqyxGnfxUy/t5lNVx1/oinYbpnLkbh0RGnVUgB13
	pQpx4yz3HT4E8awJecwTKI9LXWwiIU44klcA8oqc3YLZDuna+3z5OBczUmbiTDpfZoCwnBELOxZN9
	yyt+TyaiJNxByZW/ll3faj+5va5kwsIJ0ZT9XJc5SFSEW0oXe2rWTHfAfGum8BMF8M+JPs3RkLgi6
	LnwmBtdNZbSI2BwQ6H9KL/jnTy5Q0HjsLHaC0Fc6KdrX1BBAnCEChDn34YzPRP1dQwYFOXUswbuxQ
	Hhnq/5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qv6-0000000D8vI-2Hze;
	Thu, 24 Apr 2025 07:22:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qnj-0000000D6lO-2LCF;
	Thu, 24 Apr 2025 07:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745478913;
	bh=AbS9ukRr1Y1WjpI6BQAZO1j2qZxnAqa4Rj58ioDrX54=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pWGZTyGr/irwCzO6PHNxjv4mkiEiy0/qTjycZupYeiSqejKOccZCdioECqeb2Ybn2
	 7Abui4BbAADex/I99VKmzpEsBCRkSIT+4O2IeVzVYFhF63P6z220chDm0UG5X1EFY6
	 wahJBLPDjCxFW3dPEBp532jJrqfQto21d33e6CzTjUZDGQUGbiG3v+pLzI/W8MAKkk
	 HVxEHgBJlO9VxAyd1OryexbSGPmC92KqJKusSvTGQQOM9+usbrX2GJ01j0z4wOR/HA
	 D/7StkY/bUfgsCwsInZmwRoIy8UF8bfew/n+RAgK+4j6iuWzviZDY6pik3d8fm1qJZ
	 qQn6mv3iM8RLg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E13C717E065E;
	Thu, 24 Apr 2025 09:15:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Georgi Djakov <djakov@kerenl.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250423162958.2223689-1-arnd@kernel.org>
References: <20250423162958.2223689-1-arnd@kernel.org>
Subject: Re: [PATCH] soc: mediatek: mtk-dvfsrc: remove an unused variable
Message-Id: <174547891282.13811.10784757411900262854.b4-ty@collabora.com>
Date: Thu, 24 Apr 2025 09:15:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_001515_762714_26C9E083 
X-CRM114-Status: UNSURE (   4.48  )
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

On Wed, 23 Apr 2025 18:29:52 +0200, Arnd Bergmann wrote:
> This structure was left unused by a previous patch:
> 
> drivers/soc/mediatek/mtk-dvfsrc.c:542:43: error: unused variable 'dvfsrc_bw_constr_mt8195' [-Werror,-Wunused-const-variable]
> 
> 

Applied to v6.15-next/soc, thanks!

[1/1] soc: mediatek: mtk-dvfsrc: remove an unused variable
      commit: 69d63d19eda7792052f5f694f154898fc00d60ae

Cheers,
Angelo



