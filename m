Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF95C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNf3ovGngIu+2imVC6jh5NhzQqrcYgc31OJf+dXqycE=; b=ZMBsuCxet2ebgSy7SVoBaFdHo2
	ysXJxD4xfesc4G0HKAp0w4hryp1nt1qSPWaKxGzRpMDHeL3PFBqXxUMpFGyJDZ4Dj8XfJENkMkH6V
	/APsNBxtH3AlIKHSKpHKC7aly8XeLpi8YJdxJKMfS2sUHh21pSwq1xFirHhLiR9HquN3Jot7y9XVg
	3RHiF4pFIaOJhEm1kuglVhdu0BNCSk9uiqbPOVTGyV01FpCbESJk9SrfoaXknPRYSDJoQLOObeRhD
	qxJa9ZzxyLl7LUlgdDZTUhVQe9o7PHByM0tLHY374rGqDOqy2QLB+tYJNRSh3WKn0EXqCLRewsATU
	4HwglchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllZR-00000007hna-3qVh;
	Sat, 22 Feb 2025 09:13:13 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllWM-00000007hPN-3WOH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=HNf3ovGngIu+2imVC6jh5NhzQqrcYgc31OJf+dXqycE=;
	b=pG73TqlZWjD/lpev2f0r2Oon0FE7bKhizo3EOL4E8vmZbeMhTHho9HhElLiGHz
	TLN93grFoPq2ishUfDPsJbanYld6c4rXGeuDbAvBg+CUIoOlYjd+6Va+djVNVZv7
	I1GzMFnot5SUWcTCEyD2MDbYhmWfhVxYSniRNJzOZcTbo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAXoo1TlLlnd1N6CQ--.21701S3;
	Sat, 22 Feb 2025 17:09:41 +0800 (CST)
Date: Sat, 22 Feb 2025 17:09:39 +0800
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
Subject: Re: [PATCH 5/5] arm64: dts: mba8mx: change sound card model name
Message-ID: <Z7mUU/Rgj3Gx7g9E@dragon>
References: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
 <20250120132503.556547-5-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120132503.556547-5-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgAXoo1TlLlnd1N6CQ--.21701S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWxGF13uFW8Ar1UJFW7XFb_yoW3Xrg_AF
	Wftw1DJa1DZF4fur1Fkr4agrZa9ws7WF1DGr13Ww13X3WrKa1kGF4qq342yw1j9a4jg345
	Crn3t3yq93yjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8pHq7UUUUU==
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRf7ZWe5dcBuMAAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_011003_195631_980A4C2A 
X-CRM114-Status: GOOD (  10.88  )
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

On Mon, Jan 20, 2025 at 02:25:02PM +0100, Alexander Stein wrote:
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

I may have missed some prerequisite ones, but #4 and #5 do not apply for
me.

Shawn 


