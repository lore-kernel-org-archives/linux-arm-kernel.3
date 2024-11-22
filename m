Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBF6E65D34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKL/YfMn3Db8wOJ15FBDjXTCEC8oukhMv/EgAq4D1Bw=; b=FHk1myBLBhLf6JVpY33MXlmQd8
	/Z76/5sYkz/Db0uS23NAUJ4z9rvdOYbDqbSy2xEjDxDaAyaFANqRxe9FO2CpVvGlullzyxxyXGOqx
	37ns4/lBfxxZoD/VXTVdHceuZaY6SGEDtZ3oeF82nZHGFCW62oQC0WPom6Ju1rIDDKVkK78wFOe5j
	XT3XfQTEZ7Zhdad3oNP5kBTCLPn9FdGrWomFmZ+L1XdRvj4MPopsAWc5NWHkQxDBth2vUl3Kj3bwX
	L8A/iv2QIIKrPPRCS1Ya9pGwbqB0NDA6J3fygM1FxgsjkDFnYlNCCvt25Si33ryK1d+PLbeyxZRm1
	7bXOuhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPBo-00000001wh6-1NCA;
	Fri, 22 Nov 2024 08:38:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPAr-00000001wZY-0mab
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 08:37:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 891FB5C59AA;
	Fri, 22 Nov 2024 08:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D4EC4CECE;
	Fri, 22 Nov 2024 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732264676;
	bh=YRPhCjHnMkScpSE7BaUeWOkkkpQu14NpMm1EVAUeUFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlQOR6xrYCqf57fxGFgqbkaoiW1BaKannEDb205TFQx1q4XrT4atygpg02CUTkhbt
	 yKx8LM9w9BfyWY0i7/ZahsUGTMa9e82/lPJGqF06WaOeCu/X8szTuzZNSNbU5ycDNa
	 g+khhWqQU/l31l8uXwG2KrzX8K2RjrrOFBX/gR2dRVZBaVAo7fpGzVgaskVFVWTnRB
	 MR0pN4Sl8EsiF1DN0Olfgm6pW05hHgIgEtAObkccCaAhDKHSaNA3U2Pm+rg/16zo8k
	 kOACaBpv8P6xYDobnXQg9iKZEoI+p60M4YjZTdexeTx1Y6Gv/blg1hJ/jLfHbJ0sqF
	 V/jMkIsTQILug==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tEPAh-000000001y3-3Fnj;
	Fri, 22 Nov 2024 09:37:47 +0100
Date: Fri, 22 Nov 2024 09:37:47 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <Z0BC203BhGEmXcJi@hovoldconsulting.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
 <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_003757_308953_67DF34C5 
X-CRM114-Status: GOOD (  22.27  )
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

On Thu, Nov 14, 2024 at 09:52:12AM +0530, Sibi Sankar wrote:
> On 11/8/24 20:44, Johan Hovold wrote:

> >> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:

> >>> Second, after loading the protocol and client drivers manually (in that
> >>> order, shouldn't the client driver pull in the protocol?), I got:
> >>>
> >>> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
> >>> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
> >>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
> >>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
> >>>
> >>> which seems to suggest that the firmware on my CRD does not support this
> >>> feature. Is that the way this should be interpreted? And does that mean
> >>> that non of the commercial laptops supports this either?

> > Yeah, hopefully Sibi can shed some light on this. I'm using the DT
> > patch (5/5) from this series, which according to the commit message is
> > supposed to enable bus scaling on the x1e80100 platform. So I guess
> > something is missing in my firmware.
> 
> Nah, it's probably just because of the algo string used.
> The past few series used caps MEMLAT string instead of
> memlat to pass the tuneables, looks like all the laptops
> havn't really switched to it yet. Will revert back to
> using to lower case memlat so that all devices are
> supported. Thanks for trying the series out!

I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
there too, and there I do *not* see the above mentioned -EOPNOSUPP error
and the memlat driver probes successfully.

On the other hand, this series seems to have no effect on a kernel
compilation benchmark. Is that expected?

And does this mean that you should stick with the uppercase "MEMLAT"
string after all? The firmware on my CRD is not the latest one, but I am
using the latest available firmware for the T14s.

Johan

