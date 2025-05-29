Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCA2C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3n7o9td/bIF0NiAPn01aDgG1f/ieuz3uc3w/dftQk8I=; b=2iZSOsNUPS1NzBbJMHQUD0Z42G
	lt+MluyPqps/1CHaU1qiUkW5nisDhFA5SJlwCHTE5JlvqDFWCfxSFHMq22TN8AImZmKGz92Z4wLpv
	qSHiU//mW+ZQzAS8durQbfQp+PHVSHTRKCKmKp9uxnir2ALxQe827kxGZ3cdXQkhbA98tNGWGGqam
	tiJ2DWrFlh+EmbepdS4WPbrovUo1RiRu3tLri/jpjl3ZAv7krEvtH8Qo5JBuJicw5Jo/AEs7mkI/c
	JH1IqE0l4axVbJkBXqaGBlI+ZnjxS4DmKWf8X2j7PyTCwuTSHU3F5nOCwn3s7yxbNQahUnDLxSt7R
	ulnbVE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKafj-0000000FWiP-1AOU;
	Thu, 29 May 2025 10:39:39 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKadb-0000000FWWz-1FIv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:37:28 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 766961F91C;
	Thu, 29 May 2025 12:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1748515043;
	bh=3n7o9td/bIF0NiAPn01aDgG1f/ieuz3uc3w/dftQk8I=; h=From:To:Subject;
	b=dzny/4KtJ49L0F+VPryo0Y43RMhAjaJJz5sI2Rau0XXq1Dq7MWqLNDF9ltOoVW6cn
	 SneGkFdUPYReBwiyR6lrp3ljz/kQGkiuTSk9kBkEjEsfRPBMGnYAtBsPVD3O7IVUsB
	 CgKKg3634JSe7B+IT73a2OYiPhVgodM06y/4hCrFlF0ry6WLuO7ae40nBj6yAWL9a8
	 fR5KtUeKChycVITqzq4ZIi/SPXjfkIc83Imn0zqX3wP9IwbRwRyqahvGWHJ+sB/Z/s
	 SwMJ20pDnJDbEt4Xd2ph2K8kgBNlll+33nMmI/PbxcCGnkc4XBpGHOOEfDZqNFN1NB
	 Rsa1r8ii2J4og==
Date: Thu, 29 May 2025 12:37:10 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p-verdin: Enable pull-ups on
 I2C_3_HDMI
Message-ID: <20250529103710.GA103361@francesco-nb>
References: <20250529102601.452859-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529102601.452859-1-ghidoliemanuele@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_033727_487226_F133C481 
X-CRM114-Status: UNSURE (   6.26  )
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

On Thu, May 29, 2025 at 12:25:54PM +0200, Emanuele Ghidoli wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Enable internal bias pull-ups on the SoC-side I2C_3_HDMI that do not have
> external pull resistors populated on the SoM. This ensures proper
> default line levels.
> 
> Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


