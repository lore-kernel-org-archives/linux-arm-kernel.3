Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E79C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 01:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mucwfkb4MzJMIfmg7+6JU7Zg3V6BD7CxMn7XJa8cbwQ=; b=tD0DEbW+hySnK00Ij9XsNn6TSF
	vss1u7LXcGifdlt3Hq+pKOPfsKeVfuC6c/AaFLnAk7zAcPJ7uzgwgiY3pN+ip4MxDUmfju2rpYbvS
	+CUKIOxYx5OcXUP+zUV7LsQBi9tIxlPPuOCjK1P8tBTLHVsB+yCD22Kqogoze9SgxinFYAj8srt2K
	pBuiqlwjK/zNMla4bWKiDSL8jAMKm66F1/3FfNYP9ZF9S/Ott1olxwEK9/bqle8kWEsMQjLKAwdmu
	cR9SuoD+4T2XN0OT3e5RvlgsKBVYmnPQhp+I0CF9/dmXHf5g69vMysvZHM2l7yKn8kZ/w8uJ/sBU0
	1qW7b1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vuy-00000002AD7-47Yz;
	Mon, 14 Sep 2026 01:55:36 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vuw-00000002ACm-20ZE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 01:55:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CE84103D80;
	Mon, 14 Sep 2026 03:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789350930;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Mucwfkb4MzJMIfmg7+6JU7Zg3V6BD7CxMn7XJa8cbwQ=;
	b=St//JtXSrpBfl6a044eOJX7wXKwW/NvqVvqNMLkAIacBn3IgyiRLeposLxrmEA5j3/CItC
	R29CfmGgbweGu3yyVoU8e4MhTtHpfQv/vl2TbHBWICgMdbrVrCdYJuTgx0ODEZ22Du+UyU
	Pj64o/cnaOn1bFGhuQ8MB4VQIjVdDo/2daMCaGZZVbpC6kPeKPkSvzYI5pPDVV+QlRZn8s
	wbqYbOkizltkVNSpCeRPN2bDrW3QA2vCj682LC28jfPIYei4PMOvd2r+EIPvHIac8MQjvz
	Up6Q7TRy8qjt7naIgl/S01jTNf4tKYfMgD+l++6LYwgPNtHC9HXV45R7Tz8yWQ==
Message-ID: <00acb35f-ea7c-465c-96da-4eb5dac9e2cc@nabladev.com>
Date: Mon, 14 Sep 2026 03:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <20260909182641.165383-2-marex@nabladev.com>
 <874ifwjff2.fsf@dell.be.48ers.dk>
 <fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com>
 <87wlspb50g.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <87wlspb50g.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_185534_746869_293A2676 
X-CRM114-Status: GOOD (  13.75  )
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

On 9/13/26 4:27 PM, Peter Korsgaard wrote:

Hi,

>   >> > +	chosen {
>   >> > +		bootargs = "clk_ignore_unused";
>   >> Why?
> 
>   > This can be dropped, thanks.
> 
> Good.
> 
>   >> > +	gpio-line-names =
>   >> > +		/* GPIO 0 - 77 */
>   >> > +		"", "", "", "", "", "", "", "", "", "",	"", "", "", "", "", "",
>   >> > +		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
>   >> > +		"", "", "", "", "",
>   >> > +		"ifm_device_info_eeprom_wp",
>   >> NIT: The dts references a number of other GPIOs, any specific reason
>   >> to
>   >> only name this one?
>   > The legacy userspace tooling used to depend on it, used libgpiod to
>   > look up this GPIO by name.
> 
> OK, but why not add all the referenced GPIOs if you fill out
> gpio-line-names anyway?
Because the userspace depends only on this one line name. But since 
eeprom node contains wp-gpios DT property now and the kernel controls 
the nWP GPIO, I can also turn this around and drop the gpio-line-names 
entirely. What do you think ?

Thank you for your help !

