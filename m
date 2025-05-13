Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E15AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIYJMHCxrlsFDaNkGh7EMvR1HdzWXToGqyaKB2/3L4w=; b=MVN4H6T7Sbnag+bhkMuNvMnfnN
	t3e6pIdg3ol7QCupSDVZxtgEwDx/knIwnoVSyuCvOr7xYptlJBSZs/p6OCk+oS68evwS8ED3rxp8E
	TacsbDawV6pVQE666JkygoNLKBhfvdPL37FgIVAX9G50R4xBouRwbugNGIqkjJiYXg/PHskqAG9JC
	0uJtRCC4d09hvEOB47fB0YN6ALUCbHgJN+7pMcUppvES2Ii+9usvrQVbm6nwmnwaZaswUQvtBncuF
	JKKg+JtORgmzfhisAK6zglxKuWZqo22bGpG/2bSDQq6SIWUXi3wThUT+xJ8EBIxTpgSnEMI7cOGuT
	CDUW+Y9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsbj-0000000Cx0X-2n0E;
	Tue, 13 May 2025 16:35:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsVl-0000000Cvco-1akH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 372E15C6A24;
	Tue, 13 May 2025 16:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE0DC4CEE9;
	Tue, 13 May 2025 16:29:44 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 917235FAC0;
	Wed, 14 May 2025 00:29:41 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michael Klein <michael@fossekall.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250508173657.8695-1-michael@fossekall.de>
References: <20250508173657.8695-1-michael@fossekall.de>
Subject: Re: [PATCH v3] ARM: dts: bananapi: add support for PHY LEDs
Message-Id: <174715378157.4016543.4493109479231149921.b4-ty@csie.org>
Date: Wed, 14 May 2025 00:29:41 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_092945_473329_74D12AB3 
X-CRM114-Status: UNSURE (   7.85  )
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

On Thu, 08 May 2025 19:36:56 +0200, Michael Klein wrote:
> The RTL8211E ethernet PHY driver has recently gained support for
> controlling PHY LEDs via /sys/class/leds. The Bananapi M1 has three
> LEDs connected to the RTL8211E PHY. Add the corresponding nodes to
> the device tree.
> 
> 

Applied to sunxi/dt-for-6.16 in sunxi/linux.git, thanks!

[1/1] ARM: dts: bananapi: add support for PHY LEDs
      https://git.kernel.org/sunxi/linux/c/d010f85f1acf

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


