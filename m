Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ED9C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5AYazuPd/fcyYmxz8UgX2gUqYJg68sV7yEDZF6Ac8k=; b=g5b6wtXy6oEBRwmCCaJOwJ8K2W
	w4gBsWB55owqQ6EG8ULLsaRDehm/szroh9i9eD6UPnMNbgcfPsCtT+3L96R/ZwNRg50hkDOtYlkic
	xvgFqgbc3p5TELWvXyr+fcVIyd7XMThGXoP1cmY0JXogbrTBj0GqN+/xam4zbYZ6FZ6VzituxmSXE
	q+yeEEvwI+3Z2O1Oelr5ufRDolbjQRJNWgm8t/rPfM2Akw4Rlir5sDsd7hWYnjXoM9cDXmE3YSdFY
	2hGow9SxVT1L7P/8sNCX0d7sUWcNsKyMhm8VbQnUA5nq479Yd3yR9rWMV1bckSOdOvRvXib9vuD16
	lNccWZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDR9i-00000004O9p-1Re3;
	Fri, 09 May 2025 17:05:02 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOjI-00000003wpj-19Ck
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=C5AYazuPd/fcyYmxz8UgX2gUqYJg68sV7yEDZF6Ac8k=;
	b=Z2j/FoMmM1B6nMqmxTXkyKpKI1Q23ZHbBAaxFckG0nJ2anf2wLhIBhq3YFfBlE
	0kWq6EuW1yarP2Rffn7hCp5dc8WnhHfoiVfmNkyjY46jbD4YOsE3RQ+7FZw677a8
	dZ1qiS4Bg8jLwWRYdrc1K6qCs0FI4GPdv2htUFge1Bn/Q=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3D_Y4ER5o8mGoAA--.35470S3;
	Fri, 09 May 2025 22:29:14 +0800 (CST)
Date: Fri, 9 May 2025 22:29:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Efe Can =?utf-8?B?xLDDp8O2eg==?= <efecanicoz@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx7d: update opp-table voltages
Message-ID: <aB4RONqJI4Gdf/tF@dragon>
References: <20250425091853.54437-1-efecanicoz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425091853.54437-1-efecanicoz@gmail.com>
X-CM-TRANSID: M88vCgD3D_Y4ER5o8mGoAA--.35470S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEh5IZWgd+axyowAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_072936_659422_1AA2055D 
X-CRM114-Status: UNSURE (   5.83  )
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

On Fri, Apr 25, 2025 at 11:18:40AM +0200, Efe Can İçöz wrote:
> Update accepted voltage levels according to IMX7DCEC Table 9 Operating ranges
> 
> Signed-off-by: Efe Can İçöz <efecanicoz@gmail.com>

Applied, thanks!


