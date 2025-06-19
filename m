Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326D0C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 04:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnuhDIQHNaECsEm59Nxn5Me/W5soIU7h5crqTMNWTVA=; b=mJzw6+5Gu/VutrAnSq9fVHw2gr
	5cnCP7iglxFM9Q6mtR6+5JMlKviqI1DHIL8fp7tJhYLIV1wip9ZsSX/Mb5RVZgrbmTmTlBualG8GT
	bGv3cgRFeRG4NnUlWyll1NcAf6EBGgSM9n3d37IeAnWL8lPivf3u/BW2V/vfyQvCxG/Hf/httv5Wj
	yDFgNzYCh70v5KRrbGfU8HT7RDdoyCkLibjEmCUVBYf9lJ041xzaciCSmSP5YexljAWe+cREivqlF
	4L2bnjyde8s8Y02vyDKMnrI6xa97qfD/bXfi2iy9eIs5EGNMgQCigAyz6HAG2335n+OtIBKafla3O
	mdcovf/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6Uq-0000000BxMV-18LC;
	Thu, 19 Jun 2025 04:03:28 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6SZ-0000000Bx74-1648
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 04:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=KnuhDIQHNaECsEm59Nxn5Me/W5soIU7h5crqTMNWTVA=;
	b=HUnFwmnPibjlj4W6KrKKeWx/Z1Rs3/bLJvV4OMFgztVcpnzquQPf1+80SLqL7i
	prrBCud7S/zL8E0hEPnbrU8UxMfTy5J9glJCn8UIHfe/+dqdhW6LbfSa3VKTLe/Y
	ctj8asyB23tQyOr7kKFib9UgTOJwQZd6ENsoNxV2JMUr8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX_zpui1Nou2r2AA--.60288S3;
	Thu, 19 Jun 2025 12:00:48 +0800 (CST)
Date: Thu, 19 Jun 2025 12:00:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/8] dt-bindings: arm: fsl: Add GOcontroll Moduline
 Display
Message-ID: <aFOLbiHgnpyDtUHM@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-1-a8f0195420aa@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-1-a8f0195420aa@gocontroll.com>
X-CM-TRANSID: M88vCgDX_zpui1Nou2r2AA--.60288S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnHq2DUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBNxZWhTcvRhSgAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_210107_606445_A79D5531 
X-CRM114-Status: UNSURE (   6.02  )
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

On Tue, May 20, 2025 at 08:34:50AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Document the compatible strings for the Moduline Display controller.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!


