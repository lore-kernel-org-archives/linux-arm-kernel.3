Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E3BD6AB19
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjFUAr5TF9qMHsoiwD86cKQNGRB+CzXIhSoVtDvqsOU=; b=VtOUwb/ZaOXJ9pkArVHQH9d3V0
	De2Q8ThHp+ou0S9GyLc8x7X8Ti1teGuU5zOeho5+NWU7oC7wSpFuZ2yYlL2MrKlkJcuMv3CKcxLMI
	RsxDLa+Md5wXArKMKlgk+72u7fgcQJ4k8OxUiPYmogv3yIV1RUIEg9ryZymHHriypZ+eRUAmphmTV
	3PBVlB+z32IN13gIaywvnFAkqBRLkVUblycSVHnKg7JmgixrgnsWhYm9GaPF1n+tIm6jO39Q7xXBC
	Vy+ZwTl9fi/C00lRBUVl/y4qIJTpt5IFyutJ247Ts0pwM7fZdl8l7rbkxDP/23DB25LLMDw/tq7cp
	duAgdJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ztt-00000001iIh-2ZSI;
	Fri, 03 Apr 2026 08:29:09 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ztq-00000001iIF-25AW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YjFUAr5TF9qMHsoiwD86cKQNGRB+CzXIhSoVtDvqsOU=; b=HkLIlFthMtqIU2FWjoXhuHCrK1
	CNV810xc7IAnUy03WGQmFdqV5TE/yzzWXxDdsomaDk32vH+a28yFp2LDT57+sVO5Rp/IGFkJJz4OR
	OGJnUSW7W5sz7ruEDjHvyDgsabOz0mFVJzDEjxtoemUR7U077UNr6GyXWyjXWO/y0MHto/QyswYTO
	4IFPlY1e7yICBfCZJw40FSSjzJZ+FJuQjQbm1Pg3dVL7b95kt5BSZ0VvEF+B/6QNeHd27EPS1F4r2
	hTHfS1DMZvGEl2r2wcsukPns3KYUmMsqnUaMmUJ7R6ywD4cuEA6dXOwTZBGxMzcXOe4Vgw/+uMwce
	QA4D8lmw==;
Received: from 86-58-88-254.dynamic.telemach.net ([86.58.88.254]:30374 helo=[192.168.1.122])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8Zto-0000000AR5L-0548;
	Fri, 03 Apr 2026 10:29:03 +0200
Message-ID: <56b9e133-74b9-4e59-a40c-c7637c080fd8@norik.com>
Date: Fri, 3 Apr 2026 10:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18
 overlay
To: Frank Li <Frank.li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20260402070826.970012-1-florijan.plohl@norik.com>
 <ac50OHuEApM3tRHq@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Florijan Plohl <florijan.plohl@norik.com>
In-Reply-To: <ac50OHuEApM3tRHq@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_012907_007836_EAC04B22 
X-CRM114-Status: UNSURE (   7.53  )
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

On 4/2/26 15:50, Frank Li wrote:
> On Thu, Apr 02, 2026 at 09:08:26AM +0200, Florijan Plohl wrote:
>> Add overlay for the PEB-AV-18 adapter on phyBOARD-Segin-i.MX91/93.
> what's means PEB-AV-18? Is it random board name?
The PEB-AV-18 is PHYTEC designation for Audio/Video adapter modules that can
be used to connect displays on their boards.

I will improve commit message to add more such information in v2.

>
>
>> The supported LCD is Powertip PH800480T032-ZHC19 panel (AC220).
>>
>> Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
>> ---
>>   arch/arm64/boot/dts/freescale/Makefile        |   4 +
>>   .../imx91-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
>>   .../imx93-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
> Any difference between 91 and 93, can use one overlay file?
>
> Frank

Can you suggest how to do so?

There are imx93-pinfunc.h and imx91-pinfunc.h which are not unified
between imx91 and imx93.

So we can only create common dtsi like so:

imx91-93-phyboard-segin-peb-av-18.dtsi

and still use separate dtsos:

imx91-phyboard-segin-peb-av-18.dtso
imx93-phyboard-segin-peb-av-18.dtso

Is that your idea?

BR,

Florijan Plohl

>> --
>> 2.43.0
>>

