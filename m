Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5B7CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoAAYwwSkct1dybDxwgNyk2Rm0SbhKgSXVNFxBcKatM=; b=DMoANHhJFygAcea5LPkZ47v1WG
	z6BgIzZ9pym6QJ45Qfkj/jteHzaxOR78axAZCmDcoJmaKmIvRDOaqGBBZClpMa67oFP/A0W0U3A2g
	JsGa6XJnqkTJRSGJ/BSyx/pKDiYN/K7ybYe2dgWT5syRRGnfyE/pFdz5dfoH+wwaYfEuLXtviUnO4
	I7NEzEQsZ8zNSuP5fQHJb9z9AM2al5Gx0fDil4qU190KuA0GRqE/E7z7YLgA3ca7py5LUpdn4Ut5v
	Yj5i+awlvJwn6rte6TAhwRTwerEpR033gF02pnKcvUg8GrQkrTR9tbIDeNz54P0LQerrEVJA96axH
	FyXm3cyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ZP-00000001uQ8-2KQw;
	Wed, 15 Oct 2025 14:33:39 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ZM-00000001uMZ-1xlU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:33:38 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmtqd6zFXz9tTj;
	Wed, 15 Oct 2025 16:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KoAAYwwSkct1dybDxwgNyk2Rm0SbhKgSXVNFxBcKatM=;
	b=I2lRGJfqsloGT2SHdY2M8bMV7/q4Pr59f484nUVBeklXjYgpLKNPtR3atxbCXVW/1M6/d1
	//HA5XXVaNuD2b6Enca6KnfDPJxqBmUJVqa4NOLPhPFCNkGxeddmE1IsXzMp3cd3fDxZa9
	4Wf2yOBB5cqHG01UPn+ngvQ1D/DdhFnwzrgHDLLlrUCNHJ2+CF+eucPncmiU2dFK1Xd5zj
	1bqiFG5NNt+0uzUK50KJiBMdN5ZwIGz4mp4wdPyVgLVCJat/0ddlHGrXzVsca75CD+dH9o
	jexbeP8s6jXf3KHK5o6c3HwCeYSfw964x6dFHgdaUjHVmUad+JjZ9p3epDuIHA==
Message-ID: <78249155-c90a-4c33-8caa-d79d83171551@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KoAAYwwSkct1dybDxwgNyk2Rm0SbhKgSXVNFxBcKatM=;
	b=I/FcsianBv0Nxyf1djQKC/ndDM6D04GOPsXWCbJsRR8sd9AASeOicPZ6iFlUcdZQ5lOzOD
	Ja5w1TTbFN+8hn/CISsFQbHxB7aDwsVIp1/ltJEvascotKjnWLppiDSkL0ALI5UeGqpeDJ
	VjQca0ofS305cN2uQPwlJRtSOCiviTS/QR5G0ui17dOZgAUEzdgfYD5NVntVYPWcw21Pz1
	6LzaB30f84Cgzsz1dU5n4QmbfXG9yQpY+e8Jtp/H2lEvSCoD+car8jueuek8SJfo4QkP1S
	Yqi8gLvqHlDHg9MF2IAX9amcKfIRtY0TXLBtsfkM2aIM04bBzGFYS5+lLWccYA==
Date: Wed, 15 Oct 2025 16:32:24 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
 <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
 <e93779e7-026b-4b48-9d9b-dfef3d953749@mailbox.org>
 <dd7e09c7-995f-4ef9-a5bc-ff6c8be64ae1@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <dd7e09c7-995f-4ef9-a5bc-ff6c8be64ae1@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: c1dy1jmb5s88yb7q9s43rwqiniopzzh7
X-MBO-RS-ID: fb5ef80d27592a90e0c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073336_707732_85479993 
X-CRM114-Status: GOOD (  14.99  )
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

On 10/15/25 12:55 PM, Matt Coster wrote:

Hello Matt,

>>> I see this pattern used throughout
>>> the Renesas dts, but I'm just thinking how this will interact with the
>>> powervr driver. The reset line is optional since some hardware
>>> integrations manage it for us during the power-up/down sequences, which
>>> appears to be the case here with the MSTP control (from my brief dig
>>> through the Renesas TRM).
>>
>> As far as I can tell, the pvr_power.c toggles the IP reset after the
>> IP clock were already enabled, so the IP should be correctly reset.
>> What kind of problem do you expect ?
> 
> I think I'm just being paranoid about the weirdness (to me at least) of
> having one device be treated as both clock and reset line. Assuming this
> is tested as working, I'm okay with it, especially as it seems to be the
> norm for Renesas.

The combined clock/reset IP is not limited to renesas SoCs, there are 
other SoCs which do the same thing (Allwinner "ccu", Marvell PXA 
"soc_clocks" , nVidia Tegra "car", Qualcomm "gcc", Rockchip "cru", to 
name a few). Usually the registers which control clock and resets are 
shared in the same IP, but they control different (possibly related) 
signals in the SoC.

>>> Related, see my comments on the bindings patch (P1/3) about how clocks
>>> are wired up in this SoC.
>> I tried to reply to that one, hopefully it makes some sense.
> 
> Looks like we've figured it out there, thanks for your comments!

Likewise, thank you for sharing the clocking details.

-- 
Best regards,
Marek Vasut

