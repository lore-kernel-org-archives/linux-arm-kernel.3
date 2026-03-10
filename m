Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DA1FCC9D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 07:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJs3j1qgdiSLL660koBbkByqwIfjlXm9V1J/kzsZhok=; b=oGR+/wsaRSVqDtgckhnFlljUIT
	OS6olh9cQB+xWmnlnF6bS+ENWUxaKYpbIDKXBJFMJjNewU1XMSPiGTqeG3wN7Y2vsHAFZZRmsDRAP
	f/lCDVumI2LdHQhT43TfNVxNfEydK+TXaqdVeEJUYkKcQ8pWSG1g2SGhay8WcaGd3qwZOSww0glg0
	vG1o6yGEPNETSFO72mARSOxkJ/W5ee2EbfVmC4wgG2eXaECRCiAOMPC7moh6tlnTJp7VkK7SzRoyp
	mWgfY7ceM46btIrs/M1alxAzRdGFbjW5wIpkUujgohZsYEHkf/IWOVnUUNP3BXrWC0bCVopHsy9O+
	SCCDUhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrgF-00000008rP8-08Px;
	Tue, 10 Mar 2026 07:39:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrgC-00000008rOj-1B7Q;
	Tue, 10 Mar 2026 07:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F0374348D;
	Tue, 10 Mar 2026 07:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBEBC19423;
	Tue, 10 Mar 2026 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773128338;
	bh=eigS/zAmAe39yYs+o8HKoJPAI0Rl29kSXCxO5QeFKrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ioa+vCv3zf1suIzQ56s0muplBFPtUWyxbX/mtLahEuzfGKcPw0u1wt4TOY1tn0n/6
	 ybrFCK6eDjaY/nBNHzjF+G7qwIvc3qPT+vS0qKpjjTfPX+owKYUOjJMh7j+TdA/xxS
	 xeACZi8K7y8Ss9NOLB+cR2EBxSyO3Qw7WGKubeqGMjYpvAs4dqqlYHhsoFOLQ0sJ7X
	 2x2vL2Wr9NROMmp4yslHyCXfdZts61+YBbUoC5jPMAHMjfVRjxN/R+R4fRPODd5IVv
	 YmyC8Ud6PxpaRHZkluLjIbNuATJmHa1CK2/pUr1vVMhQa0rWgXkK7u+yXXR7sG5JoH
	 EgnTZI9pQDm3g==
Date: Tue, 10 Mar 2026 08:38:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Richard Cochran <richardcochran@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v6 01/18] dt-bindings: clock: Add MediaTek MT8189 clock
Message-ID: <20260310-notorious-manul-of-maturity-facd51@quoll>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
 <20260309120512.3624804-2-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309120512.3624804-2-irving-ch.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_003900_344364_54F32E00 
X-CRM114-Status: GOOD (  10.61  )
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

On Mon, Mar 09, 2026 at 08:04:43PM +0800, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
> The MT8189 clock IP provide clock control for main system
> (apmixedsys, topcksys and vlpcksys) and
> subsys (eg. peri, mfg, venc/vdec ...).
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---
>  .../bindings/clock/mediatek,apmixedsys.yaml   |   1 +
>  .../bindings/clock/mediatek,infracfg.yaml     |   1 +
>  .../bindings/clock/mediatek,pericfg.yaml      |   1 +
>  .../bindings/clock/mediatek,syscon.yaml       |  27 +
>  .../bindings/clock/mediatek,topckgen.yaml     |   2 +
>  .../dt-bindings/clock/mediatek,mt8189-clk.h   | 577 ++++++++++++++++++
>  6 files changed, 609 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mediatek,mt8189-clk.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


