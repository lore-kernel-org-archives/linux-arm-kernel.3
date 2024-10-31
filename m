Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70BAE68974
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 10:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzAbhMEAZUfyoIVXCjByodeIayg7CrWmA3iwH6kSxRM=; b=fXPPkZuZ6c0vx+o+8hHQXuk7WV
	gltVnY8EEwjCpYr3SHT8coi4mncab3ACcWm72M9EftQLuQg52xr2KzhIWPZN2DaiTBx2h1ICFeiKy
	tEiChIkZiI5UbwW2iXuWcduevWxxxJnZHg90BpembMfO2Gvk9cy2aJLDnIQlAGg98of8KJH8QXwwn
	CNfWy/GUOTwpoA39AdDb9LANJ8btLXWYPIUgnblAkCfN/gRxqFzKMxCohyKfChj5rlf/30rZOFHaH
	a5sGk5odZ5jnKPFU1NBTQUUKnIIHAuafsYZ6bbcNW2H7vPoCahTWxF6Q6SnHUIDzhkucCnYQlHwH6
	S+sREKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SiN-00000003Ipz-3kQ4;
	Thu, 31 Oct 2024 10:47:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SfH-00000003IBZ-2gSr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1FB98A43DA3;
	Thu, 31 Oct 2024 10:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4667C4CED2;
	Thu, 31 Oct 2024 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730371470;
	bh=6CrcuhJVpVyzZYHnkIztljkwHxS2uMuZoIvXqVnHZpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F8k8MLWVVB2n8i2EG2GeD1q+KWJwfLHhbG0e11wMe08iNRpuDg7SqA2SmaHnsfytc
	 Y0/G0ulePUpwG12ZAV2lBwUnzzBBq1QMPcOIr+FXxs22uwSWVh8jy1uNrbe6Cp26qj
	 d6iBikK07CNDrAr5YFGkTvx2S1Nn2q6UutnkBw2THlEGzlys4as0FlRXXtePdg7h2X
	 keQ8lP7E2ScoAtDCmUtp7aH0nZnv9xbbVoal4QXMfW0V/aGqfC2KBmlz7LYxJUCkOk
	 OBWxcKVI/r0Bd6bc+EECIQg+BwariS53hciZ5HxN34pTH+TYPG6S1DwemPPrCixx7g
	 wBovvT29LEr2w==
Message-ID: <c3c60bcb-186e-462d-aedb-ab90d52a58bd@kernel.org>
Date: Thu, 31 Oct 2024 12:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: am335x-bone-common: Increase MDIO reset
 deassert delay to 50ms
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Colin Foster <colin.foster@in-advantage.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_034431_766550_36CECBAF 
X-CRM114-Status: UNSURE (   8.86  )
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



On 31/10/2024 11:29, Geert Uytterhoeven wrote:
> Commit b9bf5612610aa7e3 ("ARM: dts: am335x-bone-common: Increase MDIO
> reset deassert time") already increased the MDIO reset deassert delay
> from 6.5 to 13 ms, but this may still cause Ethernet PHY probe failures:
> 
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC LAN8710/LAN8720 failed with error -5
> 
> On BeagleBone Black Rev. C3, ETH_RESETn is controlled by an open-drain
> AND gate.  It is pulled high by a 10K resistor, and has a 4.7µF
> capacitor to ground, giving an RC time constant of 47ms.  As it takes
> 0.7RC to charge the capacitor above the threshold voltage of a CMOS
> input (VDD/2), the delay should be at least 33ms.  Considering the
> typical tolerance of 20% on capacitors, 40ms would be safer.  Add an
> additional safety margin and settle for 50ms.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

