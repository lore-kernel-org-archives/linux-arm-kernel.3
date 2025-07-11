Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694E7C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hDZoIQxIbXd6WlsC6cZSw5cAAfuW34VyJGhlqXRNQ0=; b=RFcNjzR5kPRKg8atF2pROys1t4
	HeSevGc7HpmquX553m9l8sQf6zPGaCKmB1AauYlSJwZLXQrCji5G1aA0ASw5ATZX7WDK9XqGi61h/
	vp2NawCs783I8zt1EDeHPYqX3b9ETyIjVK+I9PGASLoLhgeI8HnmfYyZ+o8Oi8iN6ZhS8K8mu8O6s
	m88KdiUQ7LJ8srhqSUSpok+evH+MpFZI6F4DUNRQf5JQiZLCWU04D5MMA1DzkSUzKNChXaI0eh/yR
	UWR820/tw6j+hNgQVdGAKv8zEv857zBtew6cznKluoVDYIkUbbAVdMl+N9zbLp+pvZpbvoDmDOF+j
	dbM1unbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAMU-0000000EN0t-43SM;
	Fri, 11 Jul 2025 09:48:10 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Hh-0000000EBHm-0svt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4hDZoIQxIbXd6WlsC6cZSw5cAAfuW34VyJGhlqXRNQ0=;
	b=F+qwGLrzwZTC82LcvCyG0NANA+ERaJScJnpa+YsMeIBjfY2n41gctWFOs3G8cs
	5L8mevoj/qjd9RTy76xKi01G51cIXI90xFWkb3YYkiYIux57TzsrZZeb45IuofV5
	s+EL6n7Drr0R2UVjA+Ii2L0KEHFAROUoRNGJFyFSTPcP8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnf52azXBo7nFSAA--.5528S3;
	Fri, 11 Jul 2025 16:38:52 +0800 (CST)
Date: Fri, 11 Jul 2025 16:38:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <aHDNmVE23O4V4rqJ@dragon>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: M88vCgDnf52azXBo7nFSAA--.5528S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFWfur48WF43Gr4fZr1rtFb_yoWkurXE9F
	y8JryDCw15Aws7Kws3ZF1rX348Ka18CF1aqryftrnxX34Sq347J3ZxAr48uF45WF4293sI
	vasxtF4aqw1IgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbQeOJUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhzQNmhwzZyCeAAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_013911_540173_64E545F7 
X-CRM114-Status: GOOD (  14.10  )
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

On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> AIPS5 is actually AIPSTZ5 as it offers some security-related
> configurations. Since these configurations need to be applied before
> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
> be their parent instead of keeping AIPS5 and adding a child node for
> AIPSTZ5. Also, because of the security configurations, the address space
> of the bus has to be changed to that of the configuration registers.
> 
> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
> missing 'power-domains' property. The domain needs to be powered on before
> attempting to configure the security-related registers.
> 
> The DT node name is not changed to avoid potential issues with DTs in
> which this node is referenced.
> 
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Patch 4 ~ 6 dropped from my tree due to the regression.

Shawn


