Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44F3D12D50
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDWmgip3DngD0WSpM90Yi3gjWO6wAcgOvU2+84kSLeE=; b=QB4byJnzR0oiUdnDxJ+LSinJGP
	xHv4F3MMhS+MI6kRTFVDsBmReg5nLWpaVhotX/WZpjDvc3ToVbhLsYwvV+jVkMEWlTJoos4daIbwc
	bUWLPTrfWeJ/WAvMicpsE2ZLjtSkOZIIbdWpAPetDrN4hV8xDzgMgOjWh/uFo+WlT1xyXjLG0rdi9
	4zyWWldL4SiL2zfG3wbEPH6KV05IyFmgotvfTyQ/RWnNwFNYonQ6LDx+EgPDaQ8NS3iwNwJCrE7Jk
	U7VMJvdjyXmUTk7Ryp1IyPz8/uKXvHYfEpibG7QrbYkHgsfB2F7Ntoidn4v9XgvLPo2VjCz8XPBEh
	j+JLF/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAELV-0000000FWlm-0HLh;
	Sun, 10 Nov 2024 20:15:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAEJk-0000000FWbo-0cvT;
	Sun, 10 Nov 2024 20:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TDWmgip3DngD0WSpM90Yi3gjWO6wAcgOvU2+84kSLeE=; b=S5wwPJIrHk0JA4HlAJJQVQQaE5
	mXroOqQZdoQvH3dFzv1BCceZ7xGfBThBlbQnEpZLMH0A6bcT2nlkcImC6S03q4/balPTsIJsc+e7/
	uXlFY+fVXQcr7yECUSMyAQwwGVQFzkev0bF/Dgt5KZmgUBRsbfQA1Jo0DMbZVTp7bxelMSn1uCzfX
	9FAUhU5NKW8fUoAcddK57xhMiVRENAneHZcsSMX1Qqh/NQTUSAa7vrWdxCIfxNszRBz/S6prO4+3i
	y4hFN/my0OrwZVqI2HzcuwQBy2JxEOhI9DDieoOEAEP8aAiriDj7zbBrIK0n6k3mc58hElQ6AR2Cq
	aY0biM6w==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tAEJh-0006eU-I2; Sun, 10 Nov 2024 21:13:49 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] arm64: dts: rockchip: orangepi-5-plus: Enable GPU
Date: Sun, 10 Nov 2024 21:13:43 +0100
Message-ID: <173126942616.136493.2934640786889277471.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241025175409.886260-1-wens@kernel.org>
References: <20241025175409.886260-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_121352_213059_1C09EA6C 
X-CRM114-Status: UNSURE (   9.44  )
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

On Sat, 26 Oct 2024 01:54:09 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Enable the Mali GPU in the Orange Pi 5 Plus.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: orangepi-5-plus: Enable GPU
      commit: cdaf2acc401c691105baa3ee3e9fda3b19dc570d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

