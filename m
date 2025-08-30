Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2A4CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDmWqsxitH8ilfXlpH8wKy0vkKGYPgRhyivr03Uy/cg=; b=t0opqypf1EbAn6R68QOidPj2bM
	5BWwP5hUbbM/Ev6OYm5iZs/Zg5Z92mzOssTxIKreajqHLq/plJ4JgIg5nJdN2VAMtyZL6AC2JG3RP
	bvgfddQ71ODfEkNZtoDLzoQgoQ7hEsB8TaFDB1Gh+RQGVAI2FBz5S8+bxNyYsxOY335ZEN/O3ccrE
	utYcbwmt3rKY3Ub2KDHjnuea7WLZ9SepkZar9WipNeVYjrK9hi8KxRkm/gnjhygW9Saqbwo/NPbuT
	uUm6DAd0VZOD47vXeaz5OWHdcxNubiC11qG1GIRuf6K3TaW2ggtjVF47tp729g3rZpSE2dAFuJAUo
	81WzOcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLTQ-00000007vJA-39Ka;
	Sat, 30 Aug 2025 13:18:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usL9q-00000007t4q-2CV2;
	Sat, 30 Aug 2025 12:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oDmWqsxitH8ilfXlpH8wKy0vkKGYPgRhyivr03Uy/cg=; b=fKecV1PncNZJBBYrj9lXpcMvjV
	3ByvZ1QFZHbOrnGx8uV/zWf+ZCJd1LUyI4+VOtmMrVJDX9ooHv7mR27MFbGfnWONpF7P/WlP6XzL0
	xebmVWg4uqBkmb5g7V2Dmzdr57Ux/VFG82awVmxX9nw4RUERo0KBmV1IfC7FKAz4xG0HXgjupd5K3
	PgLk9YIuul5AiLk3k7k9Vi/KyQQY4j+8ZYvt2NBsXu+7+XyhS1+4grClo4zvi9Bii9KIGkZOQkw+Q
	nM712+/MDpoEPdMdTAxjIgDAystRYiW4qjmXlp2v1K629NQypPY5zrvr1/hIizyrtUbAFjRwgXVxT
	GNA9mxig==;
Received: from [77.241.232.9] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usL9g-0007bC-6H; Sat, 30 Aug 2025 14:58:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	FUKAUMI Naoki <naoki@radxa.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix second M.2 slot on ROCK 5T
Date: Sat, 30 Aug 2025 14:57:57 +0200
Message-ID: <175655867262.3578496.599026461545727624.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250826-rock5t-second-m2-fix-v1-1-8252124f9cc8@collabora.com>
References: <20250826-rock5t-second-m2-fix-v1-1-8252124f9cc8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_055814_561840_2E412D40 
X-CRM114-Status: GOOD (  12.92  )
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


On Tue, 26 Aug 2025 10:08:36 +0200, Nicolas Frattaroli wrote:
> The Radxa ROCK 5T has two M.2 slots, much like the Radxa Rock 5B+. As it
> stands, the board won't be able to use PCIe3 if the second M.2 slot is
> in use.
> 
> Fix this by adding the necessary node enablement and data-lanes property
> to the ROCK 5T device tree, mirroring what's in the ROCK 5B+ device
> tree.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix second M.2 slot on ROCK 5T
      commit: 5567a036d1b00fb3c6c77bbbd2944291afe1938e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

