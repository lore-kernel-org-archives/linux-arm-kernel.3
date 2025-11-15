Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A65CEACF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 00:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7OCG9M11/iVOHmp5KVZPKVVBEkVFUDSIPxfV82W8pQ=; b=AbLOYvYFMMINbePPd9yFkoUBeo
	xMAFUzoV8haUGkt8mshFwATAXkS6QZWVadaHVjS+0LeFv9nUiLNnmn/uH+tRVGeEh68wJUS0eVSYa
	J8TwtByBFbaFHmhqwxQc/UssjY1c2CPJooiz/rDeOdqBy9EugCrogjcFwYi9NqwPWh7Wer1FbYA9Q
	6u/RMT0v4FbCAOw0SSrTDqgde1Ql70mxn9RxopHWj8DT3rwjIPqWB5NFWUopwO1PDki54fulks/EJ
	WIEFdvZGEWA8DCS1C/3y8hKGaWwtH1vX/w8kUUIow4YAWLnJWarfi/VWKntu1fsk1Q/EyPajC98BG
	e8ZWkLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK3yA-0000000DGVw-1ov5;
	Sat, 15 Nov 2025 00:16:46 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK3y8-0000000DGVL-2FdH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 00:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763165803; bh=alGYrlAwEOwi5Ic0/WsJgHzayrg1ogR5hqg7HxgRYyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JOp5wtSeU7fbQE8G+WlMR7b8XOeGAfjy1x3VxjOOPfzH9L0KnA2HwXVKZfPmuqLek
	 Jk4IiWUUsOVMHO02dL5LsRBLAzZpJUGHHlYYd9tk98vhkHvrfJJKS8j8bCZ3Toqj3e
	 nonHJ4XCMzNelUPqyckzrB8/oEa8l6+DkQmAtippx4Mx5FxH1wGghUiWna5U+rWvaC
	 YFX/HN8JHm40/A04BzAb54eZuKzbXJcPr/lLuiMSz8dHaDofkXMaYLt9Ag6TDzy7xx
	 XyBhZWusHngV/OngDGe8V3Q27spmMmqlJSX12JKaUOUFGl35H2jrAzHQe9yqpiXeEf
	 gVBH66mVVX3Hg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 008CF3E16D7;
	Sat, 15 Nov 2025 00:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763165802; bh=alGYrlAwEOwi5Ic0/WsJgHzayrg1ogR5hqg7HxgRYyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rvwYuWDH3jT20GsiJvCpoqZlWTzI4ssPkzWt6Bjq2LotY51lb+sFUK4XXVkSVSGJs
	 DmisGw34enXe0AeBzAnbWKZlaws9757XH6uKqbXyUCAf+X8aIsgOfma3DAxzhnp2Wi
	 V0QElfxn57GbzFc2ttynAWA6ywdid5H+mnfaLuour6GnmkQaomM0dPjI9lhSa3nypX
	 mMO69WbOCHE3bCvIs+OYdPPEeuTHR1vWuOUduM5s4WlrKDZtm3WiJPgP0+JZMbBQlx
	 qAMywYnZ4NHLnO3ziluaz2PgKeC4FxEm52cg6YJuiNLICwFQ+0YtXE/Jc4rI3XGpfr
	 lq/l4WiTB4vDg==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 6F3223E101C;
	Sat, 15 Nov 2025 00:16:42 +0000 (UTC)
Message-ID: <09def66c-0101-4113-b788-bf31966b9316@mleia.com>
Date: Sat, 15 Nov 2025 02:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ARM: dts: lpc3250-phy3250: rename nodename at@0 to
 eeprom@0
To: Frank Li <Frank.Li@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
 <20251114174712.1206027-4-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251114174712.1206027-4-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251115_001643_016385_94964797 
X-CRM114-Status: GOOD (  14.03  )
/bin/ln: failed to access 'reaver_cache/texts/20251115_001643_016385_94964797': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_001643_016385_94964797 
X-CRM114-Status: GOOD (  14.69  )
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

On 11/14/25 19:47, Frank Li wrote:
> Rename nodename at@0 to eeprom@0 to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
> 	'at25@0' does not match '^eeprom@[0-9a-f]{1,2}$'
> 	'at25@0' does not match '^fram@[0-9a-f]{1,2}$'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - new patch
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> index 732d590f6cfdf..15463a96938cc 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> @@ -200,7 +200,7 @@ &ssp0 {
>   	cs-gpios = <&gpio 3 5 0>;
>   	status = "okay";
>   
> -	eeprom: at25@0 {
> +	eeprom: eeprom@0 {
>   		compatible = "atmel,at25";
>   		reg = <0>;
>   		spi-max-frequency = <5000000>;

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

