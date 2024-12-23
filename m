Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE4DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 03:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJFW9oZYtsTs1Ch2dRW+VjHSMsuQGwMyD8ZSxp+PwsQ=; b=3h62jepYWvYSinDTQoZ1SnF0nD
	SoQDODqbeOJUPIevUkmhDCYaRAMOVCUxFqVkG97STgRh6FGngnvS++3RGRBBkzMScuNBIJ/TxBYr9
	qmpTtLBwrPwxK4dvM0B+TKqTyUNaeXJ2HxZL0W13xb/OQrSm2L7sNLqU4bgmhHAQfuRVtV5ph26GV
	+pliK6HCTrfp3N9NRa2gCvgv/mPusncOo09aGOB11VtE70Q2hYwE2JHsbeph/BNSNviAe9cQL5EM0
	3qcejw3WkzOsMl6e1jnyanYs81KiERhGpwFYnCDgA4Q0sXtoel1owYj9MNfXmjEwjp//ztwryMXJg
	L/xrQqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYsz-00000009FB9-3QbD;
	Mon, 23 Dec 2024 03:13:37 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYg4-00000009CEf-129U;
	Mon, 23 Dec 2024 03:00:18 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:2500:9a4a:8d89:5df0:cf6f])
	by smtp.qiye.163.com (Hmail) with ESMTP id 67eb317c;
	Mon, 23 Dec 2024 11:00:09 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: naoki@radxa.com
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: default to host mode for USB on Radxa E25
Date: Mon, 23 Dec 2024 11:00:06 +0800
Message-Id: <20241223030006.852427-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4D8217DF36191C3E+be8bbb4f-ea52-4f81-8501-ff551f54621c@radxa.com>
References: <4D8217DF36191C3E+be8bbb4f-ea52-4f81-8501-ff551f54621c@radxa.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEoYVkwZH0xNQk1JSkJCTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUlOS0tBQhpPGkFDH0NCQU4fHUtBGB1NHVlXWRYaDx
	IVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1kG
X-HM-Tid: 0a93f1752f1703a2kunm67eb317c
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDo6Hww*OjISTQMwFj4jKh4*
	Mj4KCQlVSlVKTEhPQklJQ0pLS0pIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSU5LS0FCGk8aQUMfQ0JBTh8dS0EYHU0dWVdZCAFZQUhNSTcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_190016_544481_B36AA59D 
X-CRM114-Status: UNSURE (   8.58  )
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

Hi,
> I've been using the uSD card for a long time as a bootloader only,
> so I don't know what the problem is.
>
> Do you have any information on how to reproduce the problem?
>
> Best regards,

Not stable on openwrt/lede, sometimes falling to sd-highspeed.
Maybe it would be better to switch to sd-uhs-sdr50 mode.

Thanks,
Chukun

-- 
2.25.1


