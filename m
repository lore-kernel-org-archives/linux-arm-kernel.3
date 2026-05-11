Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F01ACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBKxvkPU2CN1/m6UfuK0xh8Os7GB8aRyAUSympRSKL4=; b=rhe2ldpXp9seunyVSjZBGWmC8Y
	y2YuunK9kHqrTuc25Liiip1W1Xef+oQ4L6MGW2bFQzbNNAteBJ9gqYhrI1Qe7Bdxjr7QogmY1EPHV
	Bij6AYBeCIKUgCiI+jKclHP5akevkvs1O/ajChkx60oZo1ow0na5+VoB53OqU/BflZ7vVNcLXjHKe
	3Qipz6as4EWKxPL2ZZ/ZVKSALSrSTL/Pmt+l2rxb0qc28Vkol3YvCOjPZg/v0ytPnAPfoBiy0Uh6Y
	pobdpvUPzAi8Rj8pArC5h1Bq0f72eExnxqHWBv8KTARiLL/HnvLfYzo9IqlVRm66kTHiZ9fiQ9Mke
	INtjF6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNGT-0000000D0NT-0dhG;
	Mon, 11 May 2026 09:49:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNGQ-0000000D0MJ-3YSJ;
	Mon, 11 May 2026 09:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492964;
	bh=BUrmAszX4f30Kd8CC1UJmd+M9ix2JkT81pIXUO3eEmU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SKesj2PuPZIib4SrM8agWVh5hV5mkTxdS1CGEDvpYiN7pOpjc8WE9TeJdOa8OX/7v
	 vhTpNDuEumpt03nxHTRi48elU67pKWLvlhuG+M1yY4onoQvKqSDne6EOU0siwh1Zsz
	 hjIqNqoThP7xHwY1pQ5t7ywhUvKML+g5AOdSp8lcPt2FsVLhqXxJorjC8KNWyN41wE
	 CdIvAD+O74fqL2e5WuuhYlzLTe15DGhKGomn0Eg3llxMHAx0CE9yWGh+mxgeXb1/3s
	 LgbMAhQgXjcIpWDnOcRbgjtbbNBarE7S4TR18UoP56T1N3tfuIIQcuKAQlQz7mFygt
	 AxtdYqlCdvjuA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E712A17E040C;
	Mon, 11 May 2026 11:49:23 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Gary Bisson <bisson.gary@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260310-mtkhdmi-v1-1-841e834c8abc@gmail.com>
References: <20260310-mtkhdmi-v1-1-841e834c8abc@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-tungsten-smarc: add HDMI
 support
Message-Id: <177849296389.118420.4761248447204610595.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:49:23 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_024927_038587_AD0FAF21 
X-CRM114-Status: UNSURE (   7.71  )
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

On Tue, 10 Mar 2026 16:20:13 +0100, Gary Bisson wrote:
> Add HDMI display out support to both Tungsten510 & Tungsten700
> platforms. HDMI audio is not covered by this patch, audio (HDMI & I2S)
> will be added as a follow-up patch.
> 
> 

Applied to v7.1-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8390-tungsten-smarc: add HDMI support
      commit: a74ceec38c76901baa2fc09a1a744689b696a01a

Cheers,
Angelo



