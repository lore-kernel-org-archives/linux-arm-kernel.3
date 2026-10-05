Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B2DCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWUV3emk7ULpEee/9G63NluqNobYqArTy8HB1/MEtJY=; b=qDPmA0GrpJUmZFX1xSlO8k7Ort
	HUuHnS8JlqvMi8MCO9EcrhW9VhP+0UZhpOvwBR/bAgo1zbDZ1DpSPxvW2aMK9GLOex4BecaKKT2PI
	QKAkmIHMkS9rQR1VJ/w9j6W/y3OI0Yox4NDqpz/wuefEYrcukXTfvpHBr2aCLfG4Opmj2Wqu2/j+o
	nSuDweOGYzC1sWcr+3YVSCOYRQBKd5il1yBld1AKfIvlo1mpUAcG2ZGf0ze640U53VsK4ekT6ZLeD
	MlNj/bcjKvxL7s1B0b+ndUjZbkiD0jgpHw+m9YDyD1t/bQ5qHi2+3oVxnVMLmPPQI2D771HM7edPO
	umrgxlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDl6A-0000000GoCH-1sSA;
	Mon, 05 Oct 2026 15:59:30 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDl64-0000000GoBN-1TSh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 15:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791215953; bh=wWUV3emk7ULpEee/9G63NluqNobYqArTy8HB1/MEtJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=q6YVYBE88V85PRYuvbIq3neymOFilDrh8cO5qqWizFRHMcK9SRpLyPHt8eRZJni7Y
	 AhKt8fy55tPNH8CsIQjBLqWSSSxlOWUz1zluf+zzrhlW37b1Qt4B/fIXqOR5d3oOCn
	 V0ik3x92lqC62BA97RBRf05IWe3tL4K+cSNtOyvU=
Received: from [198.18.0.1] ([112.43.117.189])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id ECAA2E19; Mon, 05 Oct 2026 23:59:10 +0800
X-QQ-mid: xmsmtpt1791215950tdkxd44af
Message-ID: <tencent_F21509258CF77A024260954C593157414F08@qq.com>
X-QQ-XMAILINFO: MhK4DKsBP06iQ0lS0hbC/UsLm9tt/MybcZCBA3F8VcY7H+aZeqAd8AROVa4pXO
	 d0pIei1IbKnZP6DIoAZ63YcKKcIIkGQ3lkGuWRWClueza9+PIxnIIKTf8t8nr/fD59D89U+EIBVL
	 pJFEJqG/ddtw5tSjxy2YFSR+z9MfRNKc9ZRI/oUaJVVtgZgVMtgcmxujBACCn8EYlTkhkOy0abr5
	 UIrmORpcPUMjDgrISxSTXiW5LEzQkcaCECIfYULE7jpwPQ9JpmJnpalM9QCqCCgEvpqM+MXLOR9R
	 rieP/2H5nNw/HcFtxJEy8tf99kEmztlQhucqRvsYMdswUg39IwpMehiIqPOj5UsRax51j6bWULQd
	 MfimKaKfYpn6P9dkwjxbcByDoMLz5WUT4SkljPAo4/lpKlU+Rw3BktTsSqhBDHsf8jCztjIrKWAQ
	 XDBmKvZFD2PA64M1mbBuk/kGfHlewP1vX0rf5xKn3oi9VHXm59MUd1DvSgJrOKYRDf96S/BftjSI
	 xBJnmgL1W61ajxRpkwW/FRSpkD1EpgOq6XOIgx9uQLwTL5NnEpv2PmN7mHMZlhN8KDyjwLjioN/M
	 cKqmzeUks5/DOyjXIydFIQc8XU1LjrdqhxZhFerDTBvdj6/xfeCP2EmnPbaGq9TLwKQy+JRS6bDP
	 9uGeerVZETCB01xMQ08u8Vg5lw3fGgFE3pUQ84v8LFXlCPVLrRdlFiLT7uBAST08rJVbbYLoKHwT
	 8gmRwww+uZG7+jl95rniYFUkuf7qerHqPYFLGuiWx+0n2tB2/0zveOW771jTcHcy1MFD/K5dHQSM
	 JNVCpywNHClD+uLOE0pS5cvCEiSHRElx8K2HMhhtkcvVzFW4hXxNzR9TGd5defYSxt3C8dAAeSIs
	 DUmd5qUZr5M4PF+goJFu0Jv9zkfT+17Drz7uukSJJTPfuh3Ht3fLXtutvMBzqjzXtcq1atYFt+wu
	 dbEw1n9AsI99ZeU9EbxG4Kag8ygSlF+NQbK7v21Rt9cC1+0tN+4vI4cR2Bm0zj7qt0n665bJexjb
	 PVd9o2DAmUBQtthosmwrLPWjIwWhwLHgcCd6sQb39CZIa9YZkfnPbX5y913nQ=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-OQ-MSGID: <322103a8-cf74-4213-bc95-e65c34366dd1@qq.com>
Date: Mon, 5 Oct 2026 23:59:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: Add EBDEE vendor prefix
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261003194625.936288-1-2254650260@qq.com>
 <tencent_E21E2A584AF8EE0505C2C0809838621C8209@qq.com>
 <387c02a6-1298-44a7-952e-47d1d8535541@kernel.org>
Content-Language: en-US
From: Pufan Jin <2254650260@qq.com>
In-Reply-To: <387c02a6-1298-44a7-952e-47d1d8535541@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_085927_171122_D91DC397 
X-CRM114-Status: UNSURE (   8.82  )
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


On 2026/10/4 05:14, Krzysztof Kozlowski wrote:
> On 03/10/2026 21:46, Pufan Jin wrote:
>> Shanghai Xin'yI Electronics Technology Co., Ltd. (EBDEE) manufactures
>> the EdgeBoard series of embedded compute cards, including Zynq
>> UltraScale+ based designs.
>>
> What does EBDEE mean? What is the company website?
>
> Best regards,
> Krzysztof

Hi Krzysztof,


Thank you for pointing this out. "EBDEE" was an improper local acronym
derived from "EdgeBoard Developer Edition".

The actual commercial brand and manufacturer of the board is ALINX
(Shanghai Xin'yi Electronics Technology Co., Ltd.). The official
company website is:
https://www.alinx.com/

I have dropped the "ebdee" prefix and replaced it with "alinx" in v2
to properly match the manufacturer and board schematics.

Best regards,
Pufan Jin




