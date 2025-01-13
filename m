Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA446C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Z0sdnVMXkMM+PvR3lzPK52+uryZkoCDg7AZ36tPRr4=; b=tc9pMLKaJK1OPPjWrHypfbLd6u
	62aUfOMRArmQMHGE56SSMgV7EVLBReVqSKQ+2vTygod8nee05BMC5+WywhpfvoH0Oz9R0SH1wtty2
	Fc7U/MFJOFWkighx4jpYwva3MgXDXHCB6qIGG9tA38nSUDwHygj8VdqHx4ER02JnTYeYqSovH/9Kx
	xVkimcyRxKRbdFqymHkaeQepfTTON0ELM1qFWrVLiS2mc6uY5/n+Q5zwYYT402ZH/8em5WDNz9dXk
	E/s+C1wZexlKbKyeULRFwoK85rsO6gg7ytOYozPOJRlZhtC/ekClPkM7iWUEeklDs1tVDU6jtgNhK
	jkhZf04Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLn2-00000005TpM-1zqU;
	Mon, 13 Jan 2025 14:51:40 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLlm-00000005TVV-1NA4;
	Mon, 13 Jan 2025 14:50:24 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 20D6D10000A;
	Mon, 13 Jan 2025 17:50:09 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 20D6D10000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1736779809;
	bh=3Z0sdnVMXkMM+PvR3lzPK52+uryZkoCDg7AZ36tPRr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=D+w4RxjDwuC6fWy2qdieubaEQBk++0K+QSltkUkmp5vBe7SRwXHCsr32e1QqqS9jm
	 mPSsHstDaw+Eb4Q8AeBtwptf0Ae/JzU/HxFfuBwPLgJCB2vM+agE8kWq0GRItGJVqM
	 zWxuSwlXjGtLcCvAnyhLogXjx1q1kDdS1AI7Qo+ahU7cJdLCikga1VdekU+PVCtHBD
	 bXMtu1VAoNNW4iwTKYPvUqe95eZ5cMFg8IKc0Pr5L9zOf6WVOSdYYhP9ewBM/44e/w
	 jv3atxiGARRLgHgWjTSx6+ywrrCYuO4FzgY9sG7R0UenlcGJ6OusrgubKjMChFruY9
	 4jeAvC2QXn4EA==
Received: from smtp.sberdevices.ru (p-i-exch-a-m1.sberdevices.ru [172.24.196.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 13 Jan 2025 17:50:08 +0300 (MSK)
Message-ID: <388076e3-35f1-4573-b682-90f6f5932f28@salutedevices.com>
Date: Mon, 13 Jan 2025 17:49:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Introduce initial support of Amlogic AC200 board
To: Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>
References: <20241114154856.3353691-1-jan.dakinevich@salutedevices.com>
Content-Language: en-US
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20241114154856.3353691-1-jan.dakinevich@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.28.224.37]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190309 [Jan 13 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2025/01/13 14:03:00
X-KSMG-LinksScanning: Clean, bases: 2025/01/13 14:02:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/01/13 07:04:00 #26996016
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065023_029124_59780BD0 
X-CRM114-Status: UNSURE (   8.97  )
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

Gentle ping.

On 11/14/24 18:48, Jan Dakinevich wrote:
> Changes v1 [1] -> v2:
>  - added "Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>" to
>    dt-bindings
>  - don't share the definition of sound card between ac2xx boards
> 
> Links:
>  [1] https://lore.kernel.org/all/20240521222155.28094-1-jan.dakinevich@salutedevices.com/
> 
> Jan Dakinevich (2):
>   dt-bindings: arm: amlogic: document AC200 support
>   arch/arm64: dts: ac200: introduce initial support of the board
> 
>  .../devicetree/bindings/arm/amlogic.yaml      |   1 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../boot/dts/amlogic/meson-sm1-ac200.dts      | 109 ++++++++++++++++++
>  3 files changed, 111 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dts
> 

-- 
Best regards
Jan Dakinevich

