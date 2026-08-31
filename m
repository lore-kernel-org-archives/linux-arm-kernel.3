Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC17C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hM4ke/zUafKbOleC4RvI9fJgOP0Pa4ovJP1DlgTbhd4=; b=WdpWdWIFU9dHNxitdSvlyDDPo7
	rFYGtHUwYe6CH356zO2+L3eCZ1efd6H+IBhNYV4bPKaE7wUjcxEbPx0QZAjYA9qj58yXE9YagqZAC
	kmn05IQJXWqCpuhbZlSLLGXsMbx1OYGe25Mc52YgGyn6MhWE3oqTbGuXisYisSCC5F06e3PE60NOM
	T4GbWLcKjfPbkCo98njspgjllKPnq4hvoVw/o7zy60otKM9f+3OjrZIbmUuJn300a05SZmIW9Q54V
	iRxgol9zI2t1Ob1AIVtjI24cc88jKW26p1ReMvQdE59hyWOnU7GlHbCZZ3qfUFnw1jcCKzqMvJXhL
	t/ePi53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12FE-00000009Sk5-020b;
	Mon, 31 Aug 2026 13:40:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12F4-00000009SZo-1gwW;
	Mon, 31 Aug 2026 13:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=hM4ke/zUafKbOleC4RvI9fJgOP0Pa4ovJP1DlgTbhd4=; b=oArI8K3AlqSTeSzPuMtl1J4y1T
	YUvp+e8+pqJL4PgyF+8mrhBBapf9Ozv7+ppAXj9g1J694c5kmm3kN4ntbSJt9Tw5zQHXoab4xVH7U
	uoUloe1reIBQomb4EpYGCFluTVz7wAI0EPEiPG7nKIGYk7y9LrFI86nqtQlEyxIQyxbqTYrVxm9Z+
	CqaoHanp6GN3b/xZx1+Yy6a1kn5FTXsaQSQcBz7bZHuhvqgkgxNxCFyFwMZp+e0cpbAo4YRS+q4Q+
	gK8DZxQm4+fc7B6+PJpEqlmeTpAi0VrsdXBjBe279vRt1So8slpMduNFbBz5rSNoxW68vEz7V9sOX
	r9mpswyA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix an error and a typo in the CM5-IO comment
Date: Mon, 31 Aug 2026 15:40:01 +0200
Message-ID: <178818359738.1934409.17545491709168923043.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260819064707.1667292-1-gahing@gahingwoo.com>
References: <20260819064707.1667292-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064008_526638_3196E8F9 
X-CRM114-Status: GOOD (  10.92  )
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


On Wed, 19 Aug 2026 18:47:07 +1200, Jiaxing Hu wrote:
> Two mistakes in the CM5-IO header comment.
> 
> The USB-C line names combphy0, but combphy0 is the M.2 PCIe lane, as the
> comment above &combphy0_ps says. The USB-C SuperSpeed path is the USBDP
> PHY.
> 
> The USB-A count is also wrong: the carrier has four ports, not two. The
> RTS5411S USB 3.0 hub fans the single USB3 lane out to four downstream
> USB-A ports.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix an error and a typo in the CM5-IO comment
      commit: 3bcd04b3e009fdd5b051c95f31c742bc9257fcb9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

