Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3DDE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/kDj7maBTS8uiIwrrn1wNwfQlayVXEKUnP0meipOzk=; b=X5OTfcZGou4gluQoZki2HJ1s/g
	bd2MLLc39kDcZsHRGZi4qh9UvdO/sIFETYTQFvnNZLzGX8JzkPEY4LkjEjHkiEdeXO/aUfB3pmDTH
	zI60+O8JY9qmyFTgn61sRI3iyOpiQOQE7AgqSn/tzWFU2Nn3/V6VSZ8YJudFG2uxj9FKDkTRtJmAC
	76wIqIbCQdSEjx7rA31p6SAC74LzfZ0RJjoUNjDVP7KPIjicjoWcZHPy87XNYosn8DY33dHcKAJoq
	CuYNCM4QmMV6XhltGYSq/IhvUvWoxXbnJNnljlIMSzCOle/A8SM4uG53LxXYBUUSRUbSkbO+tJbW+
	5UZhwn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBAH-0000000FzTn-0UHv;
	Thu, 05 Dec 2024 12:41:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJB9F-0000000FzHq-2gDr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:40:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EADE91063;
	Thu,  5 Dec 2024 04:40:26 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 040FA3F5A1;
	Thu,  5 Dec 2024 04:39:56 -0800 (PST)
Date: Thu, 5 Dec 2024 12:39:54 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Shivnandan Kumar <quic_kshivnan@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	conor+dt@kernel.org, arm-scmi@vger.kernel.org,
	Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Message-ID: <Z1GfGk0yQAVQKEVL@pluto>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2e9614de-1a93-4e17-a10c-945c50fb3f1a@quicinc.com>
 <61ce8618-cb08-06bc-9159-4ca26d703b14@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61ce8618-cb08-06bc-9159-4ca26d703b14@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_044001_772078_C7A823E2 
X-CRM114-Status: GOOD (  25.36  )
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

On Thu, Dec 05, 2024 at 04:33:05PM +0530, Sibi Sankar wrote:
> 
> 
> On 11/29/24 15:27, Shivnandan Kumar wrote:
> > 
> >

Hi Sibi,

some rants down below :P
 
> > On 10/7/2024 11:40 AM, Sibi Sankar wrote:
> > > Introduce a client driver that uses the memlat algorithm string
> > > hosted on QCOM SCMI Generic Extension Protocol to detect memory
> > > latency workloads and control frequency/level of the various
> > > memory buses (DDR/LLCC/DDR_QOS).
> > > 

[snip]

> > > +    /* Set the effective cpu frequency calculation method */
> > > +    ret = ops->set_param(ph, &cpucp_freq_method,
> > > sizeof(cpucp_freq_method), MEMLAT_ALGO_STR,
> > > +                 MEMLAT_SET_EFFECTIVE_FREQ_METHOD);
> > > +    if (ret < 0)
> > > +        return dev_err_probe(&sdev->dev, ret,
> > > +                     "failed to set effective frequency calc method\n");
> > > +
> > 
> > Hi Sibi,
> 
> Hey Shiv,
> 
> Thanks for taking time to review the series!
> 
> > Since the MEMLAT_SET_EFFECTIVE_FREQ_METHOD command is not supported in
> > the legacy CPUCP firmware, it should be kept optional. This way, if the
> > legacy firmware is used, the driver will not return an error when the
> > CPUCP firmware returns -EOPNOTSUPP.
> 
> The vendor protocol with the current major/minor version is
> expected to work as is on x1e platforms. What legacy firmware
> are you referring to? All future SoCs that plan to adhere to
> it are expected to maintain this abi and can decide to make
> use of alternate mechanisms to calculating frequency based
> on additional dt properties set.
> 

Normally in the SCMI world you could leverage protocol versioning and
the standard PROTOCOL_MESSAGE_ATTRIBUTES(0x2) command to let the agent
investigate if the SCMI server it is speaking to implements or NOT a
specific command and which specific version of that command is understood
(with possibly varying size and fields)...

...BUT since your vendor protocol is 'Generic' and, as it stands, it
basically piggybacks any kind of binary payload (i.e. subcommands of
some kind of subprotocols of yours) into the same 4 get/set/start/stop
'Generic' ops, without even specifying the transmitted/received payload
sizes into the message itself....all of the possible SCMI versioning
autodiscovery and backward-compatibility capabilities happily go out of
the window because:

- your versioning refers to the generic protocol and you cannot possibly
  describe all the possible future subcommands (opaque payloads) variations
  and/or subcommands addition/removals purely on the major/minor version, AND
  even if you did that, NONE of such future variations will be documented
  anywhere since you are hiding all of this inside a bunch of binary blobs

- you dont even specify the payload sizes of the tx/rx 'Generic' payload
  subcommands so it becomes even difficult for both the server and the
  client to safely handle your 'Generic' subcommand message payloads

- you cannot issue a PROTOCOL_MESSAGE_ATTRIBUTE() to see if a specific
  subcommand is supported, because your subcommand is NOT really a protocol
  command but it is just one of the payloads of one of the 'Generic' protocol:
  you commmands are only set/get/start/stop (maybe some sort of hack
  could be doen around these...bit all will be even more flaky...)

- you dont implement NEGOTIATE_PROTOCOL_VERSION and so you cannot even
  check if the SCMI server that you are speaking to will agree to
  downgrade and 'speak' your Kernel SCMI agent (possibly older) 'Generic'
  protocol version

All of this basically defeats all of the SCMI general capabilities
around versioning and auto-discovery when it comes to your 'Generic' vendor
protocol, with the end result that you will have to be EXTREMELY confident
to perfectly match and keep in sync at all times your SCMI Server(FW) and
Client(Kernel) sides, without any possibility of coping with a such a mismatch
on the field by using some of the fallback/downgrade mechanism that you
threw out of the window...
(...and sorry but looking at the above xchange about 'legacy firmware' I am
 a bit skeptic about this as of now :D)

...as I said initially when reviewing this series, you can do whatever
you want within your Vendor protocol, but abusing the SCMI Vendor extensions
capabilities in such a way could end up bringing to the table more cons
(the above) than pros (some supposed 'simplification')

Thanks,
Cristian

