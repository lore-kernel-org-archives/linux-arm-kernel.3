Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CDBC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pu4IDHe9lE66Z+GRLwG/y3tpdC+ppw/wsB/45AZ+X/8=; b=FllaYRW+V7+7tfGAG45RCgQy7K
	q64z8QUvsPkJdBU41/jbobo41HVCgEuSlMv4hrsqJIhdA4Oi77twekIIICkbKjELLL/RROQ5nOq60
	1z9tEl6wK78UbVGez356H3x+4+70FHSqWWxbQz6fvV4bauaBAdOLQ1iLEVczVGteeGZotOF9CALgf
	r87u5EVLoWjxEzL1V0R7Z2np6d96F6PRLG1chQ1cD0NCPprpxUBXye+89nMY0lKez0HF6so8AVbWo
	c0JfeXynzUC8n402IDp15vsQfRUr7UB11KtD7fL5WVpRFNqNnKYuJXnYIgi1BEgHjKwrfuwiiUUqB
	MLlhOZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mnx-00000005zJg-1POD;
	Mon, 28 Apr 2025 11:37:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MTW-00000005ukP-3XeL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 11:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Pu4IDHe9lE66Z+GRLwG/y3tpdC+ppw/wsB/45AZ+X/8=; b=Md8R+lTt9UM8f0zb6Xd2uU44Yk
	kxtGbMicTnX3A+O5IKMI5XnoZVk4kC8bWDxwgAit73NIzhlOK3Sfz2RWjojdx8Lusud4PMkjxcj+5
	1GuBew6QCeZ6Yy6sKl2xXKsg1yTvNlZeD7anW3U3z9/zkOcxcygsVm8LSmXI6JPHhrV1Rnd1v23pT
	nDlo+64v7r0ihtYooQlyYfWdNMTbW/57kLxKXNZHlb2MLXlFlDtV6JPnq7lKxtTLJrZ7rb0WdNNvx
	GIdXxhEDf1j7kzi5f6MHsQenshGsfJ2lF0mMGOydau5yPGiZqrVmIK3CmyWtC5TtRO7z8cmSmFHS+
	9nUyhuXg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9MTT-0000000Cgyy-3O2m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:16:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D54604A9AC;
	Mon, 28 Apr 2025 11:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE14C4CEE4;
	Mon, 28 Apr 2025 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745838990;
	bh=ZHlHP1G+yKLerL6A3JQMfI+d7AtCg+sYXv3msXk4+Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9ojCpq2Ycbah3dnNCGr/ENC8EAMQvNr7f1MbLb/7XVh4MvrZcaUCJGriFFkbOzRY
	 yhxKDx7v5wQNhYiSaWRfpy4FHJJsyjodIC44J/+jfe5cTcPi+pMqZXQPrJgl/SR+UX
	 H/i3ynfhzP4JOxDVvE1xG3/3Lmq6fUrXNtIkeHNOb1Sw3q5KTNZv6IvmnYI0bGQ/SP
	 q2rmj19Q6+hnAlPGLmoEaaEX7X8Wgk4SUMqbJl6ToJr59gWHgGj3rwRhS4Ij3yqIJE
	 eJ/g3z7ceN8yajGbUc9DhjJMwkOKyvezN8t5fjLMWj8dz6RdZAdxZ84mx3tywbYKzH
	 eHAqjBpWVa9hw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9MTP-000000002X9-11Rt;
	Mon, 28 Apr 2025 13:16:31 +0200
Date: Mon, 28 Apr 2025 13:16:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
	quic_cang@quicinc.com, quic_qianyu@quicinc.com
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
Message-ID: <aA9jjyBR5DZcSbyQ@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
 <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
 <aAt4TBrekUqyTjfi@hovoldconsulting.com>
 <306ce1fa-be83-4f13-bedd-97a20448d162@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <306ce1fa-be83-4f13-bedd-97a20448d162@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_121636_110780_241D1153 
X-CRM114-Status: GOOD (  19.89  )
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

On Sat, Apr 26, 2025 at 12:44:57PM +0200, Konrad Dybcio wrote:
> On 4/25/25 1:55 PM, Johan Hovold wrote:
> > On Fri, Apr 25, 2025 at 12:22:56PM +0200, Konrad Dybcio wrote:
> >> On 4/25/25 11:29 AM, Wenbin Yao wrote:
> >>> From: Qiang Yu <quic_qianyu@quicinc.com>
> >>>
> >>> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> >>> voltage rails can be described under this node in the board's dts.
> >>>
> >>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> >>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
> >>>  1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>> index 46b79fce9..430f9d567 100644
> >>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>> @@ -3287,6 +3287,17 @@ opp-128000000 {
> >>>  					opp-peak-kBps = <15753000 1>;
> >>>  				};
> >>>  			};
> >>> +
> >>> +			pcie3port: pcie@0 {
> >>
> >> @0,0 for PCIe adressing (bus,device)
> > 
> > No, the bus number is not included in the unit address, so just the
> > device number (0) is correct here (when the function is 0) IIUC.
> 
> Some DTs definitely have that, but I couldn't find any documentation to
> back the syntax up or explain it properly

It's part of the spec:

	http://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf

The first number is the device number and the second is the function
which can be left out if zero.

Johan

