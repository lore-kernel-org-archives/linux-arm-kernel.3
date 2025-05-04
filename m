Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BBFC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGLawBx3as26cHnzeByReNpSUTnDiE6fJ+h3lhNI4aU=; b=UVifDHrrqIzKnr7eAJsaE/7K8C
	LK4k3BkbW5FZ0hq1jQDxUkqwMacHsWaf6horrcid6hvsdd+d9pQF0T1zZrWI9HA9jckAj2NAccxlQ
	vpZFayF0+0vxCDz8uciJ1eG0uvqrZtXQdlLR/KAkQ2KeEiJK0bUI0xnmNQjU+/5uMch24kMBF2wD7
	yMSJPOhaLW9wrJgp5f0Ii0VY0kKVhwzrOrYtJiZFHwgWQXldytRGcX4a3rixebI7kvqI1zeamoWG5
	oXW83xbev2c6PO9cLDxproUI6n6IAfUExG7SRjsK2vuyRXOZ9vyh5zXTqVd5FFJ1fQuynMYvOBKHj
	CL+hcJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBdcC-00000005n29-01EH;
	Sun, 04 May 2025 17:59:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBdXi-00000005mNc-0DxV;
	Sun, 04 May 2025 17:54:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F0BA4A70A;
	Sun,  4 May 2025 17:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBF6C4CEE7;
	Sun,  4 May 2025 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746381261;
	bh=odMWSPdmr++aBNnQA5k+dYU5w/MbPwcbzmcpEEe5tcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLQVFZZFAXzicCz7P8xVAjzRBG8Aih+uFdPNmbhRIDlfidsTV6u117wopT4Khr7IB
	 rjOrGB5Oi8p2YLsUGBAu2ervzUPXO4GTE6Wluzd53XLL8SDsfkc0OywW5HAgvTfpou
	 zPGGmv0OO8P1sWBUaSQt9zmX2w0Tfal3yvVsxRUs6+VD/YX0CmNnET9uFLnIe5o7F1
	 to7bisInovLyih/h0IajnLVQQNi33Zq5Fc5qXF3uFXyevNCFOR1ElCytDbnjVt3N6n
	 GUPozsyAjpLSbaPxwFGAMl+qQ6rHfGDjoQ/SkowjBzn4vbeYznTDLUO9NiYXpFTWgA
	 ePYHKZ0XipPKA==
Date: Sun, 4 May 2025 19:54:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: John Clark <inindev@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.frattaroli@collabora.com, detlev.casanova@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576
 board
Message-ID: <20250504-sociable-golden-antelope-fb795b@kuoka>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-3-inindev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504102447.153551-3-inindev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_105422_122684_E781C0E5 
X-CRM114-Status: UNSURE (   7.94  )
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

On Sun, May 04, 2025 at 06:24:46AM GMT, John Clark wrote:
> Add device tree binding for the Luckfox Omni3576 Carrier Board with
> Core3576 Module, based on the Rockchip RK3576 SoC.
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


