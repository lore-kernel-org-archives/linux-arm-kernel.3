Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB09CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndm6aA91ujeEKkvOkUUw5s5iYx1ZSU05T1RuMOzhZd8=; b=gDrhFTEC8DEIvwz7yjLbKG1A2Z
	RgAS3ByNaLpIFJBT8Q/NWRsKupJNIWBkdzacliHMk+uwXiHYFB92/ncMglBv99tZXDqjfkKyqZZIf
	RwK1UhCf4MmZcLThDazuyng34NYVFSI3xqqog2dBRim/rrLEho2tY+qUsPe43g9tiErU0g4+GghRB
	O+Aju0d3rgwJZyJD7rl3pfI4M9DdFeAav8+4rRECvDu0wZI8pc6JCWRq6nGXLJHYvGpptvhG018/l
	VHv+q+yay1iVdnIrOcdxOQsVdSu0pUhL6NZ1iHoLf13XRjPEkYYnvGnwkS08q550ZqBu+51SYMQ/+
	SQrs2rbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMNi-00000004x9u-2Sng;
	Thu, 30 Apr 2026 08:04:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMNe-00000004x8r-2CdS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 08:04:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CF42432D2;
	Thu, 30 Apr 2026 08:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B95C2BCB3;
	Thu, 30 Apr 2026 08:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777536257;
	bh=/YKW9Bgtg7TEVcVmic3y5cqQ+hd1ttAg/W7NjZNPROs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYt0iBLSRZ8rOZbYkE1Ds6rZZnZuItlYW/Ux+0iSuJvZLfdZPuI30RVOQeibKRjpj
	 tvkrAY8kZhBnKhMSrEkGUqBB3+LVaGr4MC/5BXgrA4UxOV6cnMVDeMiq/omyfU1xQg
	 YGPIFdWKrvJQ/FbhJILEpT4ryXpOQ8YDHOR7AYRP4w2HZNoLW94W0iEGJDcf+g49Ai
	 X4XPgpbPFu7taGYLabuCVflJ1C0M/dMej4MBpmm1OCOlc4kZDX7RKIxyrO8IIpFu5b
	 aiNaQ37aY8SO9xGDosunJyXoffj+B8pjs3Skv0gbd5tR8eODNqEWpI32NSSIYVzt+W
	 3E9FZGvM4iL9Q==
Date: Thu, 30 Apr 2026 10:04:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and
 pme interrupts
Message-ID: <20260430-proud-ammonite-of-gaiety-abaafc@quoll>
References: <20260430050954.3467984-1-hongxing.zhu@nxp.com>
 <20260430050954.3467984-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430050954.3467984-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_010418_582591_33386720 
X-CRM114-Status: UNSURE (   9.37  )
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

On Thu, Apr 30, 2026 at 01:09:52PM +0800, Richard Zhu wrote:
> Add 'intr', 'aer', and 'pme' interrupt entries to the i.MX6Q PCIe binding
> to support PCIe event-based interrupts for general controller events,
> Advanced Error Reporting, and Power Management Events respectively.
> 
> These interrupts are optional for existing variants (imx6q, imx6sx, imx6qp,
> imx7d, imx8mq, imx8mm, imx8mp) to maintain backward compatibility with
> existing device trees.
> 
> For fsl,imx95-pcie, all 5 interrupts (msi, dma, intr, aer, pme) are
> mandatory due to hardware requirements.
> 
> This introduces an ABI requirement for fsl,imx95-pcie. The i.MX95 hardware
> requires dedicated interrupt lines for AER, PME, and general controller
> events due to its redesigned interrupt architecture. i.MX95 cannot
> function correctly without explicit interrupt routing for error handling,
> power management and link event detection.

fsl,imx95-pcie was added more than two years ago, so how it cannot
function correctly? Are you saying that for two years you had here
completely broken code?

If this wasn't tested for two years, how can we believe anything is
tested now?

Best regards,
Krzysztof


