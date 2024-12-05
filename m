Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944B7E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6zvJEtefW3zjV8bAtjKcTpJ3ByYyZF+8yapEqTAt1M=; b=SEAhn3PMtqVfBWncfKA+hDpfFt
	N6RJmfU7pENjvuim3wCufOmZrvQpItOnbvYr6Q9Hst1MZ1vsNMeNUsscguwiGhet63o+j2tBjCHGu
	8G1zkyUBBUdubc4px8ufoRbWstD6qRQUzVpJza9P9goAKJYGcgxgurn9ibS9RQiUTed+XwLlrxUam
	G9LSfOwIoItD1efSltCf/t6nQaNVvnww3keL77pDCUE4ew+Eb5/5vzFkNgwA+MwhDfwplIJISBlnA
	RQ/FOY2qKxdLW+Qa53eO5syagYAbd5XmbqluYYJbGoUwHrbdug7T9EOAuX5mlbGPIYWIAzoUErOKF
	xjE6MoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ80k-0000000FKyE-0NDz;
	Thu, 05 Dec 2024 09:19:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7z4-0000000FKWm-046E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:17:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2ADA5C71CC;
	Thu,  5 Dec 2024 09:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4560C4CED1;
	Thu,  5 Dec 2024 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733390237;
	bh=QOb9P9iUUuYbXp8H+bEnhQIs7EBkcuBhE1xcEl9HfSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUQJ7wRi1jEPT4Ea18YNhAjq8BH/p8Nh8GdgvQvFwsk6AcSoFIwi0obdKwoDanA8D
	 erRYDZub8cjMcdChPYVwWj2EdteaJtPk5sp8VTk3lXciaJEaudp8jw4bEjRCBqK6ad
	 2YP9SjIBMPWU3DOrfouWL1evpNl76Kt/jTFBVPddZ+P6dyNqx7PpkFxNxECx19TsMm
	 cVABsLUrOTnvZNds7gqnxdtnbW8RiHL85WLXRl12MGy3ruQ8I2jchQabR0iuVQMbJo
	 SsV808YnOZkfZmvZdTsrR0B8uoNsYBdsDW2RsGjDgXZK/qMS8YevXseuO+iTFdAAx7
	 HH9P0VNYJOu2A==
Date: Thu, 5 Dec 2024 10:17:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vabhav Sharma <vabhav.sharma@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, frank.li@nxp.com, 
	pankaj.gupta@nxp.com, daniel.baluta@nxp.com, silvano.dininno@nxp.com, V.Sethi@nxp.com, 
	meenakshi.aggarwal@nxp.com, Franck LENORMAND <franck.lenormand@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Horia Geanta <horia.geanta@nxp.com>
Subject: Re: [PATCH v4 0/4] firmware: imx: secvio: Add secvio support
Message-ID: <qgh5pzcjlke55eszovjfa3xs4icepcwz7dpfalgo2p6xyv4yei@xmgofqph4yph>
References: <20241205-secvio-v4-0-5c37cdc39573@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-secvio-v4-0-5c37cdc39573@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_011718_096293_7561F1EB 
X-CRM114-Status: GOOD (  14.82  )
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

On Thu, Dec 05, 2024 at 05:56:31AM +0100, Vabhav Sharma wrote:
> The tampers are security feature available on i.MX products and
> managed by SNVS block.The tamper goal is to detect the variation
> of hardware or physical parameters, which can indicate an attack.
> 
> The SNVS, which provides secure non-volatile storage, allows to
> detect some hardware attacks against the SoC.They are connected
> to the security-violation ports, which send an alert when an
> out-of-range value is detected.
> 
> This detection is done by:
> -Analog tampers: measure analogic values
> 	- External clock frequency.
> 	- Temperature.
> 	- Voltage.
> 
> - Digital tampers:
> 	- External tamper
> 	- Other detectors:
> 		- Secure real-time counter rollover tamper.
> 		- Monotonic counter rollover tamper.
> 		- Power supply glitch tamper.
> 
> The on-chip sensors for voltage, temperature, and clock frequency
> indicate if tamper scenarios may be present. These sensors generate an
> out-of-range signal that causes a security violation to clear the
> authentication and storage keys and to block access to sensitive
> information.
> 
> Add linux module secvio driver to handle security violation interrupt.
> 
> The "imx-secvio-sc" module is designed to report security violations
> and tamper triggering to the user.
> 
> The functionalities of the module are accessible via the "debugfs"
> kernel.The folder containing the interface files for the module is
> "<kernel_debugfs>/secvio/".


Debugfs is for debugging, not accessing functions. Come with proper
sysfs or other control interface and its ABI, not debugging one to avoid
any review.

Best regards,
Krzysztof


