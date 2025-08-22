Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9616BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdfAXE8MQUA9giWM1FSD6QrutjDX4S2ZHQRU7Dxu480=; b=qgYylyxjLaia2lqI+KcDscVr8f
	qVXYm8P45tivHccSYJGYz7It1OOgfs3wH8hiUgVhAlyXJRmdFOodvtHA0WX7H1xrA/+0HyNSQP7lN
	wJ9TSzmw2Gfh5zpKgXCdsaDgUmRTEgJnE8y6HNBYWjpidAjqI/jruz3xSdQLgP/xubJ6wSh6EIMM1
	UMNNgOtVJntpupSFHcOFb9xTTjFRTMRsFcGQzbS1qQ5lz7nkI1TpvlMuAL46JRv7JyHilr/jc+IlD
	JSR176MwpvRO1eXlD2d+Ojv13gYxxlWjvUBtTkT71+ihgIfYoxTD0ZZw/JWwQGJydIvkVjOuAZBm7
	fF+9GLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTs-00000004LWj-18sz;
	Sat, 23 Aug 2025 08:20:08 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOGR-000000024s3-0t62
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YdfAXE8MQUA9giWM1FSD6QrutjDX4S2ZHQRU7Dxu480=;
	b=lC6i4wG2QI0Bkc4laFss0qwLCocSgyzJoUWgpAhSe8XPwmcXUKHXDM4TscddvM
	yaMyX90jzjlB2Tqcmsvhxat2DPHp8Vt0wki82z6ajwtyBqaMBwXqhyOwikxMC99o
	3/JA8CHLRPRRWltW7bQixXte3WFWWXYFDYUHOvH6/SFQM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAn_IcNO6ho_I0cAw--.16415S3;
	Fri, 22 Aug 2025 17:40:31 +0800 (CST)
Date: Fri, 22 Aug 2025 17:40:29 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/4] ARM: dts: vfxxx: rename nand to nand-controller to
 fix DTB_CHECK warnings
Message-ID: <aKg7DYRXwXFJgsLa@dragon>
References: <20250819-vfxxx_warning-v1-0-080930d8e1ea@nxp.com>
 <20250819-vfxxx_warning-v1-3-080930d8e1ea@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-vfxxx_warning-v1-3-080930d8e1ea@nxp.com>
X-CM-TRANSID: Mc8vCgAn_IcNO6ho_I0cAw--.16415S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU29NVDUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgqxZWioJsE0rwAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_024051_553380_E2CDD5B1 
X-CRM114-Status: UNSURE (   7.08  )
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

On Tue, Aug 19, 2025 at 03:44:08PM -0400, Frank Li wrote:
> Rename nand@400e0000 to nand-controller@400e0000 to fix below warning:
> nand@400e0000: $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Fabio also beat you to this one.

Shawn


