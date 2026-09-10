Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1E5C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/P0j07m+Qlt1v63D3zWfA/yHhsEyVYHVaSNplYJ+Mw=; b=e1qiI6RMxO8pKmsY6k6MfOJD5V
	4ktHbiHwaHCpWXaY6qfKlgfD5/8T/HbtkB6s628ICIqoWTEDodxYDQGDzRGnhltYVjJZPTnrS9eHf
	Xi4aOKRSTomyK5Ov1s4aRJERP9Y2ivdrObbZRMD/n3syKN+Vkq6dbUek4a0vHwnY3+Cwh7QVVRXfE
	l65kt/6RL2msYrVSKwVxmqHP93ObU2knNkalY7zzmeNTTLtNXMloIHFX08ksuwe5o+HljtNqiIpUL
	rfHsONPec9XiLW+r4aRh0Y6UZgt4mIAH4fV8cQsqRQNAQ7yORhLn0fflsfzN8njrS1AglXsxkGR9+
	KRZjvWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZNf-0000000DeTH-24JG;
	Thu, 10 Sep 2026 07:39:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZNb-0000000DeSL-40o1;
	Thu, 10 Sep 2026 07:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789025967;
	bh=tX6eZXyL6wR23wIOq22oMAc/5Xx3m3IlWphVaszhixw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OnM02PA8Q4X5YFLl4fntpBgfc6QewEsP8gvuDAqM3IIEBNlgT2voZjdBZ5eWSMzKx
	 07uN47sV6TgZM+V9ECbVecXtewsYMPzbHX95oDQ3mmxJbgIMArB5dMFQ0dyixmuKDc
	 0j1iB0vQfQh5Vxtxd5P4a6RN4HjyDlnHZO7dO5U6H8RsTRnVpW4PtiPdq9Qyvk7q+/
	 Pey1ntGjWcBYA4rPnRLSLdUlzyA714xWITtbIQHltmRBQ2Yf9hOS5PuYgZeBL9/3hV
	 uDg6pRRr6V64c7V71RXo1OrU8YKjU55/x2nsc+OT21fREUuieH3hb9ulxLL9V5jHMl
	 Bk3f5qalBtXQQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B01F717E08A1;
	Thu, 10 Sep 2026 09:39:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Fei Shao <fshao@chromium.org>, 
 Justin Yeh <justin.yeh@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20260824090409.203230-1-justin.yeh@mediatek.com>
References: <20260824090409.203230-1-justin.yeh@mediatek.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0
 memory region
Message-Id: <178902596657.11066.1913117561872715668.b4-ty@b4>
Date: Thu, 10 Sep 2026 09:39:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_003932_158916_0766AB01 
X-CRM114-Status: UNSURE (   8.75  )
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

On Mon, 24 Aug 2026 17:04:00 +0800, Justin Yeh wrote:
> The SCP firmware in linux-firmware for this platform
> (mediatek/mt8188/scp_c0.img) supports MDP, which the mdp3-rdma node
> drives through scp_c0. On top of the segments it loads, the firmware
> allocates a 1 MiB DMA region at 0x50800000 at run time. That lies
> outside the 8 MiB reserved for SCP core0, so Linux is free to allocate
> over memory the firmware uses.
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0 memory region
      commit: 868297e3ebcc5c9b0e7cada19c82b11068faf4bf

Cheers,
Angelo



