Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4A9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5TFhHsb+Gl2jCiHiwd84QYuvkPTMWcNIvYm3lR9cb8=; b=D/fiesuWRQXjpEi5FWLPy2gRjd
	8vn6j8Rnw1zK/xEraVwoxd8fGyWtiY2pG71tsyr7GbgycWgJUBwih5ABMivXkARmN1F0+DXdGn6Ni
	d1Q9K3eWlgAj5++2ndWoEXllC7SBH/NuzFH+A4++V3ZkX8HD0EBHRuzduYh0MBh5aeebpRWqWzlAG
	XXjS7/QrxeKj7errNhIRkqBiJE1qwIQTAdSkK3hO4v++/F4a3iIVaxhOvGYKINfk6AtzeDKp6q7wh
	TkBR6NyimR8bqQLe0wSQKYaX3Q+c7f8czdu3SdJG0azOdisYu5k8KCr+vKK4efolGxBa1r3esJKk+
	HhsauXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAlO-0000000797n-1ade;
	Wed, 12 Feb 2025 11:18:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAib-000000078br-02Oa;
	Wed, 12 Feb 2025 11:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739358947;
	bh=CPpp5p/Qbj7YQxkb0e+0ZwICrCMzLZP3T2zYLuNWwlU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QESPeC4I0/ajZ8/yaC5D7QzgOML+PQwl5pmSc9BXQy2/vXZOMrW4x+hbCTrbeIL2O
	 ESpDUAP9As2bH9mcr/GfKWdKl2gR9MP/TN/wmZNYQ1hjq7Jniwem0ZOMZRYOHvRSTQ
	 O4XCOD8gMgNkEhQkew9RzyTNbF74budV5HTR8ueqXBegShI1e18loLmjdrqQaUiDCa
	 m65yag6GR0N+VDHxPRQEvstBmkdTcV3YJeJq5FLDCpDSs9jbWXQm4rCqIuxREqwG9t
	 TUB4z3Wku5g8+TJ7t+kug7mCep5ig75RQP+U19u/njzs68B0UfTol1g+Pbi4QfYYPG
	 KZnmVQZI6Mnuw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D606F17E151F;
	Wed, 12 Feb 2025 12:15:46 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, macpaul.lin@mediatek.com
In-Reply-To: <20241218105409.39165-1-angelogioacchino.delregno@collabora.com>
References: <20241218105409.39165-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188: Add tertiary
 eMMC/SD/SDIO controller
Message-Id: <173935894680.45655.5939286400504120661.b4-ty@collabora.com>
Date: Wed, 12 Feb 2025 12:15:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_031549_269460_A515C25F 
X-CRM114-Status: UNSURE (   9.14  )
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

On Wed, 18 Dec 2024 11:54:09 +0100, AngeloGioacchino Del Regno wrote:
> Add a node for the third instance of the eMMC/SD/SDIO controller
> found on the MT8188 SoC and keep it disabled.
> 
> It is expected that only boards that are using this controller
> instance will configure and enable it.
> 
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188: Add tertiary eMMC/SD/SDIO controller
      commit: 5de2b8ed833a1cc3c9629beb34ea6040d9f18cf5

Cheers,
Angelo



