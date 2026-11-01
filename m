Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB076074136
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YILl2m1P;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=DFmTlMB+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/5lqkhXjPOMaaYwItfh5U9VLYOPhSKVw3/zHayeWQek=; b=YILl2m1PB6ZdGV
	RhYOnecBmSSFTRzDfNl3KhKQjyARcftZsO4z+bJ96Jrq1cYWMaiiZv1UjgI9GjWPMBVtm3F2SIhc/
	2ej5NxtGF1kbzdQxWX8y55/9pzy7K3+kuFiuvkaQkCPOF+vcroutEviDmsPHnQn2Z0KLClMedPvS+
	RnnxLT1Inya+kBjBuD3bihIoRDfrBf88woLlW1swE3/RE8ln3Excyk2GqZU+Z6yf3PL9NsT9NKOdr
	7wqqg2Y7xYLpFs+W9U24/lNPkC6qVfgYcQEyNRjXar+sX0G7OnNsCDrD1E6jUyCVXHD8+/TY8iSH8
	Bq6lIMH/OA0CVREdF9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrA-0000000F1T0-3fLF;
	Sun, 01 Nov 2026 22:16:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqd-0000000Ezq9-1YV0;
	Sun, 01 Nov 2026 22:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/5lqkhXjPOMaaYwItfh5U9VLYOPhSKVw3/zHayeWQek=; b=DFmTlMB+u5KACGAPOZfSN+xwXk
	gvM5TbEwpGVgGhejDSm2o4DjxMmcMHL9x5/ou8jWCSCj8HqvUlIetE2ZaUlCjANI27A2MGi+OiqzN
	VTX9gfXQtXBJZSCCqCS+snckWHSFt8YE+4k1oeQ6KaMOyNRzfVTIAIg3YOLQz1Xkxs+gBRj+3DIxF
	FDeXoTMbqAxhksIaxc1A8kY13ZWwxNC3NGXgz8+nKAJbmyrkLUo28czjRzceeuFVNsuMuVeneEEp9
	pxe5ZpMygdN0kQiB1eBSDGWJqPLoBt0gUhpxmOntg/24ATVD7OpcJ3q//EUWSrlZoBgF9ccN/6m3e
	vp4/czgA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix adc-keys wiring for Orange Pi 5 family
Date: Sun,  1 Nov 2026 23:16:04 +0100
Message-ID: <179357136490.4108155.2920979357901660151.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012033929.2317231-1-dennis@ausil.us>
References: <20261012033929.2317231-1-dennis@ausil.us>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141619_491921_3CACF1DD 
X-CRM114-Status: GOOD (  12.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 11 Oct 2026 22:39:29 -0500, Dennis Gilmore wrote:
> When working on u-boot for the Orange Pi 5 Pro it was called out that
> the Pro does not have a recovery button and was missing the definition
> for the maskrom button.
> 
> The shared rk3588s-orangepi-5.dtsi describes a "Recovery" adc-keys
> button on SARADC channel 1. This is correct for the Orange Pi 5 and
> 5B, but the Orange Pi 5 Pro schematic shows channel 1 is pulled up
> with no button ever wired to it, so the key can never be pressed.
> Each board's schematic also shows SARADC channel 0 is connected to
> a real, populated Maskrom button, but no board described it.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix adc-keys wiring for Orange Pi 5 family
      commit: 591ff7dda0603cf21cfe3bfd7d9b1d10be8154c1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

