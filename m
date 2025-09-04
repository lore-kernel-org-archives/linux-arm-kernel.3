Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80435CA1014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 04:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6c256qQf2+lPChQleNTabNgjDZ9HCjDllbpACt/4yQ=; b=I7CdSppz0X+PqLD7AaaolFMNIM
	5pNfuU2qMGICEismAGwh7l1rJQe8Rav57gesR11Am3eT+pWLczuOZBPdZBS6H+UrU+DQlv6eH3INw
	x3Ih4RCXqmxb3qMcJjWoiodyIIyB6qw2mw37c1GIXqn5qstr1161qX3yE+9hIYX+90fjbEutED8JV
	OEbebtfLJ+E5wPn2eq8PsJClSw+iR4pR3/REp9uIHTOTsEbLRqZF7AF1qAYYBga5aSrpRIIbj71ct
	QYEWMuknkRoRQGbxnakG457Ln0Yp2OW2vpvy9evZVkuozuH6yFsG/+ZQnuGJvpM1Xf1SPT2LdigGo
	XTdu4skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1Pq-00000008vLS-2XiN;
	Thu, 04 Sep 2025 04:17:42 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1JX-00000008sgv-0bAH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 04:11:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 144D3101BCF;
	Thu,  4 Sep 2025 06:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1756959063;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=r6c256qQf2+lPChQleNTabNgjDZ9HCjDllbpACt/4yQ=;
	b=HiqyRxhOZSloSKrX3V2oCouTXLKNM9m8vCwl+6zFdCKeAnk+4lP4fAyHCdMZ5i7Ijb07K6
	hS01N3VoLh8XMft6KSEJ8zkPTX2afsGtRmcrfUQaCl2f4HOFEsIpnWLL53uM4nazS2E//n
	oLzPhzCY5/h6h4zzwDwyejealvEkIBqtOs1NQ9C44ALAtajWB2YYXhlGHTAAtdjfcdq1YW
	eAEy6c55Qf6guCZtrIz5ph81l9higMj5woX4bk+hg4qCNvYL71M5AcMDUfN5gdX1jstU86
	HVPu8ZC5/Qk1blAkjPEIiKnHg6tI13scsYivM/QYwwFk0j9wKUVluvLzqX5hVA==
Message-ID: <9b32b7f6-637e-000a-63ab-642022ad5b8d@nabladev.com>
Date: Thu, 4 Sep 2025 06:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 05/16] ARM: dts: imx6qdl-aristainetos2: rename
 ethernet-phy to ethernet-phy@0
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250903-imx6_dts_warning-v1-0-1e883d72e790@nxp.com>
 <20250903-imx6_dts_warning-v1-5-1e883d72e790@nxp.com>
 <CAOMZO5AGv2ykKmL631A6O2yas-1ffmFaZdHFGMxrFx93G9t8XA@mail.gmail.com>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <CAOMZO5AGv2ykKmL631A6O2yas-1ffmFaZdHFGMxrFx93G9t8XA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_211111_409277_D19EDCAF 
X-CRM114-Status: GOOD (  13.46  )
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

Hello Fabio, Frank,

On 04.09.25 01:37, Fabio Estevam wrote:
> Hi Frank,
> 
> Thanks for working on this series.

+1

> On Wed, Sep 3, 2025 at 5:20 PM Frank Li <Frank.Li@nxp.com> wrote:
>>
>> Rename ethernet-phy to ethernet-phy@0 to fix below CHECK_DTB warnings:
>>    arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dtb: ethernet@2188000 (fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
> ....
> 
>> -               ethphy: ethernet-phy {
>> +               ethphy: ethernet-phy@0 {
>>                          compatible = "ethernet-phy-ieee802.3-c22";
>> +                       reg = <0>;
> 
> Are you sure the Ethernet PHY is actually at address 0?
> 
> The board schematics are often needed to get this information.
> 
> I'm adding Heiko on CC in case he can confirm.

Yep, Frank was lucky, phy is @0

So, I am fine with that change.

bye,
Heiko
-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic

