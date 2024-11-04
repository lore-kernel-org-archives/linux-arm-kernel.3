Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBDCD132B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wF15CK3q+ocViJhOms9ADFB9q0mQckeGq5fArBdv+lo=; b=WLu3QUEK0X0NYK
	gtwYi6pbug1tqSTX14Xe7wL6tEG1OauLkzSXmrNbv5d3bJ9F4qOTmIXgavYxlrmTH+fWWe4LeZVGn
	0j0DZ1wWDzGolELE+nrsG8gepCEZJ9uaGSiOpMbLMY09Qec+dBZjG3jy5hkiT1WOBEXDZk9Mzqt09
	cCiOatewmQpkAaBIy4U63f5NXLBhH599osnhGb8op4Ir5WXB0uTflknfAcfkY6loj6tSSngMpb8nd
	7fLl0E7O8k7EI2GOHlNZXx3NNR+qdQ1DxUQz/UKJChkZ7JqL85LK/7ZKrXIBMqL2RnQDxwYqevpSY
	+CJ27FlybyK5g1d7NQAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7w39-0000000DfkB-0VXI;
	Mon, 04 Nov 2024 12:19:15 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7voZ-0000000DdPK-1ch2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 12:04:12 +0000
Received: from [192.168.1.107] (87-97-112-21.pool.digikabel.hu [87.97.112.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 48E0088113;
	Mon,  4 Nov 2024 13:04:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730721849;
	bh=wF15CK3q+ocViJhOms9ADFB9q0mQckeGq5fArBdv+lo=;
	h=Date:Subject:To:Cc:References:Reply-To:From:In-Reply-To:From;
	b=Iaj/wtNDV1SD0/BijQwuDtssB1toG2nFV66NzthHlMHhmYB25iVlCF1meuY18lgET
	 uvP963YFf7wAYnCpvZeUx8iDCC3wT5rPBV1jdavV2u9t3tibTM8gCUJNyv/7HOFL5o
	 BkT7nY+s5GznUpkJwD6+VrV4ih1cP/2b5jaMma7ksv7+fmR1odoEBI6q9KHa7qg0tE
	 kX7Ub9zA7jVmA4gJIV6omTECtT6isvAouDxrNKTA3V0irX7WoYpriScMRsu1RG3csC
	 ompLI0tA9KsXNZRaSxzMiJsBbTNFDOlQhBs/tQTKU0h+GlcE9m9vCFulAnh6l+AOok
	 25Bx6jlNbBH9A==
Message-ID: <3214def1-4669-79ed-36c2-e19a119aabeb@denx.de>
Date: Mon, 4 Nov 2024 13:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp: add aristainetos3 board
 support
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241031151238.67753-1-hs@denx.de>
 <20241031151238.67753-4-hs@denx.de>
 <CAOMZO5ACMGbhySUbR8r1UUimc53YDaRbfEObyUrf0GLYZcQfjg@mail.gmail.com>
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <CAOMZO5ACMGbhySUbR8r1UUimc53YDaRbfEObyUrf0GLYZcQfjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_040411_608805_5FBF9EFE 
X-CRM114-Status: GOOD (  13.59  )
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
Reply-To: hs@denx.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Fabio,

On 04.11.24 12:15, Fabio Estevam wrote:
> Hi Heiko,
> 
> On Thu, Oct 31, 2024 at 12:12 PM Heiko Schocher <hs@denx.de> wrote:
> 
>> +               brightness-levels = < 0  1  2  3  4  5  6  7  8  9
>> +                                    10 11 12 13 14 15 16 17 18 19
>> +                                    20 21 22 23 24 25 26 27 28 29
>> +                                    30 31 32 33 34 35 36 37 38 39
>> +                                    40 41 42 43 44 45 46 47 48 49
>> +                                    50 51 52 53 54 55 56 57 58 59
>> +                                    60 61 62 63 64 65 66 67 68 69
>> +                                    70 71 72 73 74 75 76 77 78 79
>> +                                    80 81 82 83 84 85 86 87 88 89
>> +                                    90 91 92 93 94 95 96 97 98 99
>> +                                   100>;
>> +               default-brightness-level = <80>;
> 
> One suggestion: a more succinct way to represent this would be:
> 
> brightness-levels = <0 100>;
> num-interpolated-steps = <100>;

Thanks for the suggestion!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

