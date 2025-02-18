Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E142CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3IbIwUSsGD7lBmeM/Tdl0GN6/ZnMLYvURcsbab4MgI=; b=4WRFMASQovvwSaDgcxYG5//YQr
	SFkI0Hnb6nlUv0O7T3qXK/zaeV2b46m+fNCeiwQGfP+tFSSlEYE8Ss2dtllzcvWE804nNBAZSKXsX
	aolLTUW+SiJOFLLKbVb/PLzjMFZMxgutm9iyKS3OeHn1+ofeUADcjLXX0HvLNcl44Oh8tG8PiCLPr
	arL6xIn3xUVqZIkeAAHjKjycVdt7ofbTfAuY7Pau45WI2hnUk5nqHSgtCD3ezOmIh8bgmtZKlHGsV
	C0pnJYA0ZATMX8lxzpM2YzuU5UBlrWnA7TNIfisbmUQLnlwcRuDpJjIxKRr9TUOcw/y00OLj4ffc1
	ekcIGIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFxL-00000006p8N-3pO0;
	Tue, 18 Feb 2025 05:15:39 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFur-00000006omo-1qYc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 05:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Y3IbIwUSsGD7lBmeM/Tdl0GN6/ZnMLYvURcsbab4MgI=;
	b=nuwmxyx3wQeEfAJK6INgoVlW4fxPlXxv/03B3IoRMobotyO0AtEX1mdemwfKkM
	+0AfulxCuBfEe3ArFVTMApgsOubNk2g4QHuxxegYESdW+7xvwYg42sdMKSZ6XNy2
	6WuOYWia9j1+ERM1/Zq4q0B9T/5tE7MltIhJ/lVmHAj7M=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnrgjOFrRnV1AjCQ--.17866S3;
	Tue, 18 Feb 2025 13:12:48 +0800 (CST)
Date: Tue, 18 Feb 2025 13:12:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mn-bsh-smm-s2pro: Remove invalid
 audio codec clock
Message-ID: <Z7QWzlQm2NVM+skd@dragon>
References: <20250106165116.2093458-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106165116.2093458-1-festevam@gmail.com>
X-CM-TRANSID: M88vCgCnrgjOFrRnV1AjCQ--.17866S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUs_OzUUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBz3ZWe0EhkQVQABsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_211305_794057_D5F3C53D 
X-CRM114-Status: UNSURE (   7.37  )
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

On Mon, Jan 06, 2025 at 01:51:16PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to ti,tlv320dac3100.yaml, 'clocks' is not a valid property.
> 
> Remove it to fix the following dt-schema warning:
> 
> Unevaluated properties are not allowed ('clocks' was unexpected)
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


