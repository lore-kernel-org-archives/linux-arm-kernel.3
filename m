Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DBEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeJgD5RqeYSgUCKAd7pwkGxapxLIfd4GsKatP9ijw/Q=; b=m2HL5WEnDHWJ8JKjoTX06VOwCb
	SH8RVzQDrEVc7qixH1FInQew8zv/GnwJiEWIh+wRq/23nzTHNtIY8KBUCCgQv785M2AXzjn0CrW6D
	wY/2RYKoMrmRp0GWulxXqXHMes2gZqdfEnpxxtbhl1PCOJFrCC8vOwn422kJOD2+TYfOcKQ/WjcqS
	GcofgQkJW+45DWByVp6wzRfSHKhwz8nnGUumaKx7J5mER/tWoSKNHKOCkpqFDGcb5wq/OZmlAMkjN
	yQLXusUdVApw/Ze5jLrhTPQCgZsc/SI3xzeOCuH4ywJVHlKz6oPwPoyXMYvJ5YFZl+Yb+jEy3O+Yu
	6VI76hwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whU2U-0000000HS7x-2oxa;
	Wed, 08 Jul 2026 15:18:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whU2T-0000000HS7U-26XC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:18:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8258160008;
	Wed,  8 Jul 2026 15:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276FB1F000E9;
	Wed,  8 Jul 2026 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783523896;
	bh=NeJgD5RqeYSgUCKAd7pwkGxapxLIfd4GsKatP9ijw/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OuWS6g2RA5H6l2xX1Q+gKsHNxQTM4CZM4PoD8otYQrcx4Q5MCIvq965nn35X7Gqsx
	 7FjnAWSIlEo97mgYC7B4Wp9x5Q92hwXxodYTsFBYCSf75MOGA6nzsOUtzGOom71jP0
	 Pc92yl33S5mF/k1dfXOtkyxkx16NwI5rArIHy6Qs/Dd46FUqhdVZc3b7GFP+XYD2NR
	 83QD64q1k2koBpNUK2Wkf4mfX9xER5kD45ukfujjWWApvvAWi0aBUne+1wov6iChCT
	 oSfSX0DVj7gMYf9Owf+WbvNEtvcVxw7e04enxB4t1DJJMHUvSB0uEf3UNH8M0+bGP1
	 T/1kUnecBZskQ==
Date: Wed, 8 Jul 2026 10:18:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <ak5pC_meP8KRc3wJ@baldur>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
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

On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
> > > 
> > > 
> > > On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> > > > > Some SoC implementations require a bandwidth vote on an interconnect
> > > > > path before the SMMU register space is accessible. Add the optional
> > > > 
> > > > Why is it limited only to those SoCs? Is it also applicable to other
> > > > Qualcomm SoCs?
> > > > 
> > > 
> > > I was hoping to keep this series focused on the core infrastructure
> > > changes: the bindings, base ICC bandwidth-voting support, and DT
> > > interconnect properties for the platforms currently supported on
> > > Qualcomm Linux and have been validated so far.
> > > 
> > > The additional targets have not been tested yet, so I'd prefer
> > > to add their support in a separate follow-up series once validation
> > > is complete, rather than growing this series further. WDYT?
> > 
> > Then it should be a part of the commit message. All SoCs since SDM12345
> > need to vote on the interconnect (and then, in the cover letter mention
> > that you convert only a few of the SoCs). We possibly can help with
> > testing on other platforms.
> > 
> 
> Ack, sounds reasonable.
> I'll add the first platform onwards which interconnect voting is required in
> commit description.

But to what degree is this related to a specific set of platforms? If we
look ahead, aren't we expecting the list to grow to include all
platforms in the end - resulting in a lot of noise and churn.

Can you give an example of a platform where there is no interconnect
path to vote for here or where it would be harmful to do so?

> And update the cover letter to clarify that this series adds
> support for the Qualcomm Linux-supported targets available today, and
> the list will be expanded in follow-up series as additional platforms
> are enabled.
> 

The binding should not reflect what has been implemented and verified in
Linux, it defines the contract between DeviceTree and the OS.

Regards,
Bjorn

> Thanks & regards,
> Bibek
> 
> > > > > 'interconnects' property to the binding to allow platform DT nodes
> > > > > to describe this path.
> > > > > 
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > > > ---
> > > > >    .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > > > >    1 file changed, 27 insertions(+)
> > > > > 
> > 
> 

