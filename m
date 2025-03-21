Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA7FC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 11:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADbjYdX1HmejF+iu7oo/TmyMWgH3NuRKBrHefNTWAvk=; b=fWHlH4ad1o+OEDbEXoQCHklUgL
	NdGqYvFPelFMoPAXBkubp+/csJvRS2GaQj5BY15e7rhEkEjdXESNkSqNSbloy+c/FgqZLiCx4ld8Q
	paFDQ5CxC1IZkzu6UeEbaeB4Ouz6HtDfzv/lzW3kDGVJ1Oof3fl6yHQswXCfws3v5IuV7DVtadRDV
	oRLyZ7h3/McD4EG0KxLlIcSX2r2UUiQm6b9ukPJx3NXxmm0miFVnUBjpjNLf2cdtAiS3KIwnlKwyP
	CT6US9KhiuWIwfiyH886WRlFEx4Oxk80Dv442FwDVJ3fGJ3oDDKkRkFPa621U6wV5Vfj4ZLSlQoMl
	LdqukGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvafB-0000000Eg3E-1yVT;
	Fri, 21 Mar 2025 11:35:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvacP-0000000Efn0-3XQM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 11:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F24A7437F2;
	Fri, 21 Mar 2025 11:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692A2C4CEE3;
	Fri, 21 Mar 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742556773;
	bh=thGuF3rwJihqxHfpwT/xQ7dl/3hvnzuOYMlnV7gGVm4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EHKWPx6zc8CSmKQULK8B1xcUHLeIU3jzwt9B86AqSqGwDSaNGNYuTJwoMBFt8d77y
	 CEK2dD4XyFGfYsyeQ7eI9atqpYJcguBOt5N3ZuwS+pidqFAf6ETDZQ417AS8aoy+T4
	 IDsdLzSPybMTmdK7dC5fKtz38H77DfvZL0Pp6KHJAdJ0IYaiTKcvrvRyqSIdorsYIO
	 x4aFXb0HOsA5g329+WgsmXTqR1+AxIlDfOqWK2lU8b0adcjWJksC51AExTMHWa/tJX
	 b7C2HeRJv2cFlQC/u8uY2DOVB2pC5dLSccOhP1MOQrxOr9gNCfzwKhZIZffV7kTJf5
	 j1xNMkBYooUqw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, claudiu.beznea@tuxon.dev, sre@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 p.zabel@pengutronix.de, Ryan.Wanner@microchip.com
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
In-Reply-To: <92543fcff4ab35e770b01d4c15d45cc5d55833f4.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <92543fcff4ab35e770b01d4c15d45cc5d55833f4.1740671156.git.Ryan.Wanner@microchip.com>
Subject: Re: (subset) [PATCH v3 02/21] dt-bindings: mfd: syscon: add
 microchip,sama7d65-sfrbu
Message-Id: <174255677015.2092266.3581610195037077485.b4-ty@kernel.org>
Date: Fri, 21 Mar 2025 11:32:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_043253_899015_F2E4D36D 
X-CRM114-Status: UNSURE (   4.32  )
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

On Thu, 27 Feb 2025 08:51:49 -0700, Ryan.Wanner@microchip.com wrote:
> Add SAMA7D65 SFRBU compatible string to DT bindings documentation
> 
> 

Applied, thanks!

[02/21] dt-bindings: mfd: syscon: add microchip,sama7d65-sfrbu
        commit: 7e3ff6785039796728a515ea6e07378823e71be1

--
Lee Jones [李琼斯]


