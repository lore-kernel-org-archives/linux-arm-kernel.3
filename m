Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA23BCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 00:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzp9xtb/Wm6eVFDycowvKsQT9oFr8d0q6GJGHChyI4s=; b=F+rLfv0tmRm4+eib470ln+x1WC
	7p4ML17XFF0tmgkntktBR+MMznR+2wflOokyI44deX3DFOdDTvk0eT8OFzMPTlJ1AgiC9tgbXyjhL
	ZfT/s9xHXXI07ZttWPXTgEEtBbDaY1On8+9Th0Jm4QBgDCCSm6GTiNUkYqAVXJEeVP+heYszSnxYu
	D6tvx4YRI3r8nW9l5LBP4jnbVlRwUf3CPT+pqOlioRjw5754LT1ZWxjwtkCNunRg7MqwAuCGvhMza
	U50fuXih40gVeL5A3a064v616j/gIijqST1c8EOdEcs7LS6L1gmMjfqq4PFo7yPlm+/nB1zYZSPDm
	Zp8ZcXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZWe-00000004yro-0JGL;
	Thu, 25 Sep 2025 00:07:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZWc-00000004yqU-1N0x;
	Thu, 25 Sep 2025 00:07:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7A2A44C9D;
	Thu, 25 Sep 2025 00:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0AEC4CEE7;
	Thu, 25 Sep 2025 00:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758758873;
	bh=m6ioeAahwYn62n7FAjt3QVV1qWaVhFS/3tj0n6LSVy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgltNu3VeW9hAzcEQsPyG8v6HItnlzF7d7HiS3FHq2+DBakU2vk520GbnYKCo3xpK
	 5CDA/pwMb8K/pevecaT4kP1i89Ok/gWBDUWwknX8OZ6jf7yol+43UakIyHOPOP9SFx
	 wWpDtql4UgcYxVquM3yPKcPrnIxiR2q/lA8xi8+Rfwbk2JpduI28lno00FFQYWknyn
	 BU0aVdM/c21imPEVGqjHXKlK9k0s12HjeGbG7FwQ60PP1Hq7U0RefFy/xxpTce67k1
	 g56Xgo7eNhTZzkFCaUYQdK5MacZ/x/hGCK7qFoOtkRrX4lo1ABSzYeNLx5ztw1xnCZ
	 OJJwMNDUWO8YA==
Date: Thu, 25 Sep 2025 02:07:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: i2c: i2c-mt65xx: Document MediaTek
 MT6878 I2C
Message-ID: <4izbn5l6v3qiddvflzckw4xac2ckaymiun57dqbzcp7etz4v6o@icgh7egzdgqi>
References: <20250920-mt6878-i2c-bringup-v2-1-70a951f10be9@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920-mt6878-i2c-bringup-v2-1-70a951f10be9@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_170754_380897_BC26569E 
X-CRM114-Status: UNSURE (   9.50  )
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

Hi Igor,

On Sat, Sep 20, 2025 at 07:22:52PM +0200, Igor Belwon wrote:
> Document the I2C controllers found in the MediaTek MT6878 SoC, by adding
> a new compatible string for the controllers. Their design is compatible
> with the design from the MediaTek MT8188 SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

merged to i2c/i2c-host.

Thanks,
Andi

