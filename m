Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87F7C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QIQAC1Squ20uW3BFDWzJ9EWESY3KXzBPAIvtArdRqI=; b=Z6BoayS1AxYZ1s4YVQ0p/JUN9a
	NIJyaKy7ByUiaQxIRZZj1PO9MyLVoqRylRQ4VPP+ipoY+bxVtyONs5Ij2+e/ULwFAZQh2L3pzPgu7
	QtOa8iPiuFQ9UqIcUe461GPayDhfPsTKIDDNKjIv9R3k33HGVFuM+y02GrpkK0Ib65Lo/djHqyU97
	00AChgkVKjtlZ7WMdJq7mSMpmQr0+M/ZxcEOQujLR/nYl0BZe8wihyDZmmAU8EM+RGbxRqqI2+eAD
	mZ7lf4ZtjfxBUDtBYWJJ4cDljcCvJlx5tjgvptcICbK9BonY7Gd3wGVayq6ecBRGo1hU6iQXcTHM9
	+pnIQI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBA38-00000000W0J-1VOX;
	Mon, 28 Sep 2026 12:01:38 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBA34-00000000Vxy-40GS;
	Mon, 28 Sep 2026 12:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=8QIQAC1Squ20uW3BFDWzJ9EWESY3KXzBPAIvtArdRqI=;
	b=eA7DeMMZQP+DiJNLwCRQg1gj9L4jE43tfQSNsBRe6OzEzkeW4kJKPGX0mUfCns
	xnlmU1aNEpX/1GfkQBYJJFEI202R8A+VYLF1cvOlTA2tjrrT4srBTyUkbHzGjcvQ
	Yb7W+VIF1A88X5ZLLRWpyyrzB8X2fJNHfIwtsULNl55fo=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Date: Mon, 28 Sep 2026 20:01:31 +0800
Message-ID: <179059689121.26126.16396827799983991795@163.com>
In-Reply-To: <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
References: <179051708448.31632.16350193430088134671@163.com> <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PigvCgBnTaobV7pqauFxBw--.30903S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWUZw47WF18tw4UKr1DGFg_yoW8XFyrpa
	y3trWUCws7tw1Ig3s3Ar48ZF48ZrWfKas8CryvgryUAay5K34akr1jgrs0q3WYkws7XFyF
	9r4UWas5Ja1kZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRSD7-UUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+Rslkmq6VxvoYwAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_050135_389872_1A02DD22 
X-CRM114-Status: GOOD (  13.21  )
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

Hello Andrew,

Thank you for the review, and for the timing guidance - you are right, and my
apologies: v2 went out far too soon after v1. I will hold off on any further
revision until the discussion here has settled, and no sooner than 2-3 working
days. I have also disabled the automated reminder job that had been set up for
this series, so nothing can be resent on its own.

On the phy-mode point in 2/2: you are correct that the value should describe the
PCB, not work around a MAC-internal delay. The RGMII traces on this board are
ordinary length; I used "rgmii-rxid" only because that is what the vendor BSP
(and many Rockchip DTs) do. I will test plain "rgmii" on the hardware with the
current tx_delay/rx_delay values and follow up with the measured results (link
state, throughput, and error counters), and drop the rxid form if it is not
needed.

If you have a preferred way for Rockchip boards to express this - plain "rgmii"
with the delays in the MAC node, or the delay masked in the driver - please say
so and I will prepare it that way.

Two other things I should mention. The enable-active-high issue that sashiko
flagged in 2/2 is already fixed locally and will be included in the next
revision. And for transparency: I prepared this series with the help of AI
tooling, which did the language conversion and consistency checking of the DTS.
I review every line before it is sent, and I will be more careful from here on -
both about the review cadence and about validating the result against the
hardware.

Thanks again,
BG9OXA


