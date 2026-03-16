Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B70F53D9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJ6Y+LE8ROKWKbLjyLIOWrghrDIWqPtkS9/wzGqqWqA=; b=JIpck46+TiBpzoaAyBnZPjyDDM
	jygIZGg1QOTcwe4tj63ZkG2amoAz7GtfvIelBNmq39Nk7+taVNRwcgSwwpxnRZ1Bc7QES3DK6eHGc
	B4ni86Gls9x6M2zMlTdkYlLcPettkkRWIJxZCzS7xtvJj5bqdRJ1bnmvOQGMUL7VVP1+VpDEE5KZO
	axaI/jYj4RehXFDrWXf5H2TnvKaQ1SmXFDqOgXHN5/aWlx2IkploEqrJB3WPtgV/rEWRKJ1hvpauQ
	+S0JgQwmgPnLBBPLIcTf2au1tnQp4krK/wiD1IWIlrrzKQSjkdno1Hrehe1uiN5LhwmXPsDba1/Q2
	eZT6tvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ErG-00000004q9m-3iBd;
	Mon, 16 Mar 2026 20:48:14 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ErF-00000004q98-0jnw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:48:14 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id BEE9FC0000F2;
	Mon, 16 Mar 2026 13:48:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com BEE9FC0000F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773694092;
	bh=AFf8U5F8ThsNUftA/mJyT/Hpx2X+5cm6eSShwnzBy6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzf/jzEOZIjFyBun3wecoDy6eevq577MwgcAscrlUI4tJquf9XE8jjakloGK22wJK
	 Q2ObHXrD0hfhIAS+OOA8aGah8YaYa2BPyDIiHehvaprZ2Ek5DihaKd6m1sP22zDgf4
	 SW+gS8RZb4oL4M5wDJCAPYhi31T3lAaOqh2ihZL8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 94156A83;
	Mon, 16 Mar 2026 13:48:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linusw@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] ARM: dts: bcm63138: Fix DMA IRQ
Date: Mon, 16 Mar 2026 13:48:12 -0700
Message-ID: <20260316204812.2145992-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-2-5373ef82c50c@kernel.org>
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-2-5373ef82c50c@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_134813_234671_E80BA2E2 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 18 Feb 2026 10:30:49 +0100, Linus Walleij <linusw@kernel.org> wrote:
> INTERRUPT_ID_PL081 is (ISR_TABLE_3_OFFSET + 23)
> which is 96+3 = 119, convert back to SPI interrupt
> 119-32 = 87.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

