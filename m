Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D009ECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqSlpzzBjh5abP5Ep10OGKmrH1NoW6pA+tFSYa8a7oU=; b=Ql4qRa49tjJO2T+BXasB1PUqF0
	V93n+8SPaNBSzHMWZE5cF0oy+ODaNbd7SYQHZSJDhj0BZfLMRhbPE7AyyZ1Cui2uDGVk2etlPBKC7
	2wglNvJdLtv+gdTAwpDCU5ScBSDZOVszDyO7beK43LhpHulYUdgjb4WtzurISbKPPn1oB4mLduWAj
	xxHM8dbEIbFl5y8OqC+xpiSOe1igqv8tjvg+bepYNfARQn3h70jl8QHbMTWyXwZQLXeVl5TSpXMU3
	qtr20nGi8ciGp7L/mqKB+sdFKuGhoX+6hlNM23DlXIxddlR7/ZTzfE13dHbdZdZhIQNydfJQ30vgZ
	NikwcRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03P-00000007UGe-3pPm;
	Mon, 18 Aug 2025 13:37:39 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvEk-00000006wZp-3oEr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:29:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 737AF4317D;
	Mon, 18 Aug 2025 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755505739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqSlpzzBjh5abP5Ep10OGKmrH1NoW6pA+tFSYa8a7oU=;
	b=Rv0VYgRDLz+wpcDNTv/5vHuI3YEpR0ijBjEG2iXuknPIRNS9iN/wnY/AHHIdfssdu22ZpQ
	F3GRdf0YrrFHP7SL6azasxNjKl+/zt9FRxxbeWJ884EhY0+pXsbtcYXg4z1eVMjae1qTa4
	A3RE21DnrdFcuw2jun2fqbr8xo8sS3JdrrF8fHRRqOGwaPV0iEQa+4ddYSxXiSmy21PKzq
	ljhf1okCHY97hEpf/JSrf4/k+0aZ6J6zzD8O97E1KMfGoeeh9O2zgAOAAaZnzKVsXcr732
	uSP7+u2ueFbKs3SEZ9eoMUhcGH8fptMlHuvWjq4aSiI/xeXuuy5cNJLGfSAlPg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,  Mark Brown
 <broonie@kernel.org>,  Michal Simek <michal.simek@amd.com>,
  linux-spi@vger.kernel.org,  Jinjie Ruan <ruanjinjie@huawei.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
In-Reply-To: <ded7ba99-089b-47a7-95b9-ca6666dc3e29@baylibre.com> (David
	Lechner's message of "Fri, 15 Aug 2025 10:49:40 -0500")
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
	<20250616220054.3968946-2-sean.anderson@linux.dev>
	<ded7ba99-089b-47a7-95b9-ca6666dc3e29@baylibre.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 18 Aug 2025 10:28:58 +0200
Message-ID: <87frdp119x.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedvudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepughlvggthhhnvghrsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehsvggrnhdrrghnuggvrhhsohhnsehlihhnuhigrdguvghvpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehruhgrnhhjihhnjhhivgeshhhurgifvghirdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_012903_279636_BB6BA66A 
X-CRM114-Status: UNSURE (   9.94  )
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

Hello,

>> +  spi-buses:
>> +    description:
>> +      Array of bus numbers that describes which SPI buses of the contro=
ller are
>> +      connected to the peripheral. This only applies to peripherals con=
nected
>> +      to specialized SPI controllers that have multiple SPI buses on a =
single
>> +      controller.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1

>
> Finally have some hardware to test this series with using 2 or 4 buses.

Out of curiosity, what is the practical use case and intended benefit?
Maybe an example of such device and an explanation of how useful this is
would be welcome, as it does not seem to fit the initial spi idea
(which has been greatly "improved", not saying it is bad, just unusual).

Thanks,
Miqu=C3=A8l

