Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55739C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDwIkddYcjzqpY0qn+RN60cxRzSZFEEPA0b1jtHao/Y=; b=cLWfbgnQ8P8Fc58/4ua7ccRk27
	VwSh4C/6dzswsCEYZCwwqC/NIw2qOpW2dUOtR6OGGDTR9PoX2qWp5NYl1zsvqaAXx4/k4GAxHNpsC
	PYBqdVwEakJe1fy20ZQFCf4BaO2SGhQYoegWj5JTg5dMoYAbJSrKCfpzXy6w/hhzxrDTBJqlNxksc
	cnclcmclMM6wE4gW886dfaR9U1KUhaBEaIey2a0sHxXqWknsnRjS3udgHq13ZQhRXu3V1Ss865DEU
	E8amvKAZ2Xj5HPpQBxblIH5JzRs78hfeMI6cUI3YZIGKyKqDvBqd7jEuTgeFoOpoUwxLD3a0PKU9o
	9yaUK+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lhm-00000009rth-28Dg;
	Tue, 29 Apr 2025 14:13:02 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jSS-00000009YWU-2RyJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 11:49:05 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 070E81F945;
	Tue, 29 Apr 2025 13:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745927343;
	bh=oDwIkddYcjzqpY0qn+RN60cxRzSZFEEPA0b1jtHao/Y=;
	h=Received:From:To:Subject;
	b=kZN9ESihpGKMvPY4cStlEn6RlCOnHRvDpolr94jqob8QWMXuZSmIGMA/LL2RgepaF
	 enHO+t6u/Ug1npMjfqK4EfrjvnMgezzOJ3Jo8m2UxqJUjiJ9n/1of4majt2inv70wb
	 bCcNx/65qczywfHfoXMUXd/8fWtBDSqnbZYHUlQ3ct85QGyW8JtoamDHRg0ryC8cX8
	 7djC+wHLUcFTMTd5gfWaTt5aKa4j7lF5d5zJBs1GhxFm4frAhxQKakwhnMjLEtPoAe
	 Dl5lhkIU4s/GInKY8O7f2co6OAwK2PAMBnbGeFe8FR06mn3vQKtxo1j9rs/cH5vxLn
	 H3slz76KCoPOw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 7A8997F9D9; Tue, 29 Apr 2025 13:49:02 +0200 (CEST)
Date: Tue, 29 Apr 2025 13:49:02 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC
 DTSI
Message-ID: <aBC8rvt-u8P4Qlzw@gaggiata.pivistrello.it>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_044904_775473_3A05E084 
X-CRM114-Status: UNSURE (   8.26  )
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

Hello,

On Tue, Apr 29, 2025 at 11:39:20AM +0200, Lucas Stach wrote:
> Am Freitag, dem 25.04.2025 um 21:48 +0200 schrieb Krzysztof Kozlowski:
> > Ethernet interface, like other exposed interfaces, aliases depend on
> > actual board configuration, e.g. its labeling, thus aliases should be
> > defined per each board or each SoM.
> > 
> Breaking existing users for the sake of aligning the i.MX platform with more
> idiomatic DT usage does not seem to be a worthwhile trade-off to me.

FWIW, I agree with Lucas.

Francesco


