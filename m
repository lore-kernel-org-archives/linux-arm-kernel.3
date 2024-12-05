Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7D8E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXr8HzE+AShiAMf+CSWWvat3NYScA28MRz7uwmR/Emc=; b=qM7FJaVqJiuKq8+dfbMbFDKIa/
	ksSxoHPDMISEBbduAVtR6Z/MbMiN8yRV3r1MvwvdCKoumTTTemKndv7xi3vc+UKnkiJlMtJjqWnJ/
	aIl4PV5v2iTh+H/5ZPBZ1WTwEnCeHCObK3Y+/L7mSWXZaClRgm9gPOFeWAH7BVWKkgOWa+5Of89Mv
	vjEcYsaxg4Q/SUpYO4lnnAvPd2TD4gABVrCd07tqytdFejSAd/cjQWQa0gsZLOVUIZdjAadQkW1j0
	cID1Is0rbMKLM/hmBZvOgy5EqzUgtvHwoyk1HmU2xpUUvDFQ5k1uVo6b58V7r/g/xLgQRIcxzGm02
	25P+reMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAIJ-0000000FlsE-2eX2;
	Thu, 05 Dec 2024 11:45:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAAr-0000000FkM6-1nL9
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 11:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gXr8HzE+AShiAMf+CSWWvat3NYScA28MRz7uwmR/Emc=; b=D1LeT2pKxli8W9fWqAclovTIXP
	2JvZDZmPdswLr2JgvxjVD7LowT0+yHyGT7INUrZ/L85aAZnKpw7qNURv1sNuAP1VzNztZl19CGVuF
	3u1VIU+r/ZHL7HJqJIC/ExascwPTBkLq/62Rx70W3E2fnd0eKk9IaLTt/gHxjOlQgVXfsLqxiemSC
	waoqe5FtG9/MRDEOl8BAnPXQrEPoLTi7WqqSZPJl1v+fvv3PJ+gZ/Ai/u9BzWQKzI0ylMhWBSKu2V
	hALTDAdu1P3nWD4bDUhDW0qu8FTovwRgzhNzvFRYqhIHnwtyAzFJUcGaYCCL5yTjJxHWPcE8tAx4+
	E5epWikQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAAn-00000002s14-3cSP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:37:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2E54FEC;
	Thu,  5 Dec 2024 03:37:57 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62B5F3F71E;
	Thu,  5 Dec 2024 03:37:28 -0800 (PST)
Date: Thu, 5 Dec 2024 11:37:20 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com,
	andersson@kernel.org, konrad.dybcio@linaro.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, arm-scmi@vger.kernel.org
Subject: Re: [PATCH V5 1/2] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
Message-ID: <Z1GQcAHsmax4RtLb@pluto>
References: <20241115011515.1313447-1-quic_sibis@quicinc.com>
 <20241115011515.1313447-2-quic_sibis@quicinc.com>
 <Z1BBirNWH1eaSKtr@pluto>
 <73a16eb4-e590-92db-ee24-cc4f42a9de01@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73a16eb4-e590-92db-ee24-cc4f42a9de01@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_113734_281662_2592929A 
X-CRM114-Status: GOOD (  31.50  )
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

On Thu, Dec 05, 2024 at 04:37:28PM +0530, Sibi Sankar wrote:
> 
> 
> On 12/4/24 17:18, Cristian Marussi wrote:
> > On Fri, Nov 15, 2024 at 06:45:14AM +0530, Sibi Sankar wrote:
> > > Add QCOM System Control Management Interface (SCMI) Generic Vendor
> > > Extensions Protocol documentation.
> > > 
> > > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> > > ---
> > > 
> > > v4:
> > > * Update the protol attributes doc with more information. [Cristian]
> > > 
> > >   .../arm_scmi/vendors/qcom/qcom_generic.rst    | 211 ++++++++++++++++++
> > >   1 file changed, 211 insertions(+)
> > >   create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> > > new file mode 100644
> > > index 000000000000..141bc932e30f
> > > --- /dev/null
> > > +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> > > @@ -0,0 +1,211 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +.. include:: <isonum.txt>
> > > +
> > > +===============================================================================
> > > +QCOM System Control and Management Interface(SCMI) Vendor Protocols Extension
> > > +===============================================================================
> > > +
> > > +:Copyright: |copy| 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > +
> > > +:Author: Sibi Sankar <quic_sibis@quicinc.com>
> > > +
> > > +SCMI_GENERIC: System Control and Management Interface QCOM Generic Vendor Protocol
> > > +==================================================================================
> > > +
> > > +This protocol is intended as a generic way of exposing a number of Qualcomm
> > > +SoC specific features through a mixture of pre-determined algorithm string and
> > > +param_id pairs hosted on the SCMI controller. It implements an interface compliant
> > > +with the Arm SCMI Specification with additional vendor specific commands as
> > > +detailed below.
> > > +
> > > +Commands:
> > > +_________
> > > +
> > > +PROTOCOL_VERSION
> > > +~~~~~~~~~~~~~~~~
> > > +
> > > +message_id: 0x0
> > > +protocol_id: 0x80
> > > +
> > > ++---------------+--------------------------------------------------------------+
> > > +|Return values                                                                 |
> > > ++---------------+--------------------------------------------------------------+
> > > +|Name           |Description                                                   |
> > > ++---------------+--------------------------------------------------------------+
> > > +|int32 status   |See ARM SCMI Specification for status code definitions.       |
> > > ++---------------+--------------------------------------------------------------+
> > > +|uint32 version |For this revision of the specification, this value must be    |
> > > +|               |0x10000.                                                      |
> > > ++---------------+--------------------------------------------------------------+
> > > +
> > > +PROTOCOL_ATTRIBUTES
> > > +~~~~~~~~~~~~~~~~~~~
> > > +
> > > +message_id: 0x1
> > > +protocol_id: 0x80
> > > +
> > > ++---------------+--------------------------------------------------------------+
> > > +|Return values                                                                 |
> > > ++------------------+-----------------------------------------------------------+
> > > +|Name              |Description                                                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|int32 status      |See ARM SCMI Specification for status code definitions.    |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 attributes |Bits[31:16] Reserved, must be to 0.                        |
> > > +|                  |Bits[15:8] Number of agents in the system                  |
> > > +|                  |Bits[7:0] Number of vendor protocols in the system         |
> > > ++------------------+-----------------------------------------------------------+
> > 
> > Thanks of clarifing this....may I ask why number of agents is reported
> > here too given that it is already exposed by Base protocol ?
> > 
> > Not really arguing about this so much, but you will end up having to maintain this
> > on 2 different protocols fw side...or are they not 'agents' in the SCMI meaning ?
> > 
> > Anyway, I'm fine with it, even though you dont seem to use this
> > anywhere.
> 
> We don't use it anywhere and it looks like it was just put together
> so that this protocol is compliant to the spec :|
> 

