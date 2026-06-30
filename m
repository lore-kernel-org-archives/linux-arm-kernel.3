Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0CEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCdrMUvSSw/mZ+gIsbwP1bklG4AtyFzFYJZ+5GttJBk=; b=n56Zd+djdhR2CgbDRHXJRXDFlc
	rGziLsFrooFrka9XtOp6hFWt3dGSPaam4Ef2ZnZoc/MgqYUotfZEO8Wrj9DREFu1ORbgrYZxXF77u
	/ZRth8k4m5OVIgGLkrs47UUTHSMVtHdGIFrbQhuv96vFtrzRUJychjPxbqDJ+vwPBX9Eokl3GyNcU
	XT63YbW6+PQVBAX5zSCAcBeXDwry8lfE0NZgZFX5Z5aS8NSCwVYG7CkfyBknq8ucYVaA7/SgmQgsJ
	EXTb8uknvfgHg/ZMMaBEtfsOzhU8H7lS5NCR2fP/xqTub8G6lvdJFBev3B8yhTVLfmaklD825en/Z
	U8P/sn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSiS-0000000G5Il-1Wbz;
	Tue, 30 Jun 2026 07:17:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSiR-0000000G5IS-07ow
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:17:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6834F41A3C;
	Tue, 30 Jun 2026 07:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE281F000E9;
	Tue, 30 Jun 2026 07:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782803825;
	bh=iCdrMUvSSw/mZ+gIsbwP1bklG4AtyFzFYJZ+5GttJBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N50/KIrdFzKgp/X3seWtKpS9i2aaZ8WpCHLUb9N10JCELAE8iJTzJDh0g2klfL+5+
	 DfaazjdfOO1T+tlX3zQqFxda68kKphzwXB0bCa3mG0MX2BaL/a41LncCZvtiVlgafp
	 SBDzGGmiOxpc+rdEunnKN8lR766aGaHGNK0tKWL+kSJl8rPqz0kx7Sh+HUF8HfEjEB
	 eAqthZ+tGwhggZItNXLA/9AnIPPk8/Ec+AleCrhMjypM1tpL5y0sP+l4CFnCqdw00f
	 sZf3bA/yFK1nnZlQ0quwAWCbMzrWUBUx7kQGlrH5v0nhkul0SkNRU5e5bSApt3rlOr
	 8lOeSyIYQqXYw==
Date: Tue, 30 Jun 2026 09:17:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: mfd: st,stmpe: fix typo st,stmpe601
 (should be st,stmpe610)
Message-ID: <20260630-energetic-spiffy-cobra-5b9b9c@quoll>
References: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
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

On Mon, Jun 29, 2026 at 06:37:34PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The compatible string "st,stmpe601" is a typo and does not correspond to
> any existing STMPE device in either the driver or DTS files. The correct
> compatible string is "st,stmpe610".
> 
> Fix the typo to ensure proper schema matching and eliminate the
> following CHECK_DTBS warning:
>   imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']
> 

Missing fixes tag. This was introduced by conversion, no?

Best regards,
Krzysztof


