Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E9AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SssroSNNicZF3HZKrSaxRszDt77Zgu+mcgH1G3AiQSM=; b=INlBn+1f2sp4R1GUbbkdj6Lvhv
	KOnddU7+FU/FsOu3B0QWmOwRPzGl0nosZd01EYLmUberuvi9aajE+CCw9gfqbQZ9bc4vH6F717g8w
	wd9/cQZ0aDdh6jb+QeL/u17f3M2IR85FfzAxwmD/ySJcljp5ZaN8LDP/cs42Vez66UineWftIkhaf
	IxmCYmEsQsNqx5Ue8wfPeS5Wvq/t4wCBufKJXwsEjdOuSyMau65uvvUgGje7bNHZBsMEvU62MYB8q
	mxpICTa32e7WX5rDJIouj+xkcDDrBzo87XGeD3rR4dlFbukDGyGCCnCNyqfcTbxt65R5v6tB/ITtX
	Jfzm5aNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivlL-0000000F15o-3TaO;
	Fri, 14 Feb 2025 13:29:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tivZi-0000000Ey8k-1Kf0;
	Fri, 14 Feb 2025 13:17:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0BDEA42A72;
	Fri, 14 Feb 2025 13:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB9BC4CED1;
	Fri, 14 Feb 2025 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739539064;
	bh=BJ86edZvh8jpGptX1hyjS/jbHr4cYEIltrPXc2Bwabw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LuGQ4m31RLZgTi45838TutKOvFwDvAt2O/z3OB5N0iI8yDKNOmh0kSErJqgjdCikx
	 cTe3mzjgUZDFNnUcz99zeA6uQpJCUaEOnMYSwRXq2f+vRrR8O/VwmZPEPrRkd9XsOs
	 UiYVBzRoWp9HIQuAfjLtEed10lEKFZDdfn+tfJ1wltf0bk8AUnvyRiYQQhAFmqlvyy
	 N5DnI9RRItxGAUd/FrXyrU86hiGr0xJc2q+k2Rb+q0tI7q8GsNQJhcHR1EiffH+PDH
	 vtMTvBFAP1Lnur2MjH3cPmdF+TyWf6m/NSM9a/Zthr0RAClvZZE92RO97HFZobNxzF
	 ESlYyCG8RLGIQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, 
 jun.li@nxp.com, alexander.stein@ew.tq-group.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org
In-Reply-To: <20241204050907.1081781-1-xu.yang_2@nxp.com>
References: <20241204050907.1081781-1-xu.yang_2@nxp.com>
Subject: Re: (subset) [PATCH v11 1/3] phy: fsl-imx8mq-usb: add tca function
 driver for imx95
Message-Id: <173953905899.3648.13979952904818516353.b4-ty@kernel.org>
Date: Fri, 14 Feb 2025 18:47:38 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_051746_454366_A4F0F91E 
X-CRM114-Status: UNSURE (   5.45  )
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


On Wed, 04 Dec 2024 13:09:05 +0800, Xu Yang wrote:
> The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> two functional blocks (XBar assist and VBus assist) and one system
> access interface using APB.
> 
> The primary functionality of XBar assist is:
>  - switching lane for flip
>  - moving unused lanes into lower power states.
> 
> [...]

Applied, thanks!

[1/3] phy: fsl-imx8mq-usb: add tca function driver for imx95
      commit: b58f0f86fd6156d7b084257f5c91ceaf7d760927

Best regards,
-- 
~Vinod



