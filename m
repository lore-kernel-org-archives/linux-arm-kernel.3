Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CBEC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 19:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bK24QqH1MNg0V4HdxTREFUnJXUUlGEAwlZf4X/A6iM=; b=F4mxfWtJ/p56Pw7ED8xvKxZY8g
	6E/bFiFXdOo0eNqZC0Ot9TTZZsnmRE1iJUVRqA6UIipmfLwer/tWaACWp/CRblEv11arSXQzackVV
	0QjhWY/GxXgK2y4koB1TDa5J5ZFFsNiCF0sJOlfnrBsI43xlYvLC2Nc9MXQ/s7Qwv4FTcosM7E+Ya
	/5MciPjK7+3P+nKpjbL06VF1BX4pqRjFAhdmO4mBMftAaI3axjcxCG/6aOeqljt0TbBKOEVvk6z6F
	V993oNORONc0Xc3ThKVCDZb5EFYKEItmLYWlw/VXXMHSXSFlTN+afjhJiHidI/5kGvn5vV9SOVguU
	LkcggSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonIF-000000067gF-40FM;
	Tue, 28 Jul 2026 19:16:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonIC-000000067cR-1WpQ;
	Tue, 28 Jul 2026 19:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8bK24QqH1MNg0V4HdxTREFUnJXUUlGEAwlZf4X/A6iM=; b=St1zC0AxH8GKdqWjAI5d1VfXgc
	Aq985pDBFVOZX7ZD28rgjynBDISyml6dkGkUSxa1YV6FtgF1mVlUVCCP86xNAxps2eKyq1LF0Qt1Z
	UsarZiv1jthS1+LbK3wFgg6SP4JzbdwjsCsV82mNs/tuYwL77iIzKxhMgEaVjioMxFfD8jXVmu+Fv
	rUygAnk6Hom6HL2b17XAvoxkaKnpO0Q+STRxYRX8rtI07rTRQbpP9LkkNMG9B8/aFbnpoxzEcfBp1
	Gh7lDcdh/aO1EHhbqRWzP9xgvBby2fa6+GK/uWlJfgUgunxUcxhj2eU4lmoy8pt7rlvH8QouHvQKH
	IvSrx4ZA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
Date: Tue, 28 Jul 2026 21:16:28 +0200
Message-ID: <178526609462.300371.16764379143271807563.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721133445.44283-1-festevam@gmail.com>
References: <20260721133445.44283-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_121644_398926_C3E50879 
X-CRM114-Status: UNSURE (   9.46  )
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


On Tue, 21 Jul 2026 10:34:45 -0300, Fabio Estevam wrote:
> The Marvell WLAN host wake interrupt is wired to GPIO0 8 and is not
> one of the PCI INTx interrupts. The PCI device schema therefore
> interprets the two-cell GPIO interrupt specifier as an invalid PCI
> interrupt and reports dtbs_check warnings:
> 
> pcie@0,0: wifi@0,0:interrupts:0:0: 8 is not one of [1, 2, 3, 4]
> pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
      commit: a761818d9ee11183df0aefd16bf9fe46cc1c4c6d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

