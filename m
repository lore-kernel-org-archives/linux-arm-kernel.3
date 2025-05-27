Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FFEC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yi+JDYL57ewf0irzru1gG1+7r9jGjICYz/MQy5TCGUw=; b=PfR3VP+mvssjugVdvK+r1ii516
	RBChQzIUyn781uhMqkTOwBJ1XnPSsKFNW530zyZ3wHlWj+yytHa08OkGFMhiRroarexZlE59W820A
	7j6If/ZZDsZcqehq814FTjAv0t8O36UNxqxDrJxmrKvvwN2HW/EXvd3vkqu+ub+1kID4hm3a2cEYz
	j6O+K3Ed/48WTr0q8Uhp/JAPH6pozoq8DPdSioverCrPe/7Z97T6e2mwYGEkSKrbsRcZAL2i7BZgg
	MS8A0bc/VX7yf8sim7tuVkAAitSZaNDyza07y8lh3ZslkX02eavMpJI1U+eEG2BxgLY1uzxnXICCM
	h9J4faxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrKn-0000000ARrx-1S8i;
	Tue, 27 May 2025 10:15:01 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrFp-0000000ARQH-1m2o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 10:09:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F76D43B1A;
	Tue, 27 May 2025 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748340590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yi+JDYL57ewf0irzru1gG1+7r9jGjICYz/MQy5TCGUw=;
	b=ERCndOZ4biQ61d8+Im5snI3+NFhcVZi3MhW7JlyrSpw79Xj7c+dBbjbQMiRFTqFk4jZsfu
	kJebeynHP+3KxmKNGm1beHxPHnp2vSI17dBkvqJITXKQHnevTT0tSXH500x7GLT6i9yg8a
	hDQNqN4bfkbBEpDxuMfT3EwAq421T/6sCy82RtuYxeqd0XQhJ1M4SEbOjYY7s0flhb6VUy
	AnTcAxYSrkO8qd+0E83ja9ACbWh1Mr6ydf7hUJiyckaQP32ijneUClC00mxKAIWwbNuMP/
	L7phdwpGOQiEADMw3W1k0K09ITIRNCCvnCGGdU4XU5ykHipdH2i1rWSOgc5kvg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Nishanth Menon <nm@ti.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Tero Kristo <kristo@kernel.org>,  Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Describe the SPI NAND
In-Reply-To: <98b6208c-4cfd-4746-9e49-4f5596f8cf3e@ti.com> (Udit Kumar's
	message of "Sat, 19 Apr 2025 18:35:47 +0530")
References: <20250401135822.244402-1-miquel.raynal@bootlin.com>
	<98b6208c-4cfd-4746-9e49-4f5596f8cf3e@ti.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 27 May 2025 12:09:48 +0200
Message-ID: <87a56ytleb.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtddutdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepuhdqkhhumhgrrhdusehtihdrtghomhdprhgtphhtthhopehnmhesthhirdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehkrhhishhtoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_030953_606822_8B9B0FAC 
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

Hello Kumar,

>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -737,3 +737,43 @@ dpi1_out: endpoint {
>>   		};
>>   	};
>>   };
>> +
>> +&fss {
>> +	status =3D "okay";
>> +};
>> +
>> +&ospi0 {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&ospi0_pins_default>;
>> +
>> +	flash@0 {
>> +		compatible =3D "spi-nand";
>
> Since this is boot flash, so please add booth-all property as well

Ok.

>
>
>> +		reg =3D <0>;
>> +		spi-tx-bus-width =3D <8>;
>> +		spi-rx-bus-width =3D <8>;
>> +		spi-max-frequency =3D <25000000>;
>> +		cdns,tshsl-ns =3D <60>;
>> +		cdns,tsd2d-ns =3D <60>;
>> +		cdns,tchsh-ns =3D <60>;
>> +		cdns,tslch-ns =3D <60>;
>> +		cdns,read-delay =3D <2>;
>
> Since this flash is used as boot device, I suggest if you can add
> partitions of flash as well .
>
> you can take reference from downstream version [0]

The flash is currently not the primary boot device, and the flash is
very fragmented in smaller mtd partitions, which is not ideal for wear
levelling. I prefer to let TI people propose a partitioning scheme
themselves.

Thanks,
Miqu=C3=A8l

