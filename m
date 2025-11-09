Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F81CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVKL4KOVVv4PCmD5ezWsnIkKKizZfKpAXP3Rk6TFCXo=; b=NLb55klbRFYGB9f8teKv8TpwHF
	gJPoJGe9/qyOmb5Zd05U5/7/X9Oo6eghp6J/X8J9hF/0CLYN9qdM4dwLj50NOT6na34noayZR7KcN
	7twFlq+/vJfk373ND5XS2V9YQJEbdDttTLQJTreDVeht1hpvMEUdkqOKKouVyHPrHYSCgfuLAS3x1
	mpvEaVQ/KMUw3qEX21sVOQlgpIBhmmwB9aZCqcC7HCXhbIaGdJerLZRSA9Cy6g0Idlrv+nzwuDPcI
	ySjMOHMFjKVsigsZgZc8Zcxq3oCR/mYG9lgszCnrqITkuClwHQAaEc6ZfQmWV+2XkNVDRejmcc5Iq
	SzE5cO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDKu-00000004PMD-3X2e;
	Sun, 09 Nov 2025 21:52:36 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDKt-00000004PLN-044Y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 21:52:36 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762725142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVKL4KOVVv4PCmD5ezWsnIkKKizZfKpAXP3Rk6TFCXo=;
	b=jbwX5XIgZ8KOC3TVlB//6JQ/2kAXWBJGhA0dKdSFOqj/VDG/CeKyypetqde568lvHcMXH7
	IXVm4g5KN9LfH/87jG7giUY7IogeDCjHJyEnzmRt6+FhC6Nb5q9EDgZndFRmrQBUNlPAsz
	GexmkfW3kuSNiP+KbyGpt29nil3281My5V9ibaknzsttsbrjrEo1umJ7PC5F8s8hlh2fra
	ldeIsCdy9VsBdtjXT0Kpnmd8RpJ0R5yNW9VOElzkyTjH56yRnDFAuoLgCfkpwcq6oVdV+S
	kfWeW3TYhVTeUPwwOOtb/7nliT3Nk0VfYBy8Y+MJ51YO6E6Uo66oShq1sqHRsQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Nov 2025 22:52:13 +0100
Message-Id: <DE4HWR95IFVW.1GG1O5GO9GKKV@cknow-tech.com>
Cc: "hrdl" <git@hrdl.eu>, "phantomas" <phantomas@phantomas.xyz>, "Dragan
 Simic" <dsimic@manjaro.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 0/2] Fixes for PineNote DT validation issues
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Samuel Holland" <samuel@sholland.org>
References: <20251109-rk3566-pinenote-dt-fixes-upstream-v1-0-ed38d200cc04@cknow-tech.com>
In-Reply-To: <20251109-rk3566-pinenote-dt-fixes-upstream-v1-0-ed38d200cc04@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_135235_196713_B2FB49CE 
X-CRM114-Status: GOOD (  12.62  )
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

On Sun Nov 9, 2025 at 6:05 PM CET, Diederik de Haas wrote:
> These patches fix the following DeviceTree validation issues on the
> PineNote dtb files:

Please ignore this patch set. Sorry about the noise.

Cheers,
  Diederik

>     Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports:
>       graph node has single child node 'port@0', #address-cells/#size-cel=
ls
>       are not necessary
>
>     usb2phy@fe8a0000 (rockchip,rk3568-usb2phy): otg-port: 'port' does not
>       match any of the regexes: '^pinctrl-[0-9]+$'
>
> And with these 2 fixes, there are no more DT validation issues :-)
>
> The fix for the 2nd issue also fix these kernel errors:
>
>   rockchip-usb2phy fe8a0000.usb2phy: Failed to create device link (0x180)=
 with supplier port0 for /usb2phy@fe8a0000/otg-port
>   rockchip-usb2phy fe8a0000.usb2phy: Failed to create device link (0x180)=
 with supplier 3-0060 for /usb2phy@fe8a0000/otg-port
>
> Cheers,
>   Diederik
>
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
> ---
> Diederik de Haas (2):
>       arm64: dts: rockchip: Simplify usb-c-connector port on rk3566-pinen=
ote
>       arm64: dts: rockchip: Move otg-port to controller on rk3566-pinenot=
e
>
>  arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 27 +++++++++--------=
------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> ---
> base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
> change-id: 20251109-rk3566-pinenote-dt-fixes-upstream-1fb32eff43ea
>
> Best regards,


