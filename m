Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3823AE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOajlXr03gCO837sr0DFIcJPkyWadXfKtuB8F1ddqSQ=; b=HztGJa2NNt4aoUtMetZeSbXmFL
	FraZ/omvG6s1gTB1Sp/l4jXGxF/mlF5DXo1B0yXCVGvuq3Jp/R7UDZRGEOphaVN6xTxD1Nb/H4ENo
	cVNZM6YprwLVWsHjazTdaHMR90SvmxszEZD5LwtLctHtzgBwoaL2xMC25z1e1jAJEwFBhkLt3CBxC
	1Y+PgKn0aRlI76PWIb1WQHh3L4YfnDBAG4y9I74nPChL4BLk+PBkV7B0RNm7wHs/y7maMlQkGmF7U
	4bPKAts2WjQ4tJnvRPzPN40uUQ0y9Bu+dWNj7DgX5sgqW61y9eV9Yce7IY91bCFE8BATu1Vl2rIl7
	F/BCQUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tODk1-00000001Xhs-2iY4;
	Thu, 19 Dec 2024 10:26:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tODiv-00000001XUp-1Ke8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 10:25:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBA79A4203A;
	Thu, 19 Dec 2024 10:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CE2C4CECE;
	Thu, 19 Dec 2024 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734603940;
	bh=sOajlXr03gCO837sr0DFIcJPkyWadXfKtuB8F1ddqSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5PWR4JBUIJuWd/fafdoEaGj6mheDRaqR7fH3Npq1gTBx9ZClTfCs8fPRyBk0MXgt
	 z14xPffVBtqgPG5RsnV1SVCp1iS13JdptWa0U0Usn6qhw+O0FHwQPF0gNDGPkwnxA4
	 87YSU5pvDCSaj0uANSmRCs3rD3X8UnCsRqTOyxoS4uo8tkCB3bPtIiiG4sa5RNQmcv
	 ZW55izRDY+883+WnPBqgVksFdALvRxWI6BXGmopJ8eG/XHYYkRqBpPVtuUIBGMI53A
	 Bt7IM2gE8MDWT8O6MNkFijxnQUq9msee/FsbHrEtjbDPl4EERatTvUFtRqw+ddQJks
	 /TSY2dSmL9Wug==
Date: Thu, 19 Dec 2024 11:25:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Frank Li <frank.li@nxp.com>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Bough Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3] i2c: imx: add imx7d compatible string for applying
 errata ERR007805
Message-ID: <brzvlpspjm66awnkshxvw7xefxxjbjx5v5mhqd3jl7befx33fy@mfi3pbagfy7a>
References: <20241218044238.143414-1-carlos.song@nxp.com>
 <Z2O1PFr4ZQHXTsrX@pengutronix.de>
 <AM0PR0402MB39379D10473292DA6533A757E8062@AM0PR0402MB3937.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB39379D10473292DA6533A757E8062@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_022541_418759_D5D41E70 
X-CRM114-Status: UNSURE (   6.09  )
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

Hi Carlos,

> It will be this in V4:

no need to send a v4.

Andi

