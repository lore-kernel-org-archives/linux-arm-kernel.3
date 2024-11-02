Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA90EE677EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWJwQWlc5Mm0fBuMtrIwZFuvP9vMnmn7fQEr75MviHo=; b=jAkvsAybVflllivcqy9S7WEuvx
	mvnWNmMvYNGgxgBNnzAFCaULKNOl6UpjFR3tVkZ0T0P1sxrkGOy6xX6PhzDIxBWfHQISp7bNWPcEs
	334i2a9YQ4816ptrbjeEYX+WmUhLhqaT4qqpHRbemH7Ozh1cSlQP9weptnd5L0rRCSCoZtvHzilnX
	7lVnJwFYBGNuf1IF2j6l1TbtX1PUeA2OGnO5ojYMQhlIFc0dzC1GutWXg0zKKVkKlfl08IoYs/Kjx
	d8AofwKiIKjMUEJeImP1SZ1SmTzTOP+9k3JomUdPyKY2uAEjRj8JknV4IC5JVWZXCkj98N72fBg/V
	QZ3rz0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t785Z-00000009Bc7-0CI9;
	Sat, 02 Nov 2024 06:58:25 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t783C-00000009BNJ-24IK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 06:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=zWJwQWlc5Mm0fBuMtrIwZFuvP9vMnmn7fQEr75MviHo=;
	b=XjSRwUtLoywjnMEZg+f5SaWj6KOJpvT+cNKQ/ZXEtLfWpzsZvnKxq3rR4Rhlxj
	PfyuItJJxF7pEhKXbVEOFIs1xDQLtR6yEVMO7zhx2DG2RH9INREgFGmqdEGRwxES
	VKEukCZc4fgA+e6qLFBNFPrLPqT3H9Dg8Fc4q08B7h7I8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3csTwzCVnHEV5AQ--.14992S3;
	Sat, 02 Nov 2024 14:55:46 +0800 (CST)
Date: Sat, 2 Nov 2024 14:55:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: imx6sll: Improve gpc description
Message-ID: <ZyXM8IJJy6woQRzj@dragon>
References: <20241028124545.72652-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028124545.72652-1-festevam@gmail.com>
X-CM-TRANSID: Mc8vCgB3csTwzCVnHEV5AQ--.14992S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzhL0UUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEROLZWcliaGP+wAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_235559_023492_7C316E54 
X-CRM114-Status: UNSURE (   7.86  )
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

On Mon, Oct 28, 2024 at 09:45:45AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to fsl,imx-gpc.yaml, 'clocks', 'clock-names', and 'pgc'
> are required properties.
> 
> Describe them to fix the following dt-schema warnings:
> 
> interrupt-controller@20dc000: 'clocks' is a required property
> interrupt-controller@20dc000: 'clock-names' is a required property
> interrupt-controller@20dc000: 'pgc' is a required property
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


