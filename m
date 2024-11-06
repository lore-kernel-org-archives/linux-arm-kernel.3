Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CF7D44D58
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHfSKErR6/Zyx4CuWUG6yflDKYFP5qOGaveireazMAo=; b=UU7zFhy0m2P864YsGHdr2Hy0Nw
	kDogLrkrMPP2sQv6hPpQCx1fN7XuZbenO2QNNYIZH1+/K3+G2vFO2bKN1fJaiS/eVWuOuEALGgZi5
	UpKB6bo4GbmSwny+4RDP4hfi15PoDof0+16p8pFB02+98hlfz7Oh18qG4Qk8B6ESAvVmR022SW2UM
	bhzCFEmFNRxaJR1wU5i+fZD5M60bz+g7PLPcTqDTcnVNABCmEaQa/KtJLhO1zax/TRxRudNx4gCnu
	bz5JbfRxitnXrmfw1h1Jblie5CvtjMHlCWFjvDXdX4HQyFb29JWDU2m+0+KYHamQ6cnJIYdjtJu5B
	ELs+Wh9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8g70-00000003QII-47VU;
	Wed, 06 Nov 2024 13:30:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fZQ-00000003KVM-2IRn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 12:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1390C5C41D0;
	Wed,  6 Nov 2024 12:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6ADC4CECD;
	Wed,  6 Nov 2024 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730897733;
	bh=THiRwHU/ItganQsalp7zDHwVZ+vTaXjEv86N7QtU7B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQQkL6ajzVfBy7VuWlIeA14Z9c6xGyE0EjjHhJSHhqQ2Tq+PpAz5Ih5Qw5GfsvRwy
	 nIna14Oawmgfg0q1Iv7bLgSvL1uS+kNZkVwv9no652K+qH4C1khxWhrG+NVpZmclyv
	 WYCL5WhEGMheZcIsnr6U1DCj4GClNjsq4R+cc5ptLxT6bvkLa7AwgpFg5RjxS6zK1Y
	 SdWrgrBJY3MxZNtGkCQmZXQzY2kWtRmAO3jR3qcm040qw7KGtUDyXz7acpYl4PoBbF
	 2byFOOlU33Xsl85JKyyvrj8UNo/yuTj+fImQ9OSE3qnvD51FyidCU39jesLyD4EP7R
	 pJx6Q9wJbK6oA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t8fZN-000000003aV-31o8;
	Wed, 06 Nov 2024 13:55:34 +0100
Date: Wed, 6 Nov 2024 13:55:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <ZytnRc94iKUfMYH0@hovoldconsulting.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007061023.1978380-1-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_045536_691431_188DDD7E 
X-CRM114-Status: GOOD (  17.94  )
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

On Mon, Oct 07, 2024 at 11:40:18AM +0530, Sibi Sankar wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a
> number of Qualcomm SoC specific features (like memory bus scaling)
> through a mixture of pre-determined algorithm strings and param_id
> pairs hosted on the SCMI controller. Introduce a client driver that
> uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
> to detect memory latency workloads and control frequency/level of
> the various memory buses (DDR/LLCC/DDR_QOS).
> 
> QCOM SCMI Generic Vendor protocol background:
> It was found that a lot of the vendor protocol used internally was
> for debug/internal development purposes that would either be super
> SoC specific or had to be disabled because of some features being
> fused out during production. This lead to a large number of vendor
> protocol numbers being quickly consumed and were never released
> either. Using a generic vendor protocol with functionality abstracted
> behind algorithm strings gave us the flexibility of allowing such
> functionality exist during initial development/debugging while
> still being able to expose functionality like memlat once they have
> matured enough. The param-ids are certainly expected to act as ABI
> for algorithms strings like MEMLAT.

I wanted to give this series a quick spin on the x1e80100 CRD, but ran
into some issues.

First, I expected the drivers to be loaded automatically when built as
modules, but that did not happen so something appears to be missing.

Second, after loading the protocol and client drivers manually (in that
order, shouldn't the client driver pull in the protocol?), I got:

	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95

which seems to suggest that the firmware on my CRD does not support this
feature. Is that the way this should be interpreted? And does that mean
that non of the commercial laptops supports this either?

Johan

