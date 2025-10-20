Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8FBCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ek7hXcjHfSQNfshdtQ9VuzGH6TYTSrmvRDEFyQJSzMY=; b=t7n3h90X9CZtf1t9lM0hRRdj6b
	fsml/4HIKCv/0y3T0UjoUyXbtf1ACNmL3IJBAKrNPrf2oxOtc+zxkiZ5YyrFpRoBPJH9mc4tWhaTx
	nezNW6ye6nHaQBe3Esj+xAiKcLTLYrbCBQtTRsyY7n4/pgwaC8s20eNnyWBZEPwKTS/VcLB+u/txp
	xbrbqC5R9nW8CvsXz/8QFJLP1RJBkg6vQqyiCiKvzXrYcxdWZyoXJi53pJmS2aZz1ghDo0TUohPwz
	iR/laIZ6Ezz3utSA4v9vGnlWtW6esI0oN4K3YDpJrpUEYdatgjECCLiFKrZ02V0ZsLYsorB7ftk6F
	xCy1JGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmUy-0000000CehB-0wFk;
	Mon, 20 Oct 2025 09:48:16 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmUv-0000000Cegf-27xE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ek7hXcjHfSQNfshdtQ9VuzGH6TYTSrmvRDEFyQJSzMY=;
	b=mWcRVKqqug1bMs4Cgl7P9GItTyL3VXvC38rpN+vmjwC9emt/RfOm5zkq58oU2V
	8e5iF29jzuwua1M9BAW0/vuWmGimqQYPl00w804ktNcu5Ndiri/pqFJAZZUqH8gy
	AdYRCTt+6ourUYnq4VtJK1M4rM8BmN1X8uD9cmckPzSbY=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX54tJBfZoTepRAA--.25208S3;
	Mon, 20 Oct 2025 17:47:54 +0800 (CST)
Date: Mon, 20 Oct 2025 17:47:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrej Rosano <andrej.rosano@reversec.com>,
	Andrej Rosano <andrej@inversepath.com>
Subject: Re: [PATCH v2 2/8] ARM: dts: imx53-usbarmory: Replace license text
 comment with SPDX identifier
Message-ID: <aPYFSKQ3T3I4VTff@dragon>
References: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
 <20250814-imx-misc-dts-lic-v2-2-faff7db49a5f@prolan.hu>
 <aMKEF4wAeET3Ntus@stjenka.localdomain>
 <78cae034-77a3-43bc-87c1-18344d5ba8c8@sch.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78cae034-77a3-43bc-87c1-18344d5ba8c8@sch.bme.hu>
X-CM-TRANSID: M88vCgDX54tJBfZoTepRAA--.25208S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx2YLDUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgsrkGj2BUvImwAA3R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_024813_921063_AEF2F8C3 
X-CRM114-Status: UNSURE (   7.54  )
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

On Thu, Sep 25, 2025 at 06:44:37PM +0200, Bence Csókás wrote:
> Would it be possible to partial-apply just this patch? Or should I maybe
> resubmit it alone? The patches in this "series" are not really related after
> all.

Applied, thanks!


