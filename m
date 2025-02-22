Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5113C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WsUmyuRPcbB5IqUP9yGlRIPUiXsRxJ+yOeFKDF2Uhc=; b=0AJqTUcZ32DLAnllNBK5+zxhU6
	xK8P9rBkFDmFFyh5RxvNuX9vG1haQ6DbpQhLSwMEiY1g6pPwJPtWog+wZCMW5M8hxqXs090WTAxfQ
	VN4xudqBORDZjTEQaE1T46c7cI6B27GS5OxkFdTd6QzYZl5VrWRnBMlJdjj6BI2kPTsCQJH/CZIao
	bbPBwm+E0KberAtx2hXQsYhGOTWiMLJfq3aDV6SjSfJ5PWhFmdCte29iiZs1s+jxvTbcA8jzbTHLa
	3p8ooJiFW+9ciWgZFmvMfRTo+uORzdrZlCJmGTlD8A2pf0RDi+QauGv9f0QHgxNc0ykDmdg+doCF1
	pmRehn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllUv-00000007hGp-2AMi;
	Sat, 22 Feb 2025 09:08:33 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllTR-00000007h3l-1PVf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5WsUmyuRPcbB5IqUP9yGlRIPUiXsRxJ+yOeFKDF2Uhc=;
	b=jQrp7i0fN7LcLmrMQgBE+aDL+TzGDL6+mkUjdKX1gLw5dJJ0X95rplCpiOAFYB
	KtNXh235hWYK/I9jdfqurJosG5PP4+sHT6Ay0vnCa0n5wkB0Ifqnr4UWbX92pXjm
	jHo25K/tBNu2b3j6B+LiluLeq1Yle5MPOX5zT8Qo9BWHw=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgA3fu6bk7lnFOKNCQ--.22045S3;
	Sat, 22 Feb 2025 17:06:36 +0800 (CST)
Date: Sat, 22 Feb 2025 17:06:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm: dts: mba6ul: change sound card model name
Message-ID: <Z7mTmtEIKRlQ9cpF@dragon>
References: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
 <20250120132503.556547-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120132503.556547-3-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgA3fu6bk7lnFOKNCQ--.22045S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr43uF43XrWfWw48Zr1xuFg_yoW3JFc_AF
	Z3J3WDJws8Za1rCw1F9r4YgrZa9ws7XFnrGr13WwnxX3WFyan5GFs0qrySyw1Uua90g345
	Cr9aqw4v93yjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eHq3UUUUU==
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQj7ZWe5h8snTQAAs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_010701_754866_A6B8A10B 
X-CRM114-Status: GOOD (  10.59  )
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

On Mon, Jan 20, 2025 at 02:25:00PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> The card name for ALSA is generated from the model name string and
> is limited to 16 characters. Use a shorter name to prevent cutting the
> name.
> 
> Since nearly all starter kit mainboards for i.MX based SoM by TQ-Systems
> use the same codec with the same routing on board it is a good idea to
> use the same mode name for the sound card. This allows sharing a default
> asound.conf in BSP over all the kits.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied 1 ~ 3 with changing subjects "ARM: dts: ...".

Shawn


