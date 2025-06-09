Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B850C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erCWTv1iBu+zhino5X8lqV0NnPCfncKslxTm/LttBO4=; b=fCILl1J+WO/bfYY/tSgGP9tTVw
	/WpK0mIJQ5b8XHdyX6URVNvRKXg8JbF69SAW95XW8+8zk4nXv05D8cef5yhRArzAak3I99bpeRaWQ
	/pO4UHun7jvXr82MMYoQdnguJfhqoRNK9aKk8Dsvn/Xo25RhRPR07YDGLfA5m2duNHCBmkDbesrRF
	BCzkFbyzSggtIIip0BDc174oketdm00ytRxm7sDpyTEVtSwRs32tJaT6u2OgN/7sG6gOWPIpNNaR7
	qtz18RR3si8FgrAaNm+PwK4WKpf63hkZvuxReqd3V5XCCEfozv4rtN92jbkRgUqqiWgn6wYopvufw
	R5qeTYYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYgX-00000003km7-1vpD;
	Mon, 09 Jun 2025 09:20:53 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYTb-00000003jSp-0DXE;
	Mon, 09 Jun 2025 09:07:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8E3B4326B;
	Mon,  9 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749460048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=erCWTv1iBu+zhino5X8lqV0NnPCfncKslxTm/LttBO4=;
	b=mqb8fdfUAPmh1nGlznkXqcy65DTSqmBNVTK2jEWW+sZy/L4Mwn72e1BDiJ6cNad6U5dhco
	u2tGJQquy5bw3+kHVVdCbRKfHfSnzViq+cQDLYETVOvMuFONiHdKYsOexHM9Wtq5TlUA27
	Wq6EQAHizzOUgD/5vnR/JKaEAE9T6g0f+lVPjJLQmVUJ7c33S2FZ74WRNQJywTAYKrGQVk
	fSKxOTK0HsojuD7X2IAULVVy80JhHB4I6IhrxTD2EO/Jy5eiufVse+maoLpEn6h5EHezDB
	jnD8xN55kzjPhIwMon0UA42cRqfRK4brNShFTyzymTAVg6aNocx8YOUgeY/CTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  Rob Herring <robh@kernel.org>,
  Mark Brown <broonie@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add VIA/WonderMedia serial flash
 controller
In-Reply-To: <CABjd4YxRMfi3ZFQxhB__6U4Rm3KQ7bm6J=wQLWAkpb++61ddEg@mail.gmail.com>
	(Alexey Charkov's message of "Fri, 6 Jun 2025 13:06:22 +0400")
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
	<20250510-wmt-sflash-v1-1-02a1ac6adf12@gmail.com>
	<20250514204159.GA2988411-robh@kernel.org>
	<CABjd4Yz3w75PtkRk_edzD5yf6b2xPuf20gopbm8ygddgCBfpkw@mail.gmail.com>
	<2b520ae5-eb0d-40eb-ba73-cc18759f33b9@kernel.org>
	<CABjd4YxRMfi3ZFQxhB__6U4Rm3KQ7bm6J=wQLWAkpb++61ddEg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 09 Jun 2025 11:07:27 +0200
Message-ID: <87y0u1z3jk.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeltdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegrlhgthhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_020731_385539_4B0D492F 
X-CRM114-Status: GOOD (  16.27  )
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

Hi Alexey,

>> > Happy to reference the spi-controller.yaml binding if so.
>>
>> SPI NOR flashes are still child devices of an SPI controller. You can
>> look at other examples - aren't they all using spi-controller? Why this
>> would be different? Unless you found some cases that are different, but
>> then which ones?
>
> No strong opinions here, and no expectation of any special treatment
> :) Just wanted to consult on what's most appropriate.
>
> My (subjective and perhaps unfounded) expectation when seeing
> something advertise itself as an SPI controller was that it would be a
> general purpose SPI master, to which one can e.g. connect an SPI
> driven LCD screen and get it to work with generic Linux SPI
> infrastructure - which would not be possible with this single-purpose
> NOR-only flash controller. Given that I don't know how flexible or
> restrictive other examples are in terms of driving arbitrary SPI
> devices, I thought it's better to just ask.
>
> What I'm getting from this exchange here is that I'd better use the
> spi-controller binding and respective node names regardless of the
> fact that this controller cannot drive arbitrary SPI devices beyond
> NOR flash (which, as I'm getting, is irrelevant after all).

Just for information, there are several SPI controllers which are
optimized for flash handling (not only NOR, though) and for that we have
a spi-mem layer which allows to reference a set of SPI memory "only"
callbacks. On the description side though, these controllers are like
all other SPI controllers, so the same controller bindings may apply.

Thanks,
Miqu=C3=A8l

