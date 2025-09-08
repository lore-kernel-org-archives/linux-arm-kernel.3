Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63667CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFP29cNly6YMrOfoT9o+KWSTBUwmoAs9nNafqPy7vMI=; b=QzZTXSM70ibSnqraB5zNmkyqQ6
	nXHJlfolsr3CSpZAKtDOYzPoUKOjY411qRZeVBis7x+GcGxzbigcKu9xzKR3lJFY1x3zo4OZXeUJk
	PKJnsYB5Qw9ebjsIzm4Z1xgJBIop/D0TilCe9VpsSeX7Zw4j9ETq2gldWFje9UiEl8gtwYCagCB5r
	f/3G06hhtKt79ECUBml1Tgu2r/ybn1kVk5RBmROb0HW5VHBP1sSdeRFhvd4RaI2epPLb5GCz1tVul
	1keNTauXJWeSKj6bYmN/bTpohQvmDXJCe/tBopqXJ0dyH15No/k/syn1hhWCWGlvF4OXubt9Uc1CG
	S2uSmZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRuW-0000000E5UF-2RF5;
	Mon, 08 Sep 2025 02:47:16 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRrg-0000000E4t5-3oQx;
	Mon, 08 Sep 2025 02:44:23 +0000
X-QQ-mid: zesmtpgz8t1757299367t8a4b77a0
X-QQ-Originating-IP: kDY0/8+9nALfx1XqnlgO5eSHKtE512wTM2GGkuQcJPg=
Received: from localhost.localdomain ( [183.51.121.90])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Sep 2025 10:42:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9255924790218013141
EX-QQ-RecipientCnt: 15
From: Kaison Deng <dkx@t-chip.com.cn>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Wayne Chou <zxf@t-chip.com.cn>,
	Kaison Deng <dkx@t-chip.com.cn>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT
Date: Mon,  8 Sep 2025 10:42:45 +0800
Message-Id: <20250908024245.1005875-1-dkx@t-chip.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2744084.BddDVKsqQX@diego>
References: <2744084.BddDVKsqQX@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:t-chip.com.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OEnzgNnS40p5aZaK1EGTl3Mj98tsGfv1ttjfuvKpkhdgicvHnivZHaS9
	oEazUl6lZTf+cZbKoxvCjopzFLNVmiHEKo30rujhSAMiJ3xdqZl/yJ6d8ESu5C/+1IAgy35
	sz/Sr32KuFaBIutErgHGK7IDoAcqFUHmQ3SNJe40rfC7yzU1Q6BfeHfC9Sg4ce5psMo+jSu
	fshjBvR28JCFT0ZTbm9oBpgVUF2CBWRfzVDUjpzdGxaximAtxlhp94nMw2Kfj1ByRJ2J8iR
	M20vnIP6Sp0dayClYncRM8dsXrkQfj8WVOxQEGJHNRVuMdg/dmUONRxvYg2c6B4Fsk7Ds+z
	ERygAH7hBZDdvJPPfCeyaCMgVEEaiVKBzadv1TKhefNzAZOwlNtmy5gZmYxxqS0TcXxa19E
	uz/rSwLNDpiFW2QhhEf5PFZSkLiTu4aly5o7+PxV9cZFxMHilebFGN8zwHmUuumgo4FUiIQ
	RBebV4L/KE1LaU0s4wHBpqsgkRZt9q5gcrPQzabiz3y//z6wyScE0iXhS9OI3a0BVbFgUDV
	5CRwXiyD0zzyAxVvIadN3R9pAzJAw0tNOsuulSWpDne+XFjakx4HLwqaJ33wWQA8V9erPCt
	/gfLUf3AKWNcBBlBi/PNfI7CgX6HYE9D5dAt0IBFfsw63H/SVRnJHDJvF6LSwuWNs40KXud
	zNP0f0atPZrUjTJZtdh0/XzuTcb4PkvRLd+RXF+NX0Z6s87kA6NQ41rn+4l8Q0MoAt4fxnc
	c2+zuc/pFovo+YYiGYMbZPKKzR0WDHG7ER0wB+dIzYE65RKNREdplFON1CzDqmunuqpnnWC
	Cu449tS38h2jqCv5UbhUmjCuO9/mWQKXCCsLqru7K2hboWFWeXgVFPz6oInZizurqmasWdn
	syWwvkNXTyDx5mIKQsY+MiIhzz849ewhTKZ7ECcu+NGGiH7pcuj2VmW1wH2G7328olKl08Z
	yH6UNlqtzM6L1nUKybEIAAUUu9cMEw8fY+IXwE7K5s5ngoRi7PswJcb+Zlkhz30xA+vVAOi
	gLo4JMYLslJQMiVgWAOW9mdNkv3l+hfQduFxvomRO1d2i2GgcGI68TwLs67uRsIdLRfL4CV
	QmtkG/uFLgSZHfOZGX/q9eJAxWKRKpLNskyfKk8NoWdB+CvP0vhsxftKReA20kYAlPILdte
	Oir69RKrYI7K3LEdQnLvQUkdzw==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_194421_593878_AC189D53 
X-CRM114-Status: GOOD (  14.84  )
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

On Fri, 2025-09-05 at 11:19 +0200, Heiko Stübner wrote:
> Hi,
>
> Am Freitag, 5. September 2025, 11:01:15 Mitteleuropäische Sommerzeit
> schrieb Kaison Deng:
> > The Firefly ROC-RK3588-RT is RK3588 based SBC featuring:
>
> On the webpage it is unclear about the soc, both rk3588 and rk3588s
> are
> mentioned?
>
> https://en.t-firefly.com/product/industry/rocrk3588rt
>
Is rk3588. This webpage is incorrectly described, we will correct it.

> > - TF card slot
> > - NVME 2242 socket
> > - 1x USB 3.0 Port, 1x USB 2.0 Port, 1x Typec Port
> > - 1x HDMI 2.1 out, 1x HDMI 2.0 out
> > - 2x Gigabit Ethernet, 1x 2.5G Ethernet
> > - M.2 E-KEY for Extended WiFI and Bluetoolh
> > - ES8388 on-board sound codec - jack in/out
> > - RTC
> > - LED: WORK, DIY
> > - BTB connector for PCie, UART, USB, CAN, SARADC, GPIO
> >
> > Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>
>
> you definitly need a 2nd patch adding an entry to
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree
/Documentation/devicetree/bindings/arm/rockchip.yaml
>
Thanks for reminding, I will add a 2nd patch for him.

> The rest looked pretty good on a short glance :-)
>
> Heiko
>
>

Kaison

