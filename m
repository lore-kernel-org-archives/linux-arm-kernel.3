Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3DCFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 02:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2gkGx0qbH8dyPrjo4aCMyIZZWrDKWMxxuUOMKVkUJY=; b=OLxkiMdEsDX2b9jESLv7THeLjx
	USeRkA7LqsmIf2mNPeFPU/CYKcgjxEIhJOXO4rzSjKcd3sz92ECnFWQjdmO/JUpm+HaaABhrSBJK9
	5LqoOTMOee7X7GT6lh8qMZdeQIu6OQycvoHm04EIWnDSSoR4+Ic7p978Y6TK5/zs3JoXXsW/hegBv
	H1MDY1iBzv74Ha+AxUnQOy7JFTp2reEAQI/P7XVoIK7jT+aGe0ZzZJF21FHYQE4MYkt8Pud6xWrXq
	+Z/3qN7Jnr7E3twkN4ZdXB3CTF1NnvTLc+wNDNi7EvFCP9m3BbhniOTkR/KqoqUhMrEeR5BPEr1I4
	Z31zFe+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK5Bh-0000000EsDX-18g4;
	Tue, 05 May 2026 02:07:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK5Bf-0000000EsCt-0EsH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 02:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D38740781;
	Tue,  5 May 2026 02:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BC5C2BCB8;
	Tue,  5 May 2026 02:06:57 +0000 (UTC)
Message-ID: <31297e73-52a5-42a0-9676-ecf057f7c21e@linux-m68k.org>
Date: Tue, 5 May 2026 12:06:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] iio: dac: add mcf54415 DAC
To: Arnd Bergmann <arnd@arndb.de>, Angelo Dureghello
 <angelo@kernel-space.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Steven King <sfking@fdwdc.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 Angelo Dureghello <adureghello@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
 <965cb599-37ac-4d69-a8c0-015152037139@app.fastmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <965cb599-37ac-4d69-a8c0-015152037139@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_190703_121024_FDD14E11 
X-CRM114-Status: GOOD (  12.34  )
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


On 5/5/26 03:27, Arnd Bergmann wrote:
> On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:
> 
>> +static void mcf54415_dac_exit(void *data)
>> +{
>> +	struct mcf54415_dac *info = data;
>> +	int val;
>> +
>> +	val = readw(info->regs + MCF54415_DAC_CR);
>> +	val |= MCF54415_DAC_CR_PDN;
>> +	writew(val, info->regs + MCF54415_DAC_CR);
>> +}
> 
> We've recently discussed changing the MMIO accessors on coldfire
> to behave like all the other ones, which makes readw() and writew()
> have an implicit byteswap. An additional driver means one more
> place to change during the conversion. Maybe you can use the
> new mcf_readw()/mcf_writew() helpers that Greg has started
> introducing? Those will keep using native big-endian register
> definitions.

Yes, please :-)
Those newly introduced mcf_readX/mcf_writeX are in the for-next branch
of the m68knommu git tree now, they have not hit mainline yet, hopefully
in the next merge cycle.

Somewhat related, I will have patches out for the other affected drivers
over the next few days.

Regards
Greg



