Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06A1C5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUcsMklZ1YJdf4MNkh3FRF0YeSfAuEHDm6BH8azZORU=; b=s7n1G0PT1lWRgLInfvK8T/Vv/F
	dvnhY14BgswIpNK14t1U4kwCzexOPLAKrMw5S9lPF8g875gYMNcvLS+9lAJF5ndqgwzkh/0tIOgwF
	qw65C2bTCYgW395asNj6ysqthDGgoFqz10LmfujRrl3428xI/oo5UEkBdHJNxrfoxEEhyTpEZPdu7
	2BAmxilL5mQsu/9lPOtAGlyvjJ+5Yxe9VArWWN/HlSRGlhMNn3pCHKUSO12BCskuxa3YsOmkZTPlw
	ojQK/AFal2KbguyyElCiBg8qf0zIKFjK4XgKRBmdLIr5ymgy7iP/eEmH4ntaql6ANiFfx3negoI9N
	R3sDUk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsT6u-00000008onw-3Bbx;
	Fri, 07 Aug 2026 22:32:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsT6t-00000008onm-3NBe;
	Fri, 07 Aug 2026 22:32:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E719760054;
	Fri,  7 Aug 2026 22:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799801F000E9;
	Fri,  7 Aug 2026 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786141934;
	bh=UUcsMklZ1YJdf4MNkh3FRF0YeSfAuEHDm6BH8azZORU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kfszCiUURm5A7BQtkQ1Tcq6znQSSEg6G0nSHVrYZPHVxbRnfmpe67uWg1gy+6Lgxm
	 TUuC/VdfvIS3t26/YqFx+Zq19eCJB4ZRjCuyIvvyzY0HW9YoHcT9E2pLqg1J/v+gw6
	 Mdsbssud3xTV3xxSU7v4p3P7UFl/8agHo7QmXJHBJsaHKPZk0Nmwu6hXMMCDOVNHfw
	 2kWhIn9j1BO4CWlbV4X+0CEzCIklctWVQWAIDRoSpoPSqe8y9qCZcJcvPBUaegZ7Qn
	 ycLMublzzAJTVAuViy1otGlpGycnsMxgoYIUQaPsuZEgEPlq3KF0y0JaOCmcvR3mje
	 vkayScuiBl9Ww==
Date: Fri, 7 Aug 2026 17:32:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Lala Lin <lala.lin@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
Message-ID: <178614193264.2164781.3666261236764063936.robh@kernel.org>
References: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
 <20260724-6572-nvmem-v2-1-e58d16a29621@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-6572-nvmem-v2-1-e58d16a29621@protonmail.com>
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


On Fri, 24 Jul 2026 14:07:06 +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 SoC efuse controller.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


