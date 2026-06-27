Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 14:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gzh2plBXJ+V5rVAo9UH0lZu//mdnWSb19kyOOoCk0VM=; b=EYTUdnUC9WcKrJXLYrIKWybM/e
	pSQj4343qM9+adzX4ZMIddNNxE/blBmoWSwDlrODMBLQAZ2MzhcbBH0snlunYCYGbAa0i+c7NB/kw
	OPK3AgJSOOsWfue3WMqnpKWooLosaee+WfcR45k5zkuRF+lVUhHKlKJvm/VTBBUVUxybxNhXlmS4X
	QhOt+a87AjDLoKuhIxIQ0mnNYNh2oQwlxNPJv4Xz72tD7S6FajQQAWvMZme5slYtHW4wMOYGHSJVv
	LDcG2JK3lj1WpEGC5Cc48rh69zjXzBASXNCEJmBS+zs3LPjxVuZK/AIenaVrCN1Dly0CdhW0ZASd/
	qhDmEi9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTmR-0000000CXS8-2IRc;
	Sat, 27 Jun 2026 14:13:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTmQ-0000000CXRs-1HAt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 14:13:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08BAE6001A;
	Sat, 27 Jun 2026 14:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888B71F000E9;
	Sat, 27 Jun 2026 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782569588;
	bh=Gzh2plBXJ+V5rVAo9UH0lZu//mdnWSb19kyOOoCk0VM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JnpZG/ZVd5B/C2reKUrIBHrC31EZoCUQUouaF9Ti+GxmZecEzJJ3lo6HKvTt6qIXS
	 1BCW73i///CgG0wfzEpeWf51FQIchi9EBBDoz7e2TMfWH1NG+PZv3asA4GxL7B6yxv
	 PKCtNi1c8JgcvT1P+ynkE1VIrs/F530SdF2umAJ9jXYo2M6g9+EjbDsW44W1CLlL2Q
	 L0tSq4H+6nyJDpny9Nw2VWZTtB5kdnSPKtXNH6FGohGVvFerRyEiv1TkInjmV13ZAl
	 eW3q2xtQyszuvO+iSuJueq80I2LSLdYsknrVGo2dbvk9R1NAeOD7v31kw2DdiYgYOk
	 fap6XfIkbWYxA==
Date: Sat, 27 Jun 2026 15:13:02 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Amir Vajid <amir.vajid@oss.qualcomm.com>,
	Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Subject: Re: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
Message-ID: <20260625-metal-chachalaca-of-fascination-eabc0f@sudeepholla>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
 <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
 <20260623-busy-beautiful-trout-8cc2ea@sudeepholla>
 <ea9d0c11-e110-4d13-b165-1548875ef9cd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea9d0c11-e110-4d13-b165-1548875ef9cd@oss.qualcomm.com>
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

On Thu, Jun 25, 2026 at 10:57:40AM +0530, Pragnesh Papaniya wrote:
> 
> 
> On 23-Jun-26 2:17 PM, Sudeep Holla wrote:
> > On Fri, Jun 19, 2026 at 06:01:23PM +0530, Pragnesh Papaniya wrote:
> >>
> >> On 16-Jun-26 1:57 PM, Sudeep Holla wrote:
> >>
> >>> Not sure if it was discussed in the previous versions or not, it would be
> >>> good if you can capture why some of bus scaling doesn't work with the existing
> >>> SCMI performance protocol and the monitors don't fit the MPAM mode.
> >>>
> >>> Please capture them in 1/9 as a motivation for this vendor protocol. It will
> >>> then help to understand it better as I am still struggling to. Sorry for that.
> >>
> >> Thanks for the input!
> >>
> >> SCMI perf protocol exports perf domains to kernel where kernel can set
> >> the frequency but here the scaling governor runs on the SCP while kernel
> >> just observes frequency changes made by remote governor.
> > 
> > OK if it is sort of read-only w.r.t kernel, why not perf domain notifications
> > work to consume the change done by the SCMI platform.
> > 
> > And why do you have set operations in the vendor protocol being proposed then.
> > It all looks like something just cooked up to make things work. I need
> > detailed reasoning as why the existing perf protocol can't work considering
> > all the existing notifications in place.
> 
> Please do take another look at the documentation and driver changes to see
> how it all comes together, since it's apparent that we use SET operation for
> a ton of things. Taking another stab at explaining how the MEMLAT uses all
> the ops exposed by the vendor protocol.
> 

Sure I will have a look at the documentation again and sorry if I missed
anything. But in general I would expect the document to be self-explanatory
and not having to look at the driver on how it is used to understand the
firmware interface. Please make sure of that if not already.

> We use the SET operation to pass on various tuneables (IPM CEIL, stall floors,
> write-back filter, freq-scale params, adaptive low/high freq, sample ms),
> the core-freq -> mem-freq map, and min/max clamps) required to run the
> MEMLAT algorithm on the SCP. You might ask why can't we have these values
> stored somewhere on the SCP itself?

Exactly, thanks for saving a round trip.

> We would like to but all of these are tuneable values, that can change for
> various boards for the same SoC.
> 

Sure and where do these boards get these values from ? I assume device tree ?
If so, are the fixed and can be done once at boot ?

> The START/STOP operations are meant to start/stop the algorithm, in this case
> the bus scaling algorithm.
> 

Yes you need to add more details on that algorithm. Can firmware take random
strings as input. I guess not. Please list the valid strings and explain them.
Filter invalid strings in the driver if only handful of values are valid.

> We use the GET operation to get the current frequency of memory that we
> are trying to scale. It can be also used to read back all the parameters
> that we are trying to set. Another thing to note is that exposing the current
> frequency to the userspace was something that the community wanted.
> 

More fun, user ABI involved, so the firmware interface needs to be as clear
as possible.

> With all of ^^ in mind, re-using the perf protocol becomes impossible.
> 
> https://lore.kernel.org/lkml/k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7/
> https://lore.kernel.org/lkml/20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5/
> 

It is good to capture summary of these old discussions if they are relevant.

> We'll add more call flow diagrams as part of the documentation for the next
> re-spin to make reviews a bit more easier.
> 

Anything that improves and helps in understanding this is always welcome.

-- 
Regards,
Sudeep

