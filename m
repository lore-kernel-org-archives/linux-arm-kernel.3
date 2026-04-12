Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13014F3ED6E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXLyw/FnCWf15FUet76VWuTmUhmS2oOQN7ZUH43Dmfk=; b=rNm4GYnWDVKGh//JY5Oepse6kb
	ABeNRmj8EPRJLrV5yA4hSnFQqPKNuUVAbcu2PHSDDH+7VFdkkkXng9vsbm7JFEf7bwMdlLlq8smjX
	vo6ytjNNznzWwWK+Y6X8bYSklWDF349xSR3SO8alm/RUCkcKLUEu0lIWuXh/76evYCssh52zm1OjY
	iJGchWtzjfVKZXK9MbFwc24pnefVet2jcY/elvhpKZa4wpIRLfvWsmcQ33pFLZs4haXUplYG+ZzBz
	9Q65bU7193rHC5PCtLCkjqFbC+H+EVvbD6dDV5+ImumAIadrxCrv9C+UgoZYcteuGbZGPqcGem+tF
	gw9lNxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqxO-0000000EBlv-2pZZ;
	Sun, 12 Apr 2026 09:18:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqxN-0000000EBlj-3Crs;
	Sun, 12 Apr 2026 09:18:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 289D260172;
	Sun, 12 Apr 2026 09:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DE4C19424;
	Sun, 12 Apr 2026 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775985496;
	bh=9zcRZ+5PCI5Z2fw1/LxfwKyquv5HdTAAezig+TuHOzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDRBhUsqCCWSwAssF/9giJVfEb8/z/9qKI5PWbBTN+5sPXpuOjuHnOTZ3cDbKPaqB
	 Y+vUW2vqRh2VYtf7OuZr0RHzIssPLLTkKwl4FBdgDStY/+N6EPT0VZM58zq8iJR4sO
	 rHzFE2KK/WkWpiH88A4e59PO/3tbCkEI7YC8TXxj8mrdKp6j2BsRIDnige6nfDAs/7
	 yaPl1mljvJcy1+Wbtmdlushm72R01n3Pbp8XFKiXRTqqhtm89pxiGeZKIL59klnOma
	 egbPQm3K8hOYdjBx6HpLNpkDFVBVdZnzJwPdmE4/UPKtlT+FdEmqsDaJ6O5o9chcK5
	 vE6dgrJlsPVDw==
Date: Sun, 12 Apr 2026 11:18:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: rockchip: convert rk3399-gru-sound
 to DT Schema
Message-ID: <20260412-copper-hummingbird-of-saturation-cdde95@quoll>
References: <20260410055532.60868-1-anushkabadhe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410055532.60868-1-anushkabadhe@gmail.com>
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

On Fri, Apr 10, 2026 at 11:25:32AM +0530, Anushka Badhe wrote:
> Convert the rockchip,rk3399-gru-sound.txt DT binding to DT Schema
> format.
> 
> Update rockchip,cpu from a single I2S controller phandle to a
> phandle-array. Add an optional second entry for the SPDIF controller,
> as seen in rk3399-gru.dtsi, required by boards with DisplayPort audio.
> 
> Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> ---
> Changes in v2:
> - Fix subject and body: "YAML Schema" -> "DT Schema"
> - Fix title: "ROCKCHIP" -> "Rockchip"
> - List items for rockchip,cpu with I2S and SPDIF descriptions
> - List items for rockchip,codec
> - Update descriptions for rockchip,cpu, rockchip,codec and
>   dmic-wakeup-delay-ms

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


