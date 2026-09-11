Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46EDC88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 03:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+dsOyuauVyftnIALjK1E6v3Vy0EWAr+12caK2RyzhU=; b=g8PmTBfWsT66cFB2TD2wG4kO2A
	MGKnr8Gs3PPVGmn9AS6tf4ruCyXBbFgMON55dVSQMvmOGuRe9RkB0IPbB7XWWzfKpB7MSTMl42fGu
	h1x72fQse7oLTK44PC9JacTP2myTRAG/LHzm7+61ZyM3y1b/5KhQAtDhj4Z1mn6Z92qusFptK9ztf
	zRTOvUR53CWwdYdl05/fGr9YRhF6Z9jklkKIxfVs537y++f91Xf+vWhAPHP3xaJGcmMPyfA2cujFm
	11CchVsMoKJjXzBfbe5gbcAM+dMg+2xzsc2eE6eiZSHACWsiheajXiEKB4pj09jNYQdS2+6YrscGh
	AiRlkweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5aW3-00000001KHK-0UUs;
	Sun, 13 Sep 2026 03:04:27 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5aW1-00000001KGJ-0471
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 03:04:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1362B10364C;
	Sun, 13 Sep 2026 05:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789268657;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=r+dsOyuauVyftnIALjK1E6v3Vy0EWAr+12caK2RyzhU=;
	b=YgCXwaxwW9SHo1xDWd02WuZx+i7/w3on54n0KB8T3Kb0tlBdTXGicKOADyuAvc91+Dt6Pk
	qcEQsFAFj9YYKfdOBwOogFfzWWl99pmIy8ROO4Ecyjls6ssifb4EUZCy/ERrQ0Cs+rXj62
	qaRc65ydEz5Hxx+i/PmTNzPpljZbZ7nlHUzScBoJ2sXAghS2tDO80qcCtowGxUcnh1ayE4
	HKnkZRYLZHahqxbxs0J6IsGh6xoHglcE2AmTa+hTclkDMcr9ZNB0b8drWhmspDnJfrKS3p
	o2pB0YDRQldXQuyWmd32xTqyFXMTpJN+RS0CBBBuGmY+6Dwpx9Vjk/H+hVMq8A==
Message-ID: <fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com>
Date: Fri, 11 Sep 2026 16:49:59 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <874ifwjff2.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_200425_322188_31152C8E 
X-CRM114-Status: UNSURE (   9.67  )
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

On 9/11/26 11:38 AM, Peter Korsgaard wrote:
>>>>>> "Marek" == Marek Vasut <marex@nabladev.com> writes:
> 
>   > Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
>   > The board is populated with four ethernet ports, QSPI NOR,
>   > eMMC, UART and USB host interfaces.
> 
>   > Signed-off-by: Marek Vasut <marex@nabladev.com>
> 
> ..
> 
>   > +	chosen {
>   > +		bootargs = "clk_ignore_unused";
> 
> Why?

This can be dropped, thanks.

>   > +&gpio {
>   > +	status = "okay";
>   > +	gpio-line-names =
>   > +		/* GPIO 0 - 77 */
>   > +		"", "", "", "", "", "", "", "", "", "",	"", "", "", "", "", "",
>   > +		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
>   > +		"", "", "", "", "",
>   > +		"ifm_device_info_eeprom_wp",
> 
> NIT: The dts references a number of other GPIOs, any specific reason to
> only name this one?
The legacy userspace tooling used to depend on it, used libgpiod to look 
up this GPIO by name.

