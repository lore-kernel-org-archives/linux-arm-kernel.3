Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7FA1075274
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 08:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0yD8IH+wK2AwJtBvP6hcdTAqqLEEeROY22oW47UUj8=; b=3aV91BALpiHqaljWulaZHdcwC3
	qaVBlvtwA0kNR6Y/+Q0YRC2d7+UcE6RtMPuOMSiiCOdcmYz33VajcQs5DRr+1EPEDKCLzt4xUGEbP
	EYOKgKxcdjmPHeQTx2kibyszrfxLZpLGuvKh2GFzLg/OKB4StrYNLmf4tUKUdLOEKy/hnrLnzEa5J
	5E4bsaZ1l9NbwC7OihD3Id1amJZnErSqbREWte1OG7uTFMrI+0O8ajoTsAztzA9DcRAhhPHMXx4Di
	HmKZOrchWT1J2P3I41YxPDA4OlyJt7Sb946JxcKodXF+L6/DRIzC38NjzOEIchPBDLVpk3FpWRVTc
	8Y0iURyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38L8-0000000ACR5-0EqC;
	Thu, 19 Mar 2026 08:02:46 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38L3-0000000ACQM-3YtU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 08:02:44 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A93231F94A;
	Thu, 19 Mar 2026 09:02:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1773907353;
	bh=h0yD8IH+wK2AwJtBvP6hcdTAqqLEEeROY22oW47UUj8=; h=From:To:Subject;
	b=kNnY/Y50A8rFL63mhjwBf0svsePueD2Fg8iR7BnGe8XFetqWnNHnWwPRgLEsDvY/F
	 eb5H7eA6rmjKwnbXeJ0XFYkYQSlZvmv9laXtzMZdsWDMplGtaOAhdJHhcOVL3Qs6XY
	 ANdM0D6Cs38oqT1SDrv8kx17rQkHwTLIixm9XzQvT+8X/ycBF1exWilnMQoAhwZCsc
	 KHRvkAdWbgrP0vC64ZlgaSndfYHrcFYRBLKU7dvKE7/79sSuekt8JQahOP0bRI5yzP
	 eMr7IR0MVjgc29t1Sli7a3aoXRuJW4n9JDHNNsmO2UquzpFTuN0K4rU2YVsR1i00KO
	 I+0/6ehcEILCw==
Date: Thu, 19 Mar 2026 09:02:28 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Judith Mendez <jm@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Moteen Shah <m-shah@ti.com>,
	Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v2 0/3] Fix MMC pin pull configurations
Message-ID: <20260319080228.GA6079@francesco-nb>
References: <20260223233731.2690472-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223233731.2690472-1-jm@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_010242_779352_93060160 
X-CRM114-Status: UNSURE (   6.65  )
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

Hello Judith,

On Mon, Feb 23, 2026 at 05:37:28PM -0600, Judith Mendez wrote:
> This series corrects MMC pin pull-up/pull-down configurations across
> TI AM62L EVM, AM62P SK, & AM62 LP SK boards to properly match their
> hardware design.

On AM62P the first mmc controller has no pinctrl, how is the situation
on this specific interface?

Francesco



