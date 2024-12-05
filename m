Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174FFE77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hZA2kqQL7wjCxGzzyGpZIhLtHX/xV1mQEZjEB5W9jc=; b=ppwpLQ2wPw+zl2ZPZz4q1B4UGs
	iuZJrjbA8Btbs/zJ5Rim7YMvjSYNVZcSROueOrRvrEFxpkhY7p59SztjzjEVuHIRdmQZ+6XqzavYA
	z4HdKKU8gDjuQ4HiLi7beKNLljWA7lyzL+CEq0DhBw0DbV2Bdd5OYbWqfl2kg9UX7yAHo2S1J4lYX
	HfDk3PDJjxCQdQx8UpVZfKYVCV/0X55aPGuoEipDckuu0yJeXZEl3qky47oNrIkEWAewBTlOD5+nl
	S8txOepC5laQua44TK4MvJQweNViPG6epnFa2dltEbTCFFN57/H89BjPh+ZpqVNhA2sHh556ss8Ae
	OmuQ8x7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ72s-0000000F96b-0tlv;
	Thu, 05 Dec 2024 08:17:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ71r-0000000F8v7-1WgI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 08:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05B5FA42A9C;
	Thu,  5 Dec 2024 08:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A770FC4CEE1;
	Thu,  5 Dec 2024 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733386565;
	bh=3FQdoGHbtK4vxVzpu1LkgtvENvTPq08yLxgUVs8oYPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIgPuRN4Xrn4bkadyn8DMZ/h9U0a9wSzY3HJyFpYa9fMErDpJhXWuK5tEdnuPwttX
	 vNNF7fxByZr7Kzh1eASsFa5nHv5yWVyuqm+4YxRXxxR7n6zFl+hUygtRpzK1ZMfPPv
	 YJmPFtytJInKofdzmnJWlzc1UVBpZA+sSpHGCYXKL36zGudTTEtLKHvcDaLBaJOVPc
	 IkrpmJ6BaiFkGyqBn/tlANtL/q2emfE+0pNNqupvwUozTQTttLRqTx4kVRvSO0OZtB
	 cgivhs/DQ/b4rTIaYHfMg/0lcOccEqXeRjEJZvBYDyMLdqVMxqw2HpWxvRYPQU+gT7
	 9X/aiHpEdGHeg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tJ71n-000000007QL-2hW1;
	Thu, 05 Dec 2024 09:16:04 +0100
Date: Thu, 5 Dec 2024 09:16:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
Message-ID: <Z1FhQ3OUI0t3k1_q@hovoldconsulting.com>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
 <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_001607_525242_EE52A128 
X-CRM114-Status: GOOD (  25.29  )
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

On Thu, Dec 05, 2024 at 01:32:29PM +0530, Krishna Kurapati wrote:
> On 12/3/2024 6:45 PM, Krishna Kurapati wrote:
> > On 12/3/2024 3:50 PM, Johan Hovold wrote:
> >> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:

> >>> +&usb_mp_dwc3 {
> >>> +    /* Limit to USB 2.0 and single port */
> >>> +    maximum-speed = "high-speed";
> >>> +    phys = <&usb_mp_hsphy1>;
> >>> +    phy-names = "usb2-1";
> >>> +};
> >>
> >> The dwc3 driver determines (and acts on) the number of ports based on
> >> the port interrupts in DT and controller capabilities.
> >>
> >> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
> >> that would still be there in the SoC (possibly initialised by the boot
> >> firmware).
> > 
> > The DWC3 core driver identifies number of ports based on xHCI registers. 
> > The QC Wrapper reads this number via interrupts. But these two values 
> > are independent of each other. The core driver uses these values to 
> > identify and manipulate phys. Even if only one HS is given in multiport 
> > it would be sufficient if the name is "usb2-1". If the others are 
> > missing, those phys would be read by driver as NULL and any ops to phys 
> > would be NOP.

No, the core driver still acts on these ports (to some extent) even if
there is no PHY specified (e.g. updates DWC3_GUSB2PHYCFG on suspend).

And IIRC I even had to specify more than just the fingerprint reader PHY
on the X13s to get it to enumerate. I never had time to fully determine
why this was the case though.

> However do we need to reduce the number of interrupts used in DTS ?
> We don't need to give all interrupts as there is only one port present.
> We don't want to enable all interrupts when ports are not exposed.

No, the interrupts are still there, wired up in the SoC, so we should
not change that.

With runtime PM eventually enabled and working as it should, the OS
should be able to power down any unused ports. And we could also
consider marking some ports as not physically accessible and not
connected as a further hint to the OS that they can be disabled even
sooner.

Johan

