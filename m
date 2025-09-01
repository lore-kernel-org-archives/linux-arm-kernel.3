Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B466CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 04:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quDK9J6zNIvpJEID6bs9zR7wT+kKDFkKNW3zLnLB/YI=; b=Qk0aUWUUyYzIG4hGVFYnuX5ofE
	vXZ8rXlil+5BijP60Wo++6ql2MIjrWCkBl6QTh8Lp26EfOwoRghhtlfj6lOgl3aRAaCOILR+eMoL8
	NZ/GMim7EiHca0up+c2rzn+0H8DydCRJ7+nDLZTkkoUVdrK5KrafIVl0nX32//PZouXdDFNYaEkDY
	fOeiSqxVmjtjQ3Burdkza05d6sFer6OjFyvktdgBCluB2jJ4KsX7/ZCKyTWwLTRZj67vDlTXhslIz
	pfjLWeHxmjU4SUp/732Ecd3m8f09zau96x3MZIJSgMxN7XaYIRazE85qevGP8sAe6lobYSBFY6Svt
	eBLJQZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uswEx-0000000B9I7-1YpH;
	Mon, 01 Sep 2025 04:33:59 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uswCD-0000000B9Aq-3RXc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 04:31:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D664105A26;
	Mon,  1 Sep 2025 06:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1756701057;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=quDK9J6zNIvpJEID6bs9zR7wT+kKDFkKNW3zLnLB/YI=;
	b=bzJQgNFof6zUwcL4ZoVzZy16oEN20bmKOjJL889sBGUDlqXpyG8YmN6+e6f+OgBkc5GMKO
	lU0nfn6opw9N1+MTB+e5hFhNPBAzSorQkqU8xCq7IAp7rfmG2bfzePfCN32aUnHtAnJYTG
	kh6x5LPQQ4TsgFdovW5QBeMce7qXlBczosh2fn+pKmiJRDCxS1CKzxgp1FDGRgXqPoA8kB
	UiDqo/3LyMB/PX8Aj/i5po8dq4pgfE/ZBB6r60W+d1McQgHiOujtxY4LLfMH6S4v7nHRXK
	lrx0yhj4pCVQxzzn3FEfaqqSBryAFrHjp6GSjzi6if0QMb91PesWLOs//s30+g==
Message-ID: <ddab6133-076c-53b0-b425-c65a5447f666@nabladev.com>
Date: Mon, 1 Sep 2025 06:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] ARM: dts: imx6-aristainetos2: Replace license text
 comment with SPDX identifier
Content-Language: en-US
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 Heiko Schocher <hs@denx.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Erika Unter <e.unter@denx.de>
References: <20250709-abb-dts-lic-v2-1-adc5e4781f65@prolan.hu>
 <58709258-9154-4ec1-b64c-5be161b061e8@prolan.hu>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <58709258-9154-4ec1-b64c-5be161b061e8@prolan.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_213110_079971_E92963FA 
X-CRM114-Status: GOOD (  11.61  )
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

Hello Bence,

Sorry was in vacation...

On 13.08.25 17:11, Csókás Bence wrote:
> Hi Heiko,
> 
> On 2025. 07. 09. 9:28, Bence Csókás wrote:
>> Replace verbatim license text with a `SPDX-License-Identifier`.
>>
>> The comment header mis-attributes this license to be "X11", but the
>> license text does not include the last line "Except as contained in this
>> notice, the name of the X Consortium shall not be used in advertising or
>> otherwise to promote the sale, use or other dealings in this Software
>> without prior written authorization from the X Consortium.". Therefore,
>> this license is actually equivalent to the SPDX "MIT" license (confirmed
>> by text diffing).
>>
>> Cc: Heiko Schocher <hs@denx.de>
>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> 
> Do you agree with this change?

Reviewed-by: Heiko Schocher <hs@nabladev.com>

bye,
Heiko
-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic

