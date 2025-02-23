Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77E3C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 06:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMxrYIMRdffn0+3ksCTpUd9GeGRHP1IsZ6oijn2fKfc=; b=sgvmHMoEns87HmXyUZNgp9p7c+
	EduuwewOVhpJ3Sm7gmhUJRxSczGaCzyMpwg+N58jXfHhMc0Ory8AVy616p3FKDXaixRadZywQupGi
	fUbhOB/kYaPn3IZ3Gxo/d1dd6K7spB0cxYeK2EI3hXy+2XE7kIYbVjCULwiKwkzkpOf00NxBZgHC8
	l0DWBLNF9LdqZZj+GMTw2IcH6ofPEdUWYnmvznXDNo/Z9BwOPD+BLSQz9mJfb4R0QSqB/b0kVpf9T
	I2nRgVkfRzuZUYcHRkTzcZoJwdkYG2n3P/omgheniGBFXJtlQ4re7tvZM2LB7Lingr0WuOQ/AYTtZ
	sKLTQ2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5kf-0000000AX54-0AQt;
	Sun, 23 Feb 2025 06:46:09 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5jB-0000000AWzC-0nKO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 06:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=mMxrYIMRdffn0+3ksCTpUd9GeGRHP1IsZ6oijn2fKfc=;
	b=hCDz1th11p8FGE1eTrt56lAUN2gq+sh+DFtDU8XVl512YTg5YECFSQjSyRAzCg
	CJqIcRX37QtlZP7wJZAn6ng/9/8t8gS7eKQU7W/g/3OuOtwMWnSBccGgbEvP7rbj
	gvP1UiI9np7QkiRBq5MJxVGbA4KVZWrcDIr0lDxVAGYC8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCX2_nGw7pnbR_ICQ--.24661S3;
	Sun, 23 Feb 2025 14:44:24 +0800 (CST)
Date: Sun, 23 Feb 2025 14:44:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	robh@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, lukma@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH RESEND] ARM: dts: vf610-bk4: Use the more specific
 "lwn,bk4-spi"
Message-ID: <Z7rDxj4Lz6Gv5I1Q@dragon>
References: <20250203120511.996058-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203120511.996058-1-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgCX2_nGw7pnbR_ICQ--.24661S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKry8XryDWw1rtF4UCFWxWFg_yoW3Jrg_AF
	n5tryqkFWDXF1UW3sxJFyrtFW5ua1xu3y3Xr93tr1qga95urn3WFyqvr13Zr4UZ39IqwnI
	ka4Yqry5AFnrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Mmh7UUUUU==
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERj8ZWe6ksyM4wABs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_224437_601983_0C764497 
X-CRM114-Status: GOOD (  10.45  )
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

On Mon, Feb 03, 2025 at 09:05:11AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Currently, the compatible string used for the spidev device is "lwn,bk4",
> which is the same as the board compatible string documented at fsl.yaml.
> 
> This causes several dt-schema warnings:
> 
> make dtbs_check DT_SCHEMA_FILES=fsl.yaml
> ...
> 
> ['lwn,bk4'] is too short
> 'lwn,bk4' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
> 'lwn,bk4' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
> 'lwn,bk4' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
> 
> Use a more specific "lwn,bk4-spi" compatible string to fix the problem.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


