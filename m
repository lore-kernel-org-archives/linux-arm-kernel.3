Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85B5E6B242
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjoYgVMGF5dHOGsBOaliuNtTt9L/SIwKjdLYdKXPZmA=; b=YzNtGI0A1MZoybj2zVhS8SRRdF
	HP0XkmdeqLdPLhjtNc8L6I/33L8CHl3j+vTOVbEZZxsIqRKgXGSvqH7BJUxnayfVEwUnUjm3VqJei
	Krf2RF8f3wK/dU+xnn1gmrfxD8b60EPvnpP77bVPHjcBooa7u70p6dv/KBThSPVnUeYaMBC0VI+tk
	B7pgqhq3fmRnflgb1KTW1MAV5QNbZiGTjhSG8SlFdEWM8LUfGdjO+YW2jBmE9DKHaELPCEv9YN1Tr
	FcJJazgu+3EgST7gO5noS38cjDdfhnieKZda67t1ljCP5AU47WSo/4bKUfXD+t+vi3oTx4WXcpuGN
	7vRURPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oon-00000006Z3X-1Tbh;
	Fri, 01 Nov 2024 10:23:49 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6odp-00000006WS4-3eup
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 10:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TjoYgVMGF5dHOGsBOaliuNtTt9L/SIwKjdLYdKXPZmA=;
	b=CCDA4ecLAXN5DLV7fWt7bWHSjhTrvGKd2VAwGHgXaTyenV8kpYg98+xIi7+wq0
	OSOKZKjeow0MEcGSd3UqtdnZY4/m5gNvNeZMSsxt6EiTmhj8Cga+FUg2NNgM77kK
	vjNZ3ZZvzOGRGnhaZgmMPyRwDxYHJ+L6zrgoDURa51Xso=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHxFl1qSRnZUphAQ--.13690S3;
	Fri, 01 Nov 2024 18:12:07 +0800 (CST)
Date: Fri, 1 Nov 2024 18:12:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/3] ARM: dts: imx6sx: Remove incorrect mmc fallback
 compatible
Message-ID: <ZySpdcmTQDjIy5i9@dragon>
References: <20241023192638.1214045-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023192638.1214045-1-festevam@gmail.com>
X-CM-TRANSID: M88vCgBHxFl1qSRnZUphAQ--.13690S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW5tFy8Zw4kXryxGr1xKrg_yoWxArg_Z3
	ZYga1kW3yUZF1DX3ZIyrs3KFWSga1kZrWDW3ZxK3yDWanYkwn0qa4fZ3yDZrWjvrZ0yrZF
	qr1DXryDuF1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8RHq7UUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwCKZWckj-1HagACs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_031230_301595_485B94C4 
X-CRM114-Status: UNSURE (   8.62  )
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

On Wed, Oct 23, 2024 at 04:26:36PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Per fsl-imx-esdhc.yaml, the correct compatible string for i.MX6SX is:
> 
> compatible = "fsl,imx6sx-usdhc"
> 
> Remove the undocumented "fsl,imx6sl-usdhc" fallback compatible.
> 
> This fixes the following dt-schema warnings:
> 
> mmc@2198000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too long
> 	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too short
> 	'fsl,imx50-esdhc' was expected
> 	...
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied all, thanks!


