Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C9DC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNcJg85jb8uy9BPEHwY/03BnrTApgjljAhujB76L3OQ=; b=ueX1HcqjGbKMYmdVcsrQXPMAYn
	DozvEPUUinN4jEM7Nx6sFD11sUUlAfLywAgs1DHNUy44Ni6vVbbVbt5GPKkIeZx9z4Z8QUVaou9HX
	29A1tLUOICXLDzbT9o6L82Cuuz7a+f29MF9P2DnNDEsZQR64ClZJUZLF+7b/f585jZcIQNIGsGeOG
	Bb+rJve+VQnNdQe945YljFvEaIw1fisJSGdzZpTVlwatzJHDwEks8+bifNUozWw6XJ6MHXOR+kxTz
	gFvsYF+U5w301wrQ6gBXr5ER1s0PHBOVt3LoU3mTNZ8LDBKLatbygl7ZOp14utS9gYtw4tvm2qCk3
	6voJ91Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfbW-00000002uQ9-1MAt;
	Mon, 24 Mar 2025 11:04:26 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twfYh-00000002u51-01Qk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 11:01:32 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1742814078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNcJg85jb8uy9BPEHwY/03BnrTApgjljAhujB76L3OQ=;
	b=mb56TlnpQ2C7KhQEa60Jci1EhHvGjef7HtEcDICRX1TD0r4ooU1qaLVYYQfo8ZkzrnjA6W
	hOXNmmclCAYps//MT6KIy1u3rRLz+++/Arlt8PHXLtrsH43IRK3fRXdeiuB4/DGailAm0W
	Og7X5LJ7Bl7RxBw7USIAe8iEwYPaQAsWiIinnHBcwZ1XG31KEJRDXHAdiuY18+/F8IoMcx
	ov/J2tLfPc8xY6I9sj48SWZwXB51DK9VGy7qtt6NltNAakWwKys9H071NSvnKJcCTfs/B3
	R51GnMEODCmGELfdr8t02ff/sN22pU/zixEqsrC0a72BAF+FjmUSdt4EETa+vA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2025 11:00:47 +0000
Message-Id: <D8OG0OI3HO2V.326AQZHJWCBAI@postmarketos.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>, "Christian Hewitt" <christianshewitt@gmail.com>
To: <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
 <20250319190150.31529-4-funderscore@postmarketos.org>
 <f36875c5-73bb-4bf8-a59f-5df30043bbbe@linaro.org>
In-Reply-To: <f36875c5-73bb-4bf8-a59f-5df30043bbbe@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_040131_184087_C6B670E3 
X-CRM114-Status: UNSURE (   6.87  )
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

On Mon Mar 24, 2025 at 7:02 AM UTC, Neil Armstrong wrote:
> I get:
> Error: arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts:243=
.1-2 syntax error
> FATAL ERROR: Unable to parse input tree

Yes, somehow a ";" is missing.

>
> whil building, could you fix that ?
>
> Neil


