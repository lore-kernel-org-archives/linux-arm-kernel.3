Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC76CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2xOVsosPW2QSJ1k/pN1LTA29nOXkFHvDRxHu7Yn0l08=; b=ppz2ZseqjQYWC3
	fo6gv/+H1TiEPb1Y80kYEnnjrLgh0JdFkQr62PpHtnrQ00x8uagZpmb7S3qKf7saJSmz+h49jS1Kf
	6PRr91s3R9+d8oeV0SIKlBWD6boXHs1cWW6TQkjA5I/qVhGI0gabzPqZgFXpPJhkofyAKKmjGQHjt
	2J6tnUB6iEYCDhG0pJi8Uxabq0kGHnpXffEilttuaBJlZYwr+QRE6lTrzUu5QYO/GHMuxfyFWfvGB
	suhBzUOz+inZr5nIggjMoCFcYsYIu+R/3UxnbxTEuVTIMcOWnx83G850vbV3XGYwszJwAlR11fL9d
	x2YZKSgMEaOg0bW4/LHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEFFx-00000003DRY-0rDp;
	Wed, 29 Oct 2025 23:07:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEFFw-00000003DQl-0IaJ;
	Wed, 29 Oct 2025 23:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33918604F7;
	Wed, 29 Oct 2025 23:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC80AC4CEF7;
	Wed, 29 Oct 2025 23:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761779222;
	bh=6vtKfxLVHTckjyhMiXXMCWIG6JF1eGfVHEoUuMCzogg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gUI24iy4PvwhwVEtAqpZpflxITkrGPyFwTkQHs8g6/9gVrcq2yrVfmYPolTzeIwAc
	 Alt/9YmvQPr43cYuqfYYWIYkVq8bzThVJ67NmhMgrsfcEuK2m9bUbQGNIsFkZQdIKI
	 Y6Lm/jo35rqeVCt7nbxEwZ1a/PPbLpD4ofCmMIvH5tm8jYSPnCUYpOg9u3gkB+bQ5T
	 DgwHHVmB8IQChz8wVvM/Os3oKQDpT32d7F3AYDwwIKUd1sJ7itSwvvVFIy85aT5eFM
	 X2PDbbGo0ImSP4Q6L+BpIfgnnhjPel1z9WfQT+GSNHuXVLwRSpTgpjwUtg2OsrcIZI
	 4lKsTfPql6oKw==
Date: Wed, 29 Oct 2025 18:07:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jingoo Han <jingoohan1@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v4 1/9] PCI: dw-rockchip: Rename rockchip_pcie_get_ltssm
 function
Message-ID: <20251029230701.GA1601620@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-rockchip-pcie-system-suspend-v4-1-ce2e1b0692d2@collabora.com>
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

On Wed, Oct 29, 2025 at 06:56:40PM +0100, Sebastian Reichel wrote:
> Rename rockchip_pcie_get_ltssm to rockchip_pcie_get_ltssm_status_reg
> to avoid confusion after introducing the .get_ltssm operation support,
> which requires further processing of the register.

If you repost for other reasons, please add "()" after function names,
including .get_ltssm().  Then you can drop "function" from the
subject.

