Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF381CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Y5z/0H5fJJc4dRc+K5nieP3CrPw2M6u68DtSwXj2A4=; b=xIQR2mIfzSkod6/mTQ5oDpwYXo
	auUkX7Ys3ZGvslbpW78YpIVuxCyXCSaSXnWwa7CE5L95wTfQ8aTmuohtxo6badCnDNMw4953EpBFD
	oLjJSzDLvRAAYrJBXsGebfF1Z75PxfLADl0uGOFAvkzb/aTpz1v2/4iLJnqxhcIKfSM+0CwjKR3/K
	xEFS7BQyEW62blm6SI164s3s6KPWWGPTGZApxgLiJ3L2J++bkF4Q+oBKnysdlq9iwtmYXo8WmQVL+
	cWMcQJ7LNIzyDnotQpHYB4uAx8c1s524ihJzUDzmKtwAaL8RJ3/mx7v8hAzJ5Bir7r2ALv90rsApP
	StL3nE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPrB-00000002Ig1-10Mz;
	Fri, 22 Aug 2025 11:22:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIGk-00000001MPm-3yU5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 03:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9Y5z/0H5fJJc4dRc+K5nieP3CrPw2M6u68DtSwXj2A4=; b=WL2nkFUfYw91rFva47SDrCC4IK
	TH+fwbmUv7H5LyduT/hI8ZRwsTy/MXmTrf1uVYqizQzkQUCYJZxnBPWceUa+isuP5zYkvzyrs3nh/
	NVbHMlMp4GMgH7bwvviHe32lZWVawBNTt5hztCNiJg67hH+sxs07yLD0tgHTXtFvcZZZkrLoNcdk1
	PI920WtXJI06dJj5iH/dfkk53y5IhdNY+0fnQY5BC4uCgWfVX8sA4kMMwYpxJU1HyIQ49QnAA6nbF
	TzRiQ8EhDGKVwJPfFdrZxJ67BxAG6Va3rxf9BWcMWYKoUyi4PKd0M+DadhdzJyQRliXNLUkbKGLHs
	9YcE0Jdg==;
Received: from mail-m16.yeah.net ([220.197.32.18])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIGg-00000000mVf-2RvW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9Y5z/0H5fJJc4dRc+K5nieP3CrPw2M6u68DtSwXj2A4=;
	b=b+F0ocoUgiT/Md9GnxolGWs1nmad/3q4h/fpptL8K/uxxdKpuCEVVd7Jyw0QrW
	AhiZgN3GOfcCs03MhJjaRisD6xWaQLtDjGKhMJwjUUeiXoXP9lWUVNUnDxYwCXmI
	g/3N+7FCo/3KtpM1TUL48BGbJyfKpCotJR5oefyBgdfjQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnHvf74KdoHr0kAw--.6236S3;
	Fri, 22 Aug 2025 11:16:12 +0800 (CST)
Date: Fri, 22 Aug 2025 11:16:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] ls1021 DT fixes
Message-ID: <aKfg-nqgbsBX-i2y@dragon>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Ms8vCgDnHvf74KdoHr0kAw--.6236S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4rZrW8Gr1rWw13uF1kAFb_yoWxZwc_G3
	ZxG3WxAr1UC3yjyr45Was2vF9rKr4q9r43GFy3CrnxJF9xKF43Was0y3W5uF1UZFZavr9r
	Jrs5CryjqryavjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjahF7UUUUU==
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNB174Gin4P0QdwAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_041643_290729_4234C220 
X-CRM114-Status: UNSURE (   6.47  )
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

On Fri, Jul 25, 2025 at 08:13:25AM +0200, Alexander Stein wrote:
> Alexander Stein (10):
>   ARM: dts: ls1021a: Fix gic node unit address
>   ARM: dts: ls1021a: Fix qspi node unit address
>   ARM: dts: ls1021a: Fix sai DMA order
>   ARM: dts: ls1021a: Fix FTM node
>   ARM: dts: ls1021a: Add reg property to enet nodes
>   ARM: dts: ls1021a: Remove superfluous address and size cells for
>     queue-group
>   ARM: dts: ls1021a: remove undocumented 'big-endian' for
>     memory-controller node
>   ARM: dts: ls1021a: Fix watchdog node
>   ARM: dts: ls1021a: remove property 'snps,host-vbus-glitches'
>   ARM: dts: ls1021a: remove undocumented 'big-endian' for
>     memory-controller node

Applied all, thanks!


