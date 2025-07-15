Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C71AC83F37
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hc3vsBfzOMAStJdYYEY+W0t5J5sQBFx3Mo+fJY+/Kfc=; b=AJuWGD/gJvUTHsaQp0xewspbYd
	1mA4IFpgE/euqTT8X+LFjL08BL6uKdc+KVH6Wy5AcNqcO/Ov2hTSP25blIJnSpAeqMPcHUPMMcqUK
	Ib+RGc9aYpE2OBurSezu12aSduMy1gA9b3NLCfXQvVkNkm6GQZYuUY66PquPJ2xkCBlq9tdvnJN8a
	/HP0f3jmwrcS0AujJPf79ophzfk4JcPmprcgkGCB6cNDQ03ONs90Rl0bfxJaoPM1gYiwLUfl1qEwT
	N3wdakhse4xB0ETQKDsBd/2QF4eMAKlB2OGuAP3wRPuRavLgBWgIwAbV+u3DHsfLx8PZvxL6D2CFB
	q0gf8f1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl6t-00000005xrl-0t2A;
	Tue, 15 Jul 2025 19:14:39 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgXb-00000005Lj8-0QQE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1752589313;
 bh=hc3vsBfzOMAStJdYYEY+W0t5J5sQBFx3Mo+fJY+/Kfc=;
 b=btU69EjkAzWWfsPnlyBVOXEZSuuuTtujrudY6k9kO1nVg0zD3vZfJnQkNT32ZBQKkejFKAeR6
 Nvz7DGF6Zd/vj0vC2kI5itgsdH6VCbDEgUSX/QLvH2ygIYP8jqxNKlJb+uPAkLz1Tj58HZNCkaM
 /CzbuZ2vtnVq5qpOfmbnX1zWGbVVDnT5lK8WbIvPSvQgLOjjqb7QX5ipl7mwXtdRkM3iSWnDoRa
 xXnsgQwTLMZFwSPaXorAJdA6X6qFSR3MY1q/Ywzi8goBIuQHgaovizyIF0IVvMGMQxcOi95oK+r
 MvJgz/UQ8xrX8HGS3xpvUogRzOlGGdLofk2wmba8PioA==
X-Forward-Email-ID: 687663ea4f06c51bcf022fb0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9050b4fe-ce69-4f93-9093-5461a6aa052f@kwiboo.se>
Date: Tue, 15 Jul 2025 16:21:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: rockchip: Add ArmSoM Sige1
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, ziyao@disroot.org
References: <20250712173805.584586-5-jonas@kwiboo.se>
 <20250715140115.1925358-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250715140115.1925358-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_072155_478277_C2133819 
X-CRM114-Status: GOOD (  11.82  )
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

Hi Chukun,

On 7/15/2025 4:01 PM, Chukun Pan wrote:
> Hi,
> 
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
>> ...
>> +&sdio0 {
>> +	bus-width = <4>;
>> +	cap-sd-highspeed;
>> +	cap-sdio-irq;
>> +	disable-wp;
> 
> I don't think sdio needs disable-wp?

I thinks your are correct:

  disable-wp:
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      When set, no physical write-protect line is present. This
      property should only be specified when the controller has a
      dedicated write-protect detection logic. If a GPIO is always used
      for the write-protect detection logic, it is sufficient to not
      specify the wp-gpios property in the absence of a write-protect
      line. Not used in combination with eMMC or SDIO.

It mention 'not used in combination with eMMC or SDIO', yet I see
multiple boards where disable-wp is currently used with eMMC and SDIO.

Do you have anything else to remark before I send a v4 with this prop
removed?

Regards,
Jonas

> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 


