Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jS76k/nC;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=aRNo6BGr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EMKZaE/XYFh3yT6HQAtYI/zY8AmONcVS3pouBV0eGto=; b=jS76k/nCuW6Gq6
	HaHFcZ9+Aa7PtelWYje7ZszgP7bxjRY3NJHoykc6uTxigok9dw+LYRhxw+M55cNP/iBWtTVTk1NaJ
	yGTTqSQXpgOgMScIs5Rj878hXiMBVtRgqVrGSCMThLZIS0pSZpnRi0ckaESMjtXnPYpnMeoqTCeIC
	y/l8gVSSCwkq17Qud0tcx2nMNcUlBGGUZJd5Tj/wZn7yeThCzSJQi2xHCUQj/ScHLhAbviZgVWR//
	RMP5bHMZjGXoKT+5S5aUtiJngQQ2bDF0Pml8PFDxpKNbLCOukXQqvEQIZWjAwuGMTzrOOvo8jBCd/
	56QAHXT9ostfU3D2zPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSWb-00000003KS2-0Vr5;
	Mon, 26 Oct 2026 21:46:37 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSWZ-00000003KR0-04aP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:46:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E604B109A29;
	Mon, 26 Oct 2026 22:46:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793051188;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=EMKZaE/XYFh3yT6HQAtYI/zY8AmONcVS3pouBV0eGto=;
	b=aRNo6BGrBEGsHg09zduodgDcdB0/hLQ65D1Gbqm5UtSVFa3U8H1bg2i6KsQ8B+zic1cI4G
	mCp+iemb+hSZSm1tyBEZzuSbILVR+fzYeNq9PZ7ETbE7cfYH9SWZ1BrX9ATwHGdoSZpqiH
	0qkFmtbL8Rg27kJciiC10UOIAW1uhINSYrVDmxcMmzXwh7C06W1r4HX7OCetUxIRGstJuB
	J2xc9HleSmPQhzEE9Ne/XmA3W+VRn1E5+YRHTu7VmwuHPrab0BTJu60i3DlXp9wjlw8szj
	ooW7dRZlgLyFC76DdQ2TZvtTsKyDdsllqL10DQTukPIJuhSTZemdsJHFN3qkOQ==
Message-ID: <8768c05d-417c-41c6-a275-33ac7f74e345@nabladev.com>
Date: Mon, 26 Oct 2026 22:46:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: imx95: Add support for Data Modul
 i.MX95 eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 linux-arm-kernel@lists.infradead.org, Aswath Govindraju
 <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260928204741.175754-1-marex@nabladev.com>
 <20260928204741.175754-3-marex@nabladev.com> <arvPDq8sjjv7na01@SMW015318>
 <49303872-5622-4e1d-8e1a-01394ec29367@nabladev.com>
 <20260930174413.GA2463938@francesco-nb> <ar1bhpji35CbArtY@SMW015318>
 <17f240e5-9c65-4562-ba51-535b0c69c5fd@nabladev.com>
 <ar19W4wX07p8u3_5@lizhi-Precision-Tower-5810>
 <4efdcea6-a099-46a6-8d07-dd5c583b962a@nabladev.com>
 <eca44457-d3d3-4732-977d-d30a408b7b66@nabladev.com>
 <at-0VK3LQ5c7rVmF@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <at-0VK3LQ5c7rVmF@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_144635_270050_9EEC2FC9 
X-CRM114-Status: GOOD (  11.97  )
X-Spam-Score: -2.1 (--)
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

On 10/26/26 9:13 PM, Frank Li wrote:
> On Mon, Oct 26, 2026 at 04:04:02PM +0100, Marek Vasut wrote:
>> On 9/30/26 11:49 PM, Marek Vasut wrote:
>>
>> Hello Frank,
>>
>>>>>> So I suggest remove it now and add it when need.
>>>>> Can we please go with consistency between these boards from one vendor ?
>>>>
>>>> Yes, I am keeping consistency, then ask remove it. I applied alex's v2
>>>> version. I put v1 link to show krzy's concern.
>>>>
>>>> https://lore.kernel.org/imx/20260319125013.2421621-3-
>>>> alexander.stein@ew.tq-group.com/
>>>>
>>>> Changes in v2:
>>>> * Changed commit message to imperative form
>>>> * Remove (currently unused) display and backlight nodes
>>> I sent you a V6 with those nodes removed.
>>
>> Have you had a chance to handle the V6 ?
> 
> Does first patch picked by vnod?

What is vnod ? (the patch has a RB from the DT maintainers)

>   dt-bindings: phy: ti,tcan104x-can: Document Microchip ATA6563

