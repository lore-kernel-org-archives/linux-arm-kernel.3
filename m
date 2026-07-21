Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2749DC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PONjBXo7q+plV0IvZnhVyHq1E/akMlsE6hQ+X/aIHuA=; b=WQiKoHFRewH7JWE3u2Jtix9P34
	K4Q3rPZigDb4ssEa4RxGdvcQxoLEZwMje/JK9CCdLr1beukTSIU6vKbhHkvK01lcjG0uuGaugmt1O
	iiS36C74YLyNM/e9i95U07cBzEs06nNLgGzTe6KoYJiImoHSHcFj+xQM4LnomXBA82Jbb9JMgKJe0
	7IDX4KqG9j0HQvDuQe4L0fFvq7JFnjCwlgRP/yVtECbmznMeZsHhI3JQyWORZ8qnF+OlWN+nwVgvp
	nIJUUWaRBplMWPpcsVOLRUTobcZMKN1cmqfNOkrurlaZht8CFuU7qeX26jjVl2DrEP0hHNnzepdAS
	cLoI4gCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJAU-0000000AWbq-1lGi;
	Tue, 21 Jul 2026 22:42:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJAR-0000000AWbG-0Znw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 22:42:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE9C41476;
	Tue, 21 Jul 2026 15:42:20 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15AD93F86F;
	Tue, 21 Jul 2026 15:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784673744; bh=RxYsiQP8kq8WcX4Wiu5TBYeE+KzuGRPuMyC04vTe9lo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jJEHv73hO6HQ086lu5xbbitXLOIGvcROEcTiIkVYUuD2o4T+l39wdKV8aezTQckJT
	 DT1haVSH+RvItnWnU7gy41xC2ZW81zMcRGrrE40Wql6Qt0dl4rcQ5ufj83RXNKeajk
	 i3dySNQ3QBnxXoJwt+6eL15DwX8atYc+Sxa1mz3g=
Date: Wed, 22 Jul 2026 00:38:36 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: a523: x96qpro+: overvolting eMMC
Message-ID: <20260722003836.4677a33b@ryzen.lan>
In-Reply-To: <20260720213832.3763-1-andre.przywara@arm.com>
References: <20260720213832.3763-1-andre.przywara@arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_154227_345682_0EFD44F8 
X-CRM114-Status: GOOD (  23.01  )
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

On Mon, 20 Jul 2026 23:38:32 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

> On the X96QPro+ TV box, the eMMC wasn't working properly: the chip would
> be detected, but most requests failed, leaving it unusable. Some
> "solutions" were circulating downstream, one "popular" one is severely
> limiting the clock frequency, with a drastic performance impact.
> 
> Instead slightly bumping the I/O voltage on PortC from the canonical
> 1.8V to 1.9V seemed to do the trick: the eMMC now works and reaches the
> expected 120MB/s performance.

So for the records: please disregard this patch, it was more voodoo
than a proper fix.
As Sashiko pointed out, this slight voltage bump changes the GPIO bank
withstand voltage, which turned out to be the actual culprit: the
encoding was wrong, and the new voltage here now changed the value to
inadvertently use the right bit setting.
I will send another patch to fix this properly.

Cheers,
Andre

> 
> Adjust the respective regulator voltage in the .dts to enable eMMC
> operation on that device.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
> 
> I am not super happy with this patch, but it seems to be a pragmatic and
> the least hacky solution I have seen.
> 
> Cheers,
> Andre
> 
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> index a96927fbdadd5..5636e95312218 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> @@ -194,8 +194,8 @@ reg_bldo4: bldo4 {
>  
>  			reg_cldo1: cldo1 {
>  				regulator-always-on;
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <1800000>;
> +				regulator-min-microvolt = <1900000>;
> +				regulator-max-microvolt = <1900000>;
>  				regulator-name = "vcc-codec-sd";
>  			};
>  


