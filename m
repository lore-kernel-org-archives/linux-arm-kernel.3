Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37598C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqzHthpgkpaj4+Y1riWSwJnRYrae4XoK1iskKUPVhEg=; b=HcNNRiIZty3JMC4DEm7ZolzEnu
	sFwQcFHpnAG8g8yL/5ubjFuhqnEfwhLjLP4pPJPS4GqKIKIGehLBrt6269M/Y0OcFbrG1d0d3t/2B
	wlpZcFFqXFiQ6ke0f+qrt86dc2eS81kjox2ziMi5JvD8WidDVV8C1drr6VTYD58EPWUCRXsGeXB+W
	zzrLr1CE9XjtyQQQEX6Dl4MkL7iegDSznimWIfkm5WUyiXrF5XSEhQHl61zVjoxzxRhJLrbFmdW3H
	82QyNByj/kwnmEswM59nyRxmMCq0yx5AVhznH3Wo7DGvNeSoozuE7fpxzePzE9SyKxEVCUDQXzMbv
	0crsBl4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LLr-0000000071M-2E7S;
	Fri, 25 Apr 2025 15:52:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HlS-0000000H3Tt-0bfP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:02:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C0464A9D4;
	Fri, 25 Apr 2025 12:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6A6C4CEE4;
	Fri, 25 Apr 2025 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745582561;
	bh=eZPFTBz6yM2gMfLd3A3QWowYwwQJiwoej0l47rx+zYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asbZVeQloMPeww+Qs89fskH1vrKk4nw4P6Uupf360RcaPWx8ckq8AADihAs+vKaUw
	 HLNqKZmXb7SsCA5sRtCy2woY7aZbcd8AsuWOfSr1JZ5z+ozi5m4r/+D1aj8lFqGI+E
	 3zOfgQ8LsBYkfOGwGYRk26LuYGeFgB9TsKSCCDYVQOqSou0DkKRF7y01g1+cXyacKN
	 qGbjK063ViwCpe5HzWubE+mOsxWStsfoFQrepkTXz23JCwg+89bd6QlwqRcRj3VmIV
	 vqDunnWeNwp+zmkfQJ0cttU1Cv4gLXrDURVOkENmmbh8xPxeF8fveXNrtolTE5Iaqi
	 e0nY0pbVnQPcg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u8HlS-000000004qm-40F9;
	Fri, 25 Apr 2025 14:02:43 +0200
Date: Fri, 25 Apr 2025 14:02:42 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
Message-ID: <aAt54vikoREWZyGY@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
 <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_050242_200309_8AA9D1E7 
X-CRM114-Status: GOOD (  17.95  )
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

On Fri, Apr 25, 2025 at 12:03:06PM +0200, Konrad Dybcio wrote:
> On 4/25/25 11:51 AM, Johan Hovold wrote:
> > On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
> >> From: Qiang Yu <quic_qianyu@quicinc.com>
> >>
> >> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
> >> missing in the current PHY device tree node. The PCIe port can still
> >> function because the regulator L3J, which vdda-qref consumes, is voted by
> >> other components.
> >>
> >> Since the device tree should accurately describe the hardware, add the
> >> vdda-qref power supply explicitly in all PCIe PHY device nodes.
> > 
> > AFAIU the PHYs do not use this qref supply directly so it does not
> > belong in the PHY node (but possibly in the tcsr node that provides the
> > refclk).
> > 
> > Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> > qref supplies") it also won't have any effect for pcie4 and pcie6.
> 
> QREF is a separate hw block distributing the reference clocks across
> certain on-SoC peripherals
> 
> If its power goes out, I don't think much of the platform would be
> functional anyway, so it's redundant here..
> 
> It doesn't have its own single register region and it's frankly
> one-shot-configured way before Linux starts up, so there should be
> no need of describing it at all.

Then it sounds like the qref supplies should be marked as always-on. Can
they be disabled at all?

Johan

