Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B1FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bz4bfto8vNr+S8FhLtgO/a38HrKDD0UrOPKdT1o0KoI=; b=l/r05A4UW99VrAgI84QCwufmWm
	co25sjhFkFJ9/+7/Qt47fifJkNivDgxV/VhAIDYAcnBUBMpJ4gO5NXF+f/H9WB9AzusL7PBl9DNkH
	PV9GfTGkZURSjUTPIuH7KEj4GVGR1b1StQKqQT1qjJgEjtKuHy/Uw9Z3tEzRg1+3n7c4cepx6Spay
	jcEyqtroy7t6XR5W8m9FXkThPPYNCuvS5vTuKYtojS+joa6XW3/Q1QuzzCMFA5rsrAOyrOrfJ314p
	VoWPWAtjRy4MLHFnCzF95F9SYXldNSCgofncTsP+jR8pIfsvClyX3oNh6+UEsWy0oMmYET+lu5eaD
	TNAnMGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYm7b-00000000KJp-2oxk;
	Fri, 17 Jan 2025 13:10:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYm5G-00000000Jsp-0spn;
	Fri, 17 Jan 2025 13:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10C175C6248;
	Fri, 17 Jan 2025 13:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C6FC4CEDD;
	Fri, 17 Jan 2025 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737119301;
	bh=/kk8bIeoOoF50IA37ReTObbO23keBjpVXrnfW1WhScE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArSSsMdMGrKvpMUgYcQ5C5cT8SjvXZh4xU7bKU38XbtIr+deczFTG71Qw7VNtvp+z
	 Jqo3CFIVE6CxRpDgzSNGla7yie1mb2aeso59Kt0IvKzZvBN4rGlhy6iNr84A4Xomci
	 FDJktPq77s74T9sn98BK/avlpveVh5vEo5MczOqwdk/pNkf+5V33Rl3fvm9mUN3EkS
	 ZL8Sv+sWCMHJNRq/p8Hdknqc+YktPac951GU/Bys/+zVnaoqVtTK7CKUNNkjjIrBpY
	 W5pToys8AMFesQ8IRwAZ+6fCs1K8Lry4zkphlWmBfyJ1CEl5IMxL6ubjg27p08+y6X
	 IDlykEU9i8p0Q==
Date: Fri, 17 Jan 2025 14:08:16 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@edgeble.ai>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
Message-ID: <Z4pWQKRjgEkFAi3W@ryzen>
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <20250116-pre-ict-jaguar-v2-2-157d319004fc@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-pre-ict-jaguar-v2-2-157d319004fc@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_050822_287552_BCBE1128 
X-CRM114-Status: GOOD (  13.53  )
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

On Thu, Jan 16, 2025 at 03:47:11PM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
> overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe endpoint
> mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs to
> be applied on Rock 5B base Device Tree. If that Rock 5B is connected to
> another Rock 5B, the latter needs to apply the
> rk3588-rock-5b-pcie-srns.dtbo overlay.
> 
> In order to make sure the overlays are still valid in the future, let's
> add a validation test by applying the overlays on top of the main base
> at build time.
> 
> Fixes: 40658534756f ("arm64: dts: rockchip: Add rock5b overlays for PCIe endpoint mode")
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

