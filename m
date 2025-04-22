Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315F4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trhyNIM9mIFtIbavFty/Wnrrd5K7EkciM85AXCfhM0Y=; b=lCRSwxm3GLL/lMTMKq8ra3Z63R
	bp9sDVOa1W4tZbhxHdBpFtVf8lMO37FB/r9ZfkzY/eEwJLRAPpDtqXqIRlNjqiOlpz+/XkBtrR8Bn
	4vzthW4HDtnKKqwlWCssRrkmZZjmGQMQFUPgwQWZx6miVy9fFhmzt97p9Burf+Z2wkUXoqGgJdjY9
	kSnTfP04PmXcD6Ig7Zvg3Qr5JtTzGw4WIaBDYtZ7mnlJ/Jy9tKpfd+2GmhbYf3WUJMhjoRxBSQcck
	zJOUQheBsaz0gFfGOnyOAEMDgaLhQ3cC0ZUhupoAApofwnye61HfbtgjVh3isiQjjHiwrkUPfTC+P
	eay8aoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73r6-00000005hSE-1LR9;
	Tue, 22 Apr 2025 02:59:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73hF-00000005gWb-118C
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 02:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=trhyNIM9mIFtIbavFty/Wnrrd5K7EkciM85AXCfhM0Y=; b=enOAGrXszjGPlWkjdgAV2IGL1J
	cUKWvNoHzeo62w8rKWGXQ2/c9IsEXIKSCa5etDlfhM3LT8UDrZigfIb7iNO3RJ8RD7O3iL7Ly+d2O
	sm3V5/VkPyy9zXggcuZlzro1D7V4AH65q7y8fiQGW0KZXjDyUDtiZhZ6coZ1OFn25d8EksvkFtxtL
	ohciDMQ+szNTQC1cJb98uH/+CBsmR+xq/nQfO0sVYWpJQlo9Lh7A56w0qx27JzAJx/9EGnaXF1q5z
	AOpaiGyE6yqB+sfCdNJo0z7YCQ2irApb+PLMiJ04DYWqZSzpP6UNdUBHxxj5g+JaK7CC/0ypE3bSr
	spi0Prdw==;
Received: from mail-m16.yeah.net ([1.95.21.15])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u73h9-0000000B8ED-0cmj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=trhyNIM9mIFtIbavFty/Wnrrd5K7EkciM85AXCfhM0Y=;
	b=czg1r706O01f0jhnKMve4+UToK2y5T1nFdPfcJ53ettuM4ljIj1Phpk7/FTSJD
	RBzyEAxFjz4jdWPrnPQ7L8rb/Ci/RVyH4d7e1EI2LV3FwBdN0YPY5UkdkX+PBYDQ
	ldDWmOobM5AU3xruIhPfdqb5AvtIEU7k8NNRd50lexVxU=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3QjyGAwdofxCrAw--.442S3;
	Tue, 22 Apr 2025 10:48:40 +0800 (CST)
Date: Tue, 22 Apr 2025 10:48:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, hector.palacios@digi.com,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v3] ARM: dts: imx51-digi-connectcore-som: Fix MMA7455
 compatible
Message-ID: <aAcDhqrCthjDtKbw@dragon>
References: <20250317123109.2216509-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317123109.2216509-1-festevam@gmail.com>
X-CM-TRANSID: Mc8vCgC3QjyGAwdofxCrAw--.442S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxpnQUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB83ZWgG2pu5jgABsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_034912_129926_4DE82EB0 
X-CRM114-Status: UNSURE (   7.89  )
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

On Mon, Mar 17, 2025 at 09:31:09AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The "fsl,mma7455l" compatible string is not documented anywhere.
> 
> MMA7455L is the exact same device as the MMA7455, with the exception that
> it is lead-free. Use the documented compatible string.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


