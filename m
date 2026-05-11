Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B44CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6912osLmgDLIF8tdws84RmqiMt/sK/Ye/ncz8PijXc=; b=cfu9o7E5jT9YwEZmicjehOX2HB
	3TquK9IXeDC77YNpLesjr4qFk01a/5xXoT8LRRXRl0q3syXCMubzrdRA3mkmD6WFev7pxpFkxoYDy
	0MB8aXHS+twx7nkMAuurGltprI8kvDjZCVgSfo2MZO6askLnXOthJd4lyqiSzRfOdOheTkhgqiCvZ
	XPDUj9cN7JxN+wJTHBxh60tzRhUpmsZh5mc+7sEK7PK9nOzjqMwkXJkcmC6McJ8ecI3oSbSeSeRVu
	S48XFbGgYJPS4VgrYkdZBHTLW5G99xuPnec07G8N5Nz57qBJTAosHDTtzibsd3my8NO9Rj54ihC2s
	BzvFtTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPKM-0000000DReu-1E3A;
	Mon, 11 May 2026 12:01:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPKK-0000000DRdn-0qs8;
	Mon, 11 May 2026 12:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778500893;
	bh=crb3ittcW9FGUuF6KW6ZZq4Dy7SCwxnAySCRyMl6eAw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f5mM1ApXE5IzjTxlGvc4LAy1emWQP844ll0il+LSJYsYw+D4355WN4ic0PxH2/4Av
	 iy5s/es5HANsOOjk2XAPclqA6V+Td7zhlgUDAObkcr9Jy/jADGm2lG19nrvAYFdUE6
	 mvNjVUvMTS/qHYPhMHU6dDQVf0cw59GQAImKMAo3p334vwkIbWC2imr7czH6WrSBJW
	 fAKkYpm6QeVUmoLpNR6q4+Fk4ECyfKxA46rlNpqgwMA+/GcbIgBEFN9H48N7YCK6gI
	 +heCzUW5Y+vWf6qYl5qzkuG8IN3w1unRWvJaomgFFAC4RKKs/7qSNLNYW4d0DIqhmT
	 SVu7rHucPB5Jg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C153017E040C;
	Mon, 11 May 2026 14:01:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Gary Bisson <bisson.gary@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260310-mtkdefconfig-v1-1-717eb3e6eea7@gmail.com>
References: <20260310-mtkdefconfig-v1-1-717eb3e6eea7@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable MT7921S support
Message-Id: <177850089272.133673.2886390087848759794.b4-ty@collabora.com>
Date: Mon, 11 May 2026 14:01:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_050136_389697_5E704246 
X-CRM114-Status: UNSURE (   6.77  )
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

On Tue, 10 Mar 2026 16:52:12 +0100, Gary Bisson wrote:
> Enable MT7921S which is the SDIO variant of the MT7921, also called
> Filogic 320 [1].
> This driver is now used by Tungsten510/700 platforms which are now
> included upstream.
> 
> [1] https://www.mediatek.com/products/broadband-wifi/mediatek-filogic-320
> 
> [...]

Applied to v7.1-next/defconfig, thanks!

[1/1] arm64: defconfig: Enable MT7921S support
      commit: f86e8870547299cb6ee5b8c29d7e35d942b4bc39

Cheers,
Angelo



