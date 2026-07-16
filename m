Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FA4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxkAPkC3WXfzJ+jrm3dHu5tnYfHhVvaTEHLkTVNbU3s=; b=IfkiR9hKXYm9LFXJWq8WIXpPxu
	SXwIX81B4iKmtQR8nOcpIrq6/s/7ffl5vXHYeXsQZfhL32dGxWQsvHk/0L7Q/QlsTL2fjQRPMU8hA
	qP/Aa2/sBZjc8nlPbP7smJ+RXPIErn6RvOAL241hg4ZpgA0OefDOj49c14OB6yKf35xGRk0BRZLOl
	dbpLiXEEn4M7KXFPULGHT5+2mKUasL50c+dMC7DtnxVYGh/LYIFbRwu0SpdmtaXkMRe+NpsX9atCA
	0V28wX/XjJ8p3Ybi2ymv0b8wNYb+U6qOPTgER6DmPQkEI+oUoeB79KeO2gYNb5iOVUt+G+2TZOPxu
	YrqZr9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJXX-0000000H2q7-2dOe;
	Thu, 16 Jul 2026 10:42:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJXX-0000000H2pw-0Wud;
	Thu, 16 Jul 2026 10:42:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 792EA40521;
	Thu, 16 Jul 2026 10:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4065F1F000E9;
	Thu, 16 Jul 2026 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784198522;
	bh=ZxkAPkC3WXfzJ+jrm3dHu5tnYfHhVvaTEHLkTVNbU3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cWpSswwZ2bEb12NpMDDRh3S3qetzA7/F1iP0gnGLzTODpf87XFGhwXVYr6wxeFvFD
	 QEBPPFYJGYDavyEhlAHgWvc8RjwW4Bm9SZnpMlwFUi3fzdPxsOCWNtsHYG/tPDYfTB
	 f5JM4J1OaohIVnCZ0TyptCXWbnivstKEwffVRZMpNi2qiyXgaQS2PK/70mbTUD+b/4
	 2QnGTsrtmg176STrQD/WkJbM8L+OcvtNaJbiG7JIOZSXaS4G18acNENmhdu5IQi60/
	 Cbihh/zTqqNg5QAi1Ngy7IAVn5n0ad6vA5HPbsuNY+gaF20ymhpGRqMBhUwsAytq+w
	 vrrXh+pp7urYw==
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260711192842.845048-3-samuel@sholland.org>
References: <20260711192842.845048-3-samuel@sholland.org>
Subject: Re: (subset) [PATCH 2/4] dt-bindings: vendor-prefixes: Add
 techvision
Message-Id: <178419851981.1265391.16595891427832466278.b4-ty@b4>
Date: Thu, 16 Jul 2026 11:41:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Sat, 11 Jul 2026 14:28:26 -0500, Samuel Holland wrote:
> Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
> Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
> computers.

Applied, thanks!

[2/4] dt-bindings: vendor-prefixes: Add techvision
      commit: f0e0417373ca55d07cba596e8afe081c078843ad

--
Lee Jones [李琼斯]


