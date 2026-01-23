Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D426D74EDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppwFZXgcvjPvaDl3An5foL2pHBaMM0peRix6xgcemok=; b=2EYc8nDQFrnr+8g8b0kylgZEUi
	YbkVrk2YA2qSbe8aRUwLALM58NAK6tbUP4EjRD+50AJwLpED5itaY5kZ2TX4oL6OXPABSMm2SL1vI
	wWE/OddwKGTIn94XZ06Jx6BH7g+gLccOKAOMGAPGCPwqixvUNMOydcifjTgM9DZdsvAbOzsax6NI+
	ElBwK1A76UIKuoNlwWFfvpEIQv1okhUlZdKwih/g+LT6UZxGxlYIcX+faC4hY02ZMkt/hPLCzi3k3
	dNc0K+C1T1OzV3eBalumzfP9qLsc68c+2JXcnh+yw4Dm9V3XUMu1wGLJUiSz9FEVP8WPLC/VUmKWd
	Qc9qLwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIgZ-000000094Zg-1yVV;
	Fri, 23 Jan 2026 15:02:55 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIgW-000000094Yw-1v5R;
	Fri, 23 Jan 2026 15:02:54 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dyLl14WMjz9tVF;
	Fri, 23 Jan 2026 16:02:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769180557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppwFZXgcvjPvaDl3An5foL2pHBaMM0peRix6xgcemok=;
	b=gbd2/qmMSN37+mcpyEQnOijscfiBq76dBaqQRZJF96Zptuz48HQJzaS79bSH15aEbfN4lz
	kIeAy12nCESlq2xTg94Mr9rnumQ/Fw8IOYvZ+v7Fca9q4hQLt1ram4YsF+FezVOJpPc9YM
	uMcBeZQ4oQnKITRsPqks+R9m6rYO+o/T1kxGZB+zLcery8mVxlsiCLbtZcIlgRptvNRHnt
	EDHzSZK9Vw8rWthU5mYQD6sgUSWj3S47h061fohYlGtKOlLLu0RZ/EkJHrYAgq/v6qn39S
	IzDtC2jVtK+wNZnm9LCs+iBkXKzM+Dv7utuhv62Zgs7S9GEr9iWkUNkA28POqA==
Message-ID: <43bf0bd6-0aea-4323-a64b-26e61a561881@mailbox.org>
Date: Fri, 23 Jan 2026 16:02:33 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: ulcb: ulcb-kf: Describe
 PCIe/USB3.0 clock generator
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
 <20260118135038.8033-9-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV7UPWCqj4A6097KKT+Es2Zz_mPeJoyJd5qDMudrNx_5A@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdV7UPWCqj4A6097KKT+Es2Zz_mPeJoyJd5qDMudrNx_5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: z5716wskbhzhgn31famzwdrhkjh9xnxg
X-MBO-RS-ID: 41e6431bbdf3d0e5844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_070252_672358_86591CA3 
X-CRM114-Status: GOOD (  14.35  )
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

On 1/23/26 2:37 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> Thanks for your patch!
> 
> On Sun, 18 Jan 2026 at 14:51, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on ULCB
>> board. The clock generator supplies 100 MHz differential clock for both
>> PCIe ports, the USB 3.0 PHY and SATA.
>>
>> SATA is not yet described in the ULCB DT, therefore the connection to
>> this clock generator is not described here either.
>>
>> The H3 ULCB schematic does describe connection from output DIF7 to
>> USB3S1_CLK_*, but these signals do not exist on the SoC, therefore
>> this connection is also not described.
> 
> That is the case because the first ULCB came with R-Car H3 ES1.0,
> which did have two USB3 channels. R-Car H3 ES2.0, M3-W, M3-W+,
> and M3-N have only a single USB3 channel.
> 
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.21.
Thank you

