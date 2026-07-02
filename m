Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0540C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSmChlaaqqMvLwI9JFc/dmZe32fXU4nIY4AkNzqVrIE=; b=m7wGmnYTfWUuKM5TBfWykr2CPD
	b1c//tI0NT9LXWtQYmjCxqOG4/ObuEVPxdi3QYaOcUoO7SXYx1tD6vG6eDq4UEXhbFXw7yQ8ItMLw
	oYsGskSzgzx2ka/6h8hMzZUfIkboqFApQQ9sHkJRGwU1EJaQarVKoi8EBnRZaxeO6jQytaNviECt0
	QAqDLhg0tt1jy28dZ3+eUSJd+uOwbJhbjOYrUJ1aIoFNZBxZPv6HSDzozmI5WR6mn+orHTOCnhIw5
	6SydPujK59fB5PNvLhoJpxHUqS96ijEowRfQ31z9UL/9mC7D1gV7kIwxQsxlKmgmAYvw8a2urBRU7
	OxIAaFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDcj-0000000409d-18tQ;
	Thu, 02 Jul 2026 09:22:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDcd-0000000403z-2y7a;
	Thu, 02 Jul 2026 09:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782984132;
	bh=j+kGXwr07dgMRRHsw8roEZSBkQ0X8Tn5IRk7GbSjOzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZyI/RTO/qkKhB6xhzsW53CmYMPdIHmsArllNS9rt7abzbc0A0/ca6Y9Hsr5iySkfn
	 jivYZq53k2GGIAhHTiPRPkpL75kRJXpPYBUcbLGXwpHohqFkDOow7qyP0qX8z/BOac
	 78aztNovUSudeREQvZfwYrpfei7hUCNHni94D++kgNE9f10dccWe+nXbNrPX4G8NGt
	 pzMkO4OIl3cKgF0RizsdvekgYe1YfBnohgKx9LE1JOahlFNKoeSm4t1WfyroGihcqx
	 HTJi0UIAGgkdo+u3v4BlZUXXquN/DTu5YDVQjd9H0fer0LLzHeZRTc8wuURIQAtD7R
	 CrI1SH2rlvQaQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F209E17E0F68;
	Thu,  2 Jul 2026 11:22:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260702083800.578581-1-wenst@chromium.org>
References: <20260702083800.578581-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add supply for
 SPI NOR flash
Message-Id: <178298413194.12161.9131704032702690772.b4-ty@b4>
Date: Thu, 02 Jul 2026 11:22:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_022215_911767_0EA20900 
X-CRM114-Status: UNSURE (   6.67  )
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

On Thu, 02 Jul 2026 16:37:58 +0800, Chen-Yu Tsai wrote:
> The SPI NOR flash is powered the "always on" 1.8V LDO regulated power
> rail.
> 
> Add the supply for the SPI NOR flash.

Applied to v7.2-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188-geralt: Add supply for SPI NOR flash
      commit: eb3e990db356964d64f5cc258d30776c0363f9e9

Cheers,
Angelo



