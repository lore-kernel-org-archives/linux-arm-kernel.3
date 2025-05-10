Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5F7C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCr5/5IxGC+rjQfn/Z+wcZsRnG96mn8qay3wCAVYNCI=; b=xS5DXBPchJWcXVKhRPhq34lM/m
	67/QO/D5W/+TUlmA3HmIqXwvWia74m7W190C4GnYN0diIhzx4VWevK6BPtY1RhmIVgkVart5hDTlc
	Tb2q927BQ4+6aUd8ksO7N1/+aw9rFrt7lZct2D6Egnn3sBZ0EiXciqsBaQNW831GIQKTFTr5JqsOu
	GWZ0gFk225sXg3Pqm8BEl5xRdixyX1MGOVg0tCDZ+GIgYMxwJvxfRNUSmbNIgWccCqgfHlsj5Gy3I
	CG4Ogi0LwS8Slwsj49sszrByFU/0ZAcq+mSYOZRT+MEwkCgGf/uB+jfWeIOk5kJnkE0T95EWCoTC2
	10fZE2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDflx-00000005euJ-2cIp;
	Sat, 10 May 2025 08:41:29 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDfAc-00000005bl3-0bv3;
	Sat, 10 May 2025 08:02:55 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9416225F87;
	Sat, 10 May 2025 10:02:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgI7a7q_e3sx; Sat, 10 May 2025 10:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746864163; bh=TgGotephKsM3CZvFEOAbmICkRQqBI40OGkRN9uP0W/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cp+2ur12X9YGgScUvhME4HTmlhADbBWK3Mc1HfKlC0WDvtn8pMHmpH0iY3wshCc3b
	 J+OfKmC0aZ82LgU9l4Sbi8PtgAh5icWcVRLWeVJ65H4xG9m26/59YWP0/ExK4gVhZ0
	 SPXYlEniuB953XVt92CAXcvVdLa8esWewf+AudhTRQSHu8liVU53tb6+BEoSypY3dF
	 k5waeYzDnbt7oSOtZ3PVgY/xjOxksCHx6KlVaH90hSsib3EDh7mG5V0cBz/lwzn891
	 3dfbggHa9kwQynBCS+3B9Y2MT3VoxNzVFc2KtR7CHBFMFYWSaLHnNd4DAt7m/tdk3b
	 LdqART5uD+xcw==
Date: Sat, 10 May 2025 08:02:29 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] rockchip: Enable Ethernet controller on Radxa E20C
Message-ID: <aB8IFYq2uPPXm0HX@pie.lan>
References: <20250509202402.260038-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509202402.260038-1-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_010254_314238_DEFDEF41 
X-CRM114-Status: GOOD (  20.46  )
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

On Fri, May 09, 2025 at 08:23:56PM +0000, Jonas Karlman wrote:
> The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
> used with the integrated PHY and a second 1000/100/10 MAC to be used
> with an external Ethernet PHY.
> 
> This series add device tree nodes for the Ethernet controllers found in
> RK3528 and enable the LAN interface on Radxa E20C.
> 
> This include a gmac0 node for the 100/10 MAC and its related integrated
> PHY node that only have recived limited testing. I have no board that
> expose an Ethernet port for the gmac0 and the integrated PHY. However,
> the PHY can be identified on addr 0x2 as 0044.1400 and in vendor kernel
> this relate to the Rockchip RK630 PHY. A proper PHY driver will be
> needed to support any real use of gmac0.
> 
> Changes in v3:
> - Rebase on top of latest mmind/for-next
> 
> Changes in v2:
> - Split from the "Add GMAC support for RK3528" driver series [1]
> - Add ethernet-phy@2 for the integrated PHY
> - Rebase on top of the "Support I2C controllers in RK3528" series [2]
> 
> [1] https://lore.kernel.org/r/20250309232622.1498084-1-jonas@kwiboo.se
> [2] https://lore.kernel.org/r/20250309070603.35254-1-ziyao@disroot.org
> 
> Jonas Karlman (2):
>   arm64: dts: rockchip: Add GMAC nodes for RK3528
>   arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C
> 
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  30 +++++
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 105 ++++++++++++++++++
>  2 files changed, 135 insertions(+)

On my Radxa E20C board, iperf3 shows the interface could run at roughly
1Gbps with this series,

# iperf3 -c 192.168.114.51
Connecting to host 192.168.114.51, port 5201
[  5] local 192.168.114.50 port 41894 connected to 192.168.114.51 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   113 MBytes   948 Mbits/sec    0    380 KByes
[  5]   1.00-2.00   sec   112 MBytes   944 Mbits/sec    0    399 KBytes
[  5]   2.00-3.00   sec   112 MBytes   940 Mbits/sec    0    399 KBytes
[  5]   3.00-4.00   sec   112 MBytes   942 Mbits/sec    0    399 KBytes
[  5]   4.00-5.00   sec   112 MBytes   944 Mbits/sec    0    399 KBytes
[  5]   5.00-6.00   sec   112 MBytes   940 Mbits/sec    0    399 KBytes
[  5]   6.00-7.00   sec   112 MBytes   940 Mbits/sec    0    399 KBytes
[  5]   7.00-8.00   sec   112 MBytes   944 Mbits/sec    0    399 KBytes
[  5]   8.00-9.00   sec   112 MBytes   941 Mbits/sec    0    399 KBytes
[  5]   9.00-10.00  sec   112 MBytes   941 Mbits/sec    0    399 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.10 GBytes   942 Mbits/sec    0            sender
[  5]   0.00-10.00  sec  1.10 GBytes   941 Mbits/sec                  receiver

iperf Done.

Tested-by: Yao Zi <ziyao@disroot.org>

Thanks for your work!

> -- 
> 2.49.0
> 

