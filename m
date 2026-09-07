Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE04DC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q2+48t1wSiZJUybl6pivADZo58b0sHhnIp8KamQgA0=; b=ep/E8Hq5tOH1vTNWGcSEw8Dybc
	AFFmop1XtbtytkohYEJIp/S4hCvffVtgKvih11fta/bJsoTkP3B9HJMWJPYOf4zU0B9au6zC425OK
	Dkm9kZ5XmeumzRHYJZamfPoBfuUq5to5/qhJWrjwEsYbM3D/dkA/xON3gAfgaSrGTrrV4MKbrn98p
	7ksCz4Y8n78nRpNvmwaTA9yPKTPeXA3/NnnrRWhrcyO5tome7Nupvom7MOyRN6YSXq/25j8+mCtb9
	qzq3CyTjENtaJ5arOQpRAxTvwEM+2eLQ+Nsmq33AqCoaQcjwJH1X8Wa4eGHdp9KcWAFOkHd3b0LzU
	s2z2ql8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Sf5-000000060Pk-1XAT;
	Mon, 07 Sep 2026 06:16:59 +0000
Received: from out-169.mta1.migadu.com ([2001:41d0:203:375::a9] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Sf2-000000060OX-1NvJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:16:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=um/5G4Ktg5bYB4/JmYOtP+jNUERGAJTRJYD0oR1JWK0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788761809; v=1; x=1789366609;
 b=NjLpTG1JlRw2/g0gx8leRwJWDpdI75WLX1LsXFajbv2ihaF8Lj31ry8kzdH9QrTgbeVEr2a+
 0K8a1XX2CBfNsV4+zV51j37mszE0ErfPSiMrVFKmIZuCzksM8SXXPuIFiHvuiSHcknbfIkJc88F
 8I0/0hOSHyQhF3UdT6hazDWg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a8b123c8c6109945;
	Mon, 07 Sep 2026 06:16:49 +0000
X-Mizu-Trace-ID: a8b123c8c6109945
X-Migadu-Flow: FLOW_OUT
Message-ID: <55e5864b-a292-476f-a6c4-20f89412abae@linux.dev>
Date: Mon, 7 Sep 2026 14:16:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: phy: mediatek-ge: disable EEE on the MT7530
 PHY
To: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>,
 netdev@vger.kernel.org
Cc: andrew@lunn.ch, daniel@makrotopia.org, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 sean.wang@mediatek.com, olteanv@gmail.com, yangshiji66@outlook.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_231656_520730_FB112769 
X-CRM114-Status: GOOD (  15.91  )
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

On 2026/9/5 4:28, Vladislav Karmanov wrote:
> The MT7530 internal GE PHY advertises EEE by hardware default, but its
> EEE support is defective: with EEE advertised, some link partners fail
> to establish a stable link. On a 2-pair (4-wire) cable where both ends
> advertise gigabit, 1000BASE-T training cannot succeed, and instead of
> falling back to 100 Mbps the port loops, so no link or DHCP lease is
> ever obtained. MediaTek confirms the hardware is the root cause (Landen
> Chao, 2021): "EEE of the 10-year-old MT7530 internal gephy has many IOT
> problems, so it is recommended to disable its EEE."
>
> mtk_gephy_config_init() used to clear the EEE advertisement early, but
> commit af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE
> advertisement") removed that on the rationale that the DSA subdriver
> already performs an early disable. That holds for MT7531, whose
> mt7531_setup() clears MDIO_AN_EEE_ADV on each switch PHY, but not for
> the MT7530 PHY: neither the MT7621 integrated switch nor the dedicated
> MT7530 IC ever had such a loop, so removing it left those boards
> without any working early EEE disable and the link flapping came back.
>
> Since the broken hardware is the PHY, fix it in the PHY driver so it
> covers all users of this PHY, integrated in a switch or standalone:
>
>    - clear MDIO_AN_EEE_ADV in probe(), before anything can negotiate
>      EEE with the link partner;
>    - call phy_disable_eee() so phylib does not write the advertisement
>      back on later renegotiations and userspace cannot re-enable EEE.
>
> Auto-negotiation then falls back to a stable 100 Mbps link instead of
> looping at gigabit. Tested on ASUS RT-AX53U (MT7621): with a 2-pair
> cable on the WAN port, a single clean 100 Mbps link comes up and a
> DHCP lease is obtained, where the unpatched driver loops.
>
> Fixes: af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE advertisement")
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>

Acked-by: Qingfang Deng <qingfang.deng@linux.dev>


