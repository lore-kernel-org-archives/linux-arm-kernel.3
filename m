Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0D760A2635
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sv0iSQzm;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=l3Ic3VYd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Eooql/PWw9JrcOSkmPC1JhQXpt0yj7tFL/LJ7TTte3w=; b=sv0iSQzm52NOFx
	QyiDEoM+y/lSZ5+6YXY60QOV/qfuqCJNgUiHjoQJxtWmPS3oQL5AXZm55USLhRW7znYgC17MdASHE
	eM9s1B1EJ6S/HBZz4NkblmTUfmKUVCCLjYNaBn4IbhTvDIuR3ixKH/qstZbKrfX2SjdDXeSH+wdJK
	6JSvWN/8j0P7oIR9gR6CJWqCmmSJoEaNw1tAReGmCxwVHFTJsqX/Hu8VYiz5xzCMamZ7MefTyoeJg
	glxxLewZMnU98mecCDX5oFpFH+hJG+qATToDXVBkTGG1q4dCvFa9q2J5GNl3THX8rcdOLUqAN/tss
	UpNxSNHrz/3ouxQQI2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJO3-00000002RGx-3EXb;
	Mon, 26 Oct 2026 12:01:11 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJNz-00000002RGP-456v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:09 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261026120100epoutp035e740c6d2fefc1e87b9893eb2216a03c~iEpt30p3N1660616606epoutp03U
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:01:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261026120100epoutp035e740c6d2fefc1e87b9893eb2216a03c~iEpt30p3N1660616606epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793016060;
	bh=Eooql/PWw9JrcOSkmPC1JhQXpt0yj7tFL/LJ7TTte3w=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=l3Ic3VYd+gMtyXg1JgRhU7okFwCOEiwEoqoWQDb8N1n2G+hoj2eoZZjWy6BNeiazL
	 2DLAFM7Juqu38NPweXOp6vDulsFjwTCue8tgAufNaF3R6CYajbtnN7XuldaVgfYdFk
	 vbHCxmFrIiDGFXUvx/j/FTwNZV5RKJvAZVG2sES0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261026120059epcas5p1bdaf5a44a5c532174e91bbfd3d5400a6~iEptUuaTR0298902989epcas5p1a;
	Mon, 26 Oct 2026 12:00:59 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jCsf26vfDz6B9m5; Mon, 26 Oct
	2026 12:00:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261026120058epcas5p32b10714e9c7e86c757b03baf88c6b40b~iEpr3-hd61524215242epcas5p3M;
	Mon, 26 Oct 2026 12:00:58 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261026120055epsmtip160f476325e622f7e86ea621ffb4427f6~iEppABK6U1282912829epsmtip1P;
	Mon, 26 Oct 2026 12:00:55 +0000 (GMT)
Message-ID: <c09bd0c9-5173-4cb8-a2c0-2b5008b63712@samsung.com>
Date: Mon, 26 Oct 2026 17:30:54 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20261026-attractive-puma-of-merriment-0dfbe4@quoll>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261026120058epcas5p32b10714e9c7e86c757b03baf88c6b40b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
	<CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
	<20261023131501.3157463-2-selvarasu.g@samsung.com>
	<20261026-attractive-puma-of-merriment-0dfbe4@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_050108_348418_D63EC3A3 
X-CRM114-Status: GOOD (  11.88  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/26/2026 3:14 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 23, 2026 at 06:45:00PM +0530, Selvarasu Ganesan wrote:
>> Add the Samsung Exynos8855 DWC3 binding using a flattened node
>> representation, where the DWC3 controller is directly addressable
>> rather than nested as a child node of a glue layer.
>>
>> This is the first Samsung Exynos binding using the flattened
>> representation.
> Ah and:
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://protect2.fireeye.com/v1/url?k=f1571c7b-aecc251e-f1569734-000babff32e3-08400c25edf5bcfb&q=1&e=549cd4c8-34f1-4b98-afc6-3f62b054ef3c&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv7.1-rc7%2Fsource%2FDocumentation%2Fdevicetree%2Fbindings%2Fsubmitting-patches.rst%23L23
>
> Best regards,
> Krzysztof


Hi Krzysztof,

Thanks for pointing this out. Sure, will drop the redundant "binding" in 
the next version.

Thanks,
Selva

