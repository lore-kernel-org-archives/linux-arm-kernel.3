Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416C2C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSLpZABWWT2QC12oVoBVzQDjxUCLfjlwQF4+Oy3kyjI=; b=yC4/SVlXDZ/a3Ygvc7HqFbObpm
	wuFw1PfyCwf71dhf2BHHkCwg87kTh913DfaUp1qhTMNSsbFUba4xO4PYyhRtaPY4CXpSjca8d0ue4
	6DYShr1M5XkmJxNP4ypiKc75hOevYrigSX5EWxn5Et16dC8QuSx60tDtpqJWw+PSrdPV4teVo5Ca+
	YyPQEpcqqZRdsQ0FrWS1RRddgIxZcXF6BieJlxge0EzVC7Eb1d04vbd2jQzgohz2YfTMjx7P4E7hL
	ZDgxBWssZfuhhVyaFA3Mja+ZduvC3btLDW0pMSK7RYN7UqMWrbPgqbIj6TGfdLYd8PRIk74dTvak6
	rl1LxOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qaZ-0000000CBSF-3EFx;
	Thu, 24 Sep 2026 21:02:43 +0000
Received: from out12-174.antispamcloud.com ([185.201.16.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qaW-0000000CBRn-2Ujx;
	Thu, 24 Sep 2026 21:02:42 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx321.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1x9qa5-00ECoc-Dd; Thu, 24 Sep 2026 23:02:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=fSLpZABWWT2QC12oVoBVzQDjxUCLfjlwQF4+Oy3kyjI=; b=zac2eTzdql0T
	Vf5p6kKLl6WKpbDW5ahZ8XFqA4eAWqgegNhpx34OHYkcE/0/qjTwFWv6sZGT+wLrq4Q0mqcHfPrSF
	uVbNxPkoRp9iAUchqyH95vsfOE5sLlyGldYcp2TtFem8zSSsBPv3xLfDMYztfpvQ0x3bdk0CEJxV9
	0GIptReVBAdg9VsedBkdT30Aol1eJxzTKF7oHm4FECbrrV93yhGT1RaNbxAd5GxGDrAHiyHp6tv2K
	zG6VaRjK8N2HRX85qbzykzzcpAvYA0cqAKyE/Ws0wrg5kzmjCbqSshHJmlGszBNwHAZtFku96WHme
	ZWEt1eq9/gPqBZX5cLXFIQ==;
Received: from [188.251.249.2] (port=60568 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <dan@reactivated.net>)
	id 1x9qZy-00000005v13-3u57;
	Thu, 24 Sep 2026 21:02:07 +0000
Message-ID: <19ebea19-c7a6-4135-8abb-1f139ce1f74f@reactivated.net>
Date: Thu, 24 Sep 2026 22:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add support for Broadcom BCM2712 IOMMU driver
 (Raspberry Pi 5)
To: "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com, james.quinlan@broadcom.com,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <arUJxhEDFYSIUp4e@8bytes.org>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <arUJxhEDFYSIUp4e@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuUI6VlrppaKMI350tzbitpsV7EYtdIDduUM
 IbM3yETjliu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVINB+PBQNEtUhkVluwFFCsX/GnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWCfZW7a9uhvfuE0J/hsBuu+eB7itP8hgjDRserKv4bhb7ubyJcscJCC/8jhyq4eIIJWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAu4LTp8S3dP3ahgJ5Qcw+TYW/Yi0hJk
 8x1QQxCxZuYYqu1Es/mNlaSZ677NPMmQgxXznb05WiC8jaGsg2zWAtSwOqsKFjyOw6ht9+0m+2HK
 hyDZczNB19Zd16i8m1k/DGgEQyEoi1/j5tZiR031ah+gQPOIjlkSAfAYMUguLL/iJyO1DBoi69uN
 i8SsHHKkwfIcMf/IXZptVL/AvAk4qADKpWAtS6hgL14V/ocDGzv3txBOv3jFjgsNoFxTfcJiJyEa
 2OI0tSy1D95E625Y16tBpucgO37djUJrXU/wgrKuQcWSKoKpHc12nUrWNUzw/3DGQdeBNIkLb6r4
 7afaw/CHM6llfItwtYhKi/k9/RA3UB2LIFGgh/QiXjPxB1Apcw3AHj9py9u4Cvw3T1rOV/d4D61d
 j5p7BYnIfUPLdSLTlKS/neSdJxr5whbTg0m4/7LGifDpq5EYH46qR+vFm9wC7ren9RtRNyYim5e3
 GD8LGQOAW9bE+k+gl+anV+4sNfMDJFSfqfmiZ+On+h6teTV37eoUTJObIfbUgxRJO5so89RJ9UeM
 S3sx/LZgkEzT4R77BsVio7IvGyM4VI1B3eqGna9aZwZynFm29FaFzEVtpg4br2+mEmVJrJM4fd19
 PqjIyvGxWL1rN3cWjPD5viEZJolz8ClgrSFC0qV2pwUtO92lcKbdXd1aPKEJfyZsBP+3ojxAc8lp
 0sobbdB+F7B3Y8TjGBGmQjnZT0wGxghmQiiyHai0+C+cV2SwXGGBGRJoh9VoIekQHpwUfpYnEThm
 JIBq/vl4T589Eoyw88oKK0Ika8ptpD+DyUmjOrd9V8i0AjwQSM6AQD8AM65nbdW1/nvATdPRNfRC
 ogKUBoiGk7+7TY+LxsYMBY14CoC2k4ZFj2kpuIv/9gSqTljzmaSLiwQzKw+6v3CaIMG6s7LqJEBr
 r4RYD5fnTwa0tMnLz6SKQpgZ8zVbGmL5ozttECcg597p245AIcvvY28Ycjy4wfZVgO2+xlhjYQtN
 TOKCWKLh6v5HXh8xAM0W3+ESyNN702F0dRgAVZw81E22mZaseAdYAUt3zF2gN7skM/50TVH1H/aA
 warQpYDOYx/6JtUORHHV0k7mR0VPG9HQWV7dXfBjXbvxH2nMLfV+SMGovieHnQDrcLDN17YMjSrM
 Y2oTcPJOcrZu7OKsSObGAqhi7iERbInMiTBIUBbQ/Dy6Ip5s2Cc9h6F0bzi9eJvFy172Pif4H4Ku
 78pBi/ZAqnPyI/BjXbvxH2nMLfV+SMGovie1ATPpp8i1sHWZQrJ+tLuI
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_140240_659321_FD34BE56 
X-CRM114-Status: UNSURE (   7.68  )
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

On 24/09/2026 12:30, Joerg Roedel (AMD) wrote:
> On Tue, Aug 25, 2026 at 09:56:03PM +0100, Daniel Drake wrote:
>> Daniel Drake (5):
>>        iommu_pt: Fix test_pgsize_boundary() failure on narrow-OA formats
>>        dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
>>        iommu/generic_pt: Add Broadcom BCM2712 page table format
>>        iommu: Add Broadcom BCM2712 IOMMU driver
>>        arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes
> 
> Applied, thanks.


I'm assuming you didn't apply the v3 version of the series, since that's 
an old submission and you also just acknowledged my plan to send a v6:
https://lore.kernel.org/all/arT-U_Rp0ZFMyCD7@8bytes.org/

I'll go ahead with v6 submission now, but let me know if you prefer to 
handle this another way.
Daniel


