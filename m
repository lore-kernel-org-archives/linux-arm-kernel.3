Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358EFE99056
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z75R0tX4ysdgRCqX76W/Tt05c+xcNPLtoZZGSPW5SLw=; b=WXFgQmwNODMVowgn/6/l12yhCl
	6nJjJo4BHWJAydYwoWczJsGlqm4eVHj6kRI6BTXDN102C9yPv2ujKruwaOCfr0AGHM0ClHCpVG2p7
	NSiLZt8cAdb7ivAEGuAa2c4mJ7anlSPq2BaeBCGZGcRku8TfwI4P9R9cKaaeDcyxypUS7ChOKmcTT
	1SlojrTYrfEI2caGeGfOMfoLZl407otivQYfObn5WAuUy28+lH2evU8YUnPITQt1Zzc7f+m7X6DMe
	H5ITQrRpXtIpjNP+OIG3l1TVpjTAB2NAa8yRwdWyYr/uQNGfad1Qt0bTLg9TGvNLNGrNCfN6WPg5X
	8/UUCWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7Cj-0000000BqHv-1Bkt;
	Fri, 10 Apr 2026 08:27:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7Ch-0000000BqHW-1yIY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 08:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBF9142E37;
	Fri, 10 Apr 2026 08:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EEEC19421;
	Fri, 10 Apr 2026 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775809622;
	bh=wiVpkLOHesaDxqsTty1+qn46GjmDPchZxN/XYbW0yVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ETa0mesoel9QguYJ8pV0cmtc3Cyt+G6JUpWibDvnx++QugKMurkEiMLxtwQDB5+4M
	 52/cbsopugbayzbSPnnyAbHWsP0AdFH67TlACy8kcfjh4JdG6u2Qq/LC1oH/Eiu4g6
	 bfyMNUg5cCwzSZz9MdhsqS4IWcLAKxeL5tYLwh3e6uu5BnTlKtyIR0LjeFSbDSstuK
	 fFnnYkgL415whPrxMxn28Q5jI5A2U/9LwBir5p2eofF6AYQid7qaJOIQ/pBC5aLcD5
	 osR7giAvoly013z7WULooyA3wUIaHOb5+eAjs96gtEyycEn74RadjM7s8MUn7+f7Vk
	 LV0Sgr7ATh/ZA==
Message-ID: <b280ad04-d4ae-4904-9e99-3d057e3d221b@kernel.org>
Date: Fri, 10 Apr 2026 09:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
 <Z8a4y73p6MgF8gQkVtottkgG2Ok8-Vhm8zzckWEbiU_DUO84x2VlwPt-VBL2g0utw3ZwZK0aUvI4ev-p_YRGoQ==@protonmail.internalid>
 <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_012703_533865_077DAC58 
X-CRM114-Status: UNSURE (   8.62  )
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

On 10/04/2026 04:55, Taniya Das wrote:
>> Why do these two controllers have no power-domains ?
> Bryan, on Eliza the videocc and camcc are connected on CX and MXA.

Shouldn't you at least have:

power-domains = <&rpmhpd RPMHPD_CX> ?

And even

power-domains = <&rpmhpd RPMHPD_MX>,
                 <&rpmhpd RPMHPD_CX>;
power-domain-names = "mx",
                      "cx";

Konrad's suggestion to me was that MXA should have a vote in my CSIPHY 
series I think he and Jagadeesh discussed it but I'm not sure if they 
_concluded_ what was the right thing to do.

Right now I'm representing the dependency. MXA is always on ... and 
there's nothing to do voting for it @ MX ?

---
bod

