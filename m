Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE0DCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrXU69xzkgvwPWnpud9gbDMjpFVZTCd84n7XEDFMSxQ=; b=V0UHUDl8aqFXsZhWCEmIOBxHkz
	L83yJzg1V255pTQDr7VHkRN6iL/+IJpzb4Se9VESUQaQWJV3AlDd82ArbsomAJg3r+YuMUP9LVmnk
	UxDTNW2YAjLCXfGJ6pS5Gvlb+g2O6jx5o9jjR94Pd0G6pKbchXOLh97Xu+4p0oJSfzPQdw1ryMIKo
	3x78AiKXOoHQ44NVDum1l2hBe/azoLL7hp8WkEwtvvc75Zp0A+EgBCSPB+k9o/gQ7scqPyyarEiaQ
	qn8KTBJk8h5vDBAE1VAmmFq/ri/4E4QLn9pKkzVf4Mn8bvhasEEstrQfxei1k8AuBDrnywy+Lv6bD
	GtaRG5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp5G-0000000AuOs-1nhw;
	Wed, 17 Sep 2025 10:08:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp5D-0000000AuOO-2dIV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:08:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91DBB44070;
	Wed, 17 Sep 2025 10:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A77C4CEF0;
	Wed, 17 Sep 2025 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758103692;
	bh=2UJitnxHH4ITOpk1XyAJb3VMT4TKF/dbAik6uHRq8es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ovJNpLtF4n+pjUrxXR2L10rGFPRCmARWfvMI5X0a6r826Alh0O8fuD+srvriol0UJ
	 WRBUf4EkEfFTrELGrXFX5sOBpC70dg/IHX8C+xkPaLS2NeALteU18AXXHIR/F3Lh9T
	 t9VYsSo8iUaZ92OEKuWj6qB07Nw5tzRs+ngR811nvwcnMdtIXpLQXPmdfPT0Stjzfr
	 beS98qwrhSs5V0mE6ZEtlz7+wVPlHEoTpxbSAedZuh1E6wH0ivx6ow3ZRWlVA5L1qO
	 yAscsMSqjmQzgIW4ZU0TI1xZkdnpFxwghGyYMcoXwP86PGucRtK+RmNFotqwywcMNt
	 itYVQE6CpBFHQ==
Date: Wed, 17 Sep 2025 15:38:04 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 4/6] dt-bindings: remoteproc: Add compatibility for
 TEE support
Message-ID: <aMqIhFdIqp5auH22@sumit-X1>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
 <aMkqifHSdlCs4VjA@sumit-X1>
 <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_030815_711590_4EAECDD1 
X-CRM114-Status: GOOD (  47.94  )
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

On Tue, Sep 16, 2025 at 03:26:47PM +0200, Arnaud POULIQUEN wrote:
> Hello Sumit,
> 
> On 9/16/25 11:14, Sumit Garg wrote:
> > Hi Arnaud,
> > 
> > First of all apologies for such a late review comment as previously I
> > wasn't CCed or involved in the review of this patch-set. In case any of
> > my following comments have been discussed in the past then feel free to
> > point me at relevant discussions.
> 
> No worries, there are too many versions of this series to follow all the
> past discussions. I sometimes have difficulty remembering all the
> discussions myself :)
> 
> > 
> > On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
> > > The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
> > > where the Cortex-M4 firmware is loaded by the Trusted Execution Environment
> > > (TEE).
> > Having a DT based compatible for a TEE service to me just feels like it
> > is redundant here. I can see you have also used a TEE bus based device
> > too but that is not being properly used. I know subsystems like
> > remoteproc, SCMI and others heavily rely on DT to hardcode properties of
> > system firmware which are rather better to be discovered dynamically.
> > 
> > So I have an open question for you and the remoteproc subsystem
> > maintainers being:
> > 
> > Is it feasible to rather leverage the benefits of a fully discoverable
> > TEE bus rather than relying on platform bus/ DT to hardcode firmware
> > properties?
> 
> The discoverable TEE bus does not works if the remoteproc is probed
> before the OP-TEE bus, in such case  no possibility to know if the TEE
> TA is not yet available or not available at all.
> This point is mentioned in a comment in rproc_tee_register().

The reason here is that you are mixing platform and TEE bus for remoteproc
driver. For probe, you rely on platform bus and then try to migrate to
TEE bus via rproc_tee_register() is the problem here. Instead you should
rather probe remoteproc device on TEE bus from the beginning.

> 
> Then, it is not only a firmware property in our case. Depending on the
> compatible string, we manage the hardware differently. The same compatibles
> are used in both OP-TEE and Linux. Based on the compatible, we can assign
> memories, clocks, and resets to either the secure or non-secure context.
> This approach is implemented on the STM32MP15 and STM32MP2x platforms.

You should have rather used the DT property "secure-status" [1] to say
the remoteproc device is being managed by OP-TEE instead of Linux. Then
the Linux driver will solely rely on TEE bus to have OP-TEE mediated
remoteproc device.

[1] https://github.com/devicetree-org/dt-schema/blob/4b28bc79fdc552f3e0b870ef1362bb711925f4f3/dtschema/schemas/dt-core.yaml#L52

> 
> More details are available in the ST WIKI:
> https://wiki.st.com/stm32mpu/wiki/OP-TEE_remoteproc_framework_overview#Device_tree_configuration
> https://wiki.st.com/stm32mpu/wiki/Linux_remoteproc_framework_overview#Device_tree_configuration
> 
> > 
> > > For instance, this compatible is used in both the Linux and OP-TEE device
> > > trees:
> > > - In OP-TEE, a node is defined in the device tree with the
> > >    "st,stm32mp1-m4-tee" compatible to support signed remoteproc firmware.
> > >    Based on DT properties, the OP-TEE remoteproc framework is initiated to
> > >    expose a trusted application service to authenticate and load the remote
> > >    processor firmware provided by the Linux remoteproc framework, as well
> > >    as to start and stop the remote processor.
> > > - In Linux, when the compatibility is set, the Cortex-M resets should not
> > >    be declared in the device tree. In such a configuration, the reset is
> > >    managed by the OP-TEE remoteproc driver and is no longer accessible from
> > >    the Linux kernel.
> > > 
> > > Associated with this new compatible, add the "st,proc-id" property to
> > > identify the remote processor. This ID is used to define a unique ID,
> > > common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.
> > This "st,proc-id" is just one such property which can rather be directly
> > probed from the TEE/OP-TEE service rather than hardcoding it in DT here.
> Do you mean a topology discovery mechanism through the TEE remoteproc
> service?
> 
> For the STM32MP15, it could work since we have only one remote processor.
> However, this is not the case for the STM32MP25, which embeds both a
> Cortex-M33 and a Cortex-M0.

I rather mean here whichever properties you can currently dicovering via
DT can rather be discovered by invoke command taking property name as input
and value as output.

> 
> Could you please elaborate on how you see the support of multiple remote
> processors without using an hardcoded identifier?

By multiple remote processors, do you mean there can be multiple
combinations of which remote processor gets managed via OP-TEE or not?

> 
> > I think the same will apply to other properties as well.
> Could you details the other properties you have in mind?

I think the memory regions including the resource table can also be
probed directly from the TEE service too. Is there any other DT property
you rely upon when remoteproc is managed via OP-TEE?

-Sumit

