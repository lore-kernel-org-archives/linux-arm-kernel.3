Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F76CC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 00:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QgXkkNdHre4C26c9GV+NpL0QV5WDefYsihE2tDLo6E=; b=AHcL8oMZGjs7gSFSEVU6smiaaO
	Jrf5e+D+3MyK8QUQ6G8FTA9uJ98uxeFOqP5fTiJOjeTSO9C+6bncKvF2jrCS8CmQQndl9dcJixsMd
	0RVRX3sHt5WimM3ORtAbvQwYGz8Po+uyEfD2ygol/phh3BHlrfG5g558lUouEkqkUc4i1QJjVSM7T
	Z40D0eO73QHattePJxUMUTyqnt2m+ChGQy4HK1RnICy75dP0pp4et/Q2LLUNzKpr0dPLTUmPxiVlN
	JXCJddmRGP8pfbKZqeopfgaRUUSeKCF34NA5ui2lWwkp84gp+dQCjD/VyAGDtq6BbxresBERgTfX9
	JaQlhcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7MZD-0000000D2eE-2xXL;
	Fri, 18 Sep 2026 00:35:03 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7MZA-0000000D2dH-3lB2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 00:35:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1789691700;
 bh=8QgXkkNdHre4C26c9GV+NpL0QV5WDefYsihE2tDLo6E=;
 b=gMG6wtvqMKTyhBxYmDYbtBzGs+48odI7aJ98gEFJSOaQUNM3nPdDmOqqwFULzf4Go7aDmobPf
 8Z8lytX1QsM+OJmWGfIRbkhJAUUdm2XZnFTBCTb22mppBLadwiEXp/39thPzvM0Hh98syCefIIs
 S3C5P5MVfPP8HwEQyMQLbLzNNqwLw1EA1ATj+k/4FAIMsoqdL5F2LzkaMt2FOEyBqrilPHB5Bqq
 Tz3ZoUPk8cE8PqSXMxEr8TsD4OwX0Z7YsoDic5iwDOXi7NXZExL3Aqc6J8uR6WA1elPQlWeEAXT
 xQWA/ocMSzQPYjVbvJaJ/lvs71y84WKJOL1mEjyNPT9w==
X-Forward-Email-ID: 6aac871042fb3e762f6d18f9
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Thu, 17 Sep 2026 20:34:18 -0400
Message-Id: <DLI0QTP0NUHS.DAFYGACKWKWO@ubuntu.com>
Subject: Re: [PATCH v4 01/20] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michal Wilczynski"
 <m.wilczynski@samsung.com>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Lee
 Jones" <lee@kernel.org>, "Andy Yan" <andy.yan@rock-chips.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Emil Renner Berthing" <kernel@esmil.dk>,
 "Hal Feng" <hal.feng@starfivetech.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Dominique Belhachemi" <db@domibel.de>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <mfd@lists.linux.dev>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maud Spierings"
 <maud_spierings@murena.io>, "Graham Markall" <hello@big-grey.co.uk>,
 "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Chaoyi Chen"
 <chaoyi.chen@rock-chips.com>, "Joshua Peisach" <jpeisach@ubuntu.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125@eucas1p2.samsung.com> <20260915-jh7110-clean-send-v4-1-f0e4fd6f2cc8@samsung.com> <20260917-mutant-chamois-of-competence-46ca77@quoll>
In-Reply-To: <20260917-mutant-chamois-of-competence-46ca77@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_173501_153825_38DEF05E 
X-CRM114-Status: GOOD (  19.53  )
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

On Thu Sep 17, 2026 at 2:51 AM EDT, Krzysztof Kozlowski wrote:
> On Tue, Sep 15, 2026 at 05:32:09PM +0200, Michal Wilczynski wrote:
>> Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.
>>=20
>> This device is a child of the starfive,jh7110-hdmi-subsystem node. It
>> functions as both a PHY provider for the controller and as a clock
>> provider for the variable pixel clock (hdmi_pclk), which it generates
>> from its refoclk.
>>=20
>> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
>
> While I appreciate other people looking at this, I don't think review
> here applies. It was a blanket tag, given to the entire series, with
> exception that it is from newbie, thus I want to ask: was this binding
> REALLY reviewed by Joshua?
>
> Are the rest of the patches actually reviewed or just "looks good to
> me"? I see no comments from Joshua on v3, v2 and v1, which is usual sign
> of doing review.
>
>
I commented on v3 saying that I would test if I could. I don't just
throw "Reviewed-by" on everything I look at.

If anything, I've been trying to be more honest in reviews, and only
review ones that I actually care about[1].

If reviewing patches isn't a good way for newbies to start getting
familiar with the kernel code (especially a NEW driver), then I don't
know what is.

And to be clear, I'm not using a LLM to review. I am using actual
intelligence. For the JH7110 PR specifically, I did actually go through
and review each commit, because I wanted to learn what was happening
and why. Actually, that's why I asked where the data sheet was[2].

So if you really want to, drop the Reviewed-by tag. And if it makes
you feel better, I'll leave the series alone.

-Josh

[1] I won't be reviewing PRs around devicetree since I'm not confident
(or frankly, interested) in it at this point. https://lore.kernel.org/all/D=
L94TU52KBMO.2HAKJMJXV2CPE@ubuntu.com/

[2] Michal giving me the hardware info:
https://lore.kernel.org/all/071901ef-57f3-456f-af5b-a8c99a0a7dd3@samsung.co=
m/

