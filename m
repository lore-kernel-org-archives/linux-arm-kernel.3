Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCF6EE49B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 21:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbZdVAaFTWODcICt4oidtE+rwPVgQ3ermHb4FrC1pcU=; b=K8vupq1by7kmDVV8t97JvN6GAX
	C739cD6jlF++nDqPTwbjigVhWjtGyDrWyBbe3RhVm+y4gfwk1Gi7k/KMQ6XzOzRMMGvJA2MN8E77/
	AXcZDQ07HPQX0yQw40FzZvG9DNDs/NexQepgCney48tDEh2fr7M64UVl2DljZIoTQLbakVjDsUkZ/
	3fARoYvy7shH/RNUdKg9QIaDUT7d3Q4yW9A6CyhnVqDvwWfK1ApsskIHOQpHlbiywgOu37vSEISqH
	j2puS7X6I7kva5TISlShtvYpxMJjwsBf1bWAa0kks5auNrReHLR2V+64lCoL8g3EnYFAYLbJ1V1Ja
	fGewzlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vahGk-00000005JTo-3CaY;
	Tue, 30 Dec 2025 21:28:42 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vahGh-00000005JTO-3m1T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 21:28:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D34110B69B;
	Tue, 30 Dec 2025 22:28:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767130113;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zbZdVAaFTWODcICt4oidtE+rwPVgQ3ermHb4FrC1pcU=;
	b=B7vSbpSUi6h+kYRi3xoSUxZaswBPtS5ejaB8EUL03cR7JIkAS9r2S8jY21jEJNraM8dGt3
	bPAwT2pPxmXdN0vVVc4Wssu/0Yim68CV1QyQsE19AQv8E2SisQ9yFJU/N2r889oxi4oei7
	Bg49NeZZuksUWCy3WhXpTluujOwdyq5QBRPgcZGUlTbr1dhuSTzF+ixS0tlxX/wkfqrd2X
	Wncix6hm3r21NzgrbmlvcsIjOVv3f8JvNun8Spi4PBMjSfpjAnw6KFkbTq7qhUpsXWdSSH
	6/Sbv/TLsG07ChTV1/yI/DMlAftY5pruK0++De4KI/nNJKVgf0HmGn1zUqA0dQ==
Message-ID: <8df1ff09-a5be-418f-9723-3f64bf97eba8@nabladev.com>
Date: Tue, 30 Dec 2025 22:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and
 v2
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
 Christian Eggers <ceggers@arri.de>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Markus Heidelberg <m.heidelberg@cab.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251230184121.52635-1-marex@nabladev.com>
 <20251230184121.52635-4-marex@nabladev.com>
 <CAOMZO5Aa6iDg2u-sJu1yPZX8T2wE=QVzwSbxjZHo1bMwfDW5HQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <CAOMZO5Aa6iDg2u-sJu1yPZX8T2wE=QVzwSbxjZHo1bMwfDW5HQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_132840_182863_08689783 
X-CRM114-Status: UNSURE (   8.10  )
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

On 12/30/25 7:52 PM, Fabio Estevam wrote:
> On Tue, Dec 30, 2025 at 3:41 PM Marek Vasut <marex@nabladev.com> wrote:
> 
>> +&gpio4 {
>> +       /*
>> +        * Hog USB-nRESET high here, since neither U-Boot nor Linux
>> +        * has any support for USB Hub GPIO reset so far.
> 
> Which USB hub chip is used?
USB2512B , so I can use this.

Both temp sensor node names are also updated.

Thanks.