mmm...you mean the vendor protocol is compliant with this vendor doc ?

...because while PROTOCOL_ATTRIBUTES(0x1) is a mandatory command for
each protocols (including vendors) there isn't any expectation from the spec to
expose such info like agents and vendors protos....it is expected to
expose attributes specific to the protocol itself...or nothing if you
dont need anything.
 
> > 
> > > +
> > > +PROTOCOL_MESSAGE_ATTRIBUTES
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +message_id: 0x2
> > > +protocol_id: 0x80
> > > +
> > > ++---------------+--------------------------------------------------------------+
> > > +|Return values                                                                 |
> > > ++------------------+-----------------------------------------------------------+
> > > +|Name              |Description                                                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|int32 status      |See ARM SCMI Specification for status code definitions.    |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 attributes |For all message id's the parameter has a value of 0.       |
> > > ++------------------+-----------------------------------------------------------+
> > > +
> > > +QCOM_SCMI_SET_PARAM
> > > +~~~~~~~~~~~~~~~~~~~
> > > +
> > > +message_id: 0x10
> > > +protocol_id: 0x80
> > > +
> > > ++------------------+-----------------------------------------------------------+
> > > +|Parameters                                                                    |
> > > ++------------------+-----------------------------------------------------------+
> > > +|Name              |Description                                                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 ext_id     |Reserved, must be zero.                                    |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 param_id   |Serves as the token message id for the algorithm string    |
> > > +|                  |and is used to set various parameters supported by it.     |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 buf[]      |Serves as the payload for the specified param_id and       |
> > > +|                  |algorithm string pair.                                     |
> > > ++------------------+-----------------------------------------------------------+
> > > +|Return values                                                                 |
> > > ++------------------+-----------------------------------------------------------+
> > > +|Name              |Description                                                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
> > > +|                  |by the chosen algorithm string.                            |
> > > +|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
> > > +|                  |matches.                                                   |
> > > +|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
> > > +|                  |is rejected by the algorithm string.                       |
> > > ++------------------+-----------------------------------------------------------+
> > > +
> > > +QCOM_SCMI_GET_PARAM
> > > +~~~~~~~~~~~~~~~~~~~
> > > +
> > > +message_id: 0x11
> > > +protocol_id: 0x80
> > > +
> > > ++------------------+-----------------------------------------------------------+
> > > +|Parameters                                                                    |
> > > ++------------------+-----------------------------------------------------------+
> > > +|Name              |Description                                                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 ext_id     |Reserved, must be zero.                                    |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 param_id   |Serves as the token message id for the algorithm string.   |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 buf[]      |Serves as the payload and store of value for the specified |
> > > +|                  |param_id and algorithm string pair.                        |
> > > ++------------------+-----------------------------------------------------------+
> > > +|Return values                                                                 |
> > > ++------------------+-----------------------------------------------------------+
> > > +|Name              |Description                                                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
> > > +|                  |by the chosen algorithm string and the result is copied    |
> > > +|                  |into buf[].                                                |
> > > +|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
> > > +|                  |matches.                                                   |
> > > +|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
> > > +|                  |is rejected by the algorithm string.                       |
> > > ++------------------+-----------------------------------------------------------+
> > 
> > ..missed this last time...so you should add here also a field describing
> > the reply buf right ? (as it happenns really in your code) something
> > like:
> > 
> >   ++------------------+-----------------------------------------------------------+
> >   +|uint32 buf[]      |Holds the payload of the result of the query.	 	 |
> >   +|                  |					                         |
> >   ++------------------+-----------------------------------------------------------+
> 
> Thanks will get this added in the next re-spin.
>

Ok.

Thanks,
Cristian

