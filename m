Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B447ED3ABFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 21:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYiVjrcxZpTi/c06BPQHiFC8F+p+6wh7EIqPd/zEwtM=; b=WhNM4F0SbL1cQOhngQBuzsPVc+
	HlCo3qPks4SUlMkjYrxzR5Ia4ND3w+DFvsu2aVhnwNYs7G0wpO9ieeWgCw1NGYJxy++qcPYor8+3W
	xQqNLtJXcJNwF+QZjXIUI0Yh5KB4IkISctwPQ64Dnshe6TmM8Q6pcaIm5GmmwpmlUmJmDB7Zk/Rhu
	WyM+AmVFS+hlX8/35Ef4/Dzn5CTxY2PdubKtp9tTtkZEF0WgctBq0wvgF6G3txXxHALXpf3xrifrE
	7yhd49AX3plwV51vqIx63MIf32WDOg8Fo2hStpY0gotBaxQmjPGSZJqFjuGETALuz6k9ANwN7nycp
	vFV8VkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbbl-00000001Ir5-2oQP;
	Mon, 11 Nov 2024 21:06:01 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbLz-00000001F97-02IU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:49:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EACAA40003;
	Mon, 11 Nov 2024 20:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731358179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYiVjrcxZpTi/c06BPQHiFC8F+p+6wh7EIqPd/zEwtM=;
	b=fR8BdtbLRORymTS3lN4WPxSA0gFafroYaf0+NPUNSYqFRz9s9YIJKoWcRxSyPUJK+T+GOK
	PDAT9kd0OL/+BSkML1RRiHrg4SNAbPz8qapqjynItAHTMXd3TVYuoruuiWfGssEMX05iML
	cRnrz7vx8nSCAK4Moe5i12X8Htm/mFPzVJFflXGFXkk/TumQfEf+mV8hV+RdrV4Dq2OwwF
	WWCdn/CrHb312hihColuJ1DRDDS91iiVj8aUbSV3TnVQgnSg0xxXmEDMwYHYepMgyUkMrL
	Oo8eGycEX9fW4rQCCC6+Sw01fq4NeyMHjov8vfmn3zbwxPiBBQVHeWcbFq8HgQ==
Date: Mon, 11 Nov 2024 21:49:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH 10/14] dt-bindings: rtc: sun6i: Add Allwinner
 A523 support
Message-ID: <173135816498.3301625.12210632932642052880.b4-ty@bootlin.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-11-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-11-andre.przywara@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_124943_363380_183C0BAA 
X-CRM114-Status: UNSURE (   9.05  )
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

On Mon, 11 Nov 2024 01:30:29 +0000, Andre Przywara wrote:
> The RTC in the Allwinner A523 SoC is compatible to the D1 and R329, so
> just add its name and use the R329 as a fallback.
> 
> 

Applied, thanks!

[10/14] dt-bindings: rtc: sun6i: Add Allwinner A523 support
        https://git.kernel.org/abelloni/c/9beeecbd63d5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

