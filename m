Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C995C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khh9GkiKSYF8ytE7q9ANWl34TwhOsAHnv4+wLwiqWMg=; b=ga/9zqlpvlMZ2ogdGceD35NsBw
	4EesjQMMXyfMGk0aWfFPuGmm7Sa4ZOMiTC0JC24/XcDUd2K5IzpFjn7bQHLS89xD3Eao8ALsUMC7F
	sXVgyPIwa5AsnDQWxODE7rndDW+gY1mSO0ImqjBx51Rzn5B1xjTjNgRDu0T4pAdbiqdFtWSw8/7Ns
	HcnyS2b+2cpuqEAX8bS+hDdU8mOFH6zVQhBdo8CE+BlJQI6oMUxJbz7nCgyqdTe4tXWIf1UBpObbc
	yxor/YNT85bdNY3It6j76Ptu/G8nEBUpN5/hdivEQILzDtFs8QKxQYNEW2GJvdWLTHDvoelBj/Wqa
	1LGwS66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQJA-00000004EOT-1pJK;
	Fri, 09 May 2025 16:10:44 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOLl-00000003tIV-158t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=khh9GkiKSYF8ytE7q9ANWl34TwhOsAHnv4+wLwiqWMg=;
	b=l82BzNXkCTxWjEoAZgW+8IwakmblZgzJRLkx3jx1WP8S7IbkG/dkkC1uQCG/M6
	sUclQziMC7ZOJOJrcZkTnv+sah5IjGrlaIkJT7pTeDwwCnUz42rXeU0D3zWTAHHs
	woN/Ni4jnHOBW6lHjmzMSnj/ash2HiEUFSQaLPwpT9MfY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXTxNxCx5oIsCsAA--.16043S3;
	Fri, 09 May 2025 22:04:35 +0800 (CST)
Date: Fri, 9 May 2025 22:04:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add
 LVDS device tree overlay
Message-ID: <aB4LcS48R/uqSPPO@dragon>
References: <20250424075000.1263138-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424075000.1263138-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Ms8vCgDXTxNxCx5oIsCsAA--.16043S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUF7KIDUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARdIZWgd+-hNSwAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_070517_681733_935B2E77 
X-CRM114-Status: UNSURE (   9.83  )
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

On Thu, Apr 24, 2025 at 09:49:58AM +0200, Alexander Stein wrote:
> From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> 
> This adds an overlay for the supported LVDS display tianma tm070jvhg33.
> The LVDS interface is the same as for MBa8MPxL so the already existing
> overlay can be reused on this platform.
> 
> Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


