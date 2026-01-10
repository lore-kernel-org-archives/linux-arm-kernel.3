Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0627D277DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhOgwybFFPnagdYu4hSJEa1o5vFyGxREF5NYTn32qW4=; b=OeNzArgVY21+jbzp6HVlwhUD/n
	XQe4ouX2yEbQR3Lc/PWRJ9JpDYmR9j6ecKALEShc6Q4ZmE8ZLZaZaublq3fZU9O7yN88+nMqHzkVj
	1OuqiFA0x2VZqweSEtiXkYhyY8rUpRBI5NIcKp4hk5S/jx1Il4uiKAsA1Ymf6DpEjXkNExgJ+UVEz
	8A0K8bym//n1eTeGpfWx3Tm/epkBlP+dEcRdv7MvZlqRMTeqprpv+BmR76/MhjADPDjBntQr2bSjy
	zvE7Cudn+/N0C5zfbYk4oqRG86xolON8QzRTH2fYHgS3FV9wy6pOH/RtSoO/0YrAjxhBm4DlQmXto
	sYZRHNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veXGs-00000003Qe5-3DiU;
	Sat, 10 Jan 2026 11:36:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veXGq-00000003Qdi-0d1a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 11:36:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24D8C404B3;
	Sat, 10 Jan 2026 11:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95096C4CEF1;
	Sat, 10 Jan 2026 11:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768044996;
	bh=hFmk1VD0wsbSjaFH/RZ3HHi9KAL8aML96uYpgGNPOnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vDrJfIAiURhOO1bdyBXeF4sTII+rlZAxGBqWg5F/VJM4UFVVm2txe8mpUcimK3tcJ
	 jAz+y6pH4YSyB4gTG4iIq8LT0dcVtsw2e+NNiRTcqDxNAkbATT3aYptYNxX8QqIKMl
	 euUhvhFwPkfFSYSnU4KulHSLUOgxA9fGXAOc2w2kCcSwOxZxtxW4facDaS5HSpD8Vz
	 jWeuNUoFRm25qgnqsKuPt4Da+9urNgC1ljlPrCoObBWQxfGYsyMLTIfvTFF7h8U/Oh
	 yJYt3794581qZCkBu6kNoVL4+KkvYF3gPTIORGrPnb6dRlQE8lrknCHsRDLtcVGT+q
	 8K6aeHPAXDe4w==
Message-ID: <9a0590d7-6d3f-422d-8db8-a30845180298@kernel.org>
Date: Sat, 10 Jan 2026 12:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: apple: Add integrated USB Type-C ports
To: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 R <rqou@berkeley.edu>
References: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_033640_236155_D846B131 
X-CRM114-Status: GOOD (  17.40  )
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

On 1/9/26 15:07, Janne Grunau wrote:
> Now that all dependencies for USB 2.0 and 3.x support are either merged
> (tipd changes in v6.18, dwc3-apple in v6.19-rc1) or in linux-next (Apple
> Type-C PHY) prepare device tree changes to expose the ports.
>
> Each port on Apple silicon devices is driven by a separate collection of
> hardware blocks. For USB 2.0 and 3.x the collection consists of:
> - Apple Type-C PHY, combo PHY for USB 2.0, USB 3.x, USB4/Thunderbolt and
>    DisplayPort
> - Synopsys Designware dwc3 USB controller
> - two DART iommu instances for dwc3
> - CD321x USB PD controller (similar to Ti's TPS6598x series)
>
> The CD321x nodes are already present so this series add the remaining
> devices nodes, typec connector nodes and connections between all
> components.
>
> The devices expose except for a few exceptions noted below all ports. M1
> and M2 have two ports, M1 and M2 Pro and Max have four ports and
> M1 and M2 Ultra have eight ports.
> The Pro and Max based Macbook Pros use only three ports. The fourth port
> is used as DisplayPort PHY to drive a HDMI output via an integrated
> DP to HDMI converter.
> The Ultra based Mac studio devices only use six ports. The third and
> fourth port on the second die is completely fused off.
>
> The changes for t600x and t602x are in a single commit since the devices
> share .dtsi files across SoC generations due to their similarity.
>
> Depends on commit c1538b87caef ("dt-bindings: phy: Add Apple Type-C
> PHY") in linux-phy's [1] next branch for `make dtbs_check` to pass.
> checkpatch warns about the undocumented DT compatible strings
> "apple,t8112-atcphy", "apple,t6000-atcphy" and "apple,t6020-atcphy" but
> not about "apple,t8103-atcphy". I don't under why it doesn't warn about
> the last. "apple,t8103-atcphy" is only found in the added devicetree
> files and nowhere else in v6.19-rc1.
>
> Tested on top of next-20260106 on M1, M2, M1 Max and M2 Pro Mac mini /
> Mac studio and a few fixes for dwc3-apple and atc [2, 3, 4, 5].
>
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/ [1]
> Link: https://lore.kernel.org/asahi/20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org/ [2]
> Link: https://lore.kernel.org/asahi/20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org/ [3]
> Link: https://lore.kernel.org/asahi/20260108-dwc3-apple-usb2phy-fix-v1-1-5dd7bc642040@kernel.org/ [4]
> Link: https://lore.kernel.org/asahi/20260109-apple-dwc3-role-switch-v1-1-11623b0f6222@jannau.net/ [5]
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---


thanks for doing this tedious work!
This all looks good to me and the t8103 changes have been running fine 
for a while on my machine now. I will give it another week or so on LKML 
before merging it!


Tested-by: Sven Peter <sven@kernel.org> # M1 mac mini and macbook air
Reviewed-by: Sven Peter <sven@kernel.org>


Best,

Sven


