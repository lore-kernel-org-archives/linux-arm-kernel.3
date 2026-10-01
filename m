Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D455CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGgCN/UyYep39hXBcQSCcp4ph3CLbo3ezOswYP7AJS0=; b=Vm2bnrb0hhhpmK8a/hzz6kprMJ
	7KK63V+KsmmJzwz5bV4unLgPeCdrkadBdQ28E/QESQO3IxZgJLv2LX9ILjM8HP9rrlitNY9UoHVUI
	dBCBBy5NudCOVSkeFxCCdG9jFM1/yqEBWdFPMrT/oS8NGzcOqLW/oYrnE6s4vi/S+MBRJaAHrzKiV
	K7/V9JgiYeNOfFKaU1NHLyrtpamzrZYhc8TRx8h180ea9XM3vaMEJ3oM5edrcYSTnXmjRXh7NXbWT
	KKwWYDvRoUzlcrOiHRCBnsOQCYTfvyG9GwbaDz/zVRnpZ2wZMxukL+068pBueXXEtWNEzuKTg3SwK
	xxxZoyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGer-00000009D6a-0nty;
	Thu, 01 Oct 2026 13:17:09 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGem-00000009D35-2M1b;
	Thu, 01 Oct 2026 13:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=gGgCN/UyYep39hXBcQSCcp4ph3CLbo3ezOswYP7AJS0=;
	b=otoEIY0DN0sd7suy6dNZvYK2DQydOhChQaeoy//zBMzEbGaWTPKa+FzYBfLsIu
	OGNA5b8VC+bUBQ5nIMJMfx5mbH6jC/VLkVxUAVvznsPTY2XyhmN+ZA/c65W37tkm
	Q8z7LFnxHNDVYycYm+6KVTDhLzTogD1QcdqBFpvIodAq8=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Date: Thu, 01 Oct 2026 21:17:01 +0800
Message-ID: <179086062104.25951.4172888328376175948@163.com>
In-Reply-To: <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
References: <179051708448.31632.16350193430088134671@163.com> <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wDXvzxNXb5q1QFnBw--.45058S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr45JF45GF4fJryDuFy7GFg_yoW8Cr1fp3
	yfXrZ7Gr4DKrW8Za97t3ykAryxZ395tF45WFyjqrW3Cwn8WF1ftrnIkw1Yk347Arsaq34Y
	gFWY9FWSkFs5ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR3ku3UUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+Q20Imq+XU2mUAAA3Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061706_043596_09914513 
X-CRM114-Status: GOOD (  10.39  )
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

Following up on the phy-mode point, with the measurements I promised.

I ran three 15-minute runs at full rate in both directions on this board
(rk_gmac-dwmac + YT8531 PHY, iperf3, 900 s per direction), rebooting
between runs so each configuration was fresh:

  mode          tx_delay   rx_delay   board->host    host->board   retrans
  rgmii-rxid    0x2f       0x00       922 Mbit/s     939 Mbit/s    0
  rgmii         0x2f       0x00       922 Mbit/s     939 Mbit/s    0
  rgmii-id      0x00       0x00       918 Mbit/s     939 Mbit/s    224

The MAC error counters (rx/tx errors and drops) stayed at zero in all
three runs, and the link came up at 1000 Mb/s Full duplex every time.

So plain "rgmii" with the delay added on the MAC side behaves exactly
like the rxid form, and the "rgmii-id" run - where both sides add the
delay - is the only one that shows retransmissions. That matches your
point that only one side should add the delay. I have changed 2/2 to
phy-mode = "rgmii" and dropped the rxid form: the RGMII traces on this
board are ordinary length, so nothing in the PCB asks for an extra RX
delay.

While reworking it I also addressed the two things sashiko raised: the
enable-active-high property is now present, and the codec node no longer
carries a clock-names property, which everest,es8328.yaml does not allow.
The codec compatible list is "everest,es8388", "everest,es8328", as that
binding documents, and dtbs_check is clean for the node.

I also removed a stray phy-supply from u2phy0_otg, the USB 2.0 PHY of the
USB-C OTG port.  That rail is the Type-C VBUS and belongs to the TCPC;
with the PHY holding it enabled as well, VBUS was powered from boot and
the port never finished a source attach, so DisplayPort altmode never
came up.  The full change list is in the v3 cover letter.

Thanks again for the careful review - the phy-mode explanation in
particular was worth the rework.

BG9OXA


