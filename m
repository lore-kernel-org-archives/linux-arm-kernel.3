Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7B3CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 15:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPldbMYLLM5wdvZKBFXIyO57PFB8hb6GDPoxln4Bc9Q=; b=PC28XGidkxXStglYO/uC51h6Nf
	cmWdJPe4/wxxGywELHOezL2+0fI335fk80cIof/TNeb81wnWRE4YsxidZslwFnBktPsop7k475AHt
	LigHk3Yo9c5krH/A6nuTc5Mex/1ldbaXp/58FwTll2flGrq7PnR8m5KKNICSN8ZoYuhA012KE0lyt
	KS+azTgB8lmofTNm8i49QZrsB2BBdCPixVy8flIR5VpHVyq/pxZmfaYGQsoE3QN/fE19g2rGWpVmh
	NTGfSxht8O6RyUDXla0t1ZUaA6FJT1V3qXSVacG668aDm2iuAcTpRurtnPXwLQa4Mrvb/g1e7+T2j
	ZlipFbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4LTo-0000000Akct-0gDn;
	Thu, 02 Oct 2025 15:44:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4LTl-0000000AkcX-458T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 15:44:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 903F0450F0;
	Thu,  2 Oct 2025 15:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEDDC4CEF4;
	Thu,  2 Oct 2025 15:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759419865;
	bh=gwC5BhJBwYKgsnNt4fN26IJ79zFAZbre4VusA+f9pes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Itwu3wciA297/eNzH7IsKflMpXmHgbzbByzzUeWY++7lJqzQG0//z8vEeua0uNuGi
	 wCUHifUd3ejiiE5D7rPb6mJcNvPXe6wgeslW0kVP31U0pjh94O4jfPJwY2kBFlefhM
	 SAtSZT0/ONJmBewr0/tjHlkQ8zgP/8MaH7XK/B80jSDT5t8e/dHc8kZeLSNH6sD3ct
	 /iSGvoBU1ikZfyhYnUdrpl3jhqgBTX14a42i1DQ3hk/vuReiwRdLhfx4PP3eJSCdBD
	 Deas6xrGBPbyqDSAEAIOWixKRAtXdRtZoEdXzfRhE84fZPMmIsWgDRN4dXPPy0Cx/Z
	 4LwZX6SXCtr9w==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Jun Guo <Jun.Guo@cixtech.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20251001-basics-grafting-a1a214ef65ac@spud>
References: <20251001-basics-grafting-a1a214ef65ac@spud>
Subject: Re: (subset) [PATCH v1 1/2] spi: dt-bindings: cadence: add
 soc-specific compatible strings for zynqmp and versal-net
Message-Id: <175941986332.90691.14872518520812537985.b4-ty@kernel.org>
Date: Thu, 02 Oct 2025 16:44:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_084426_038019_F7B7A932 
X-CRM114-Status: GOOD (  14.42  )
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

On Wed, 01 Oct 2025 19:31:12 +0100, Conor Dooley wrote:
> When the binding for the Cadence spi controller was written, a dedicated
> compatible was added for the zynq device. Later when zynqmp and
> versal-net, which also use this spi controller IP, were added they did
> not receive soc-specific compatibles. Add them now, with a fallback to
> the existing compatible for the r1p6 version of the IP so that there
> will be no functional change. Retain the r1p6 in the string, to match
> what was done for zynq.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: dt-bindings: cadence: add soc-specific compatible strings for zynqmp and versal-net
      commit: 4092fc5f35cecb01d59b2cdf7740b203eac6948a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


